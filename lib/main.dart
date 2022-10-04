import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:html/dom.dart';
import 'package:web3browser/data/datasource/ipfs_api_handler.dart';
import 'package:web3browser/presentation/widget/prev_next_button.dart';
import 'package:web3browser/presentation/widget/search_box.dart';
import 'package:web3browser/presentation/widget/swarm_panel.dart';
import 'package:web3browser/presentation/widget/window_button.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  await windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden,
        windowButtonVisibility: false);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hideSwarmPanel = false;
  String text = '';
  bool change = true;
  Document htmlData = parse('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 0,
            child: GestureDetector(
              onHorizontalDragStart: (x) async {
                await windowManager.startDragging();
              },
              child: Container(
                height: 50,
                color: Colors.brown,
                child: Row(
                  children: [
                    Flexible(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WindowButton(
                              icons: Icons.close,
                              onPressed: () {
                                windowManager.close();
                              },
                            ),
                            WindowButton(
                              color: Colors.amber,
                              onPressed: () {
                                windowManager.minimize();
                              },
                            ),
                            WindowButton(
                              icons: Icons.fullscreen,
                              color: Colors.green,
                              onPressed: () async {
                                await windowManager.isMaximized()
                                    ? windowManager.unmaximize()
                                    : windowManager.maximize();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 5),
                        child: Row(
                          children: [
                            PrevNextButton(
                              icon: Icons.arrow_back_ios,
                              onPressed: () => '',
                            ),
                            PrevNextButton(
                              icon: Icons.arrow_forward_ios,
                              onPressed: () => '',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SearchBox(),
                    ),
                    Flexible(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: PrevNextButton(
                          icon: Icons.add,
                          onPressed: () async {
                            String buffer = await IpfsHandler.getItems();
                            // htmlData = parse(buffer);
                            // log(htmlData.documentElement.toString());
                            // print('==========================');
                            // log(htmlData.head.toString());
                            setState(() {
                              text = buffer;
                              change = !change;
                            });
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: PrevNextButton(
                          icon: Icons.menu,
                          onPressed: () async {
                            setState(() {
                              hideSwarmPanel = !hideSwarmPanel;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Html(
                    data: text,
                    // style: htmlData.,
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: hideSwarmPanel ? const SwarmPanel() : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
