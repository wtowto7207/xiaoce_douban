import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xiaoce_douban/hot/hot_movie_item.dart';
import 'package:xiaoce_douban/hot/hot_movie_data.dart';
import 'package:http/http.dart' as http;

class HotMovieList extends StatefulWidget {
  @override
  _HotMovieListState createState() => _HotMovieListState();
}

class _HotMovieListState extends State<HotMovieList> with AutomaticKeepAliveClientMixin {
  List<HotMovieData> hotMovies = new List<HotMovieData>();
  // mixin AutomaticKeppAliveClientMixin  设置wantKeepAlive为true,使其不回收不显示的Widget
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    setState(() {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.separated(
        itemCount: hotMovies.length,
        itemBuilder: (context, index) {
          return HotMovieItem(hotMovies[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
      );
    }
  }

//通过http请求获取数据
  Future _getData() async {
    List<HotMovieData> serverDataList = new List();
    var response = await http.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=10&client=&udid=');
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      for (dynamic data in responseJson['subjects']) {
        HotMovieData hotMovieData = HotMovieData.fromJson(data);
        serverDataList.add(hotMovieData);
      }
      setState(() {
        hotMovies = serverDataList;
      });
    }
  }
}
