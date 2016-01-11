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
    Language1: TMenuItem;
    English1: TMenuItem;
    Deutsch1: TMenuItem;
    ZurProjektwebsite1: TMenuItem;
    Werkzeuge1: TMenuItem;
    VOKDateienerstellen1: TMenuItem;
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
    procedure English1Click(Sender: TObject);
    procedure Deutsch1Click(Sender: TObject);
    procedure SetDefaultProfileBtnClick(Sender: TObject);
    procedure ZurProjektwebsite1Click(Sender: TObject);
    procedure VOKDateienerstellen1Click(Sender: TObject);
  private
    procedure loadQuestsFromProfile(profile:String);
    procedure loadQuestsFromFile(path:String);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  MainFrm: TMainFrm;
  selectedProfile: Integer;


implementation

{$R *.dfm}

uses about, profileOptions, generalSettings, saveProfile, createFiles, Sprache;

var
  questions, answers, requests: TStringList;
  lastQuest, quest: Integer;
  profilesIni: TIniFile;

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
if (questions.Count>0) then
begin
  loop:=true;
  Button2.Visible:=false;
  Button3.Visible:=false;
  Label2.Caption:='';
  while loop do begin
  quest:=Random(questions.Count);
  loop:=quest=lastQuest;
  if(questions.Count=1) then loop:=false;
  end;
  Label1.Caption:=questions.Strings[quest];
  lastQuest:=quest;
  beep;
  showAnsBt.Visible:=true;
end else
begin
  ShowMessage('Du hast bereits alle Vokabeln gelernt!');
end;
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
//ShowMessage(inttostr(requestsYet)+' | '+requests.Strings[lastQuest]);
requests.Strings[lastQuest]:=inttostr(requestsYet);

if(requestsYet=2) then
begin
  beep;
  ShowMessage(questions.Strings[lastQuest]+' erfolgreich gelernt! :)');
  questions.Delete(lastQuest);
  answers.Delete(lastQuest);
  requests.Delete(lastQuest);
  if(questions.Count=0) then ShowMessage('Lernen erfolgreich abgeschlossen');
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

procedure TMainFrm.Deutsch1Click(Sender: TObject);
begin
{Button1.Caption:='Neue Aufgabe';
Button2.Caption:='Richtig';
Button3.Caption:='Falsch';
showAnsBt.Caption:='Lösung zeigen';
MainMenu1.Items[0].Caption:='Datei';
MainMenu1.Items[0].Items[0].Caption:='Öffnen';
MainMenu1.Items[0].Items[1].Caption:='Einstellungen';
MainMenu1.Items[0].Items[3].Caption:='Beenden';
MainMenu1.Items[1].Caption:='Hilfe';
MainMenu1.Items[1].Items[0].Caption:='Über das Programm';
MainMenu1.Items[1].Items[2].Caption:='Zur Projektseite';
MainMenu1.Items[1].Items[3].Caption:='Zur Heilwig Website';
MainMenu1.Items[1].Items[3].Visible:=true;
AddProfileBtn.Caption:='Hinzufügen';
EditProfileBtn.Caption:='Bearbeiten';
DeleteProfileBtn.Caption:='Entfernen';
SetDefaultProfileBtn.Caption:='Als Standart';
TabSheet1.Caption:='Abfrage';

Form7.Label2.Caption:='Vokabel Tester';
Form7.Label2.Left:=34;

saveProfileForm.Caption:='Profil speichern';
saveProfileForm.SaveProfileBtn.Caption:='Speichern';
saveProfileForm.CancelBtn.Caption:='Abbrechen';
saveProfileForm.ProfileNameEdt.TextHint:='Profilname';

profileOptionsForm.Caption:='Profil Einstellungen';
profileOptionsForm.pathEdt.TextHint:='Pfad';
profileOptionsForm.browseBtn.Caption:='Durchsuchen';
profileOptionsForm.cancelBtn.Caption:='Abbrechen';
profileOptionsForm.saveBtn.Caption:='Speichern';

generalSettingsForm.CancelBtn.Caption:='Abbrechen';
generalSettingsForm.SaveSettingsBtn.Caption:='Speichern';
generalSettingsForm.Caption:='Einstellungen';
generalSettingsForm.Label1.Caption:='Profil beim Start:';

StatusBar1.Panels[1].Text:='Language: German';

if(profileLT.Items[0]='No profile available') then profileLT.Items[0]:='Kein Profil vorhanden';
}
Spracheinstellung(sp_deutsch);
end;

procedure TMainFrm.EditProfileBtnClick(Sender: TObject);
begin
Main.MainFrm.Enabled:=false;
profileOptionsForm.Show;
end;

procedure TMainFrm.Einstellungen1Click(Sender: TObject);
begin
MainFrm.Enabled:=false;
GeneralSettingsForm.Show;
end;

procedure TMainFrm.English1Click(Sender: TObject);
begin
{Button1.Caption:='New quest';
Button2.Caption:='I`m Right';
Button3.Caption:='I`m Wrong';
showAnsBt.Caption:='Show Answer';
MainMenu1.Items[0].Caption:='File';
MainMenu1.Items[0].Items[0].Caption:='Open';
MainMenu1.Items[0].Items[1].Caption:='Settings';
MainMenu1.Items[0].Items[3].Caption:='Stop tester';
MainMenu1.Items[1].Caption:='Help';
MainMenu1.Items[1].Items[0].Caption:='About';
MainMenu1.Items[1].Items[2].Caption:='Projectwebsite';
MainMenu1.Items[1].Items[3].Caption:='To our school`s website';
MainMenu1.Items[1].Items[3].Visible:=false;
AddProfileBtn.Caption:='Add';
EditProfileBtn.Caption:='Edit';
DeleteProfileBtn.Caption:='Delete';
SetDefaultProfileBtn.Caption:='Set Default';
TabSheet1.Caption:='Test';

Form7.Label2.Caption:='Vocabulary tester';
Form7.Label2.Left:=20;

saveProfileForm.Caption:='Save profile';
saveProfileForm.SaveProfileBtn.Caption:='Save';
saveProfileForm.CancelBtn.Caption:='Cancel';
saveProfileForm.ProfileNameEdt.TextHint:='Name';

profileOptionsForm.Caption:='Profile settings';
profileOptionsForm.pathEdt.TextHint:='Path';
profileOptionsForm.browseBtn.Caption:='Browse';
profileOptionsForm.cancelBtn.Caption:='Cancel';
profileOptionsForm.saveBtn.Caption:='Save';

generalSettingsForm.CancelBtn.Caption:='Cancel';
generalSettingsForm.SaveSettingsBtn.Caption:='Save';
generalSettingsForm.Caption:='General Settings';
GeneralSettingsForm.Label1.Caption:='Start-Up profile:';

StatusBar1.Panels[1].Text:='Language: English';

if(profileLT.Items[0]='Kein Profil vorhanden') then profileLT.Items[0]:='No profile available';
}
Spracheinstellung(sp_englisch);
end;

procedure TMainFrm.FormCreate(Sender: TObject);
var
i: Integer;
profiles: TStringList;
settingsIni:TIniFile;

begin
profiles:=TStringList.Create;
//ShowMessage(TPath.GetHomePath+'\Abfrager\profiles');
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
{questions.Add('vocare 1. Person Singular Futur');
questions.Add('vocare 2. Person Singular Futur');
questions.Add('vocare 3. Person Singular Futur');
questions.Add('vocare 1. Person Plural Futur');
questions.Add('vocare 2. Person Plural Futur');
questions.Add('vocare 3. Person Plural Futur');
}
answers:=TStringList.Create;
{answers.Add('vocabo');
answers.Add('vocabis');
answers.Add('vocabit');
answers.Add('vocabimus');
answers.Add('vocabitis');
answers.Add('vocabunt');
}

settingsIni:=TIniFile.Create(TPath.GetHomePath+'\Abfrager\settings.ini');
if(settingsIni.SectionExists('General')) then
begin
  if(profiles.IndexOf(settingsIni.ReadString('General', 'startUpProfile', 'None'))>-1) then
  begin
      loadQuestsFromProfile(settingsIni.ReadString('General', 'startUpProfile', 'None'));
  end;
end;
settingsIni.Free;
for i := 0 to questions.Count do requests.Add('0');

if ParamCount<>0 then
begin
  //ShowMessage('Paramstr gefunden: '+ParamStr(1));
  loadQuestsFromFile(ParamStr(1));
end;

end;

procedure TMainFrm.FormDestroy(Sender: TObject);
begin
questions.Free;
answers.Free;
profilesIni.Free;
end;

procedure TMainFrm.OeffnenClick(Sender: TObject);
var
Pfad2, Dateiname2:String;
fileContent: TStringList;
begin
fileContent:=TStringList.Create;
SaveDialog.Title:='Aufgabendatei auswählen';
if SaveDialog.Execute then
begin
    loadQuestsFromFile(ExtractFilePath(SaveDialog.FileName)+ExtractFileName(SaveDialog.FileName));
{  ShowMessage('Bitte wählen sie nun eine .vok Datei mit den entsprechenden Antworten aus!');
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
}
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
selectedProfile:=profileLT.ItemIndex;
profileLT.ClearSelection;
end;

procedure TMainFrm.SetDefaultProfileBtnClick(Sender: TObject);
var
  Path: String;
  fileContent: TStringList;
  i: Integer;
begin
fileContent:=TStringList.Create;
Path:=profilesIni.ReadString(profileLT.Items[selectedProfile], 'Path', 'None');
if not (Path='None') then
begin
  fileContent.LoadFromFile(Path);
  answers.Clear;
  questions.Clear;
  for i:=0 TO Round(fileContent.Count/2)-1 do
  begin
    questions.Add(fileContent.Strings[i]);
  end;

  for i:=Round(fileContent.Count/2) TO fileContent.Count-1 do
  begin
    answers.Add(fileContent.Strings[i]);
  end;
  requests.Clear;
  for i := 0 to questions.Count do requests.Add('0');
end;
end;

procedure TMainFrm.loadQuestsFromProfile(profile:String);
var
  Path: string;
  fileContent: TStringList;
  i:Integer;
begin
  fileContent := TStringList.Create;
  Path := profilesIni.ReadString(profile, 'Path', 'None');
  if not (Path = 'None') then
  begin
    fileContent.LoadFromFile(Path);
    answers.Clear;
    questions.Clear;
    for i := 0 to Round(fileContent.Count / 2) - 1 do
    begin
      questions.Add(fileContent.Strings[i]);
    end;
    for i := Round(fileContent.Count / 2) to fileContent.Count - 1 do
    begin
      answers.Add(fileContent.Strings[i]);
    end;
    requests.Clear;
    for i := 0 to questions.Count do
      requests.Add('0');
  end;
end;

procedure TMainFrm.loadQuestsFromFile(path: String);
var
  i: Integer;
  fileContent:TStringList;
begin
  fileContent:=TStringList.Create;
  fileContent.LoadFromFile(path);
  answers.Clear;
  questions.Clear;
  for i := 0 to Round(fileContent.Count / 2) - 1 do
  begin
    questions.Add(fileContent.Strings[i]);
  end;
  for i := Round(fileContent.Count / 2) to fileContent.Count - 1 do
  begin
    answers.Add(fileContent.Strings[i]);
  end;
  requests.Clear;
  for i := 0 to questions.Count do
    requests.Add('0');

  fileContent.Free;
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

procedure TMainFrm.VOKDateienerstellen1Click(Sender: TObject);
begin
createFilesFrm.Show;
end;

procedure TMainFrm.ZurHeilwigWebsite1Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'http://heilwig.de', nil, nil, SW_SHOWNORMAL);
end;

procedure TMainFrm.ZurProjektwebsite1Click(Sender: TObject);
begin
if(StatusBar1.Panels[1].Text='Language: German') then
ShellExecute(Handle, 'open', 'http://moritz157.github.io/Vocabulary-Tester/german.html', nil, nil, SW_SHOWNORMAL) else
ShellExecute(Handle, 'open', 'http://moritz157.github.io/Vocabulary-Tester/', nil, nil, SW_SHOWNORMAL);
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
