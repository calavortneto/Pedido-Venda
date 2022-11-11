program PedidoVenda;

uses
  Vcl.Forms,
  UForm_Principal in 'UForm_Principal.pas' {Form_Principal},
  UClasse.Conexao in 'classes\UClasse.Conexao.pas',
  UClasse.Controle in 'classes\UClasse.Controle.pas',
  UClasse.Cadastro.Cliente in 'classes\UClasse.Cadastro.Cliente.pas',
  UClasse.Movimento.Pedido in 'classes\UClasse.Movimento.Pedido.pas',
  UClasse.Cadastro.Produto in 'classes\UClasse.Cadastro.Produto.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.Run;
end.
