import 'dart:io';
import 'package:fake_wechat/widgets/me/me_header_view.dart';
import 'package:fake_wechat/widgets/moment/moment_home_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final String _selAvatar = 'sel_avatar';
  final String _reciveImagePath = 'rec_imagePath';
  final MethodChannel _channel = const MethodChannel('mine_header/channel');
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _channel.setMethodCallHandler((call) async {
      if (call.method == _reciveImagePath) {
        print('${call.arguments}');
        setState(() {
          _avatarPath = call.arguments.toString();
        });
      }
    });
  }

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
              child: ListView(
                children: <Widget>[
                  MeHeaderView(
                    avatarTap: () {
                      _channel.invokeMapMethod(_selAvatar);
                    },
                    avatarFile: _avatarPath == null ? null : File(_avatarPath!),
                  ),
                  const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 12,
                  ),
                  MomentHomeCell(
                    title: '设置',
                    imageName: 'images/微信设置.png',
                  ),
                ],
              ),
            ),
            const Positioned(
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
