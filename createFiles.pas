unit createFiles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls;

type
  TcreateFilesFrm = class(TForm)
    ListView1: TListView;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Speichern1: TMenuItem;
    Speichernunter1: TMenuItem;
    ffnen1: TMenuItem;
    N1: TMenuItem;
    Beenden1: TMenuItem;
    SaveDialog1: TSaveDialog;
    EditGroup: TGroupBox;
    questEdt: TEdit;
    ansEdt: TEdit;
    saveEditBtn: TButton;
    cancelEditBtn: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Beenden1Click(Sender: TObject);
    procedure ffnen1Click(Sender: TObject);
    procedure loadQuestsFromFile(path: String);
    procedure loadQuestsToListView();
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure saveEditBtnClick(Sender: TObject);
    procedure cancelEditBtnClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Speichern1Click(Sender: TObject);
    procedure Speichernunter1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure saveListToFile(saveAs:Boolean);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  createFilesFrm: TcreateFilesFrm;

implementation

{$R *.dfm}

var
  questions, answers: TStringList;
  currentEdit: Integer;
  currentFile: String;

procedure TcreateFilesFrm.Beenden1Click(Sender: TObject);
begin
  createFilesFrm.Close;
end;


procedure TcreateFilesFrm.Button3Click(Sender: TObject);
begin
ListView1.Items.Add.Caption:='No question';
ListView1.Items[ListView1.Items.Count-1].SubItems.Add('No answer');
ListView1.Selected:=ListView1.Items[ListView1.Items.Count-1];
currentEdit:=ListView1.Items.Count-1;
EditGroup.Visible:=true;
questEdt.Text:='No question';
ansEdt.Text:='No answer';
questEdt.SetFocus;
end;

procedure TcreateFilesFrm.Button4Click(Sender: TObject);
begin
  if MessageDlg('Wollen sie die Vokabel wirklich löschen?',mtConfirmation,[mbYes,mbNo],0) = mrYes {mrNo} then
  begin
    ListView1.Items.Delete(currentEdit);
    currentEdit:=-1;
    EditGroup.Visible:=false;
  end
end;

procedure TcreateFilesFrm.saveListToFile(saveAs: Boolean);
var
  fileContent:TStringList;
  i:Integer;
begin
  fileContent:=TStringList.Create;
  //LOL
  if(saveAs=true) then currentFile:='';
  if (currentFile='') then
  begin
    if(SaveDialog1.Execute) then
      currentFile:=ExtractFilePath(SaveDialog1.FileName)+ExtractFileName(SaveDialog1.FileName);
  end;
  //ShowMessage(currentFile);
  for i:=0 to ListView1.Items.Count-1 do
  begin
    fileContent.Add(ListView1.Items[i].Caption);
  end;
  for i:=0 to ListView1.Items.Count-1 do
  begin
    fileContent.Add(ListView1.Items[i].SubItems[0]);
  end;
  fileContent.SaveToFile(currentFile);
  fileContent.Free;
end;

procedure TcreateFilesFrm.Speichern1Click(Sender: TObject);
begin
saveListToFile(false);
end;

procedure TcreateFilesFrm.Speichernunter1Click(Sender: TObject);
begin
saveListToFile(true);
end;

procedure TcreateFilesFrm.cancelEditBtnClick(Sender: TObject);
begin
EditGroup.Visible:=false;
end;

procedure TcreateFilesFrm.ffnen1Click(Sender: TObject);
begin
if(SaveDialog1.Execute) then
begin
  loadQuestsFromFile(ExtractFilePath(SaveDialog1.FileName)+ExtractFileName(SaveDialog1.FileName));
  loadQuestsToListView;
end;
end;

procedure TcreateFilesFrm.FormCreate(Sender: TObject);
begin
answers:=TStringList.Create;
questions:=TStringList.Create;
currentEdit:=-1;
currentFile:='';
end;

procedure TcreateFilesFrm.FormDestroy(Sender: TObject);
begin
answers.Free;
questions.Free;
end;

procedure TcreateFilesFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    if(questEdt.Focused) then ansEdt.SetFocus else
    if(ansEdt.Focused) then begin
      saveEditBtn.Click;
      EditGroup.Visible:=false;
      Button3.SetFocus;
    end;
  end;
end;

procedure TcreateFilesFrm.ListView1Click(Sender: TObject);
begin
  EditGroup.Visible:=true;
  if(ListView1.SelCount=1) then
  begin
    currentEdit:=ListView1.Selected.Index;
    EditGroup.Visible:=true;
    Button4.Enabled:=true;
    questEdt.Text:=ListView1.Selected.Caption;
    ansEdt.Text:=ListView1.Selected.SubItems[0];
  end else
  begin
    EditGroup.Visible:=false;
    Button4.Enabled:=false;
  end;
end;

procedure TcreateFilesFrm.loadQuestsFromFile(path: String);
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
  fileContent.Free;
end;

procedure TcreateFilesFrm.loadQuestsToListView;
var
  i:Integer;
begin
  //iuhhh
  ListView1.Clear;
  for i := 0 to questions.Count-1 do
  begin
    ListView1.Items.Add.Caption:=questions[i];
    ListView1.Items.Item[i].SubItems.Add(answers[i]);
  end;
end;

procedure TcreateFilesFrm.saveEditBtnClick(Sender: TObject);
begin
if(currentEdit>questions.Count-1) then
begin
  questions.Add(questEdt.Text);
  answers.Add(ansEdt.Text);
end else
begin
  questions.Strings[currentEdit]:=questEdt.Text;
  answers.Strings[currentEdit]:=ansEdt.Text;
end;
ListView1.Items[currentEdit].Caption:=questEdt.Text;
ListView1.Items[currentEdit].SubItems[0]:=ansEdt.Text;
end;

end.
