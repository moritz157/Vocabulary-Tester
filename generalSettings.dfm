object GeneralSettingsForm: TGeneralSettingsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Einstellungen'
  ClientHeight = 84
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 80
    Height = 13
    Caption = 'Profil beim Start:'
  end
  object ComboBox1: TComboBox
    Left = 104
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'Keine'
    Items.Strings = (
      'Keine')
  end
  object CancelBtn: TButton
    Left = 32
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Abbrechen'
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object SaveSettingsBtn: TButton
    Left = 153
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Speichern'
    TabOrder = 2
  end
end
