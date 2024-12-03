import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_card/main.dart';
import 'package:shop_card/src/core/bloc/states/base_state.dart';
import 'package:shop_card/src/core/bloc/states/erro.state.dart';
import 'package:shop_card/src/core/bloc/states/loading.state.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/data/models/produto.model.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/events/adicionar_produto.event.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/events/buscar_produtos.event.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/gerencia_de_produtos.bloc.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/bloc/states/exibir_produtos.state.dart';

class ListaDeItensView extends StatefulWidget {
  const ListaDeItensView({super.key});

  @override
  State<ListaDeItensView> createState() => _ListaDeItensViewState();
}

class _ListaDeItensViewState extends State<ListaDeItensView> {
  final GerenciaDeProdutosBloc _bloc = sl<GerenciaDeProdutosBloc>();
  List<ProdutoModel?>? listaProdutos = [];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  void initState() {
    _bloc.add(BuscarProdutosEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Produtos salvos no banco"),
          backgroundColor: Colors.yellow[200],
        ),
        body: BlocBuilder<GerenciaDeProdutosBloc, BaseState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ExibirProdutosState) {
              listaProdutos = state.listaProdutos;
              return ListView.builder(
                itemCount: listaProdutos!.length,
                itemBuilder: (context, index) {
                  final produto = listaProdutos![index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      title: Text(produto!.nome.toString()),
                      subtitle: Text('Preço: R\$ ${produto.preco}'),
                      leading: const Icon(Icons.shopping_cart),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          print('Adicionado ao carrinho: ${produto.nome}');
                        },
                      ),
                    ),
                  );
                },
              );
            }
            if (state is ErrorState) {
              return const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 50,
                    ),
                    Text(
                      "Erro ao conectar a API",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 6,
                        child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                children: [
                                  Text("Nome do produto"),
                                  Text(
                                    "Produto",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Valor do produto:"),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _nomeController,
                                  ),
                                  TextField(
                                    controller: _precoController,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            ProdutoModel produto = ProdutoModel(
                                nome: _nomeController.text.toString(),
                                preco: double.tryParse(_precoController.text.toString()),
                                desconto: 0.0);
                            _bloc.add(AdicionarProdutorEvent(produto));
                          },
                          child: const Text("salvar"),)
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
