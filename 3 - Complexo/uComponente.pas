unit uComponente;

interface

type

  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  private
    FX: Integer;
    FY: Integer;
    FAltura: Integer;
    FLargura: Integer;
    FComponentes: TComponenteArray;

    procedure pNewAltura(const vAltura: Integer);
    procedure pNewLargura(const vLargura: Integer);

    procedure pNewX(const vX: Integer);
    procedure pNewY(const vY: Integer);

  public
    procedure AdicionaComponente(aComponente: TComponente); virtual;
    procedure RemoveComponente(aComponente: TComponente); virtual;

    property X : Integer read FX write pNewX;
    property Y : Integer read FY write pNewY;
    property Altura : Integer read FAltura write pNewAltura;
    property Largura : Integer read FLargura write pNewLargura;
    property Componentes: TComponenteArray read FComponentes write FComponentes;
    procedure pRedimensiona(vX, vY : Integer; vAltura, vLargura : Double); virtual; Abstract;

  end;

implementation

uses uBotao, uFrame, uLabel, uMemo;


procedure TComponente.pNewAltura(const vAltura: Integer);
begin
   FAltura := vAltura;
end;

procedure TComponente.pNewLargura(const vLargura: Integer);
begin
   FLargura := vLargura;
end;

procedure TComponente.pNewX(const vX: Integer);
begin
   FX := vX;
end;

procedure TComponente.pNewY(const vY: Integer);
begin
   FY := vY;
end;

procedure TComponente.AdicionaComponente(aComponente: TComponente);
var
   objFrame : TFrame;
   objBotao : TBotao;
   objMemo  : TMemo;
   objLabel : TLabel;
begin
   objFrame :=  TFrame.Create(0,0,1000,1000);
   objBotao :=  TBotao.Create(0,0,25,100);
   objMemo  :=  TMemo.Create(0,0,100,100);
   objLabel :=  TLabel.Create(0,0,25,1000);
end;

procedure TComponente.RemoveComponente(aComponente: TComponente);
begin
end;
end.
