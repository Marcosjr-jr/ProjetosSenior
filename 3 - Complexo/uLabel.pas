unit uLabel;

interface

uses
  uComponente;

type

  TLabel = class(TComponente)
    public
      procedure pRedimensiona(vX, vY: Integer; vAltura, vLargura: Double); override;
      Constructor Create(vX, vY, vAltura, vLargura : Integer);
      Destructor  Destroy; Override;
  end;

implementation

{ TLabel }

constructor TLabel.Create(vX: Integer; vY: Integer; vAltura: Integer; vLargura: Integer);
begin
   with Self do
   begin
      X := vX;
      y := vY;

      Altura  := vAltura;
      Largura := vLargura;
   end;
end;

destructor TLabel.Destroy;
begin
  inherited;
end;

procedure TLabel.pRedimensiona(vX: Integer; vY: Integer; vAltura: Double; vLargura: Double);
begin
   with Self do
   begin
      X := Trunc(vX / 2 + X);
      Y := Trunc(vY / 2 + Y);
   end;
end;
end.
