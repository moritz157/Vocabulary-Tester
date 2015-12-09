program Abfrager;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainFrm},
  about in 'about.pas' {Form7},
  profileOptions in 'profileOptions.pas' {profileOptionsForm},
  generalSettings in 'generalSettings.pas' {GeneralSettingsForm},
  saveProfile in 'saveProfile.pas' {saveProfileForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TprofileOptionsForm, profileOptionsForm);
  Application.CreateForm(TGeneralSettingsForm, GeneralSettingsForm);
  Application.CreateForm(TsaveProfileForm, saveProfileForm);
  Application.Run;
end.
