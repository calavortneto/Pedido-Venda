unit UForm_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Datasnap.DBClient, System.StrUtils,

  UClasse.Controle,
  UClasse.Cadastro.Cliente,
  UClasse.Cadastro.Produto,
  UClasse.Movimento.Pedido,

  UFuncoes;

type
  TFuncao = (Habilitar, Desabilitar);
  TMovimento = (Inserindo, Alterando, Neutro);

  TForm_Principal = class(TForm)
    Informacao: TStatusBar;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtNumeroPedido: TEdit;
    MskDataEmissao: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigoCliente: TEdit;
    Label4: TLabel;
    edtTotalPedido: TEdit;
    edtDescricaoCliente: TEdit;
    btnGravarPedido: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnRemover: TBitBtn;
    pnlItensPedido: TPanel;
    Panel2: TPanel;
    StatusBar2: TStatusBar;
    btnFechar: TSpeedButton;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    lblCodProduto: TLabel;
    edtCodigoProduto: TEdit;
    edtDescricaoProduto: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtQuantidade: TEdit;
    edtVlrUnitario: TEdit;
    edtVlrTotal: TEdit;
    btnRemoverPedido: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
    procedure MskDataEmissaoExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroPedidoExit(Sender: TObject);
    procedure btnRemoverPedidoClick(Sender: TObject);
    procedure edtNumeroPedidoMouseEnter(Sender: TObject);
    procedure edtNumeroPedidoMouseLeave(Sender: TObject);
    procedure btnRemoverPedidoMouseEnter(Sender: TObject);
    procedure btnRemoverPedidoMouseLeave(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }

    cdsItensPedido: TClientDataSet;
    dsItensPedido: TDataSource;
    FMovimento: TMovimento;

    procedure Manutencao(Funcao: TFuncao);
    procedure LimparProduto;
    procedure NovoPedido;
    procedure TotalizarPedido;

    function TiraPonto(Valor: String): String;

  public
    { Public declarations }
  end;

var
  Form_Principal: TForm_Principal;

implementation

{$R *.dfm}

procedure TForm_Principal.btnRetornarClick(Sender: TObject);
begin
  FMovimento := Neutro;
  Manutencao(Habilitar);
  pnlItensPedido.Visible := False;
  if DBGrid1.CanFocus then
    DBGrid1.SetFocus;
end;

procedure TForm_Principal.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DBGrid1.Canvas.Font.Color := clBlack;
  if cdsItensPedido.FieldByName('ds_deletado').AsString = 'T' then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Principal.DBGrid1Enter(Sender: TObject);
begin
  KeyPreview := False;
end;

procedure TForm_Principal.DBGrid1Exit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TForm_Principal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    btnAlterar.Click
  else if key = 46 then
    btnRemover.Click;
end;

procedure TForm_Principal.btnAlterarClick(Sender: TObject);
begin
  if cdsItensPedido.IsEmpty then
    Exit;

  if cdsItensPedido.FieldByName('ds_deletado').AsString = 'T' then
    Exit;

  FMovimento := Alterando;
  Manutencao(Desabilitar);
  LimparProduto;

  lblCodProduto.Enabled := False;
  edtCodigoProduto.Enabled := False;
  edtDescricaoProduto.Enabled := False;

  edtCodigoProduto.Text := cdsItensPedido.FieldByName('id_produto').AsInteger.ToString;
  edtDescricaoProduto.Text := cdsItensPedido.FieldByName('ds_produto').AsString;
  edtQuantidade.Text := FormatFloat('#,##0.00',cdsItensPedido.FieldByName('vl_quantidade').AsFloat);
  edtVlrUnitario.Text := FormatFloat('#,##0.00',cdsItensPedido.FieldByName('vl_unitario').AsFloat);
  edtVlrTotal.Text := FormatFloat('#,##0.00',cdsItensPedido.FieldByName('vl_total').AsFloat);

  pnlItensPedido.Visible := True;
  if edtQuantidade.CanFocus then
    edtQuantidade.SetFocus;
end;

procedure TForm_Principal.btnConfirmarClick(Sender: TObject);
begin
  if Trim(edtCodigoProduto.Text) = '' then
  begin
    Application.MessageBox('Cód. Produto deve ser informado.', 'Atenção',
      MB_ICONWARNING + MB_OK);
    if edtCodigoProduto.CanFocus then
      edtCodigoProduto.SetFocus;
    Exit;
  end;

  if StrToCurrDef(TiraPonto(edtQuantidade.Text),0) = 0 then
  begin
    Application.MessageBox('Quantidade deve ser informada.', 'Atenção',
      MB_ICONWARNING + MB_OK);
    if edtQuantidade.CanFocus then
      edtQuantidade.SetFocus;
    Exit;
  end;

  if StrToCurrDef(TiraPonto(edtVlrUnitario.Text),0) = 0 then
  begin
    Application.MessageBox('Vlr. Unitário deve ser informado.', 'Atenção',
      MB_ICONWARNING + MB_OK);
    if edtVlrUnitario.CanFocus then
      edtVlrUnitario.SetFocus;
    Exit;
  end;

  with cdsItensPedido do
  begin
    if FMovimento = Inserindo then
    begin
      Append;
      FieldByName('id_produtos_pedido').AsInteger := 0;
      FieldByName('id_numero_pedido').AsInteger := StrToIntDef(edtNumeroPedido.Text,1);
      FieldByName('id_produto').AsInteger := StrToIntDef(edtCodigoProduto.Text,0);
      FieldByName('ds_produto').AsString := edtDescricaoProduto.Text;
    end
    else if FMovimento = Alterando then
    begin
      Edit;
    end;
    FieldByName('vl_quantidade').AsCurrency := StrToCurrDef(TiraPonto(edtQuantidade.Text),0);
    FieldByName('vl_unitario').AsCurrency := StrToCurrDef(TiraPonto(edtVlrUnitario.Text),0);
    FieldByName('vl_total').AsCurrency := StrToCurrDef(TiraPonto(edtVlrTotal.Text),0);
    FieldByName('ds_deletado').AsString := 'F';
    Post;
  end;

  TotalizarPedido;
  FMovimento := Neutro;
  Manutencao(Habilitar);
  pnlItensPedido.Visible := False;
  if btnNovo.CanFocus then
    btnNovo.SetFocus;
end;

procedure TForm_Principal.btnFecharClick(Sender: TObject);
begin
  Manutencao(Habilitar);
  pnlItensPedido.Visible := False;
  if DBGrid1.CanFocus then
    DBGrid1.SetFocus;
end;

procedure TForm_Principal.btnGravarPedidoClick(Sender: TObject);
var
  Pedido: TPedido;
begin
  if Trim(edtNumeroPedido.Text) = '' then
  begin
    Application.MessageBox('Número do Pedido deve ser informado.', 'Atenção',
      MB_ICONWARNING + MB_OK);
    if edtNumeroPedido.CanFocus then
      edtNumeroPedido.SetFocus;
    Exit;
  end;

  if MskDataEmissao.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data de Emissão deve ser informada.', 'Atenção',
      MB_ICONWARNING + MB_OK);
    if MskDataEmissao.CanFocus then
      MskDataEmissao.SetFocus;
    Exit;
  end;

  if Trim(edtCodigoCliente.Text) = '' then
  begin
    Application.MessageBox('Cliente deve ser informado.', 'Atenção',
      MB_ICONWARNING + MB_OK);
    if edtCodigoCliente.CanFocus then
      edtCodigoCliente.SetFocus;
    Exit;
  end;

  if cdsItensPedido.IsEmpty then
  begin
    Application.MessageBox('Produo(s) não informado(s).', 'Atenção',
      MB_ICONWARNING + MB_OK);
    if btnNovo.CanFocus then
      btnNovo.SetFocus;
    Exit;
  end;

  try
    Pedido := TPedido.Create;
    Pedido.Numero := StrToIntDef(edtNumeroPedido.Text,0);
    Pedido.idCliente := StrToIntDef(edtCodigoCliente.Text,0);
    Pedido.DtEmissao := StrToDate(MskDataEmissao.Text);
    Pedido.VlrTotal := StrToFloatDef(edtTotalPedido.Text,0);
    Pedido.Itens := cdsItensPedido;
    Pedido.RetItens := False;
    if Pedido.Post then
    begin
      Application.MessageBox('Pedigo gravado com sucesso.', 'Informação',
        MB_ICONINFORMATION + MB_OK);
      NovoPedido;
    end else
    begin
      Application.MessageBox('Falha ao gravar o Pedido.', 'Erro',
        MB_ICONERROR + MB_OK);
    end;
  finally
    Pedido.Free;
  end;
end;

procedure TForm_Principal.btnNovoClick(Sender: TObject);
begin
  Manutencao(Desabilitar);
  LimparProduto;

  FMovimento := Inserindo;
  lblCodProduto.Enabled := True;
  edtCodigoProduto.Enabled := True;
  edtDescricaoProduto.Enabled := True;

  pnlItensPedido.Visible := True;
  if edtCodigoProduto.CanFocus then
    edtCodigoProduto.SetFocus;
end;

procedure TForm_Principal.btnRemoverClick(Sender: TObject);
var
  Pedido: TPedido;
begin
  if cdsItensPedido.IsEmpty then
    Exit;

  if cdsItensPedido.FieldByName('ds_deletado').AsString = 'T' then
    Exit;

  if Application.MessageBox('Confirma a exclusão do produto selecionado?',
    'Pergunta', MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    if cdsItensPedido.FieldByName('id_produtos_pedido').AsInteger <> 0 then
    begin
      cdsItensPedido.Edit;
      cdsItensPedido.FieldByName('ds_deletado').AsString := 'T';
      cdsItensPedido.Post;
    end else
      cdsItensPedido.Delete;

    TotalizarPedido;
  end;
end;

procedure TForm_Principal.btnRemoverPedidoClick(Sender: TObject);
var
  Pedido: TPedido;
begin
  if Trim(edtNumeroPedido.Text) = '' then
    Exit;

  if Application.MessageBox('Confirma a exclusão do Pedido?',
    'Pergunta', MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    try
      Pedido := TPedido.Create;
      Pedido.Numero := StrToIntDef(edtNumeroPedido.Text,0);
      if Pedido.Delete then
      begin
        Application.MessageBox('Pedido excluído com sucesso.', 'Informação',
          MB_ICONINFORMATION + MB_OK);

        NovoPedido;
      end;
    finally
      Pedido.Free;
    end;
  end;
end;

procedure TForm_Principal.btnRemoverPedidoMouseEnter(Sender: TObject);
begin
  Informacao.Panels[0].Text := TBitBtn(Sender).Hint;
end;

procedure TForm_Principal.btnRemoverPedidoMouseLeave(Sender: TObject);
begin
  Informacao.Panels[0].Text := '';
end;

procedure TForm_Principal.edtCodigoClienteExit(Sender: TObject);
var
  Cliente: TCliente;
begin
  if Trim(edtCodigoCliente.Text) = '' then
  begin
    edtDescricaoCliente.Clear;
    Exit;
  end;

  try
    Cliente := TCliente.Create;
    Cliente.Codigo := StrToIntDef(edtCodigoCliente.Text, 0);
    if Cliente.Exists then
    begin
      edtDescricaoCliente.Text := Cliente.Nome;
    end else
    begin
      Application.MessageBox('Cliente não encontrado.', 'Atenção',
        MB_ICONWARNING + MB_OK);
      edtDescricaoCliente.Clear;
      if edtCodigoCliente.CanFocus then
        edtCodigoCliente.SetFocus;
    end;
  finally
    Cliente.Free;
  end;
end;

procedure TForm_Principal.edtCodigoProdutoExit(Sender: TObject);
var
  Produto: TProduto;
begin
  if Trim(edtCodigoProduto.Text) = '' then
  begin
    LimparProduto;
    Exit;
  end;

  try
    Produto := TProduto.Create;
    Produto.Codigo := StrToIntDef(edtCodigoProduto.Text, 0);
    if Produto.Exists then
    begin
      edtDescricaoProduto.Text := Produto.Nome;
      edtQuantidade.Text := '1,00';
      edtVlrUnitario.Text := FloatToStrF(Produto.Preco,ffNumber,15,2);
    end else
    begin
      Application.MessageBox(PChar('Produto ' + edtCodigoProduto.Text +
        ' não encontrado.'), 'Atenção', MB_ICONWARNING + MB_OK);
      LimparProduto;
      if edtCodigoProduto.CanFocus then
        edtCodigoProduto.SetFocus;
    end;
  finally
    Produto.Free;
  end;
end;

procedure TForm_Principal.edtNumeroPedidoExit(Sender: TObject);
var
  Pedido: TPedido;
begin
  if Trim(edtNumeroPedido.Text) = '' then
    Exit;

  try
    Pedido := TPedido.Create;
    Pedido.Numero := StrToIntDef(edtNumeroPedido.Text,0);
    Pedido.Itens := cdsItensPedido;
    Pedido.RetItens := True;
    if Pedido.Exists then
    begin
      MskDataEmissao.Text := DateToStr(Pedido.DtEmissao);
      edtCodigoCliente.Text := Pedido.idCliente.ToString;
      edtDescricaoCliente.Text := Pedido.dsCliente;
      btnRemoverPedido.Enabled := True;
      TotalizarPedido;
    end else
    begin
      btnRemoverPedido.Enabled := False;
      MskDataEmissao.Text := DateToStr(Date);
      edtCodigoCliente.Clear;
      edtDescricaoCliente.Clear;
      edtTotalPedido.Text := '0,00';

      FMovimento := Neutro;
      cdsItensPedido.EmptyDataSet;
      LimparProduto;
    end;
  finally
    Pedido.Free;
  end;
end;

procedure TForm_Principal.edtNumeroPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#0,#8]) then
    Key := #0;
end;

procedure TForm_Principal.edtNumeroPedidoMouseEnter(Sender: TObject);
begin
  Informacao.Panels[0].Text := TEdit(Sender).Hint;
end;

procedure TForm_Principal.edtNumeroPedidoMouseLeave(Sender: TObject);
begin
  Informacao.Panels[0].Text := '';
end;

procedure TForm_Principal.edtQuantidadeExit(Sender: TObject);
var
  vlrQtde, vlrUnitario: Currency;
begin
  vlrQtde := 0;
  vlrQtde := StrToCurrDef(TiraPonto(edtQuantidade.Text), 0);
  vlrUnitario := 0;
  vlrUnitario := StrToCurrDef(TiraPonto(edtVlrUnitario.Text), 0);
  edtQuantidade.Text := FormatFloat('#,##0.00', vlrQtde);
  edtVlrUnitario.Text := FormatFloat('#,##0.00', vlrUnitario);
  edtVlrTotal.Text := FormatFloat('#,##0.00', vlrQtde * vlrUnitario);
end;

procedure TForm_Principal.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  { Permitir digitação de numeros e virgula }
  if not (key in ['0'..'9',#8,#0,',']) then
  begin
    key := #0;
  end else
  begin
    { Não permitir o preenchimento de duas virgulas }
    if (Pos(',',TEdit(Sender).Text) > 1) and (key = ',') then
      key := #0;
  end;
end;

procedure TForm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(dsItensPedido) then
    FreeAndNil(dsItensPedido);

  if Assigned(cdsItensPedido) then
    FreeAndNil(cdsItensPedido);

  Action := Cafree;
end;

procedure TForm_Principal.FormCreate(Sender: TObject);
begin
  { TClientDataSet temporário :: Itens do Pedido }
  cdsItensPedido := TClientDataSet.Create(nil);
  cdsItensPedido.Active := False;
  cdsItensPedido.FieldDefs.Clear;
  cdsItensPedido.FieldDefs.Add('id_produtos_pedido', ftInteger);
  cdsItensPedido.FieldDefs.Add('id_numero_pedido', ftInteger);
  cdsItensPedido.FieldDefs.Add('id_produto', ftInteger);
  cdsItensPedido.FieldDefs.Add('ds_produto', ftString, 60);
  cdsItensPedido.FieldDefs.Add('vl_quantidade', ftCurrency);
  cdsItensPedido.FieldDefs.Add('vl_unitario', ftCurrency);
  cdsItensPedido.FieldDefs.Add('vl_total', ftCurrency);
  cdsItensPedido.FieldDefs.Add('ds_deletado', ftString, 1);
  cdsItensPedido.CreateDataSet;
  cdsItensPedido.EmptyDataSet;

  { TDataSource temporário :: Itens do Pedido }
  dsItensPedido := TDataSource.Create(nil);
  dsItensPedido.DataSet := cdsItensPedido;

  DBGrid1.Columns[0].FieldName := 'id_produto';
  DBGrid1.Columns[1].FieldName := 'ds_produto';
  DBGrid1.Columns[2].FieldName := 'vl_quantidade';
  DBGrid1.Columns[3].FieldName := 'vl_unitario';
  DBGrid1.Columns[4].FieldName := 'vl_total';
  DBGrid1.DataSource := dsItensPedido;
end;

procedure TForm_Principal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(wm_nextdlgctl,0,0);
  end;
end;

procedure TForm_Principal.FormShow(Sender: TObject);
begin
  NovoPedido;
end;

procedure TForm_Principal.LimparProduto;
begin
  edtCodigoProduto.Clear;
  edtDescricaoProduto.Clear;
  edtQuantidade.Text := '0,00';
  edtVlrUnitario.Text := '0,00';
  edtVlrTotal.Text := '0,00';
end;

procedure TForm_Principal.Manutencao(Funcao: TFuncao);
var
  x: Integer;
begin
  for x := 0 to Componentcount -1 do
  begin
    if Components[x].Tag <> 1 then
      Continue;

    if Components[x] is TDBGrid Then
      TDBGrid(Components[x]).Enabled := Funcao = Habilitar
    else if Components[x] is TEdit Then
      TEdit(Components[x]).Enabled := Funcao = Habilitar
    else if Components[x] is TLabel Then
      TLabel(Components[x]).Enabled := Funcao = Habilitar
    else if Components[x] is TMaskEdit Then
      TMaskEdit(Components[x]).Enabled := Funcao = Habilitar
    else if Components[x] is TBitBtn Then
      TBitBtn(Components[x]).Enabled := Funcao = Habilitar;
  end;
end;

procedure TForm_Principal.MskDataEmissaoExit(Sender: TObject);
var
  fDataEmissao: TDate;
begin
  if MskDataEmissao.Text <> '  /  /    ' then
    try
      fDataEmissao := StrToDate(MskDataEmissao.Text);
      MskDataEmissao.Text := FormatDateTime('dd/mm/yyyy', fDataEmissao);
    except
      Application.MessageBox(PChar('Data ' + MskDataEmissao.Text + ' inválida.'),
        'Erro', MB_ICONERROR + MB_OK);
      MskDataEmissao.SetFocus;
    end;
end;

procedure TForm_Principal.NovoPedido;
var
  Pedido: TPedido;
begin
  try
    Pedido := TPedido.Create;
    edtNumeroPedido.Text := Pedido.NewNum.ToString;
  finally
    Pedido.Free;
  end;

  btnRemoverPedido.Enabled := False;
  MskDataEmissao.Text := DateToStr(Date);
  edtCodigoCliente.Clear;
  edtDescricaoCliente.Clear;
  edtTotalPedido.Text := '0,00';

  FMovimento := Neutro;
  cdsItensPedido.EmptyDataSet;
  LimparProduto;

  if edtNumeroPedido.CanFocus then
    edtNumeroPedido.SetFocus;
end;

function TForm_Principal.TiraPonto(Valor: String): String;
begin
  { Retirar o Ponto da String }
  Result := StringReplace(Valor,'.','',[rfReplaceAll]);
end;

procedure TForm_Principal.TotalizarPedido;
var
  cdsTemp: TClientDataSet;
  vlrTotal: Currency;
begin
  vlrTotal := 0;
  if cdsItensPedido.IsEmpty then
  begin
    edtTotalPedido.Text := '0,00';
    Exit;
  end;

  try
    cdsTemp := TClientDataSet.Create(nil);
    cdsTemp.CloneCursor(cdsItensPedido, False);
    cdsTemp.First;
    while not cdsTemp.Eof do
    begin
      if cdsTemp.FieldByName('ds_deletado').AsString = 'T' then
      begin
        cdsTemp.Next;
        Continue;
      end;
      vlrTotal := vlrTotal + cdsTemp.FieldByName('vl_total').AsCurrency;
      cdsTemp.Next;
    end;
  finally
    FreeAndNil(cdsTemp);
  end;

  edtTotalPedido.Text := FormatFloat('#,##0.00', vlrTotal);
end;

end.
