unit uCardOfertas;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISDataCard, FMX.ISFrame;

type
  [ISAutoCreate(_On)]
  TCardOfertas = class(TISFrameCard)
  private
  public
  end;

implementation

{$R *.fmx}

initialization
RegisterFMXClasses([TCardOfertas]);

end.
