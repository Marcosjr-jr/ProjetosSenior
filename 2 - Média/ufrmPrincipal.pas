unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Mask;

type
  TfrmPrincipal = class(TForm)
    Panel: TPanel;
    GroupBox: TGroupBox;
    Image: TImage;
    GroupBox1: TGroupBox;
    edtValorTroco: TMaskEdit;
    Label1: TLabel;
    btnCalcularTroco: TButton;
    ListaDescricaoTroco: TListBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCalcularTrocoClick(Sender: TObject);
    procedure edtValorTrocoExit(Sender: TObject);
    procedure edtValorTrocoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uIMaquina, uMaquina, uTroco;

procedure TfrmPrincipal.btnCalcularTrocoClick(Sender: TObject);
var
    ObjTroco : TMaquina;
    ListaValores : TList;
    vI : Integer;
begin
   ObjTroco     := TMaquina.Create;
   ListaValores := TList.Create;
   ListaValores := ObjTroco.MontarTroco(StrToFloat(StringReplace(edtValorTroco.Text,'.','',[rfReplaceAll])));

   ListaDescricaoTroco.Items.Clear;

   for vI := 0 to ListaValores.Count - 1 do
   begin
      if TTroco(ListaValores.Items[vI]).Quantidade > 0 then
      begin
         case TTroco(ListaValores.Items[vI]).Tipo of
            ceNota100  :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Notas de 100 Reais')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Nota de 100 Reais');
            end;

            ceNota50   :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Notas de 50 Reais')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Nota de 50 Reais');
            end;

            ceNota20   :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Notas de 20 Reais')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Nota de 20 Reais');
            end;

            ceNota10   :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Notas de 10 Reais')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Nota de 10 Reais');
            end;
            ceNota5    :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Notas de 5 Reais')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Nota de 5 Reais');
            end;
            ceNota2    :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Notas de 2 Reais')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Nota de 2 Reais');
            end;
            ceMoeda100 :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moedas de 1 Real ')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moeda de 1 Real ');
            end;
            ceMoeda50  :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moedas de 0.50 Centavos')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moeda de 0.50 Centavos');
            end;
            ceMoeda25  :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moedas de 0.25 Centavos')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moeda de 0.25 Centavos');
            end;
            ceMoeda10  :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moedas de 0.10 Centavos')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moeda de 0.10 Centavos');
            end;
            ceMoeda5   :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moedas de 0.5 Centavos')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moeda de 0.5 Centavos');
            end;
            ceMoeda1   :
            begin
               if TTroco(ListaValores.Items[vI]).Quantidade > 1 then
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moedas de 0.1 Centavo')
               else
                  ListaDescricaoTroco.Items.Add(TTroco(ListaValores.Items[vI]).Quantidade.ToString + ' Moeda de 0.1 Centavo');
            end;
         end;
      end;
   end;

  ListaValores.Free;
  ObjTroco.Free;
end;

procedure TfrmPrincipal.edtValorTrocoExit(Sender: TObject);
begin
   if Trim(edtValorTroco.Text) =  '' then
      edtValorTroco.Text :=  FormatFloat('#,##0.00', 0)
   else
      edtValorTroco.Text :=  FormatFloat('#,##0.00', StrToFloat(edtValorTroco.Text));
end;

procedure TfrmPrincipal.edtValorTrocoKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',',',#8]) then
      Abort;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 27 then
      Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   edtValorTroco.SetFocus;
end;

end.
