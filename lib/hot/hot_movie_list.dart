import 'package:flutter/material.dart';
import 'package:xiaoce_douban/hot/hot_movie_item.dart';

class HotMovieList extends StatefulWidget {

  @override
  _HotMovieListState createState() => _HotMovieListState();
}

class _HotMovieListState extends State<HotMovieList> {
  List<HotMovieData> hotMovies = new List<HotMovieData>();
  @override
  void initState() {
    super.initState();
    var data = HotMovieData('反贪风暴4', 6.3, '林德禄', '古天乐/郑嘉颖/林峯', 29013,
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551353482.webp');
    setState(() {
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: hotMovies.length,
      itemBuilder: (context, index){
        return HotMovieItem(hotMovies[index]);
      },
      separatorBuilder: (context, index){
        return Divider(
          height: 1,
          color: Colors.black26,
        );
      },
    );
  }
}


