unit saveProfile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls, System.IOUtils;

type
  TsaveProfileForm = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses Unit6, Main;

procedure TsaveProfileForm.Button1Click(Sender: TObject);
begin
  saveProfileForm.Hide;
end;

procedure TsaveProfileForm.Button2Click(Sender: TObject);
begin
  profilesIni := TIniFile.Create(TPath.GetHomePath +
    '\Abfrager\profiles\profiles.ini');
  profilesIni.WriteString(Edit1.Text, 'Path', 'None');
  profilesIni.Free;
  if (MainFrm.profileLT.Items[0] = 'Kein Profil vorhanden') then
    Form6.profileLT.Items.Clear;
  Form6.profileLT.Items.Add(Edit1.Text);
  Edit1.Text := '';
  saveProfileForm.Hide;
end;

procedure TsaveProfileForm.FormHide(Sender: TObject);
begin
  MainFrm.Enabled := true;
  MainFrm.Show;
end;
end.
