program ServerMercado;
{$APPTYPE GUI}

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uWebModule in 'uWebModule.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
