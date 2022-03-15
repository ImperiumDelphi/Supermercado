unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types,
  FMX.Controls, FMX.Forms, FMX.Graphics,  FMX.Dialogs, FMX.Platform,
  FMX.ISBase, FMX.ISLayouts, FMX.ISFrame, FMX.ISMainForm, FMX.Objects, FMX.ISPath, FMX.ISObjects, FMX.ISControls, FMX.ISIcon,
  FMX.Controls.Presentation, FMX.Edit;

type
  [ISAutoCreate(_On)]
  TMainForm = class(TISMainForm)
    StyleBook1: TStyleBook;
    procedure ISMainFormActivate(Sender: TObject);
  private
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.ISMainFormActivate(Sender: TObject);
begin
log.d('Onactivate');
end;

end.
