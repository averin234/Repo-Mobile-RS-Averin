import 'package:flutter/material.dart';
import 'package:rsaverin/app/data/componen/my_style.dart';

class WidgetTitleAntrian4 extends StatefulWidget {
  const WidgetTitleAntrian4({Key? key}) : super(key: key);

  @override
  _WidgetTitleAntrian4State createState() => _WidgetTitleAntrian4State();
}

class _WidgetTitleAntrian4State extends State<WidgetTitleAntrian4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: Text("Antrian Saat ini", style: MyStyle.textTitleBlack),
          ),
        ],
      ),
    );
  }
}
