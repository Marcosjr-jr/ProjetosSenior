program QC2;

uses
  Vcl.Forms,
  uBotao in 'uBotao.pas',
  uComponente in 'uComponente.pas',
  uFrame in 'uFrame.pas',
  uLabel in 'uLabel.pas',
  uMemo in 'uMemo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
