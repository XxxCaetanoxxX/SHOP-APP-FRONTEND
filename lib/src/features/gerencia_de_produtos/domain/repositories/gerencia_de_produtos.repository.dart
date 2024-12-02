import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';

abstract class GerenciaDeProdutosRepository{
  Future<List<ProdutoModel?>> recuperarProdutos();
  Future<void> inserirProduto(ProdutoModel? produto);
}