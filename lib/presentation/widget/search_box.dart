import 'package:flutter/material.dart';

final TextEditingController searchBoxText = TextEditingController();

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, this.onEventSubmited}) : super(key: key);
  final Function(String text)? onEventSubmited;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width / 12),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          TextField(
            // style: Text('test'),
            onSubmitted: onEventSubmited,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 11, bottom: 9, left: 10, right: 10),
              isDense: true,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
