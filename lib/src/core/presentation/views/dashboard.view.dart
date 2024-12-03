import 'package:flutter/material.dart';
import 'package:shop_card/src/core/presentation/views/configuracoes.view.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/views/lista_de_itens.view.dart';
import 'package:shop_card/src/features/home.view.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _selectedIndex = 0;
  final _navigatorKey = GlobalKey<NavigatorState>();

  static final List<Widget> _opcoesTela = <Widget>[
    const MyHomePage(),
    const ListaDeItensView(),
    const ConfiguracoesView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (BuildContext context) => _opcoesTela.elementAt(index)),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _opcoesTela.elementAt(_selectedIndex),
          Navigator(
            key: _navigatorKey,
            onGenerateRoute: (RouteSettings settings) {
              Widget page;
              if (_selectedIndex == 0) {
                page = _opcoesTela.elementAt(0);
              } else if (_selectedIndex == 1) {
                page = _opcoesTela.elementAt(1);
              } else if (_selectedIndex == 2) {
                page = _opcoesTela.elementAt(2);
              } else {
                return null;
              }
              return MaterialPageRoute(
                builder: (context) => page,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
