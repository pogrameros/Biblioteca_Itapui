unit f_funcoes;

interface

uses
   SysUtils,Classes,Forms,windows,Data.DB,ZAbstractRODataset, ZAbstractDataset, ZDataset,ZSqlUpdate, StdCtrls,StrUtils;

type
   TFuncoes = class

   private
      { private declarations }
   public
      { public declarations }
   end;

procedure ConectarBanco;

procedure RodaQuery(StrSQL : String);overload;
procedure RodaQuery(StrSQL : TStringList);overload;
procedure TrocaQuery(Componente  : TZQuery ; StrSQL : String);overload;
procedure TrocaQuery(Componente  : TZReadOnlyQuery ; StrSQL : String);overload;

function GeraUpdate(nome_tabela : String) : TStringList;
Function GeraInsert(nome_tabela : String) : TStringList;
Function GeraDelete(nome_tabela : String) : TStringList;
procedure TrataZUpdate(ZQuery_Master : TZQuery ;Componente : TZUpdateSQL; Nome_Tabela : String);

// utilizar no evendo Keypress do componente
procedure ApenasTexto(Edit: TComponent;var Key: Char);
procedure ApenasNumeros(Edit: TComponent;var Key: Char);

function BuscaDados(Campos : string; Titulos : string; Nome_Tabela : String; Titulo_Tela_Busca : String ;SQL_Extra : String = '' ) : String;

function isFieldKey(nome_campo : String) : Boolean;

implementation

uses f_menu, f_form_busca_base;



procedure ConectarBanco;
var
   Dir_config,Dir_DLL : String;
   Lista: TStringList;
begin
   Dir_config := ExtractFilePath(Application.ExeName)+'configs.ini';
   Dir_DLL    := ExtractFilePath(Application.ExeName)+'libmysql.dll';

   Lista := TStringList.Create;

   try
      try
         if (FileExists(Dir_config) AND (FileExists(Dir_DLL)))then begin
            lista.LoadFromFile(Dir_config);

            with frm_menu.zconn do begin
               Disconnect;
               ClientCodepage := 'utf8';
               LibraryLocation := Dir_DLL;
               Port :=  Strtoint(lista[1]);
               HostName := lista[0];
               Database := 'db_biblioteca';
               Password := 'master';
               Connect;
            end;
          end
         else begin
            Application.MessageBox('Erro ao Conectar ao banco de Dados, Contate o Administrador...' ,'Erro ao Conectar' ,MB_OK+MB_ICONERROR);
            frm_menu.StatusBar1.panels[3].Text := 'Acesso a Dados negado!';
         end;
      Except
         on E:Exception do begin
            Application.MessageBox('Erro ao Conectar ao banco de Dados, Contate o Administrador...' , 'Erro',MB_OK+MB_ICONERROR);
            frm_menu.StatusBar1.panels[3].Text := 'Acesso a Dados negado!';
            Lista.Free;
            Exit;
         end;
      end;
   finally
      frm_menu.StatusBar1.panels[3].Text := 'Acesso a Dados Ok!';
      Lista.Free;
   end;
end;

procedure RodaQuery(StrSQL : String);overload;
begin
   with TZQuery.Create(nil) do try
      Connection := frm_menu.zconn;
      SQL.Add(StrSQL);
      ExecSQL;
   finally
      Free;
   end;
end;

procedure RodaQuery(StrSQL : TStringList);overload;
begin
   with TZQuery.Create(nil) do try
      Connection := frm_menu.zconn;
      SQL.Add(StrSQL.Text);
      ExecSQL;
   finally
      Free;
   end;
end;

procedure TrocaQuery(Componente  : TZQuery ; StrSQL : String);overload;
begin
   with Componente do begin
      Close;
      SQL.Clear;
      SQL.Add(StrSQL);
      Open;
   end;
end;

procedure TrocaQuery(Componente  : TZReadOnlyQuery ; StrSQL : String);overload;
begin
   with Componente do begin
      Close;
      SQL.Clear;
      SQL.Add(StrSQL);
      Open;
   end;
end;

function GeraUpdate(nome_tabela : String) : TStringList;
begin
   Result := TStringList.Create;

   with TZReadOnlyQuery.Create(nil) do try
      Connection := frm_menu.zconn;
       SQL.Add('desc '+ nome_tabela);
       //adiciona primeira linha da instrução SQL
       Result.Add('Update ' + nome_tabela + ' SET ');
       Open;
       //gera lista com nome dos campos e com os parametros referentes
       while not EOF do begin
          Result.Add(FieldByName('Field').AsString + '= :' + FieldByName('Field').AsString);
          Result.Add(',');
          Next;
       end;
       Result.Delete(Result.Count-1);
       //pega campo primario, e gera filtro WHERE
       First;
       Result.Add('WHERE ');
       Result.Add(FieldByName('Field').AsString + '= :OLD_' + FieldByName('Field').AsString);
   finally
      Free;
   end;
end;

Function GeraInsert(nome_tabela : String) : TStringList;
begin
   Result := TStringList.Create;

   with TZReadOnlyQuery.Create(nil) do try
      Connection := frm_menu.zconn;
       SQL.Add('desc '+ nome_tabela);
       //adiciona primeira linha da instrução SQL
       Result.Add('INSERT INTO ' + nome_tabela + ' SET ');
       Open;

       //gera lista com nome dos campos e com os parametros referentes
       while not EOF do begin
          Result.Add(FieldByName('Field').AsString + '= :' + FieldByName('Field').AsString);
          Result.Add(',');
          Next;
       end;
       Result.Delete(Result.Count-1);
   finally
      Free;
   end;
end;

Function GeraDelete(nome_tabela : String) : TStringList;
begin
   Result := TStringList.Create;

   with TZReadOnlyQuery.Create(nil) do try
      Connection := frm_menu.zconn;
       SQL.Add('desc '+ nome_tabela);
       //adiciona primeira linha da instrução SQL
       Result.Add('DELETE FROM ' + nome_tabela + ' WHERE ');
       Open;
       //gera filtro WHERE
       Result.Add(FieldByName('Field').AsString + '= :OLD_' + FieldByName('Field').AsString);
   finally
      Free;
   end;
end;

procedure TrataZUpdate(ZQuery_Master : TZQuery ;Componente : TZUpdateSQL; Nome_Tabela : String);
begin
   with Componente do begin
      DeleteSQL := GeraDelete(Nome_Tabela);
      ModifySQL := GeraUpdate(Nome_Tabela);
      InsertSQL := GeraInsert(Nome_Tabela);
      RefreshSQL := ZQuery_Master.SQL;
   end;
end;

procedure ApenasTexto(Edit: TComponent;var Key: Char);
begin
   if not ((Key in ['a'..'z']) or (Key in ['A'..'Z']) or (Key in[#8,#83,#34,#44])) then begin
      Key := #0;
   end;
end;

procedure ApenasNumeros(Edit: TComponent;var Key: Char);
begin
    if not ((Key in ['0'..'9']) or (Key in[#08,#83,#44])) then begin
       Key := #0;
    end;
end;

function BuscaDados(Campos : string; Titulos : string; Nome_Tabela : String; Titulo_Tela_Busca : String ;SQL_Extra : String = '' ) : String;
begin
   frm_menu.pub_string_busca := '';
   frm_form_busca_base := Tfrm_form_busca_base.Create(Application);

   with frm_form_busca_base do begin
      FCampos      := Campos;
      FTitulos     := Titulos;
      FNome_Tabela := Nome_Tabela;
      FSQL_Extra   := SQL_Extra;
      FTitulo_Tela_Busca := Titulo_Tela_Busca;
   end;

   frm_form_busca_base.ShowModal;
   Result := frm_menu.pub_string_busca;
end;

function isFieldKey(nome_campo : String) : Boolean;
begin
   Result := False;

   if (LeftStr(nome_campo,3) = 'ID_') or (LeftStr(nome_campo,6) = 'Codigo') then begin
      Result := True;
   end;
end;


end.
