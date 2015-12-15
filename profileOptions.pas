unit profileOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, System.IOUtils;

type
  TprofileOptionsForm = class(TForm)
    pathEdt: TEdit;
    browseBtn: TButton;
    SaveDialog1: TSaveDialog;
    cancelBtn: TButton;
    saveBtn: TButton;
    procedure browseBtnClick(Sender: TObject);
    procedure cancelBtnClick(Sender: TObject);
    procedure saveBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  profileOptionsForm: TprofileOptionsForm;

implementation

{$R *.dfm}

uses Main;
var
  profilesIni: TIniFile;

procedure TprofileOptionsForm.browseBtnClick(Sender: TObject);
var
Pfad, Dateiname: String;
begin
 if SaveDialog1.Execute then
 begin
  Pfad := ExtractFilePath(SaveDialog1.FileName);
  Dateiname := ExtractFileName(SaveDialog1.FileName);
  pathEdt.Text:=Pfad+Dateiname;
 end;

end;

procedure TprofileOptionsForm.cancelBtnClick(Sender: TObject);
begin
MainFrm.Enabled:=true;
MainFrm.Show;
profileOptionsForm.Close;
end;

procedure TprofileOptionsForm.saveBtnClick(Sender: TObject);
begin
profilesIni:=TIniFile.Create(TPath.GetHomePath+'\Abfrager\profiles\profiles.ini');
profilesIni.WriteString(MainFrm.profileLT.Items[Main.selectedProfile], 'Path', pathEdt.Text);
profilesIni.Free;
//ShowMessage(MainFrm.profileLT.Items[Main.selectedProfile]);
pathEdt.Text:='';
profileOptionsForm.Close;
MainFrm.Enabled:=true;
MainFrm.Show;
end;

end.
