unit uMainFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.ISBase, FMX.ISLayouts, FMX.ISFrame;

type
  [ISAutoCreate(_On)]
  TMain = class(TISFrameNaviBar)
    procedure ISFrameNaviBarReceiveMessage(aSender, aCommand, aData: string; aObject: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TMain.ISFrameNaviBarReceiveMessage(aSender, aCommand, aData: string; aObject: TObject);
begin
if aCommand = 'FadeOut' then TAnimator.AnimateFloat(Self, 'Opacity', 0, 0.3);
if aCommand = 'FadeIn'  then TAnimator.AnimateFloat(Self, 'Opacity', 1, 0.3);
end;

initialization
RegisterFMXClasses([TMain]);

end.
