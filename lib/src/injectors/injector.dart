import 'package:shop_card/src/core/bloc/index_dashboard.cubit.dart';
import 'package:shop_card/src/features/configuracoes/presentation/bloc/recuperar_info_app.cubit.dart';
import 'package:shop_card/src/features/configuracoes/presentation/bloc/swtich.cubit.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/datasources/gerencia_de_produtos_data_source.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/repository/gerencia_de_produtos.repository_impl.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/repositories/gerencia_de_produtos.repository.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/usecases/inserir_produto_use_case.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/usecases/recuperar_produtos_use_case.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/gerencia_de_produtos.bloc.dart';

import '../../main.dart';

Future<void> init() async {
  //datasources
  sl.registerLazySingleton<GerenciaDeProdutosDataSource>(
    () => GerenciaDeProdutosDataSourceImpl(),
  );

  //repository
  sl.registerLazySingleton<GerenciaDeProdutosRepository>(
    () => GerenciaDeProdutosRepositoryImpl(
        gerenciaDeProdutosDataSource: sl<GerenciaDeProdutosDataSource>()),
  );

  //usecase
  sl.registerLazySingleton<RecuperarProdutosUseCase>(
    () => RecuperarProdutosUseCase(
        gerenciaDeProdutosRepository: sl<GerenciaDeProdutosRepository>()),
  );

  sl.registerLazySingleton<InserirProdutoUseCase>(
    () => InserirProdutoUseCase(
        gerenciaDeProdutosRepository: sl<GerenciaDeProdutosRepository>()),
  );

  //bloc
  sl.registerFactory(
    () => GerenciaDeProdutosBloc(
      recuperarProdutosUseCase: sl<RecuperarProdutosUseCase>(),
      inserirProdutoUseCase: sl<InserirProdutoUseCase>(),
    ),
  );

  //cubit
  sl.registerFactory(()=> IndexDashboardCubit());
}
