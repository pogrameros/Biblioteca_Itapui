unit f_locacao_livros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, f_form_normal, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, rkGlassButton, Vcl.Menus;

type
  Tfrm_locacao_livros = class(Tfrm_form_normal)
    btn_sair: TrkGlassButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_locacao_livros: Tfrm_locacao_livros;

implementation

{$R *.dfm}

end.
