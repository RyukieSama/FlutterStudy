import 'package:flutter/material.dart';

class MyTextListWidget extends StatelessWidget {
  final TextStyle _textStyle = const TextStyle(
    color: Colors.red,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  final String _ryukie = 'RyukieSama';
  final String _longString =
      '为什么 `Flutter` 中大量 `final` 修饰的属性， `const` 修饰的构造方法（`常量对象`）\n因为 `Flutter` 的渲染逻辑，是`增量渲染`。 `Widget` 结构是`树状结构`\n想改变屏幕内容就直接改变 `Widget` 对象\n`常量对象` 的创建效率更高';

  const MyTextListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          '$_ryukie LTR',
          textDirection: TextDirection.ltr,
        ),
        Text(
          '$_ryukie RTL',
          textDirection: TextDirection.rtl,
        ),
        Text(
          _ryukie,
          style: _textStyle,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        ),
        Text(
          '多行文本: \n$_longString',
          maxLines: 3,
          overflow: TextOverflow.fade, // 剪切形式
        ),
        RichText(
          text: TextSpan(
              text: 'RichText: Hello  ',
              style: const TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: _ryukie, style: _textStyle),
                const TextSpan(
                    text: ' is fine.', style: TextStyle(color: Colors.blue)),
              ]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
