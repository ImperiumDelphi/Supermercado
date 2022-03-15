unit uChildrenOfertas;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISFrame, FMX.ISDataCardList, FMX.ISSearchEdit, FMX.ISDownload, FMX.ISPlaceHolder;

type
  [ISAutoCreate(_On)]
  TOfertas = class(TISFrameChildren)
    ISSearchEdit1: TISSearchEdit;
    Lista: TISDataCardList;
    ISDownload1: TISDownload;
    procedure ISframeChildrenShow(Sender: TObject);
    procedure ListaPullTop(Sender: TObject);
  private
    procedure ListaOfertas;
  public
  end;

implementation

{$R *.fmx}

procedure TOfertas.ListaOfertas;
Var
   I    : Integer;
begin
TThread.CreateAnonymousThread(
   Procedure
   Begin
   Lista.Clear;
   Lista.BeginUpdate;
   Lista.AddCard('CardOfertas');
   Lista.LoadFromJson(TISFrame.GetCard('CardProduto'), 'http://192.168.0.180:8080/getpromocoes');
   Lista.EndUpdate;
   End).Start;
end;

procedure TOfertas.ISframeChildrenShow(Sender: TObject);
begin
ListaOfertas;
end;

procedure TOfertas.ListaPullTop(Sender: TObject);
begin
ListaOfertas;
end;

initialization
RegisterFMXClasses([TOfertas]);

end.
