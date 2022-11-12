unit UFuncoes;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls;

function Format(Valor: String): String;

implementation

function Format(Valor: String): String;
begin
  { Retirar o Ponto da String }
  Result := StringReplace(Valor,'.','',[rfReplaceAll]);
  { Trocar a Virgula por Ponto }
  Result := StringReplace(Result,',','.',[rfReplaceAll]);
end;

end.
