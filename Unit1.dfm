object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Netlock - Website blocker for windows'
  ClientHeight = 401
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 528
    Height = 39
    Align = alTop
    Alignment = taCenter
    Caption = 'Netlock'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 123
  end
  object Label2: TLabel
    Left = 8
    Top = 77
    Width = 117
    Height = 13
    Align = alCustom
    Caption = 'List of blocked websites:'
  end
  object Label3: TLabel
    Left = 484
    Top = 21
    Width = 44
    Height = 13
    Caption = 'by Rudra'
  end
  object Button1: TButton
    Left = 344
    Top = 62
    Width = 88
    Height = 28
    Align = alCustom
    Caption = 'Add'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 438
    Top = 62
    Width = 88
    Height = 28
    Align = alCustom
    Caption = 'Delete'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 0
    Top = 96
    Width = 528
    Height = 305
    ItemHeight = 13
    TabOrder = 2
  end
end
