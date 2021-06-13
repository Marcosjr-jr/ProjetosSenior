program QS6;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Senior';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
