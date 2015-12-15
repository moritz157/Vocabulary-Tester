unit generalSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, System.IOUtils, Registry;

type
  TGeneralSettingsForm = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    CancelBtn: TButton;
    SaveSettingsBtn: TButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveSettingsBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  GeneralSettingsForm: TGeneralSettingsForm;

implementation

{$R *.dfm}

uses Main;

procedure TGeneralSettingsForm.CancelBtnClick(Sender: TObject);
begin
GeneralSettingsForm.Close;
MainFrm.Show;
MainFrm.Enabled:=true;
end;

procedure TGeneralSettingsForm.FormShow(Sender: TObject);
var
  profilesIni:TIniFile;
  profiles:TStringList;
begin
  profiles:=TStringList.Create;
  profilesIni:=TIniFile.Create(TPath.GetHomePath+'\Abfrager\profiles\profiles.ini');
  profilesIni.ReadSections(profiles);
  ComboBox1.Clear;
  if(MainFrm.StatusBar1.Panels[1].Text='Language: German') then
  ComboBox1.Items.Add('Keine') else
  ComboBox1.Items.Add('None');
  ComboBox1.Items.AddStrings(profiles);
  profilesIni.Free;
end;

procedure TGeneralSettingsForm.SaveSettingsBtnClick(Sender: TObject);
var
  settingsIni: TIniFile;
begin
  settingsIni:=TIniFile.Create(TPath.GetHomePath+'\Abfrager\settings.ini');
  settingsIni.WriteString('General', 'startUpProfile', ComboBox1.Text);
  settingsIni.Free;
  GeneralSettingsForm.Close;
  MainFrm.Show;
  MainFrm.Enabled:=true;
end;

end.
