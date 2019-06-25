import 'package:flutter/material.dart';
import 'package:xiaoce_douban/hot/hot_widget.dart';
import 'package:xiaoce_douban/movies/movies_widget.dart';
import 'package:xiaoce_douban/mine/mine_widget.dart';
import 'package:xiaoce_douban/citys/citys.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '豆瓣电影'),
      routes: {
        '/Citys': (context) => CitysWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  // body部分显示的内容
  final _widgetItems = [
    HotWidget(),
    MoviesWidget(),
    MineWidget(),
  ];

  // 切换tap
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetItems[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部items项
        items: [
          BottomNavigationBarItem(
            title: Text("热映"),
            icon: Icon(Icons.school),
          ),
          BottomNavigationBarItem(
            title: Text("找片"),
            icon: Icon(Icons.panorama_fish_eye),
          ),
          BottomNavigationBarItem(
            title: Text("我的"),
            icon: Icon(Icons.people),
          ),
        ],
        // 选中项
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        // 点击触发的事件
        onTap: _onItemTapped,
      ),
    );
  }
}
