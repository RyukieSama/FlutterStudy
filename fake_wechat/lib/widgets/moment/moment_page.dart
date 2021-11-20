import 'package:fake_wechat/widgets/moment/moment_home_cell.dart';
import 'package:fake_wechat/widgets/moment/pages/moment_detailpage.dart';
import 'package:flutter/material.dart';

class MommentPage extends StatefulWidget {
  @override
  _MommentPageState createState() => _MommentPageState();
}

class _MommentPageState extends State<MommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: const Text('发现'),
        elevation: 0.0, // 导航底部阴影
        centerTitle: true, // 为了安卓设置
      ),
      body: Container(
        color: Colors.brown,
        child: ListView(
          children: <Widget>[
            MomentHomeCell(
              title: '朋友圈',
              imageName: 'images/朋友圈.png',
              didSelected: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => MomentDetailPage(title: '朋友圈',),
                  )
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            MomentHomeCell(
              title: '扫一扫',
              imageName: 'images/扫一扫2.png',
            ),
            MomentHomeCell(
              title: '摇一摇',
              imageName: 'images/摇一摇.png',
            ),
            const SizedBox(
              height: 12,
            ),
            MomentHomeCell(
              title: '看一看',
              imageName: 'images/看一看icon.png',
            ),
            MomentHomeCell(
              title: '搜一搜',
              imageName: 'images/搜一搜 2.png',
            ),
            const SizedBox(
              height: 12,
            ),
            MomentHomeCell(
              title: '附近的人',
              imageName: 'images/附近的人icon.png',
            ),
            const SizedBox(
              height: 12,
            ),
            MomentHomeCell(
              title: '购物',
              imageName: 'images/购物.png',
              subTitle: '618限时特价',
              subImageName: 'images/badge.png',
            ),
            MomentHomeCell(
              title: '游戏',
              imageName: 'images/游戏.png',
            ),
            const SizedBox(
              height: 12,
            ),
            MomentHomeCell(
              title: '小程序',
              imageName: 'images/小程序.png',
            ),
          ],
        ),
      ),
    );
  }
}
