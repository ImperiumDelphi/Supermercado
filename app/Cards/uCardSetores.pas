unit uCardSetores;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISDataCard, FMX.ISFrame, FMX.ISDataCardImageFieldEx, FMX.Objects, FMX.ISPath, FMX.ISObjects, FMX.ISControls,
  FMX.ISText, FMX.ISDataCardFields;

type
  [ISAutoCreate(_On)]
  TCardSetores = class(TISFrameCard)
    ISTextField1: TISTextField;
    ISImageFieldEx1: TISImageFieldEx;
    ISWorkField2: TISWorkField;
    ISWorkField1: TISWorkField;
    procedure ISFrameCardLoadRecord(Sender: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TCardSetores.ISFrameCardLoadRecord(Sender: TObject);
begin
if FieldByName('idCat').AsString.Trim.IsEmpty then
   FieldByName('Imagem').AsString := 'https://app.jusimperium.com.br/Produtos/Imagens/Depto/C'+FieldByName('Id').AsString+'.Png'
Else
   FieldByName('Imagem').AsString := 'https://app.jusimperium.com.br/Produtos/Imagens/Secoes/SC'+FieldByName('Id').AsString+'.Png';
end;

initialization
RegisterFMXClasses([TCardSetores]);

end.
