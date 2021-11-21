import 'package:fake_wechat/configs/ui_const.dart';
import 'package:fake_wechat/widgets/contacts/friends_data.dart';
import 'package:fake_wechat/widgets/contacts/index_bar.dart';
import 'package:flutter/material.dart';

class _ContactCell extends StatelessWidget {
  const _ContactCell({
    required this.name,
    this.avatarUrl,
    this.assetName,
    this.indexLetter,
  }) : assert((avatarUrl != null || assetName != null), '至少一张图片');

  final String name;
  final String? avatarUrl;
  final String? assetName;
  final String? indexLetter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          height: indexLetter == null ? 0 : 22,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 12,),
              Text(indexLetter ?? ""),
            ],
          ),
        ),
        Container(
          height: 60,
          color: Colors.white,
          child: Stack(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      const SizedBox(
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
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(left: 70),
                  height: 0.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    super.initState();
    _contacts
      ..addAll(friendsData)
      ..addAll(friendsData)
      ..sort((a, b) {
        if (a.indexLetter == null || b.indexLetter == null) {
          return 0;
        }
        return a.indexLetter!.compareTo(b.indexLetter!);
      });

    _systems.addAll(friendsHeaderData);

    _contacts.forEach((element) {
      if (element.indexLetter != null && _indexs.contains(element.indexLetter) == false) {
        _indexs.add(element.indexLetter!);
      }
    });
  }

  final List<Friends> _contacts = [];
  final List<Friends> _systems = [];
  final List<String> _indexs = [];

  Widget _itemForRow(BuildContext context, int index) {
    if (index < 4) {
      return index < _systems.length
          ? _ContactCell(
              name: _systems[index].name,
              avatarUrl: _systems[index].imageUrl,
              assetName: _systems[index].imageAssets,
            )
          : Container();
    }


    int trueIndex = index - 4;
    // 是否隐藏Header
    bool notShowHeader = (trueIndex < _contacts.length)
        && (trueIndex - 1 >= 0)
        && (_contacts[trueIndex].indexLetter == _contacts[trueIndex - 1].indexLetter);

    return trueIndex < _contacts.length
        ? _ContactCell(
            name: _contacts[trueIndex].name,
            avatarUrl: _contacts[trueIndex].imageUrl,
            assetName: _contacts[trueIndex].imageAssets,
            indexLetter: notShowHeader ? null : _contacts[trueIndex].indexLetter,
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
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: ListView.builder(
              itemBuilder: _itemForRow,
              itemCount: _contacts.length,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IndexBar(
                    dataSource: _indexs,
                  callBack: (index, title) {
                      print('选择了$title');
                  },
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
