unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtPalavra: TEdit;
    edtNovaPalavra: TEdit;
    btnSubstituir: TButton;
    btnLimparFrase: TButton;
    memoFrase: TMemo;
    Image1: TImage;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure memoFraseClick(Sender: TObject);
    procedure btnLimparFraseClick(Sender: TObject);
    procedure edtPalavraClick(Sender: TObject);
    procedure edtNovaPalavraClick(Sender: TObject);
    procedure btnSubstituirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uISubstitui, uSubstitui;

procedure TfrmPrincipal.btnLimparFraseClick(Sender: TObject);
begin
   memoFrase.Clear;
end;

procedure TfrmPrincipal.btnSubstituirClick(Sender: TObject);
var
   vFrase    : String;
   Substitui : TSubstitui;
begin
   if Trim(memoFrase.Lines.Text) = '' then
   begin
      ShowMessage('A Frase não pode estar em branco! Verifique.');
      Abort;
   end
   else if Trim(edtPalavra.Text) = '' then
   begin
      ShowMessage('A Palavra não pode estar em branco! Verifique.');
      Abort;
   end
   else if Trim(edtNovaPalavra.Text) = '' then
   begin
      ShowMessage('A Nova Palavra não pode estar em branco! Verifique.');
      Abort;
   end;

   vFrase      := memoFrase.Lines.Text;

   with memoFrase do
   begin
      Clear;
      Lines.Text := Substitui.Substituir(vFrase, edtPalavra.Text, edtNovaPalavra.Text);
   end;
end;

procedure TfrmPrincipal.edtPalavraClick(Sender: TObject);
begin
   edtPalavra.Clear;
end;

procedure TfrmPrincipal.edtNovaPalavraClick(Sender: TObject);
begin
   edtNovaPalavra.Clear;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 27 then
      Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   memoFrase.Text := 'O rato roeu a roupa do rei de roma';
   btnSubstituir.SetFocus;
end;

procedure TfrmPrincipal.memoFraseClick(Sender: TObject);
begin
   memoFrase.Clear;
   memoFrase.SetFocus;
end;

end.
