
import 'package:shop_card/src/core/domain/usecase.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/repositories/gerencia_de_produtos.repository.dart';

//a esquerda do use case, o que retornará para o front, a direita, o que irá para o back
//nesse caso, nada irá para o front, pois é um método POST, que irá adicionar um produto
//no banco de dados
class InserirProdutoUseCase extends UseCase<void, ProdutoModel?>{
  final GerenciaDeProdutosRepository _gerenciaDeProdutosRepository;

  InserirProdutoUseCase({required GerenciaDeProdutosRepository gerenciaDeProdutosRepository})
      : _gerenciaDeProdutosRepository = gerenciaDeProdutosRepository;

  @override
  Future<void> call({ProdutoModel? params}) async{
    await _gerenciaDeProdutosRepository.inserirProduto(params!);
  }
}