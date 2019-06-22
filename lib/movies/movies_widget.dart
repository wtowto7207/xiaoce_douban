import 'package:flutter/material.dart';

class MoviesWidget extends StatefulWidget {
  @override
  _MoviesWidgetState createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80.0,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
            decoration: InputDecoration(
              hintText: '电影 / 电视剧 / 影人',
              hintStyle: TextStyle(
                fontSize: 16.0,
              ),
              contentPadding: EdgeInsets.only(top:8.0,bottom:8.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              filled: true,
              fillColor: Colors.black12,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        )
      ],
    );
  }
}
