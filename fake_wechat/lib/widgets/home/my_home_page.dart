import 'package:fake_wechat/widgets/me/me_page.dart';
import 'package:fake_wechat/widgets/message/message_page.dart';
import 'package:fake_wechat/widgets/moment/moment_page.dart';
import 'package:fake_wechat/widgets/contacts/contacts_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageDataSource();
  }
}

class _MyHomePageDataSource extends State<MyHomePage> {
  int _selectedTab = 0;
  final List<Widget> _pages = [
    MessagePage(),
    ContactsPage(),
    MommentPage(),
    MinePage()
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (idx) {
          setState(() {
            _selectedTab = idx;
          });
        },
        controller: _pageController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.fixed, // 这样就是标准的哪种
//        fixedColor: Colors.green,//选中颜色
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedTab,
        onTap: (idx) {
          setState(() {
            _selectedTab = idx;
            _pageController.jumpToPage(_selectedTab);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '微信',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature_people),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '我',
          ),
        ],
      ),
    );
  }
}
