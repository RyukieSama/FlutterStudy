import 'package:flutter/material.dart';

class MomentHomeCell extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String imageName;
  final String? subImageName;
  final GestureTapCallback? didSelected;

  MomentHomeCell(
      {required this.title,
      this.subTitle,
      required this.imageName,
      this.subImageName,
      this.didSelected})
      : assert(title != null, '标题不能为空'),
        assert(imageName != null, '主图标不能为空');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: didSelected,
      child: Container(
          color: Colors.white,
          height: 44,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    child: Row(
                      children: [
                        Image(image: AssetImage(imageName)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(title),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.yellow,
                      child: Row(
                        children: [
                          subTitle != null ? Text(subTitle!) : Container(),
                          subImageName != null
                              ? Image.asset(subImageName!)
                              : Container(),
                          Image.asset(
                            'images/icon_right.png',
                            width: 15,
                          )
                        ],
                      ))
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(left: 48),
                  height: 0.5,
                  color: Colors.grey,
                ),
              )
            ],
          )
      ),
    );
  }
}
