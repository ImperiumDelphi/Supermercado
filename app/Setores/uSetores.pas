unit uSetores;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISLayouts, FMX.ISFrame;

type
  [ISAutoCreate(_On)]
  TSetores = class(TISFrameNaviBar)
    procedure ISFrameNaviBarShow(Sender: TObject);
    procedure ISFrameNaviBarReceiveMessage(aSender, aCommand, aData: string; aObject : TObject);
    procedure ISFrameNaviBarActivate(Sender: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TSetores.ISFrameNaviBarActivate(Sender: TObject);
begin
ButtonIndex := 0;
end;

procedure TSetores.ISFrameNaviBarReceiveMessage(aSender, aCommand, aData: string; aObject : TObject);
begin
if aCommand = 'Index' then
   Begin
   ButtonIndex := aData.ToInteger;
   End;
end;

procedure TSetores.ISFrameNaviBarShow(Sender: TObject);
begin
Start;
end;

initialization
RegisterFMXClasses([TSetores]);

end.
