import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/events/gerencia_de_produtos.event.dart';

class AdicionarProdutorEvent extends GerenciaDeProdutosEvent {
  ProdutoModel produto;

  AdicionarProdutorEvent(this.produto);
}