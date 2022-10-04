import 'package:flutter/material.dart';

class SwarmPanel extends StatefulWidget {
  const SwarmPanel({Key? key}) : super(key: key);

  @override
  State<SwarmPanel> createState() => _SwarmPanelState();
}

class _SwarmPanelState extends State<SwarmPanel> {
  double widthSwarmPanel = 300;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeColumn,
      child: Row(
        children: [
          Flexible(
            flex: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (x) async {
                // print(x.delta);
                double maxWidth = MediaQuery.of(context).size.width;
                setState(() {
                  if (x.globalPosition.dx >= (maxWidth - 200)) {
                    widthSwarmPanel = 200;
                  } else if (x.globalPosition.dx <= 300) {
                    widthSwarmPanel = maxWidth - 300;
                  } else {
                    widthSwarmPanel = maxWidth - x.globalPosition.dx;
                  }
                });
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.black26, width: 2),
                  ),
                ),
                width: 8,
              ),
            ),
          ),
          Container(
            // color: Colors.grey,
            width: widthSwarmPanel,
            alignment: Alignment.topLeft,
            child: const Text("""
{
  conection : option_header/connection_swarm,
  peers : [
      {
        location : asia pacific,
        id : Qmjhjsyqbjajk,
        connection_adderss : 192.168.0.1
      },
      {
        location : asia pacific,
        id : Qmjhjsyqbjajk,
        connection_adderss : 172.16.0.1
      },
      {
        location : asia pacific,
        id : Qmjhjsyqbjajk,
        connection_adderss : 10.0.0.1
      },
      {
        location : asia pacific,
        id : Qmjhjsyqbjajk,
        connection_adderss : 1.18.2.1
      },
      
  ]
                            
}
                          """),
          )
        ],
      ),
    );
  }
}
