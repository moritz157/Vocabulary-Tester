unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Shellapi, Vcl.ComCtrls, IniFiles, System.IOUtils;

type
  TMainFrm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    showAnsBt: TButton;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Oeffnen: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    Hilfe1: TMenuItem;
    berdasProgramm1: TMenuItem;
    SaveDialog: TSaveDialog;
    N2: TMenuItem;
    ZurHeilwigWebsite1: TMenuItem;
    MainPageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    profileLT: TListBox;
    AddProfileBtn: TButton;
    DeleteProfileBtn: TButton;
    EditProfileBtn: TButton;
    SetDefaultProfileBtn: TButton;
    Einstellungen1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure showAnsBtClick(Sender: TObject);
    procedure OeffnenClick(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure ZurHeilwigWebsite1Click(Sender: TObject);
    procedure berdasProgramm1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure profileLTClick(Sender: TObject);
    procedure profileLTExit(Sender: TObject);
    procedure DeleteProfileBtnClick(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure EditProfileBtnClick(Sender: TObject);
    procedure Einstellungen1Click(Sender: TObject);
    procedure AddProfileBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  MainFrm: TMainFrm;
  questions, answers, requests: TStringList;
  lastQuest, quest: Integer;
  profilesIni: TIniFile;

implementation

{$R *.dfm}

uses about, profileOptions, generalSettings, saveProfile;

procedure TMainFrm.Beenden1Click(Sender: TObject);
begin
Application.Terminate;
end;


procedure TMainFrm.berdasProgramm1Click(Sender: TObject);
begin
Form7.Show;
end;

procedure TMainFrm.Button1Click(Sender: TObject);
var
loop: Boolean;
begin
loop:=true;
Button2.Visible:=false;
Button3.Visible:=false;
Label2.Caption:='';
while loop do begin
quest:=Random(questions.Count);
loop:=quest=lastQuest;
end;
Label1.Caption:=questions.Strings[quest];
lastQuest:=quest;
beep;
showAnsBt.Visible:=true;
end;

procedure TMainFrm.Button2Click(Sender: TObject);
var
requestsYet: Integer;
begin
Button2.Visible:=false;
Button3.Visible:=false;
Label1.Caption:='';
Label2.Caption:='';

requestsYet:=strtoint(requests.Strings[lastQuest]);
requestsYet:=requestsYet+1;
requests.Strings[lastQuest]:=inttostr(requestsYet);
if(requestsYet=5) then
begin
  beep;
  ShowMessage(questions.Strings[lastQuest]+' erfolgreich gelernt! :)');
  questions.Delete(lastQuest);
  answers.Delete(lastQuest);
  requests.Delete(lastQuest);
end;
end;

procedure TMainFrm.Button3Click(Sender: TObject);
begin
Button2.Visible:=false;
Button3.Visible:=false;
Label1.Caption:='';
Label2.Caption:='';
end;

procedure TMainFrm.AddProfileBtnClick(Sender: TObject);
var
profiles: TStringList;
begin
profiles:=TStringList.Create;

if(FileExists(TPath.GetHomePath+'\Abfrager\profiles\profiles.ini')) then
begin
  //Profildatei vorhanden
end else begin
  //Profile NICHT vorhanden
  //Profildatei erstellen
  FileCreate(TPath.GetHomePath+'\Abfrager\profiles\profiles.ini');
end;
MainFrm.Enabled:=false;
saveProfileForm.Show;
end;

procedure TMainFrm.DeleteProfileBtnClick(Sender: TObject);
begin
ShowMessage('Hi');
end;

procedure TMainFrm.EditProfileBtnClick(Sender: TObject);
begin
profileOptionsForm.Show;
end;

procedure TMainFrm.Einstellungen1Click(Sender: TObject);
begin
GeneralSettingsForm.Show;
end;

procedure TMainFrm.FormCreate(Sender: TObject);
var
i: Integer;
profiles: TStringList;
begin
profiles:=TStringList.Create;
//ShowMessage(TPath.GetHomePath+'\Abfrager\profiles');
ForceDirectories(TPath.GetHomePath+'\Abfrager\profiles');
if(FileExists(TPath.GetHomePath+'\Abfrager\profiles\profiles.ini')) then
begin
  //Profildatei vorhanden
end else begin
  //Profile NICHT vorhanden
  //Profildatei erstellen
  FileCreate(TPath.GetHomePath+'\Abfrager\profiles\profiles.ini');
end;
//Inhalt prüfen
profilesIni:=TIniFile.Create(TPath.GetHomePath+'\Abfrager\profiles\profiles.ini');
profilesIni.ReadSections(profiles);
if(profiles.Count>0) then
begin
profileLT.Items.Clear;
for i := 0 to profiles.Count-1 do profileLT.Items.Add(profiles.Strings[i]);
end;


Randomize;
requests:=TStringList.Create;
questions:=TStringList.Create;
questions.Add('vocare 1. Person Singular Futur');
questions.Add('vocare 2. Person Singular Futur');
questions.Add('vocare 3. Person Singular Futur');
questions.Add('vocare 1. Person Plural Futur');
questions.Add('vocare 2. Person Plural Futur');
questions.Add('vocare 3. Person Plural Futur');

answers:=TStringList.Create;
answers.Add('vocabo');
answers.Add('vocabis');
answers.Add('vocabit');
answers.Add('vocabimus');
answers.Add('vocabitis');
answers.Add('vocabunt');

for i := 0 to questions.Count do requests.Add('0');

end;

procedure TMainFrm.FormDestroy(Sender: TObject);
begin
questions.Free;
answers.Free;
profilesIni.Free;
end;

procedure TMainFrm.OeffnenClick(Sender: TObject);
var
i:Integer;
Pfad, Dateiname, Pfad2, Dateiname2:String;
begin
ShowMessage('Bitte wählen sie anschließen eine .vok Datei mit Aufgaben aus!');
SaveDialog.Title:='Aufgabendatei auswählen';
if SaveDialog.Execute then
begin
  Pfad := ExtractFilePath(SaveDialog.FileName);
  Dateiname := ExtractFileName(SaveDialog.FileName);

  ShowMessage('Bitte wählen sie nun eine .vok Datei mit den entsprechenden Antworten aus!');
  SaveDialog.Title:='Antwortdatei auswählen';
  if SaveDialog.Execute then
  begin
    Pfad2 := ExtractFilePath(SaveDialog.FileName);
    Dateiname2 := ExtractFileName(SaveDialog.FileName);
    answers.LoadFromFile(Pfad2+Dateiname2);
    questions.LoadFromFile(Pfad+Dateiname);
    requests.Clear;
    for i := 0 to questions.Count do requests.Add('0');
  end else ShowMessage('Keine Datei ausgewählt! Bitte versuchen sie es erneut.');

end else
begin
  ShowMessage('Keine Datei ausgewählt! Bitte versuchen sie es erneut.');
end;

//answers.LoadFromFile(ExtractFilePath(SaveDialog.FileName)+ExtractFileName(SaveDialog.FileName));

end;


procedure TMainFrm.profileLTClick(Sender: TObject);
begin
if(profileLT.ItemIndex>-1) then
begin
  DeleteProfileBtn.Enabled:=true;
  EditProfileBtn.Enabled:=true;
  SetDefaultProfileBtn.Enabled:=true;
end;
end;

procedure TMainFrm.profileLTExit(Sender: TObject);
begin

profileLT.ClearSelection;
end;

procedure TMainFrm.showAnsBtClick(Sender: TObject);
begin
showAnsBt.Visible:=false;
Button2.Visible:=true;
Button3.Visible:=true;
Label2.Caption:=answers.Strings[lastQuest];
end;

procedure TMainFrm.TabSheet2Exit(Sender: TObject);
begin
DeleteProfileBtn.Enabled:=false;
EditProfileBtn.Enabled:=false;
SetDefaultProfileBtn.Enabled:=false;
end;

procedure TMainFrm.ZurHeilwigWebsite1Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'http://heilwig.de', nil, nil, SW_SHOWNORMAL);
end;

//INIFUNCTIONS
function readIni(Filename, Section, Key:String):String;
var
ini: TIniFile;
begin
  ini:=TIniFile.Create(Filename);
  try
    result:=ini.ReadString(Section, Key, '');
  finally
    ini.Free;
    beep;
    ShowMessage('Can not open file');
  end;
end;

procedure WriteIni(Filename, Section, Key, Value:String);
var
ini: TIniFile;
begin
  ini:=TIniFile.Create(Filename);
  try
    ini.WriteString(Section, Key, Value);
  finally
    ini.Free;
  end;
end;

end.
