import 'package:dio/dio.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';

abstract class GerenciaDeProdutosDataSource {
  Future<List<ProdutoModel?>> recuperarProdutos();
  Future<void> inserirProduto(ProdutoModel? produto);
}

class GerenciaDeProdutosDataSourceImpl implements GerenciaDeProdutosDataSource {
  final dio = Dio();
  String baseUrl = 'http://192.168.15.136:8080';

  @override
  Future<List<ProdutoModel?>> recuperarProdutos() async {
    Response response = await dio.get(
      '$baseUrl/api/produtos',
    );
    List<dynamic> dados = response.data;
    return dados.map((e) => ProdutoModel.fromJson(e)).toList();
  }

  @override
  Future<void> inserirProduto(ProdutoModel? produto) async {
    if (produto == null) {
      throw ArgumentError("Produto não pode ser nulo.");
    }
    Response response = await dio.post(
      '$baseUrl/api/produtos/objetoCompleto',
      options: Options(
          contentType: Headers.jsonContentType,
        responseType: ResponseType.plain
      ),
      data: produto,
    );
  }
}
