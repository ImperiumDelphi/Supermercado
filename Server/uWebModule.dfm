object WebModule1: TWebModule1
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'GetPromocoes'
      PathInfo = '/getpromocoes'
      OnAction = WebModule1GetPromocoesAction
    end
    item
      Name = 'GetProdutos'
      PathInfo = '/getprodutos'
      OnAction = WebModule1GetProdutosAction
    end
    item
      Name = 'GetDepto'
      PathInfo = '/getdepto'
      OnAction = WebModule1GetDeptoAction
    end
    item
      Name = 'GetSecoes'
      PathInfo = '/getsecoes'
      OnAction = WebModule1GetSecaoAction
    end>
  Height = 230
  Width = 415
  PixelsPerInch = 96
  object DBConnection: TFDConnection
    ConnectionName = 'MySQL'
    Params.Strings = (
      'DriverID=MySQL'
      'Database=AppVendas'
      'User_Name=jaques'
      'Password=qwaszx12'
      'Port=4126'
      'Server=192.168.0.250')
    Left = 220
    Top = 32
  end
  object Query: TFDQuery
    Connection = DBConnection
    Left = 316
    Top = 36
  end
end
