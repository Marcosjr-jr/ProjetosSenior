unit uBotao;

interface

uses
  uComponente;

type

  TBotao = class(TComponente)
    public
      Constructor Create(vX, vY, vAltura, vLargura : Integer);
      Destructor  Destroy; Override;
      Procedure pRedimensiona(vX, vY: Integer; vAltura, vLargura: Double); override;
  end;

implementation

{ TBotao }

constructor TBotao.Create(vX: Integer; vY: Integer; vAltura: Integer; vLargura: Integer);
begin
   with Self do
   begin
      X       := vX;
      Y       := vY;
      Altura  := vAltura;
      Largura := vLargura;
   end;
end;

destructor TBotao.Destroy;
begin
  inherited;
end;

procedure TBotao.pRedimensiona(vX: Integer; vY: Integer; vAltura: Double; vLargura: Double);
begin
   with Self do
   begin
      X       := Trunc(vX / 2 + X);
      Y       := Trunc(vY / 2 + Y);
      Largura := Trunc(((vLargura / 100) + 1) * Largura);
   end;
end;

end.
