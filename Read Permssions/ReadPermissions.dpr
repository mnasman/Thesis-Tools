program ReadPermissions;

uses
  Forms,
  uMain in 'uMain.pas' {Form1},
  uViewPermissions in 'uViewPermissions.pas' {frmViewPermissions},
  uHelper in 'uHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmViewPermissions, frmViewPermissions);
  Application.Run;
end.
