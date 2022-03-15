program Supermercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm: TISMainForm},
  uOfertas in 'Ofertas\uOfertas.pas' {Ofertas: TISframeChildren},
  uMainFrame in 'uMainFrame.pas' {Main: TISFrameNaviBar},
  uCardOfertas in 'Cards\uCardOfertas.pas' {CardOfertas: TISFrameCard},
  uCardProduto in 'Cards\uCardProduto.pas' {CardProduto: TISFrameCard},
  uCategorias in 'Setores\uCategorias.pas' {Setores_Categorias: TISframeChildren},
  uCardSetores in 'Cards\uCardSetores.pas' {CardSetores: TISFrameCard},
  uSetores in 'Setores\uSetores.pas' {Setores: TISFrameNaviBar},
  uSubCategoria in 'Setores\uSubCategoria.pas' {Setores_SubCategoria: TISframeChildren},
  uCarrinho in 'uCarrinho.pas' {Carrinho: TISFrameCard},
  uProdutos in 'Setores\uProdutos.pas' {Setores_Produtos: TISframeChildren},
  uMostraProduto in 'Venda\uMostraProduto.pas' {MostraProduto: TISframeChildren};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.