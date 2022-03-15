unit uMostraProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes,
  System.Classes, System.Variants, FMX.Types, FMX.Platform,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ISBase, FMX.ISFrame, FMX.Layouts, FMX.ISLayout, FMX.Objects, FMX.ISPath, FMX.ISObjects, FMX.ISControls,
  FMX.ISDataCard, FMX.ISDataCardImageFieldEx, FMX.ISText, FMX.ISPrice, FMX.ISSpin, FMX.ISBase.Presented, FMX.ISBaseButtons,
  FMX.ISButtons;

type
  [ISAutoCreate(_On)]
  TMostraProduto = class(TISFrameChildren)
    Imagem: TISImage;
    PrePro: TISPrice;
    LayPre: TISControl;
    DesPro: TISText;
    Qtd: TISSpin;
    LayPreTot: TLayout;
    ValTot: TISPrice;
    LayQtd: TLayout;
    ISTextButton1: TISIconTextButton;
    Background: TISControl;
    procedure ISframeChildrenReceiveMessage(aSender, aCommand, aData: string; aObject: TObject);
    procedure QtdSetValue(Sender: TObject);
  private
    FCard : TISCustomDataCard;
  public
  end;

implementation

Uses
   FMX.ISExecute, FMX.Ani;

{$R *.fmx}

procedure TMostraProduto.ISframeChildrenReceiveMessage(aSender, aCommand, aData: string; aObject: TObject);
Var
   Control : TControl;
   Point   : TPointF;
begin
if aCommand = 'Show' then
   Begin
   FCard             := aObject As TISCustomDataCard;
   Imagem.Bitmap     := Nil;
//   PrePro.Visible    := False;
//   DesPro.Visible    := False;
   PrePro.Value      := FCard.FieldByName('Price').AsFloat;
   DesPro.Text       := FCard.FieldByName('Name') .AsString;
   LayQtd.Width      := LayoutControl.Root.GetWidth;
   LayQtd.Position.Y := LayoutControl.Root.GetChildrenHeight-246;
   LayQtd.Position.X := -LayQtd.Width;
   if DesPro.Text.Contains(' KG') then
      Begin
      Qtd.ValueMin       := 0.100;
      Qtd.ValueMax       := 20;
      Qtd.Value          := 0.100;
      Qtd.ValueMask      := '0.000';
      Qtd.ValueIncrement := 0.100;
      End
   Else
      Begin
      Qtd.ValueMin       := 1;
      Qtd.ValueMax       := 20;
      Qtd.Value          := 1;
      Qtd.ValueMask      := '0';
      Qtd.ValueIncrement := 1;
      End;

   Control                   := FCard.GetControl('Imagem');
   Imagem    .Position.Point := TISScreen.GetScreenPos(Control);
   Imagem    .Size           := Control.Size;
   Control                   := FCard.GetControl('Name');
   DesPro    .Position.Point := TISScreen.GetScreenPos(Control);
   DesPro    .Size           := Control.Size;
   Control                   := FCard.FindControl('LayPre');
   Laypre    .Position.Point := TISScreen.GetScreenPos(Control);
   Laypre    .Size           := Control.Size;
   Background.Size           := FCard.Size;
   Background.Position.Point := TISScreen.GetScreenPos(FCard);
   Imagem    .Bitmap         := (FCard.GetControl('Imagem') As TISImageFieldEx).Bitmap;
//   PrePro    .Visible        := True;
//   DesPro    .Visible        := True;

   ShowLayout;

   TISExecute.StartExecute(10,
      Procedure
      Begin
      Background.MoveTo (0, 0, 0.4);
      Background.MorphTo(LayoutControl.Root.GetWidth, LayoutControl.Root.GetHeight, 0.4);
      Imagem    .MoveTo ((LayoutControl.Root.GetWidth - 270)/2,  24, 0.4);
      Imagem    .MorphTo(270, 190, 0.4);
      Laypre    .MoveTo ((LayoutControl.Root.GetWidth - 270)/2, 240, 0.6);
      LayPre    .MorphTo(270,  43, 0.6);
      DesPro    .MoveTo ((LayoutControl.Root.GetWidth - 270)/2, 308, 0.8);
      DesPro    .MorphTo(270,  52, 0.8);
      End);
   TISExecute.StartExecute(400,
      Procedure
      Begin
      TAnimator.AnimateFloat(LayQtd, 'Position.X',              0, 0.2);
      End);
   End;
end;

procedure TMostraProduto.QtdSetValue(Sender: TObject);
begin
ValTot.Value := PrePro.Value * Qtd.Value;
end;

initialization
RegisterFMXClasses([TMostraProduto]);

end.
