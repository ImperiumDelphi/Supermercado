unit uSubCategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISFrame, FMX.ISDataCardList, FMX.Objects, FMX.ISPath, FMX.ISObjects, FMX.ISControls, FMX.ISText, FMX.ISDownload,
  FMX.ISPlaceHolder, FMX.ISDataCard;

type
  [ISAutoCreate(_On)]
  TSetores_SubCategoria = class(TISFrameChildren)
    TxtTitulo: TISText;
    Lista: TISDataCardList;
    ISDownload1: TISDownload;
    procedure ISframeChildrenReceiveMessage(aSender, aCommand, aData: string; aObject : TObject);
    procedure ListaSelectCard(aRecord: TISDataCardRecord);
  private
    FCodCat: Integer;
    function GetTitulo: String;
    procedure SetTitulo(const Value: String);
    Procedure ListaSubCategorias;
  public
    Property Titulo : String  Read GetTitulo Write SetTitulo;
    PRoperty CodCat : Integer Read FCodCat   Write FCodCat;
  end;

implementation

{$R *.fmx}

{ TISFrameChildren1 }

function TSetores_SubCategoria.GetTitulo: String;
begin
Result := TxtTitulo.Text;
end;

procedure TSetores_SubCategoria.SetTitulo(const Value: String);
begin
TxtTitulo.Text := Value;
end;

procedure TSetores_SubCategoria.ISframeChildrenReceiveMessage(aSender, aCommand, aData: string; aObject : TObject);
begin
if aCommand = 'List' then
   Begin
   CodCat := aData.Substring(0, 4).ToInteger;
   Titulo := aData.Remove(0, 4);
   ListaSubCategorias;
   End;
if aCommand = 'Clear' then
   TThread.CreateAnonymousThread(
      Procedure
      Begin
      Lista.Clear;
      End).Start;
end;

procedure TSetores_SubCategoria.ListaSelectCard(aRecord: TISDataCardRecord);
begin
TISFrame.SendMessage(Name, 'Setores_Produtos', 'Clear', '');
TISFrame.SendMessage(Name, 'Setores_Produtos', 'List',  FormatFloat('0000',aRecord.FieldByName('idcat').AsInteger)+
                                                        FormatFloat('0000',aRecord.FieldByName('id')   .AsInteger)+
                                                        aRecord.FieldByName('Name').AsString);
TISFrame.SendMessage(Name, 'Setores',          'Index', '2');
end;

procedure TSetores_SubCategoria.ListaSubCategorias;
begin
TThread.CreateAnonymousThread(
   Procedure
   Begin
   Sleep(300);
   Lista.Clear;
   Lista.BeginUpdate;
   Lista.LoadFromJson(TISFrame.GetCard('CardSetores'), 'http://192.168.0.180:8080/getsecoes?id='+CodCat.ToString);
   Lista.EndUpdate;
   End).Start;
end;

initialization
RegisterFMXClasses([TSetores_SubCategoria]);

end.
