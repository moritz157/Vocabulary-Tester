unit saveProfile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls, System.IOUtils;

type
  TsaveProfileForm = class(TForm)
    ProfileNameEdt: TEdit;
    CancelBtn: TButton;
    SaveProfileBtn: TButton;
    procedure SaveProfileBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  saveProfileForm: TsaveProfileForm;
  profilesIni: TIniFile;

implementation

{$R *.dfm}

uses Main;

procedure TsaveProfileForm.CancelBtnClick(Sender: TObject);
begin
  saveProfileForm.Close;
end;

procedure TsaveProfileForm.SaveProfileBtnClick(Sender: TObject);
begin
  profilesIni := TIniFile.Create(TPath.GetHomePath + '\Abfrager\profiles\profiles.ini');
  profilesIni.WriteString(ProfileNameEdt.Text, 'Path', 'None');
  profilesIni.Free;
  if (MainFrm.profileLT.Items[0] = 'Kein Profil vorhanden') then
    MainFrm.profileLT.Items.Clear;
  MainFrm.profileLT.Items.Add(ProfileNameEdt.Text);
  ProfileNameEdt.Text := '';
  saveProfileForm.Close;
end;

procedure TsaveProfileForm.FormHide(Sender: TObject);
begin
  MainFrm.Enabled := true;
  MainFrm.Show;
end;
end.
