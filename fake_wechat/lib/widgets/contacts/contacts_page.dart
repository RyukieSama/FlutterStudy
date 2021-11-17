import 'package:fake_wechat/configs/ui_const.dart';
import 'package:fake_wechat/widgets/contacts/friends_data.dart';
import 'package:flutter/material.dart';

class _ContactCell extends StatelessWidget {
  const _ContactCell({
    required this.name,
    this.avatarUrl,
    this.assetName,
  }) : assert((avatarUrl != null || assetName != null), '至少一张图片');

  final String name;
  final String? avatarUrl;
  final String? assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Stack(
        children: [
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  avatarUrl != null
                      ? Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage(avatarUrl!),
                            ),
                          ),
                        )
                      : Container(),
                  assetName != null
                      ? Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: AssetImage(assetName!),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 50,
            bottom: 0,
            child: Container(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Widget _itemForRow(BuildContext context, int index) {
    if (index < 4) {
      return index < friendsHeaderData.length
          ? _ContactCell(
              name: friendsHeaderData[index].name,
              avatarUrl: friendsHeaderData[index].imageUrl,
              assetName: friendsHeaderData[index].imageAssets,
            )
          : Container();
    }
    return (index - 4) < friendsData.length
        ? _ContactCell(
            name: friendsData[index - 4].name,
            avatarUrl: friendsData[index - 4].imageUrl,
            assetName: friendsData[index - 4].imageAssets,
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        centerTitle: true,// 否则多个 actions 的话会被调整到左边去
        backgroundColor: UIConfig.appBarColor, // 和 primarySwatch 冲突
        title: const Text('通讯录'),
        actions: [
          Container(
            width: 44,
            color: Colors.blue,
            child: const Icon(Icons.print),
          ),
          GestureDetector(
            onTap: () {
              print('添加联系人');
            },
            child: Container(
              width: 44,
              color: Colors.blue,
              child: const Icon(Icons.person_add),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: _itemForRow,
          itemCount: friendsData.length,
        ),
      ),
    );
  }
}
