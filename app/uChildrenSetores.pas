unit uChildrenSetores;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISFrame, FMX.ISDataCardList;

type
  [ISAutoCreate(_On)]
  TSetores = class(TISFrameChildren)
    Lista: TISDataCardList;
    procedure ISframeChildrenShow(Sender: TObject);
    procedure ListaPullTop(Sender: TObject);
  private
    procedure ListaSetores;
  public
  end;

implementation

{$R *.fmx}

procedure TSetores.ListaSetores;
Var
   Card : TISFrameCard;
   I    : Integer;
begin
Card := TISFrame.GetCard('CardSetores');
Lista.Clear;
Lista.BeginUpdate;
for i := 1 to 25 do
   Begin
   Card.FieldByName('Nome')  .AsString := 'Setor '+I.ToString;
   Card.FieldByName('Imagem').AsString := 'https://app.jusimperium.com.br/Produtos/Imagens/Depto/C'+I.ToString+'.Png';
   Lista.AddCard(Card);
   End;
Lista.EndUpdate;
end;

procedure TSetores.ListaPullTop(Sender: TObject);
begin
ListaSetores;
end;

procedure TSetores.ISframeChildrenShow(Sender: TObject);
begin
ListaSetores;
end;

initialization
RegisterFMXClasses([TSetores]);

end.
