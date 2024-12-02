import 'package:shop_card/src/core/domain/usecase.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/repositories/gerencia_de_produtos.repository.dart';


//a esquerda do use case, o que retornará para o front, a direita, o que irá para o back
//nesse caso, nada irá para o backend, pois é um método GET
class RecuperarProdutosUseCase extends UseCase<List<ProdutoModel?>?, void>{
  final GerenciaDeProdutosRepository _gerenciaDeProdutosRepository;

  RecuperarProdutosUseCase({required GerenciaDeProdutosRepository gerenciaDeProdutosRepository})
      : _gerenciaDeProdutosRepository = gerenciaDeProdutosRepository;

  @override
  Future<List<ProdutoModel?>?> call({void params}) async{
    return await _gerenciaDeProdutosRepository.recuperarProdutos();
  }
}