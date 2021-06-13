unit uSubstitui;

interface

uses
  uISubstitui;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
   vI, vII, vQtdeLetra : Integer;
   vFrase, vPalavra, vValidaString : String;
   vConfirma : boolean;
begin
   vI         := 1;
   vFrase     := '';
   vQtdeLetra := Length(aVelho);

   while not (vI = Length(aStr)+1 ) do
   begin
      if aStr[vI] = aVelho[1] then
      begin
         vPalavra   := '';
         vConfirma  := False;

         for vII := 0 to vQtdeLetra - 1 do
         begin
            vPalavra := vPalavra + aStr[vI+vII];

            if vPalavra = aVelho then
            begin
               vPalavra  := aNovo;
               vConfirma := True;
               Break;
            end;
         end;

         if vConfirma then
         begin
            vFrase := vFrase + vPalavra;
            vI := vI + (vQtdeLetra);
         end
         else
         begin
            vFrase := vFrase + aStr[vI];
            Inc(vI);
         end;
      end
      else
      begin
         vFrase := vFrase + aStr[vI];
         Inc(vI);
      end;
   end;

   Result := vFrase;
end;

end.

