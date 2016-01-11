program Abfrager;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainFrm},
  about in 'about.pas' {Form7},
  profileOptions in 'profileOptions.pas' {profileOptionsForm},
  generalSettings in 'generalSettings.pas' {GeneralSettingsForm},
  saveProfile in 'saveProfile.pas' {saveProfileForm},
  createFiles in 'createFiles.pas' {createFilesFrm},
  Sprache in '..\..\..\RAD Studio\Projekte\Sprache.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TprofileOptionsForm, profileOptionsForm);
  Application.CreateForm(TGeneralSettingsForm, GeneralSettingsForm);
  Application.CreateForm(TsaveProfileForm, saveProfileForm);
  Application.CreateForm(TcreateFilesFrm, createFilesFrm);
  Application.Run;
end.
