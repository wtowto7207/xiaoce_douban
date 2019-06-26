import 'package:flutter/material.dart';

class CitysWidget extends StatefulWidget {
  @override
  _CitysWidgetState createState() => _CitysWidgetState();
}

class _CitysWidgetState extends State<CitysWidget> {
  String curCity;
  @override
  Widget build(BuildContext context) {
    curCity = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "选择城市",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 1,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              child: TabBar(
                unselectedLabelColor: Colors.black12,
                labelColor: Colors.green,
                indicatorColor: Colors.green,
                tabs: <Widget>[
                  Tab(
                    text: '国内',
                  ),
                  Tab(
                    text: '海外',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Text('国内'),
                    ),
                    Center(
                      child: Text('海外'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
