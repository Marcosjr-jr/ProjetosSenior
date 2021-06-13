unit uMemo;

interface

uses
  uComponente;

type

  TMemo = class(TComponente)
    public
      Constructor Create(vX, vY, vAltura, vLargura: Integer);
      Destructor Destroy; Override;
      Procedure pRedimensiona(vX, vY: Integer; vAltura, vLargura: Double); override;
  end;

implementation

{ TMemo }

constructor TMemo.Create(vX: Integer; vY: Integer; vAltura: Integer; vLargura: Integer);
begin
   with Self do
   begin
      X       := vX;
      Y       := vY;
      Altura  := vAltura;
      Largura := vLargura;
   end;
end;

destructor TMemo.Destroy;
begin
  inherited;
end;

procedure TMemo.pRedimensiona(vX: Integer; vY: Integer; vAltura: Double; vLargura: Double);
begin
   with Self do
   begin
      X       := Trunc(vX / 2 + X);
      Y       := Trunc(vY / 2 + Y);
      Largura := Trunc(((vAltura / 100) + 1) * Largura);
      Altura  := Trunc(((vLargura / 100) + 1) * Altura);
   end;
end;


end.
