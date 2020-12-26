import 'package:flutter/material.dart';
import 'package:tracking_app/search.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buttonSection = Container(
      margin: const EdgeInsets.only(top: 70.0),
      child: Builder(
        builder: (context) => RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchPage()));
          },
          child: Text(
            "START NOW",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, fontFamily: 'FredokaOne',
            ),
          ),
          color: Colors.black45,
          textColor: Colors.white70,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)),
        ),
      ),
    );

    Widget txtName = Container(
      margin: const EdgeInsets.only(top: 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Mobie Application by fuseSavage',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold, fontFamily: 'FredokaOne',
                color: Colors.black54),
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/check.png',
                  fit: BoxFit.contain,
                  height: 70,
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    'Check Tracking',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                )
              ],
            ),
            backgroundColor: Color(0xFF424242),
          ),
          body: Container(
            color: const Color(0xFFC6FF00),
            child: ListView(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              children: [
                Image.asset(
                  'images/checkTrack.jpg',
                  width: 600,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                buttonSection,
                txtName,
              ],
            ),
          )),
    );
  }
}

