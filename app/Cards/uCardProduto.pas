unit uCardProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISDataCard, FMX.ISFrame, FMX.Objects, FMX.ISPath, FMX.ISObjects, FMX.ISControls, FMX.ISText, FMX.ISDataCardFields,
  FMX.ISIcon, FMX.ISDataCardImageFieldEx, FMX.Layouts, FMX.ISPrice, FMX.ISLayout;

type
  [ISAutoCreate(_On)]
  TCardProduto = class(TISFrameCard)
    ISTextField1: TISTextField;
    ISIconField1: TISIconField;
    Imagem: TISImageFieldEx;
    ISWorkField1: TISWorkField;
    ISWorkField2: TISWorkField;
    ISWorkField3: TISWorkField;
    ISWorkField4: TISWorkField;
    ISPriceField1: TISPriceField;
    LayPre: TLayout;
    ImgOferta: TISImage;
    procedure ISFrameCardLoadRecord(Sender: TObject);
    procedure ISFrameCardActivate(Sender: TObject);
    procedure ISFrameCardClickCard(Sender: TObject);
    procedure ISIconField1Clicked(Sender: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TCardProduto.ISFrameCardActivate(Sender: TObject);
begin
ImgOferta.Visible := FieldByName('Promo').AsInteger = 1;
end;

procedure TCardProduto.ISFrameCardClickCard(Sender: TObject);
begin
TISFrame.SendMessage('', 'MostraProduto', 'Show', FieldByName('Id').AsString, Self);
end;

procedure TCardProduto.ISFrameCardLoadRecord(Sender: TObject);
begin
FieldByName('Imagem').AsString := 'https://app.jusimperium.com.br/Produtos/Imagens/Produtos/Prod_'+FieldByName('Id').AsString+'.Png';
end;

procedure TCardProduto.ISIconField1Clicked(Sender: TObject);
begin
TISFrame.SendMessage('', 'Carrinho', 'Shake', '', Self);
end;

initialization
RegisterFMXClasses([TCardProduto]);

end.
