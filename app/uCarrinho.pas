unit uCarrinho;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISDataCard, FMX.ISFrame, FMX.Objects, FMX.ISPath, FMX.ISObjects, FMX.ISControls, FMX.Layouts, FMX.ISIcon,
  FMX.ISText, FMX.ISDataCardFields, FMX.ISBase.Presented, FMX.ISBaseButtons, FMX.ISButtons, FMX.ISPrice;

type
  [ISAutoCreate(_On)]
  TCarrinho = class(TISFrameCard)
    Layout1: TLayout;
    ISControl1: TISControl;
    IcoCar: TISSpeedButton;
    ISPrice1: TISPrice;
    Layout2: TLayout;
    procedure ISFrameCardReceiveMessage(aSender, aCommand, aData: string; aObject: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TCarrinho.ISFrameCardReceiveMessage(aSender, aCommand, aData: string; aObject: TObject);
begin
if aCommand = 'Shake' then IcoCar.Shake;
end;

initialization
RegisterFMXClasses([TCarrinho]);

end.
