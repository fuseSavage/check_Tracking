import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

// ignore: non_constant_identifier_names
String parcelNumber, tracking_number, courier;

class _SearchPageState extends State<SearchPage> {
  // Default Drop Down Item.
  String dropdownValue = 'KR_Express';

  // To show Selected Item in Text.
  String holder = '';

  List<String> actorsName = [
    'KR_Express',
    'JT_Express',
    'SH_Express',
  ];

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              children: [
                Image.asset(
                  'images/check.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: Column(
                    children: [
                      boxSearch,
                      Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping company',
                                style: TextStyle(
                                    fontSize: 15,
                                    
                                    color: Colors.black45,
                                    fontFamily: 'RobotoMono'),
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String data) {
                                  setState(() {
                                    dropdownValue = data;
                                    courier = '$dropdownValue';
                                    // print('$tranFer hhhhhh');
                                  });
                                },
                                items: actorsName.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                iconSearch,
              ],
            ),
          ),
        ));
  }

  Widget txtWelcome = Container(
    margin: const EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Search',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
              fontFamily: 'RobotoMono'),
        ),
      ],
    ),
  );

  Widget boxSearch = Container(
    child: TextFormField(
      onChanged: (value) {
        parcelNumber = value.trim();
        // print('$parcelNumber');
      },
      decoration: InputDecoration(labelText: 'Enter your parcel number'),
    ),
  );

  Widget iconSearch = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.teal[900],
          ),
          tooltip: 'Search',
          onPressed: () {
            tracking_number = '$parcelNumber';

            print('$tracking_number');
            print('$courier');
          },
        ),
        Text(
          'Search',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        )
      ],
    ),
  );

   Widget showDetail = Container(
      
    );
}
