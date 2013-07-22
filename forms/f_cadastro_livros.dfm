inherited frm_cadastro_livros: Tfrm_cadastro_livros
  Caption = 'Biblioteca - Cadastro de Livros'
  ClientHeight = 547
  ClientWidth = 794
  OnShow = FormShow
  ExplicitWidth = 800
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited Image1: TImage
    Width = 794
    ExplicitLeft = 0
    ExplicitTop = -6
    ExplicitWidth = 794
  end
  inherited lbl_titulo: TLabel
    Top = 8
    Width = 293
    Caption = 'Biblioteca - Cadastro de Livros'
    ExplicitTop = 8
    ExplicitWidth = 293
  end
  inherited Panel1: TPanel
    Top = 282
    Width = 794
    ExplicitTop = 282
    ExplicitWidth = 794
    inherited btn_salvar: TrkGlassButton
      Left = 19
      ExplicitLeft = 19
    end
    inherited btn_alterar: TrkGlassButton
      Left = 107
      ExplicitLeft = 107
    end
    inherited btn_apagar: TrkGlassButton
      Left = 198
      ExplicitLeft = 198
    end
    inherited btn_sair: TrkGlassButton
      Left = 682
      ExplicitLeft = 682
    end
    inherited btn_busca: TrkGlassButton
      Left = 286
      OnClick = btn_buscaClick
      ExplicitLeft = 286
    end
    inherited rkGlassButton1: TrkGlassButton
      Left = 375
      ExplicitLeft = 375
    end
    inherited DBGrid1: TDBGrid
      Width = 788
    end
  end
  inherited Panel2: TPanel
    Width = 794
    Height = 241
    ExplicitWidth = 794
    ExplicitHeight = 241
    object Bevel1: TBevel
      Left = 10
      Top = 6
      Width = 775
      Height = 230
    end
    object Label1: TLabel
      Left = 21
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 101
      Top = 20
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object Label3: TLabel
      Left = 226
      Top = 20
      Width = 26
      Height = 13
      Caption = 'Titulo'
    end
    object Label4: TLabel
      Left = 228
      Top = 64
      Width = 27
      Height = 13
      Caption = 'Autor'
    end
    object Label5: TLabel
      Left = 21
      Top = 64
      Width = 34
      Height = 13
      Caption = 'Editora'
    end
    object Label6: TLabel
      Left = 441
      Top = 64
      Width = 35
      Height = 13
      Caption = 'G'#234'nero'
    end
    object Label7: TLabel
      Left = 656
      Top = 64
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label8: TLabel
      Left = 21
      Top = 106
      Width = 47
      Height = 13
      Caption = 'Categoria'
    end
    object Label9: TLabel
      Left = 188
      Top = 107
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label10: TLabel
      Left = 21
      Top = 147
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
    end
    object Label11: TLabel
      Left = 355
      Top = 107
      Width = 37
      Height = 13
      Caption = 'Armario'
    end
    object Label12: TLabel
      Left = 568
      Top = 104
      Width = 32
      Height = 13
      Caption = 'Tombo'
    end
    object Label13: TLabel
      Left = 456
      Top = 107
      Width = 23
      Height = 13
      Caption = 'N'#237'vel'
    end
    object DBEdit1: TDBEdit
      Left = 21
      Top = 36
      Width = 73
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 99
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edt_titulo: TDBEdit
      Left = 226
      Top = 36
      Width = 543
      Height = 21
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 21
      Top = 79
      Width = 199
      Height = 21
      TabOrder = 3
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 228
      Top = 79
      Width = 199
      Height = 21
      TabOrder = 4
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 441
      Top = 79
      Width = 199
      Height = 21
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 656
      Top = 79
      Width = 113
      Height = 21
      TabOrder = 6
      OnKeyPress = DBEdit4KeyPress
    end
    object DBCheckBox1: TDBCheckBox
      Left = 698
      Top = 122
      Width = 71
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo'
      TabOrder = 7
      ValueChecked = '-1'
      ValueUnchecked = '0'
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 21
      Top = 122
      Width = 160
      Height = 21
      TabOrder = 8
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 188
      Top = 122
      Width = 160
      Height = 21
      TabOrder = 9
    end
    object DBMemo1: TDBMemo
      Left = 21
      Top = 163
      Width = 748
      Height = 65
      TabOrder = 10
    end
    object DBEdit5: TDBEdit
      Left = 355
      Top = 122
      Width = 96
      Height = 21
      TabOrder = 11
    end
    object DBEdit6: TDBEdit
      Left = 568
      Top = 122
      Width = 121
      Height = 21
      TabOrder = 12
    end
    object DBEdit7: TDBEdit
      Left = 456
      Top = 122
      Width = 105
      Height = 21
      TabOrder = 13
    end
  end
  inherited tab_principal: TZQuery
    Left = 312
    Top = 384
  end
  inherited dts_master: TDataSource
    Left = 376
    Top = 384
  end
  inherited pop_opcoes: TPopupMenu
    Left = 432
    Top = 384
    object NovaCategoria1: TMenuItem
      Caption = 'Nova Categoria'
      OnClick = NovaCategoria1Click
    end
    object NovaEditora1: TMenuItem
      Caption = 'Nova Editora'
      OnClick = NovaEditora1Click
    end
    object NovoGnero1: TMenuItem
      Caption = 'Novo G'#234'nero'
      OnClick = NovoGnero1Click
    end
    object NovoAutor1: TMenuItem
      Caption = 'Novo Autor'
      OnClick = NovoAutor1Click
    end
    object NovoFornecedor1: TMenuItem
      Caption = 'Novo Fornecedor'
      OnClick = NovoFornecedor1Click
    end
  end
end
