unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Strutils,
  System.UITypes;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    ListBox1: TListBox;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  Weblist: TStringlist;

procedure TForm1.Button1Click(Sender: TObject);
var
  Site: string;
begin
  Site := inputbox('Website name',
    'Please insert the address of the website you wish to block', '');
  ListBox1.Items.Add(Site);
  Weblist.Add('127.0.0.1 '+Site);
  Weblist.SaveToFile(IncludeTrailingBackSlash
    (GetEnvironmentvariable('SYSTEMDRIVE')) +
    'Windows\System32\drivers\etc\hosts');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if MessageDlg('Delete this address from blocked list?', mtConfirmation,
    [mbYes, mbNo], 0, mbNo) = mrYes then
  begin
    Weblist.Delete(Weblist.IndexOf('127.0.0.1 '+ListBox1.Items[ListBox1.itemindex]));
    ListBox1.Items.Delete(ListBox1.itemindex);
    Weblist.SaveToFile(IncludeTrailingBackSlash
      (GetEnvironmentvariable('SYSTEMDRIVE')) +
      'Windows\System32\drivers\etc\hosts');
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Weblist.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  Weblist := TStringlist.Create;
  Weblist.LoadFromFile(IncludeTrailingBackSlash
    (GetEnvironmentvariable('SYSTEMDRIVE')) +
    'Windows\System32\drivers\etc\hosts');
    Weblist.SaveToFile(IncludeTrailingBackSlash
    (GetEnvironmentvariable('SYSTEMDRIVE')) +
    'Windows\System32\drivers\etc\hosts.bak');
  for i := 0 to Weblist.Count - 1 do
    if copy(Weblist.Strings[i], 1, 10) = '127.0.0.1 ' then
      ListBox1.Items.Add(replacetext(Weblist.Strings[i], '127.0.0.1 ', ''));
end;

end.
