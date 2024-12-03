import 'package:flutter/material.dart';
import 'package:shop_card/src/features/login/presentation/views/login.view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                        const LoginView()),
                        (Route<dynamic> route) => false);
              },
            ),
          ],
        )
      ),
      body: Container(),
    );
  }
}
