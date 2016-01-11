unit Sprache;

interface
  const sp_deutsch = 0;
  const sp_englisch = 1000;
  procedure Spracheinstellung(offset:Integer);
implementation
uses forms,StdCtrls, ExtCtrls,menus,sysutils,windows, Vcl.ComCtrls, Vcl.Dialogs;
{$R VocabTester_LANG.res}

procedure Spracheinstellung(offset:Integer);
var i,j, l: integer;
    c  : TObject;


function GetResString(Nr: Integer): String;
var p: PChar;
begin
  p := StrAlloc(256);
  LoadString(Hinstance,nr+offset,p,255);
  result:=p;
  StrDispose(p);
end;


begin
  with application do for i := 0 to ComponentCount-1 do begin
    for j := 0 to Components[i].ComponentCount-1 do begin
      if Components[i].Components[j].Tag <> 0 then begin
        c := Components[i].Components[j];
        if(c is TButton) then
          (c as TButton).Caption := GetResString((c as TButton).tag);
        if(c is TLabel) then
          (c as TLabel).Caption := GetResString((c as TLabel).Tag);
        if(c is TEdit) then
          (c as TEdit).TextHint := GetResString((c as TEdit).Tag);
        if(c is TMenuItem) then
          (c as TMenuItem).Caption := GetResString((c as TMenuItem).Tag);
        if(c is TTabSheet) then
          (c as TTabSheet).Caption := GetResString((c as TTabSheet).Tag);
        if(c is TForm) then
          (c as TForm).Caption := GetResString((c as TForm).Tag);
      end;
    end;
  end;
end;
end.
