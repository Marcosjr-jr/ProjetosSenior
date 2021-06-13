unit uFrame;

interface

uses
  uComponente;

type

  TFrame = class(TComponente)
    Constructor Create(vX, vY, vAltura, vLargura : Integer);
    Destructor Destroy; Override;
    Procedure NewTamanho(vAltura, vLargura : Integer);
    Procedure pRedimensiona(vX, vY : Integer; vAltura, vLargura : Double); override;
  end;

implementation

{ TFrame }

constructor TFrame.Create(vX: Integer; vY: Integer; vAltura: Integer; vLargura: Integer);
begin
   with Self do
   begin
      X := vX;
      Y := vY;

      Altura  := vAltura;
      Largura := vLargura;
   end;
end;

destructor TFrame.Destroy;
begin
  inherited;
end;

procedure TFrame.NewTamanho(vAltura: Integer; vLargura: Integer);
var
  vX, vY, vI : Integer;
  vAlt, vLar : Double;
begin
   with Self do
   begin
      vX      := vAltura - Altura;
      vY      := vLargura - Largura;
      vAlt    := ((vAltura * 100) / Altura) - 100;
      vLar    := ((vLargura * 100) / Largura) - 100;
      Altura  := vAltura;
      Largura := vLargura;

      for vI := 0 to Length(Componentes) - 1 do
         Componentes[vI].pRedimensiona(vX,vY,vAlt,vLar);
  end;
end;

procedure TFrame.pRedimensiona(vX: Integer; vY: Integer; vAltura: Double; vLargura: Double);
begin
   with Self do
   begin
      X       := Trunc((vX / 2) + X);
      Y       := Trunc((vY / 2) + Y);
      Altura  := Trunc(((vAltura / 100) + 1) * Altura);
      Largura := Trunc(((vLargura / 100) + 1) * Largura);
   end;
end;
end.
