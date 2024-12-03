import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';


class ConfiguracoesView extends StatefulWidget {
  const ConfiguracoesView({super.key});

  @override
  State<ConfiguracoesView> createState() => _ConfiguracoesViewState();
}

class _ConfiguracoesViewState extends State<ConfiguracoesView> {
  bool darkMode = false;
  bool positive = false;
  String versaoApp = "";
  final ScrollController _scrollController = ScrollController();
  bool switchValue = false;

  @override
  void initState() {
    recuperarPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        radius: const Radius.circular(5),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: currentOrientation == Orientation.portrait
                  ? MediaQuery.sizeOf(context).height * 0.5
                  : MediaQuery.sizeOf(context).height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Tooltip(
                      message: "Detalhes da versão",
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Detalhes da versão",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'Versão $versaoApp',
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Tooltip(
                      message: "Changelog",
                      onTriggered: () {
                      },
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Changelog",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Tooltip(
                      message: "Politica de privacidade",
                      child: InkWell(
                        child:  Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Política de privacidade",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Tooltip(
                      message: "Termos de uso",
                      child: InkWell(
                        child:  Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Termos de uso",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Modo Escuro",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                          ),
                          Flexible(
                            child: SizedBox(
                              height: 40,
                              child: Switch(
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = !switchValue;
                                  });
                                },
                                inactiveTrackColor: Colors.transparent,
                                inactiveThumbColor: Colors.green,
                                activeColor: Colors.black38,
                                activeTrackColor: Colors.green,
                                trackOutlineWidth: WidgetStateProperty.all(1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future<void> recuperarPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versaoApp = packageInfo.version;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}