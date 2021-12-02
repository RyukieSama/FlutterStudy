import 'dart:io';
import 'package:flutter/material.dart';

class MeHeaderView extends StatelessWidget {
  Function()? avatarTap;
  File? avatarFile;

  MeHeaderView({this.avatarTap, this.avatarFile});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.green,
                  height: 80,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (avatarTap != null) {
                              avatarTap!();
                            }
                          },
                          child: Container(
//                    color: Colors.grey, // 和 decoration 不能共存
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(left: 12),
//                    child: Image(image: AssetImage('images/header_avatar.GIF')),// decoration 的圆角对这里的child无效
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: (avatarFile == null
                                    ? const AssetImage('images/header_avatar.GIF')
                                    : FileImage(avatarFile!)) as ImageProvider,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Lab.Lawliet',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              '微信号：RyukieW',
                              style: TextStyle(
                                color: Colors.brown,
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: Row(
                                children: [const Icon(Icons.add_box), Text('状态')],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.ac_unit),
                    Image.asset(
                      'images/icon_right.png',
                      width: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ));
  }
}
