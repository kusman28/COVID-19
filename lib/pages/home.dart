import 'package:covidph19/pages/outside.dart';
import 'package:covidph19/pages/search.dart';
import 'package:covidph19/pages/suspect.dart';
import 'package:flutter/material.dart';

import 'cases.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> tabs = [
    Cases(),
    Outside(),
    Suspect(),
    Search(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Cases();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Cases(); // if user taps on this dashboard tab will be active
                        _currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.healing,
                          color: _currentIndex == 0 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'PH Cases',
                          style: TextStyle(
                            color: _currentIndex == 0 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Outside(); // if user taps on this dashboard tab will be active
                        _currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.pin_drop,
                          color: _currentIndex == 1 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Outside PH',
                          style: TextStyle(
                            color: _currentIndex == 1 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 100,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Suspect(); // if user taps on this dashboard tab will be active
                        _currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: _currentIndex == 3 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Suspect',
                          style: TextStyle(
                            color: _currentIndex == 3 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 107,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Search(); // if user taps on this dashboard tab will be active
                        _currentIndex = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: _currentIndex == 4 ? Colors.red : Colors.grey,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: _currentIndex == 4 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Right Tab bar icons
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     MaterialButton(
              //       minWidth: 40,
              //       onPressed: () {
              //         setState(() {
              //           currentScreen =
              //               Suspect(); // if user taps on this dashboard tab will be active
              //           _currentIndex = 2;
              //         });
              //       },
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Icon(
              //             Icons.dashboard,
              //             color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              //           ),
              //           Text(
              //             'Suspect',
              //             style: TextStyle(
              //               color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     MaterialButton(
              //       minWidth: 40,
              //       onPressed: () {
              //         setState(() {
              //           currentScreen =
              //               Search(); // if user taps on this dashboard tab will be active
              //           _currentIndex = 3;
              //         });
              //       },
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Icon(
              //             Icons.chat,
              //             color: _currentIndex == 3 ? Colors.blue : Colors.grey,
              //           ),
              //           Text(
              //             'Search',
              //             style: TextStyle(
              //               color: _currentIndex == 3 ? Colors.blue : Colors.grey,
              //             ),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}