import 'package:flutter/material.dart';

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
            widget.hotMovieData.images,
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
                    widget.hotMovieData.rating.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '导演：${widget.hotMovieData.directors}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '演员：${widget.hotMovieData.casts}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
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
                  '${widget.hotMovieData.watchedPeople.toString()}人看过',
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
class HotMovieData {
  String title;
  double rating;
  String directors;
  String casts;
  int watchedPeople;
  String images;

  HotMovieData(
    this.title,
    this.rating,
    this.directors,
    this.casts,
    this.watchedPeople,
    this.images,
  );
}