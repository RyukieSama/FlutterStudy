import 'package:flutter/material.dart';

class MomentHomeCell extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String imageName;
  final String? subImageName;
  final GestureTapCallback? didSelected;

  bool _heighlight = false;

  MomentHomeCell(
      {required this.title,
        this.subTitle,
        required this.imageName,
        this.subImageName,
        this.didSelected})
      : assert(title != null, '标题不能为空'),
        assert(imageName != null, '主图标不能为空');

  @override
  _MomentHomeCellState createState() => _MomentHomeCellState();
}

class _MomentHomeCellState extends State<MomentHomeCell> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.didSelected,
      onTapDown: (TapDownDetails details){
        print('onTapDown');
        setState(() {
          widget._heighlight = true;
        });
      },
      onTapCancel: (){
        print('onTapCancel');
        setState(() {
          widget._heighlight = false;
        });
      },
      onTapUp: (TapUpDetails details){
        print('onTapUp');
        setState(() {
          widget._heighlight = false;
        });
      },
      child: Container(
          color: widget._heighlight == true ? Colors.grey : Colors.white,
          height: 44,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Image(image: AssetImage(widget.imageName)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(widget.title),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.yellow,
                      child: Row(
                        children: [
                          widget.subTitle != null ? Text(widget.subTitle!) : Container(),
                          widget.subImageName != null
                              ? Image.asset(widget.subImageName!)
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
