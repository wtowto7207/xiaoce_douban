import 'package:flutter/material.dart';

class HotWidget extends StatefulWidget {
  @override
  _HotWidgetState createState() => _HotWidgetState();
}

class _HotWidgetState extends State<HotWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left:20.0,right: 20.0),
          child: Row(
            children: <Widget>[
              Text(
                '湖州',
                style: TextStyle(
                  fontSize: 16.0,
                ),
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
                    contentPadding: EdgeInsets.only(top: 8.0,bottom: 8.0),
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
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}