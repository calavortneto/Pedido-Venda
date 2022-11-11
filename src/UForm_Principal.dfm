object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedido de Venda'
  ClientHeight = 583
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Tag = 1
    Left = 5
    Top = 8
    Width = 84
    Height = 15
    Caption = 'N'#250'mero Pedido'
  end
  object Label2: TLabel
    Tag = 1
    Left = 139
    Top = 9
    Width = 70
    Height = 15
    Caption = 'Data Emiss'#227'o'
  end
  object Label3: TLabel
    Tag = 1
    Left = 233
    Top = 9
    Width = 65
    Height = 15
    Caption = 'C'#243'd. Cliente'
  end
  object Label4: TLabel
    Tag = 1
    Left = 598
    Top = 527
    Width = 120
    Height = 21
    Alignment = taRightJustify
    Caption = 'Total do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 564
    Width = 854
    Height = 19
    Panels = <>
  end
  object DBGrid1: TDBGrid
    Tag = 1
    Left = 5
    Top = 53
    Width = 841
    Height = 465
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnEnter = DBGrid1Enter
    OnExit = DBGrid1Exit
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        Title.Caption = 'C'#243'digo do Produto'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Descri'#231#227'o do Produto'
        Width = 397
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Quantidade'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vlr. Unit'#225'rio'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vlr. Total'
        Width = 95
        Visible = True
      end>
  end
  object edtNumeroPedido: TEdit
    Tag = 1
    Left = 5
    Top = 26
    Width = 84
    Height = 23
    Alignment = taRightJustify
    TabOrder = 0
    OnExit = edtNumeroPedidoExit
    OnKeyPress = edtNumeroPedidoKeyPress
  end
  object MskDataEmissao: TMaskEdit
    Tag = 1
    Left = 139
    Top = 26
    Width = 88
    Height = 23
    EditMask = '##/##/####;1; '
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
    OnExit = MskDataEmissaoExit
  end
  object edtCodigoCliente: TEdit
    Tag = 1
    Left = 233
    Top = 26
    Width = 84
    Height = 23
    Alignment = taRightJustify
    TabOrder = 3
    OnExit = edtCodigoClienteExit
    OnKeyPress = edtNumeroPedidoKeyPress
  end
  object edtTotalPedido: TEdit
    Tag = 1
    Left = 723
    Top = 523
    Width = 125
    Height = 29
    TabStop = False
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    Text = '0,00'
    OnKeyPress = edtNumeroPedidoKeyPress
  end
  object edtDescricaoCliente: TEdit
    Tag = 1
    Left = 321
    Top = 26
    Width = 397
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 4
  end
  object btnGravarPedido: TBitBtn
    Tag = 1
    Left = 5
    Top = 524
    Width = 130
    Height = 30
    Caption = '&Gravar Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Glyph.Data = {
      5A010000424D5A01000000000000760000002800000012000000130000000100
      040000000000E4000000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778877777
      7777770000007777844877777777770000007778444487777777770000007784
      4444487777777700000078444C4444877777770000007444C4C4448777777700
      00007C4C444C444877777700000078C44444C4448777770000008444C4444C44
      487777000000444C7C4448C4448777000000C4C777C4448C4448770000007C77
      777C4448C4448700000077777777C4448C4487000000777777777C4448C44700
      00007777777777C4448C7700000077777777777C444877000000777777777777
      C448770000007777777777777C447700000077777777777777C777000000}
    ParentFont = False
    TabOrder = 10
    OnClick = btnGravarPedidoClick
  end
  object btnNovo: TBitBtn
    Tag = 1
    Left = 723
    Top = 24
    Width = 41
    Height = 25
    Hint = 'Incluir Produto'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000FFFF00000000000000000000000000FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000FFFF00000000000000000000000000FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      000000000000000000000000000000000000000000000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnNovoClick
  end
  object btnAlterar: TBitBtn
    Tag = 1
    Left = 765
    Top = 24
    Width = 41
    Height = 25
    Hint = 'Alterar Produto'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF0000000000FF00FF0000000000FF00FF0000000000FF00FF000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      000000FFFF008486840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      000000FFFF00C6C7C60000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000000000FFFF008486840000000000FF00FF00FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00C6C7C60000000000FF00FF00FF00FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000FFFF008486840000000000FF00FF0000000000FFFF
      FF00848684008486840084868400FFFFFF00848684008486840084868400FFFF
      FF00000000000000000000FFFF000000000000000000FF00FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF00FF000000000000008400000084000000000000000000FFFF
      FF00848684008486840084868400FFFFFF00848684008486840084868400FFFF
      FF0000000000FF00FF00000000000000000000000000FF00FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
      FF00848684008486840084868400FFFFFF00848684008486840084868400FFFF
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnAlterarClick
  end
  object btnRemover: TBitBtn
    Tag = 1
    Left = 807
    Top = 24
    Width = 41
    Height = 25
    Hint = 'Excluir Produto'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00
      FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
      FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
      0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
      FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00
      FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = btnRemoverClick
  end
  object pnlItensPedido: TPanel
    Tag = 1
    Left = 147
    Top = 211
    Width = 561
    Height = 162
    TabOrder = 12
    Visible = False
    object lblCodProduto: TLabel
      Left = 9
      Top = 39
      Width = 71
      Height = 15
      Caption = 'C'#243'd. Produto'
    end
    object Label6: TLabel
      Left = 9
      Top = 87
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label7: TLabel
      Left = 102
      Top = 87
      Width = 62
      Height = 15
      Caption = 'Vlr. Unit'#225'rio'
    end
    object Label8: TLabel
      Left = 196
      Top = 87
      Width = 45
      Height = 15
      Caption = 'Vlr. Total'
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 559
      Height = 32
      Align = alTop
      Alignment = taLeftJustify
      BevelKind = bkTile
      Caption = '  Lan'#231'amento :: Itens do Pedido'
      Color = 7752498
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object btnFechar: TSpeedButton
        Left = 527
        Top = 1
        Width = 27
        Height = 26
        Align = alRight
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnFecharClick
        ExplicitLeft = 597
      end
    end
    object StatusBar2: TStatusBar
      Left = 1
      Top = 147
      Width = 559
      Height = 14
      Panels = <>
    end
    object btnConfirmar: TBitBtn
      Left = 325
      Top = 100
      Width = 107
      Height = 27
      Caption = '&Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        5A010000424D5A01000000000000760000002800000012000000130000000100
        040000000000E4000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778877777
        7777770000007777844877777777770000007778444487777777770000007784
        4444487777777700000078444C4444877777770000007444C4C4448777777700
        00007C4C444C444877777700000078C44444C4448777770000008444C4444C44
        487777000000444C7C4448C4448777000000C4C777C4448C4448770000007C77
        777C4448C4448700000077777777C4448C4487000000777777777C4448C44700
        00007777777777C4448C7700000077777777777C444877000000777777777777
        C448770000007777777777777C447700000077777777777777C777000000}
      ParentFont = False
      TabOrder = 6
      OnClick = btnConfirmarClick
    end
    object btnRetornar: TBitBtn
      Left = 440
      Top = 100
      Width = 107
      Height = 27
      Caption = '&Retornar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000084828400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF000000FF000000FF
        000000FF000000FF0000000000000000000084828400FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF000000FF000000FF
        000000FF000000FF000000FF000000BE000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF000000FF000000FF
        000000FF000000FF000000BE000000FF000000BE000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000FF000000BE000000BE000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000BE000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000BE000000000000FF00FF00FF00
        FF000000000000FF000000000000000000000000000000000000000000000000
        0000000000000000000000FF000000BE000000BE000000000000FF00FF000000
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000BE000000FF000000BE0000000000000000000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000BE000000000000FF00FF00FF00FF000000
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF00000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF000000000000FF000000000000000000000000000000000000000000000000
        0000000000000000000084828400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentFont = False
      TabOrder = 7
      OnClick = btnRetornarClick
    end
    object edtCodigoProduto: TEdit
      Left = 9
      Top = 56
      Width = 84
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
      OnExit = edtCodigoProdutoExit
      OnKeyPress = edtNumeroPedidoKeyPress
    end
    object edtDescricaoProduto: TEdit
      Left = 100
      Top = 56
      Width = 447
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtQuantidade: TEdit
      Left = 9
      Top = 104
      Width = 84
      Height = 23
      Alignment = taRightJustify
      TabOrder = 3
      Text = '0,00'
      OnExit = edtQuantidadeExit
      OnKeyPress = edtQuantidadeKeyPress
    end
    object edtVlrUnitario: TEdit
      Left = 102
      Top = 104
      Width = 84
      Height = 23
      Alignment = taRightJustify
      TabOrder = 4
      Text = '0,00'
      OnExit = edtQuantidadeExit
      OnKeyPress = edtQuantidadeKeyPress
    end
    object edtVlrTotal: TEdit
      Left = 196
      Top = 104
      Width = 84
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      Text = '0,00'
      OnKeyPress = edtQuantidadeKeyPress
    end
  end
  object btnRemoverPedido: TBitBtn
    Left = 91
    Top = 24
    Width = 41
    Height = 25
    Hint = 'Excluir Pedido'
    Enabled = False
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00
      FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
      FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
      0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
      FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00
      FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00
      FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = btnRemoverPedidoClick
  end
end
