import 'package:flutter/material.dart';
import 'package:xiaoce_douban/hot/hot_movie_data.dart';
class HotMovieItem extends StatefulWidget {
  final HotMovieData hotMovieData;
  HotMovieItem(this.hotMovieData);
  @override
  _HotMovieItemState createState() => _HotMovieItemState();
}

class _HotMovieItemState extends State<HotMovieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            widget.hotMovieData.images.small,
            width: 80.0,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.hotMovieData.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.hotMovieData.rating.average.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '导演：${widget.hotMovieData.getDirectors()}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '演员：${widget.hotMovieData.getCasts()}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${widget.hotMovieData.collectCount.toString()}人看过',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red,
                  ),
                ),
                OutlineButton(
                  child: Text(
                    '购票',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
