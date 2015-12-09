object saveProfileForm: TsaveProfileForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Profil speichern'
  ClientHeight = 71
  ClientWidth = 182
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 156
    Height = 21
    TabOrder = 0
    TextHint = 'Profilname'
  end
  object Button1: TButton
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Abbrechen'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Speichern'
    TabOrder = 2
    OnClick = Button2Click
  end
end
