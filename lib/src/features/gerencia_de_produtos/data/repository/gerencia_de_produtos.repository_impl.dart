import 'package:shop_card/src/features/gerencia_de_produtos/data/datasources/gerencia_de_produtos_data_source.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/repositories/gerencia_de_produtos.repository.dart';

class GerenciaDeProdutosRepositoryImpl extends GerenciaDeProdutosRepository{
  final GerenciaDeProdutosDataSource _gerenciaDeProdutosDataSource;

  GerenciaDeProdutosRepositoryImpl({required GerenciaDeProdutosDataSource gerenciaDeProdutosDataSource})
      : _gerenciaDeProdutosDataSource =  gerenciaDeProdutosDataSource;

  @override
  Future<List<ProdutoModel?>> recuperarProdutos() async{
    return await _gerenciaDeProdutosDataSource.recuperarProdutos();
  }

  @override
  Future<void> inserirProduto(ProdutoModel? produto) async{
    await _gerenciaDeProdutosDataSource.inserirProduto(produto);
  }
}