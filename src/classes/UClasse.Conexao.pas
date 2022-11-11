unit UClasse.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IniFiles, Forms;

type
  TConexao = class
    private
      FConexao: TFDConnection;
      FMsgErro: String;

    public
      constructor Create;
      destructor Destroy; override;

      function GetConexao: TFDConnection;

      property Conexao: TFDConnection read GetConexao;
      property MsgErro: String Read FMsgErro Write FMsgErro;
  end;

implementation

{ TConexao }
constructor TConexao.Create;
var
  FDatabase: String;
  FServer: String;
  FUserName: String;
  FPassword: String;
  FPort: String;
  FDriver: String;
begin
  with TIniFile.Create(ParamStr(0) + 'PedidoVenda.ini') do
  try
    FDatabase := ReadString('Configuracao', 'Base', 'pedidosvenda');
    FServer := ReadString('Configuracao', 'Server', 'localhost');
    FUserName := ReadString('Configuracao', 'User', 'root');
    FPassword := ReadString('Configuracao', 'Password', 'result');
    FPort := ReadString('Configuracao', 'Port', '3306');
    FDriver := ReadString('Configuracao', 'Driver', 'MySQL');
  finally
    Free;
  end;

  FConexao := TFDConnection.Create(Application);
  FConexao.Params.Clear;
  FConexao.Params.Add('Database=' + FDatabase);
  FConexao.Params.Add('Server=' + FServer);
  FConexao.Params.Add('User_Name=' + FUserName);
  FConexao.Params.Add('Password=' + FPassword);
  FConexao.Params.Add('DriverID=' + FDriver);
  try
    FConexao.Connected := True;
  except
    on e:Exception do
    begin
      FMsgErro := e.Message;
      raise Exception.Create(e.Message);
    end;
  end;
end;

destructor TConexao.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TConexao.GetConexao: TFDConnection;
begin
  Result := FConexao;
end;

end.
