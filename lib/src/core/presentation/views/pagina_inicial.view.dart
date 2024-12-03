import 'package:flutter/material.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/presentation/views/lista_de_itens.view.dart';

class PaginaInicialView extends StatefulWidget {
  const PaginaInicialView({super.key});

  @override
  State<PaginaInicialView> createState() => _PaginaInicialViewState();
}

class _PaginaInicialViewState extends State<PaginaInicialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text("Página Inicial"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ListaDeItensView()));
              },
              child: const Text("List Page"),
            )
          ],
        ),
      ),
    );
  }
}
