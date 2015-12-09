unit generalSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TGeneralSettingsForm = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    CancelBtn: TButton;
    SaveSettingsBtn: TButton;
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  GeneralSettingsForm: TGeneralSettingsForm;

implementation

{$R *.dfm}

procedure TGeneralSettingsForm.CancelBtnClick(Sender: TObject);
begin
GeneralSettingsForm.Close;
end;

end.
