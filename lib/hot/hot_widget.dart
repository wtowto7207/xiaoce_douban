import 'package:flutter/material.dart';
import 'package:xiaoce_douban/hot/hot_movie_list.dart';

class HotWidget extends StatefulWidget {
  @override
  _HotWidgetState createState() => _HotWidgetState();
}

class _HotWidgetState extends State<HotWidget> {
  String curCity = '湖州';
  void _jumpToCityWidget() async {
    var selectCity =
        await Navigator.pushNamed(context, '/Citys', arguments: curCity);
    if (selectCity == null) return;
    setState(() {
      curCity = selectCity;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  curCity,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onTap: () {
                  _jumpToCityWidget();
                },
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    hintText: '电影 / 电视剧 / 影人',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'MaterialIcons',
                    ),
                    contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    filled: true,
                    fillColor: Colors.black12,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50.0),
                  child: TabBar(
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.black87,
                    indicatorColor: Colors.black87,
                    tabs: <Widget>[
                      Tab(
                        text: '正在热映',
                      ),
                      Tab(
                        text: '即将上映',
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        HotMovieList(curCity),
                        Center(
                          child: Text('即将上映'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
