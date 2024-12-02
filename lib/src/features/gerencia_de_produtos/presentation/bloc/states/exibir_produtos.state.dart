import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/states/gerencia_de_produtos.state.dart';

class ExibirProdutosState extends GerenciaDeProdutoState{
  final List<ProdutoModel?>? listaProdutos;

  ExibirProdutosState(this.listaProdutos);
}