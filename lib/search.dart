import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

// ignore: non_constant_identifier_names
String parcelNumber, tracking_number, courier;
String name = '',
    courierkey = '',
    trackingNo = '',
    currentStatus = '',
    timelinesdate = '',
    timelinesdetails = '',
    timelinesdetails2 = '',
    timelinesdetails3 = '',
    timelinesdate2 = '';

class _SearchPageState extends State<SearchPage> {
  // Default Drop Down Item.
  String dropdownValue = 'kerry_express';

  // To show Selected Item in Text.
  String holder = '';

  List<String> actorsName = [
    'kerry_express',
    'jt_express',
    'shopee_express',
    'flash_express ',
  ];

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

  void _sendToAPI() async {
    print(courier);
    print(tracking_number);
    var url = "https://api.etrackings.com/v2/tracks/find";

    var body = {"tracking_number": tracking_number, "courier": courier};

    var response = await http.post(
      url,
      headers: {
        "etracking-api-key": "b3394f93a2af319322016586f58bc3894654351f7",
        "etracking-key-secret":
            "e7e5c54317cb01493db04d3121b25fa4027973cb09a4a8145342f1d8d7985d03af63f9656f27fc8ba345dfb4a69acc530ee0c637e1179e16f4e4db1cf45f5b296bc12924db3e52c47bcc2dc",
        "accept-language": "TH",
        "Content-Type": "application/json"
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      setState(() {
        name = json.decode(response.body)['data']['detail']['recipient'];
      });
      setState(() {
        courierkey = json.decode(response.body)['data']['courier'];
      });
      setState(() {
        trackingNo = json.decode(response.body)['data']['trackingNo'];
      });
      setState(() {
        currentStatus = json.decode(response.body)['data']['currentStatus'];
      });
      setState(() {
        timelinesdate =
            json.decode(response.body)['data']['timelines'][0]['date'];
        timelinesdate2 =
            json.decode(response.body)['data']['timelines'][1]['date'];
      });

      setState(() {
        timelinesdetails = json.decode(response.body)['data']['timelines'][0]
            ['details'][0]['description'];
        timelinesdetails2 = json.decode(response.body)['data']['timelines'][0]
            ['details'][1]['description'];
      });

      setState(() {
        timelinesdetails3 = json.decode(response.body)['data']['timelines'][1]
            ['details'][0]['description'];
      });
    } else {
      throw Exception('Failed to load Album');
    }
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
                                'Company',
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
                // iconSearch,

                Container(
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

                          // print('$tracking_number');
                          // print('$courier');
                          _sendToAPI();
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
                ),
                // Text(name==''?'':name)
                //             courierkey = '',
                // trackingNo = '',
                // currentStatus = '',
                // timelinesdate = '',
                // timelinesdetails;

                Container(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    children: [
                      Text(
                        'ผู้สั่ง   :   ' + (name == '' ? '' : name),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                      Text(
                        'บริษัทขนส่ง   :   ' +
                            (courierkey == '' ? '' : courierkey),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                      Text(
                        'หมายเลขพัสดุ   :   ' +
                            (trackingNo == '' ? '' : trackingNo),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                      Text(
                        'สถานะการจัดส่ง :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        (currentStatus == '' ? '' : currentStatus),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                      Text(
                        'วันที่    :   ' +
                            (timelinesdate == '' ? '' : timelinesdate),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        (timelinesdetails == '' ? '' : timelinesdetails),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                      Text(
                        (timelinesdetails2 == '' ? '' : timelinesdetails2),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                      Text(
                        'วันที่    :   ' +
                            (timelinesdate2 == '' ? '' : timelinesdate2),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                      Text(
                        (timelinesdetails3 == '' ? '' : timelinesdetails3),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(''),
                    ],
                  ),
                ),
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
            // _sendToAPI();
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
}
