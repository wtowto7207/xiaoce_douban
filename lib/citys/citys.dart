import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CitysWidget extends StatefulWidget {

  @override
  _CitysWidgetState createState() => _CitysWidgetState();
}

class _CitysWidgetState extends State<CitysWidget> {
  String curCity;
  List<String> hotCitys = [
    '北京',
    '上海',
    '广州',
    '深圳',
    '成都',
    '武汉',
    '杭州',
    '重庆',
    '郑州',
    '南京',
    '西安',
    '苏州',
    '长沙',
    '天津',
    '福州'
  ];

  static const platformChannel = const MethodChannel('flutter.doubanmovie/toast');

  void showToast(String content) async {
    var arguments = Map();
    arguments['content'] = content;
    try {
      String result = await platformChannel.invokeMethod('toast',arguments);
      print('showToast$result');
    } on PlatformException catch (e) {
      print('showToast${e.code}${e.message}${e.details}');
    } on MissingPluginException catch(e){
      print('showToast${e.message}');
    }
  }

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 搜索框
                        Container(
                          height: 50.0,
                          child: TextField(
                            textAlign: TextAlign.start,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                              hintText: '输入城市名称查询',
                              hintStyle: TextStyle(
                                fontSize: 16.0,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black38,
                              ),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        // GPS定位城市
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 5.0, left: 20.0),
                          child: Text(
                            'GPS定位城市',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 5.0, left: 20.0),
                          child: MaterialButton(
                            child: Container(
                              width: 70.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                    size: 18.0,
                                  ),
                                  Text(
                                    curCity,
                                  )
                                ],
                              ),
                            ),
                            color: Colors.white,
                            elevation: 0.0,
                            onPressed: () {
                              showToast('hello');
                            },
                          ),
                        ),
                        // 热门城市
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.0, bottom: 5.0, left: 20.0),
                          child: Text(
                            '热门城市',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2.6,
                                mainAxisSpacing: 20.0,
                                crossAxisSpacing: 50.0,
                              ),
                              itemCount: hotCitys.length,
                              itemBuilder: (context, index) {
                                return MaterialButton(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Text(
                                    hotCitys[index],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context,hotCitys[index]);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
