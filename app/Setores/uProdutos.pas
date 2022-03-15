unit uProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISFrame, FMX.ISPlaceHolder, FMX.ISDownload, FMX.ISDataCardList, FMX.Objects, FMX.ISPath, FMX.ISObjects,
  FMX.ISControls, FMX.ISText, FMX.ISSearchEdit;

type
  [ISAutoCreate(_On)]
  TSetores_Produtos = class(TISFrameChildren)
    TxtTitulo: TISText;
    Lista: TISDataCardList;
    ISDownload1: TISDownload;
    ISSearchEdit1: TISSearchEdit;
    procedure ISframeChildrenReceiveMessage(aSender, aCommand, aData: string; aObject : TObject);
  private
    FCodCat: Integer;
    FSubCat: Integer;
    function GetTitulo: String;
    procedure SetTitulo(const Value: String);
    Procedure ListarProdutos;
  public
    Property Titulo : String  Read GetTitulo   Write SetTitulo;
    Property CodCat : Integer Read FCodCat     Write FCodCat;
    Property SubCat : Integer Read FSubCat     Write FSubCat;
  end;

implementation

{$R *.fmx}

{ TSetores_Produtos }

function TSetores_Produtos.GetTitulo: String;
begin
Result := TxtTitulo.Text;
end;

procedure TSetores_Produtos.ISframeChildrenReceiveMessage(aSender, aCommand, aData: string; aObject : TObject);
begin
if aCommand = 'List' then
   Begin
   CodCat := aData.Substring(0, 4).ToInteger;
   SubCat := aData.Substring(4, 4).ToInteger;
   Titulo := aData.Remove(0,8);
   ListarProdutos;
   End;
if aCommand = 'Clear' then
   TThread.CreateAnonymousThread(
      Procedure
      Begin
      Lista.Clear;
      End).Start;
end;

procedure TSetores_Produtos.ListarProdutos;
begin
TThread.CreateAnonymousThread(
   Procedure
   Begin
   Sleep(300);
   Lista.Clear;
   Lista.BeginUpdate;
   Lista.LoadFromJson(TISFrame.GetCard('CardProduto'), 'http://192.168.0.180:8080/getprodutos?idCat='+CodCat.ToString+'&idSubCat='+SubCat.ToString);
   Lista.EndUpdate;
   End).Start;
end;

procedure TSetores_Produtos.SetTitulo(const Value: String);
begin
TxtTitulo.Text := Value;
end;

initialization
RegisterFMXClasses([TSetores_Produtos]);

end.
