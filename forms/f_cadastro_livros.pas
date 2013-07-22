unit f_cadastro_livros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, f_cadastro_base, Vcl.Menus, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  rkGlassButton, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Mask,
  Vcl.DBCtrls;

type
  Tfrm_cadastro_livros = class(Tfrm_form_cadastro_base)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Label8: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label10: TLabel;
    DBMemo1: TDBMemo;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    NovaCategoria1: TMenuItem;
    NovoGnero1: TMenuItem;
    NovoAutor1: TMenuItem;
    NovoFornecedor1: TMenuItem;
    NovaEditora1: TMenuItem;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure btn_buscaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cadastro_livros: Tfrm_cadastro_livros;

implementation

{$R *.dfm}

uses f_funcoes;

procedure Tfrm_cadastro_livros.btn_buscaClick(Sender: TObject);
var
   Valor : String;
begin
   inherited;
   Valor := BuscaDados('Referencia;Titulo;Autor;Editora','Refêrencia;Título;Autor;Editora','Livros','Livros');

   tab_principal.Locate('ID',Valor,[]);
end;

procedure Tfrm_cadastro_livros.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
   ApenasNumeros(DBEdit4,Key);
end;

procedure Tfrm_cadastro_livros.FormShow(Sender: TObject);
begin
   inherited;
   TrocaQuery(tab_principal,'SELECT * FROM Livros');
end;

end.
