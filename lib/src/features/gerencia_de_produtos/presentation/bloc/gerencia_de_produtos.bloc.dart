import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_card/src/core/api_Exception.dart';
import 'package:shop_card/src/core/bloc/base_event.dart';
import 'package:shop_card/src/core/bloc/base_state.dart';
import 'package:shop_card/src/core/bloc/erro.state.dart';
import 'package:shop_card/src/core/bloc/loading.state.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/usecases/inserir_produto_use_case.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/usecases/recuperar_produtos_use_case.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/events/adicionar_produto.event.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/events/buscar_produtos.event.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/states/exibir_produtos.state.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/states/gerencia_de_produtos.state.dart';

class GerenciaDeProdutosBloc extends Bloc<BaseEvent, BaseState> {
  final RecuperarProdutosUseCase _recuperarProdutosUseCase;
  final InserirProdutoUseCase _inserirProdutoUseCase;

  GerenciaDeProdutosBloc({
    required RecuperarProdutosUseCase recuperarProdutosUseCase,
    required InserirProdutoUseCase inserirProdutoUseCase,
  })  : _recuperarProdutosUseCase = recuperarProdutosUseCase,
        _inserirProdutoUseCase = inserirProdutoUseCase,
        super(GerenciaDeprodutosInitialState()) {
    on<BuscarProdutosEvent>(_buscarProdutosEvent);
    on<AdicionarProdutorEvent>(_adicionarProdutorEvent);
  }

  Future<void> _buscarProdutosEvent(
      BuscarProdutosEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    try {
      List<ProdutoModel?>? listaProdutos =
          await _recuperarProdutosUseCase.call();
      emit(ExibirProdutosState(listaProdutos));
    } catch (e) {
      if (e is ApiException && e.code == 404) {
        emit(ErrorState());
      } else {
        emit(ErrorState());
      }
    }
  }

  Future<void> _adicionarProdutorEvent(
      AdicionarProdutorEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    try {
      await _inserirProdutoUseCase.call(params: event.produto);
      List<ProdutoModel?>? listaProdutos =
          await _recuperarProdutosUseCase.call();
      emit(ExibirProdutosState(listaProdutos));
    } catch (e) {
      if (e is ApiException && e.code == 404) {
        emit(ErrorState());
      } else {
        emit(ErrorState());
      }
    }
  }
}
