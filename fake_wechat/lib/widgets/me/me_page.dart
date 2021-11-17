import 'package:fake_wechat/widgets/me/me_header_view.dart';
import 'package:fake_wechat/widgets/moment/moment_home_cell.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Stack(
          children: [
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Container(
              child: ListView(
                children: <Widget> [
                  MeHeaderView(),
                  SizedBox(
                    height: 12,
                  ),
                  MomentHomeCell(
                    title: '支付',
                    imageName: 'images/微信 支付.png',
                    didSelected: () {
//                      Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (BuildContext context) => MomentDetailPage(title: '朋友圈',),
//                          )
//                      );
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MomentHomeCell(
                    title: '收藏',
                    imageName: 'images/微信收藏.png',
                  ),
                  MomentHomeCell(
                    title: '相册',
                    imageName: 'images/微信相册.png',
                  ),
                  MomentHomeCell(
                    title: '卡包',
                    imageName: 'images/微信卡包.png',
                  ),
                  MomentHomeCell(
                    title: '表情',
                    imageName: 'images/微信表情.png',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  MomentHomeCell(
                    title: '设置',
                    imageName: 'images/微信设置.png',
                  ),
                ],
              ),
            ),
            ),
            Positioned(
              right: 12,
              top: 12,
              width: 60,
              height: 60,
              child: Icon(Icons.camera_alt),
            )
          ],
        ),
      ),
    );
  }
}
