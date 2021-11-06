import 'package:flutter/material.dart';

// 渲染逻辑
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyStateDataSource();
  }
}

// 数据逻辑
class _MyStateDataSource extends State<MyStatefulWidget> {
  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: FloatingActionButton(
        child: Text("$_clickCount"),
        onPressed: () {
          setState(() {// 触发状态改变，重新渲染
            _clickCount += 1;
          });
        },
      ),
    );
  }
}
