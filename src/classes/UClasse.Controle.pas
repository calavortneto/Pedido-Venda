unit UClasse.Controle;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
   FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
   FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
   UClasse.Conexao;

type
  TControle = class
    private
      FConexao: TConexao;
      FQuery: TFDQuery;
      FMsgErro: String;

    public
     constructor Create;
     destructor  Destroy; override;

     property Query: TFDQuery read FQuery write FQuery;
     property MsgErro: String Read FMsgErro Write FMsgErro;

  end;

implementation

{ TControle }

constructor TControle.Create;
begin
   FConexao  := TConexao.Create;
   FQuery := TFDQuery.Create(Application);
   FQuery.Connection := FConexao.Conexao;
end;

destructor TControle.Destroy;
begin
  FQuery.Free;
  FConexao.Free;
  inherited;
end;

end.
