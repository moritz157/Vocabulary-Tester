unit generalSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TGeneralSettingsForm = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  GeneralSettingsForm: TGeneralSettingsForm;

implementation

{$R *.dfm}

procedure TGeneralSettingsForm.Button1Click(Sender: TObject);
begin
GeneralSettingsForm.Close;
end;

end.
