unit f_locacao_livros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, f_form_normal, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, rkGlassButton, Vcl.Menus, Vcl.Grids, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid;

type
  Tfrm_locacao_livros = class(Tfrm_form_normal)
    Panel1: TPanel;
    Image2: TImage;
    btn_sair: TrkGlassButton;
    Panel2: TPanel;
    rkGlassButton1: TrkGlassButton;
    grade_usuarios: TStringGrid;
    tab_principal: TZQuery;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    JvDBGrid1: TJvDBGrid;
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUsuario : String;
  public
    { Public declarations }
  end;

var
  frm_locacao_livros: Tfrm_locacao_livros;

implementation

{$R *.dfm}

uses f_funcoes, f_menu;

procedure Tfrm_locacao_livros.btn_sairClick(Sender: TObject);
var
   tab_busca : TZReadOnlyQuery;
begin
   FUsuario := BuscaDados('Nome;SobreNome;RG,Bairro','Nome;Sobre Nome; Rg; Bairro','usuarios','Usuários');
   if FUsuario <> '0' then begin
      tab_busca := TZReadOnlyQuery.Create(nil);
      with tab_busca do begin
         Connection := frm_menu.zconn;
         SQL.Add('SELECT ');
         SQL.Add('	ID,');
         SQL.Add('	Concat(Nome ," ",SobreNome) AS Nome_SobreNome,');
         SQL.Add('	Concat("Rua: ",Rua," nº ",Numero_Casa," Bairro: ",Bairro," - ",Complemento) AS endereco_completo');
         SQL.Add('FROM usuarios');
         SQL.Add('	WHERE ID = ' + FUsuario);
         Open;
      end;

     grade_usuarios.Cells[0,1] := tab_busca.FieldByName('ID').AsString;
     grade_usuarios.Cells[1,1] := tab_busca.FieldByName('Nome_SobreNome').AsString;
     grade_usuarios.Cells[2,1] := tab_busca.FieldByName('endereco_completo').AsString;

     tab_busca.Free;
   end;
end;

procedure Tfrm_locacao_livros.FormShow(Sender: TObject);
begin
  inherited;
  grade_usuarios.Cells[0,0] := 'Código';
  grade_usuarios.Cells[1,0] := 'Nome';
  grade_usuarios.Cells[2,0] := 'Endereço';

end;

end.
