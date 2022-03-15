unit uCategorias;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISFrame, FMX.ISDataCardList, FMX.Objects,
  FMX.ISPath, FMX.ISObjects, FMX.ISControls, FMX.ISText,
  FMX.ISDataCard, FMX.ISDownload;

type
  [ISAutoCreate(_On)]
  TSetores_Categorias = class(TISFrameChildren)
    Lista: TISDataCardList;
    ISText1: TISText;
    ISDownload1: TISDownload;
    procedure ListaPullTop(Sender: TObject);
    procedure ListaSelectCard(aRecord: TISDataCardRecord);
    procedure ISframeChildrenActivate(Sender: TObject);
  private
    procedure ListaSetores;
  public
  end;

implementation

{$R *.fmx}

procedure TSetores_Categorias.ListaSelectCard(aRecord: TISDataCardRecord);
begin
TISFrame.SendMessage(Name, 'Setores_SubCategoria', 'Clear', '');
TISFrame.SendMessage(Name, 'Setores_SubCategoria', 'List',  FormatFloat('0000', aRecord.FieldByName('Id').AsInteger)+aRecord.FieldByName('Name')  .AsString);
TISFrame.SendMessage(Name, 'Setores',              'Index', '1');
end;

procedure TSetores_Categorias.ListaSetores;
begin
TThread.CreateAnonymousThread(
   Procedure
   Begin
   Lista.Clear;
   Lista.BeginUpdate;
   Lista.LoadFromJson(TISFrame.GetCard('CardSetores'), 'http://192.168.0.180:8080/getdepto');
   Lista.EndUpdate;
   End).Start;
end;

procedure TSetores_Categorias.ListaPullTop(Sender: TObject);
begin
ListaSetores;
end;

procedure TSetores_Categorias.ISframeChildrenActivate(Sender: TObject);
begin
if Lista.Count = 0 then
   ListaSetores;
end;

initialization
RegisterFMXClasses([TSetores_Categorias]);

end.
