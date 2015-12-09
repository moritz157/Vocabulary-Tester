object profileOptionsForm: TprofileOptionsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 108
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 10
    Width = 257
    Height = 21
    TabStop = False
    TabOrder = 0
    TextHint = 'Aufgaben Dateipfad'
  end
  object Button1: TButton
    Left = 271
    Top = 8
    Width = 90
    Height = 25
    Caption = 'Durchsuchen'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Abbrechen'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 239
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Speichern'
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 8
    Top = 37
    Width = 257
    Height = 21
    TabOrder = 4
    TextHint = 'Antworten Dateipfad'
  end
  object Button4: TButton
    Left = 271
    Top = 35
    Width = 90
    Height = 25
    Caption = 'Durchsuchen'
    TabOrder = 5
    OnClick = Button4Click
  end
  object SaveDialog1: TSaveDialog
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Left = 312
    Top = 104
  end
end
