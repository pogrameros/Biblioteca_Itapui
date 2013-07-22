unit f_sub_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, f_cadastro_base, Vcl.Menus, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  rkGlassButton, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Mask,
  Vcl.DBCtrls;

type
  Tfrm_form_cadastro_base2 = class(Tfrm_form_cadastro_base)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_form_cadastro_base2: Tfrm_form_cadastro_base2;

implementation

{$R *.dfm}

end.
