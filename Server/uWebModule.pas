unit uWebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait;

type
  TWebModule1 = class(TWebModule)
    DBConnection: TFDConnection;
    Query: TFDQuery;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModule1GetProdutosAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1GetPromocoesAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1GetDeptoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1GetSecaoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    Function ToJson(aQuery : TFDQuery) : String;
  public
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

Uses
   System.JSON;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application</body>' +
    '</html>';
end;

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
DBConnection.Connected := true;
end;

function TWebModule1.ToJson(aQuery: TFDQuery): String;
Var
   Resp : TJsonObject;
   Rows : TJsonArray;
   Arr  : TJsonArray;
   I    : Integer;
begin
Resp := TJsonObject.Create;
Arr  := TJsonArray.Create;
for I := 0 to aQuery.FieldCount-1 do
   Arr.Add(aQuery.FieldDefs[I].Name);
Resp.AddPair('columns', Arr);
Rows := TJsonArray.Create;
while Not Query.Eof do
   Begin
   Arr  := TJsonArray.Create;
   for I := 0 to aQuery.FieldCount-1 do
      Arr.Add(aQuery.Fields[i].AsString);
   Rows.Add(Arr);
   Query.Next;
   End;
Resp.AddPair('rows', Rows);
Result := Resp.ToJSON;
end;




procedure TWebModule1.WebModule1GetDeptoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
Query.Open('Select * From category');
Response.Content := ToJson(Query);
Query.Close;
end;

procedure TWebModule1.WebModule1GetSecaoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
Query.Open('Select * From subcategory Where idCat = '+Request.ContentFields.Values['id']);
Response.Content := ToJson(Query);
Query.Close;
end;

procedure TWebModule1.WebModule1GetProdutosAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
Query.SQL.Text := 'Select * From products Where idCat = :idCat And idSubCat = :idSubCat';
Query.ParamByName('idCat')   .AsString := Request.ContentFields.Values['idCat'];
Query.ParamByName('idSubCat').AsString := Request.ContentFields.Values['idSubCat'];
Query.Open;
Response.Content := ToJson(Query);
Query.Close;
end;

procedure TWebModule1.WebModule1GetPromocoesAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
Query.Open('Select * From products where promo =1');
Response.Content := ToJson(Query);
Query.Close;
end;

end.
