import 'package:flutter/material.dart';

class Videodescription extends StatelessWidget {
  const Videodescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 80,
      padding: EdgeInsets.only(left: 10),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "@BurnaBoy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Odogwu By BurnaBoy"),
            Row(
              children: <Widget>[
                Icon(Icons.music_note, size: 15.0, color: Colors.white),
                Text(
                  "Burna Boy - TikTok - Odogwu",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ]),
    ));
  }
}
