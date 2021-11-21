import 'package:flutter/material.dart';

class IndexBar extends StatefulWidget {
  IndexBar({
    required this.dataSource,
    required this.callBack
  });

  final List<String> dataSource;
  final double _indexItemHeight = 22;
  final IndexBarSelectCallBack callBack;

  @override
  _IndexBarState createState() => _IndexBarState();
}

typedef IndexBarSelectCallBack = void Function(int index,  String title);

class _IndexBarState extends State<IndexBar> {
  List<Widget> _indexsWidgets = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.dataSource.length; i++) {
      _indexsWidgets.add(Container(
        height: widget._indexItemHeight,
        child: Text(
          widget.dataSource[i],
          style: const TextStyle(color: Colors.grey),
        ),
      ));
    }
  }

  int _currentIndex(Offset point) {
    return (point.dy ~/ widget._indexItemHeight).clamp(0, widget.dataSource.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        Offset point = box.globalToLocal(details.globalPosition);
        int index = _currentIndex(point);
        String title = widget.dataSource[index];
        widget.callBack(index, title);
      },
      onTapUp: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        Offset point = box.globalToLocal(details.globalPosition);
        int index = _currentIndex(point);
        String title = widget.dataSource[index];
        widget.callBack(index, title);
      },
      child: Container(
        width: 22,
        color: const Color.fromRGBO(1, 1, 1, 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _indexsWidgets,
        ),
      ),
    );
  }
}
