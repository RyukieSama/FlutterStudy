import 'package:fake_wechat/configs/ui_const.dart';
import 'package:fake_wechat/widgets/contacts/contact_cell.dart';
import 'package:fake_wechat/widgets/contacts/friends_data.dart';
import 'package:fake_wechat/widgets/contacts/index_bar.dart';
import 'package:flutter/material.dart';

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
  ScrollController _scroller = ScrollController();

  Widget _itemForRow(BuildContext context, int index) {
    if (index < 4) {
      return index < _systems.length
          ? ContactCell(
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
        ? ContactCell(
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
              controller: _scroller,
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
                      _scroller.animateTo(200, duration: const Duration(microseconds: 250), curve: Curves.easeIn);
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
