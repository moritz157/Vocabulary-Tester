object MainFrm: TMainFrm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MainFrm'
  ClientHeight = 272
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 389
    Height = 233
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Abfrage'
      object Label1: TLabel
        Left = 3
        Top = 58
        Width = 375
        Height = 30
        Alignment = taCenter
        AutoSize = False
        Constraints.MaxHeight = 50
        Constraints.MinHeight = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 0
        Top = 86
        Width = 403
        Height = 30
        Alignment = taCenter
        AutoSize = False
        Constraints.MaxHeight = 50
        Constraints.MinHeight = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button1: TButton
        Left = 3
        Top = 3
        Width = 375
        Height = 49
        Caption = 'Neue Aufgabe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 0
        Top = 122
        Width = 178
        Height = 68
        Caption = 'Richtig'
        TabOrder = 1
        Visible = False
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 200
        Top = 122
        Width = 178
        Height = 68
        Caption = 'Falsch'
        TabOrder = 2
        Visible = False
        OnClick = Button3Click
      end
      object showAnsBt: TButton
        Left = 104
        Top = 122
        Width = 177
        Height = 65
        Caption = 'L'#246'sung zeigen'
        TabOrder = 3
        Visible = False
        OnClick = showAnsBtClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Profile'
      ImageIndex = 1
      OnExit = TabSheet2Exit
      object profileLT: TListBox
        Left = 3
        Top = 3
        Width = 296
        Height = 198
        ItemHeight = 13
        Items.Strings = (
          'Kein Profil vorhanden')
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnClick = profileLTClick
        OnExit = profileLTExit
      end
      object Button4: TButton
        Left = 303
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Hinzuf'#252'gen'
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 303
        Top = 47
        Width = 75
        Height = 25
        Caption = 'Entfernen'
        Enabled = False
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 303
        Top = 78
        Width = 75
        Height = 25
        Caption = 'Bearbeiten'
        Enabled = False
        TabOrder = 3
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 303
        Top = 109
        Width = 75
        Height = 25
        Caption = 'Als Standart'
        Enabled = False
        TabOrder = 4
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 253
    Width = 405
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Version 1.2'
    ExplicitLeft = 8
    ExplicitTop = 247
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 192
    object Datei1: TMenuItem
      Caption = 'Datei'
      object Oeffnen: TMenuItem
        Caption = #214'ffnen'
        OnClick = OeffnenClick
      end
      object Einstellungen1: TMenuItem
        Caption = 'Einstellungen'
        OnClick = Einstellungen1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Beenden1: TMenuItem
        Caption = 'Beenden'
        OnClick = Beenden1Click
      end
    end
    object Hilfe1: TMenuItem
      Caption = 'Hilfe'
      object berdasProgramm1: TMenuItem
        Caption = #220'ber das Programm'
        OnClick = berdasProgramm1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ZurHeilwigWebsite1: TMenuItem
        Caption = 'Zur Heilwig Website'
        OnClick = ZurHeilwigWebsite1Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'VOK-Dateien|*.vok'
    Left = 40
    Top = 176
  end
end
