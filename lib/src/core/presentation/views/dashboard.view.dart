import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_card/src/core/bloc/index_dashboard.cubit.dart';
import 'package:shop_card/src/core/presentation/views/configuracoes.view.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/views/lista_de_itens.view.dart';
import 'package:shop_card/src/features/home.view.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  static final List<Widget> _opcoesTela = <Widget>[
    const MyHomePage(),
    const ListaDeItensView(),
    const ConfiguracoesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexDashboardCubit(),
      child: BlocBuilder<IndexDashboardCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: _opcoesTela[state],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                elevation: 5,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 28),
                    label: 'Início',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.work,
                      size: 26,
                    ),
                    label: 'Serviços',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.perm_device_info_rounded,
                      size: 26,
                    ),
                    label: 'Informações',
                  ),
                ],
                currentIndex: state,
                onTap: (value) {
                  context.read<IndexDashboardCubit>().selecionarIndex(value);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}