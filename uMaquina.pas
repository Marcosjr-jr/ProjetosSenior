unit uMaquina;

interface

uses
  uIMaquina, Classes;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

uses uTroco;

function TMaquina.MontarTroco(aTroco: Double): TList;
var ObjTroco      : TTroco;
    MontarLista  : TList;
    vCountNotas, vCountMoedas, vQtde     : Integer;
    ValorNotas, ValorMoedas, ValorDif : Double;
begin
   vCountNotas  := 0;
   vCountMoedas := 7;
   vQtde        := 0;
   ValorDif     := 0;
   ValorNotas   := aTroco;
   ValorMoedas  := aTroco;

   MontarLista := TList.Create;

   while (ValorNotas > 0) do
   begin
      ValorDif   := Trunc(CValorCedula[TCedula(vCountNotas)]);
      vQtde      := (Trunc(ValorNotas) div Trunc(ValorDif));
      ObjTroco   := TTroco.Create(TCedula(vCountNotas), vQtde);

      MontarLista.Add(ObjTroco);
      ValorNotas := (Trunc(ValorNotas) mod Trunc(ValorDif));

      Inc(vCountNotas);
   end;

   ValorMoedas := round(frac(aTroco) * 100);

   while (ValorMoedas > 0) do
   begin
      ValorDif := round(CValorCedula[TCedula(vCountMoedas)]* 100);
      vQtde    := (round(ValorMoedas* 100) div round(ValorDif*100));

      if vQtde > 0 then
      begin
         ObjTroco   := TTroco.Create(TCedula(vCountMoedas), vQtde);
         MontarLista.Add(ObjTroco);
         ValorMoedas := round(ValorMoedas) mod round(ValorDif);
      end;

      Inc(vCountMoedas);
   end;

   result := MontarLista;
end;
end.

