import 'package:flutter/material.dart';

class IndexBar extends StatefulWidget {
  IndexBar({
    required this.dataSource,
  });

  final List<String> dataSource;

  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  List<Widget> _indexsWidgets = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.dataSource.length; i++) {
      _indexsWidgets.add(Text(
        widget.dataSource[i],
        style: const TextStyle(color: Colors.grey),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(1, 1, 1, 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _indexsWidgets,
      ),
    );
  }
}
