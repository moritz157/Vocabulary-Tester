unit profileOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TprofileOptionsForm = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  profileOptionsForm: TprofileOptionsForm;

implementation

{$R *.dfm}

procedure TprofileOptionsForm.Button1Click(Sender: TObject);
var
Pfad, Dateiname: String;
begin
 if SaveDialog1.Execute then
 begin
  Pfad := ExtractFilePath(SaveDialog1.FileName);
  Dateiname := ExtractFileName(SaveDialog1.FileName);
  Edit1.Text:=Pfad+Dateiname;
 end;

end;

procedure TprofileOptionsForm.Button2Click(Sender: TObject);
begin
profileOptionsForm.Close;
end;

procedure TprofileOptionsForm.Button4Click(Sender: TObject);
var
Pfad, Dateiname: String;
begin
 if SaveDialog1.Execute then
 begin
  Pfad := ExtractFilePath(SaveDialog1.FileName);
  Dateiname := ExtractFileName(SaveDialog1.FileName);
  Edit2.Text:=Pfad+Dateiname;
 end;

end;

end.
