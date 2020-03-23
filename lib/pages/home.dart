import 'package:covidph19/pages/contact.dart';
import 'package:covidph19/pages/outside.dart';
import 'package:covidph19/pages/faqs.dart';
import 'package:covidph19/pages/suspect.dart';
import 'package:flutter/material.dart';

import 'cases.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 2;
  final List<Widget> tabs = [
    Cases(),
    Outside(),
    Suspect(),
    Search(),
    Contact(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Suspect();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   body: PageStorage(
      //   child: currentScreen,
      //   bucket: bucket,
      // ),
      body: tabs[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            title: Text('PH Cases'),
            // backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            title: Text('Outside PH'),
            // backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('ZC Updates'),
            // backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            title: Text('FAQs'),
            // backgroundColor: Colors.orange
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('Contact'),
            // backgroundColor: Colors.orange
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   child: Container(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             MaterialButton(
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       Cases(); // if user taps on this dashboard tab will be active
      //                   _currentIndex = 0;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.healing,
      //                     color: _currentIndex == 0 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'PH Cases',
      //                     style: TextStyle(
      //                       color: _currentIndex == 0 ? Colors.red : Colors.grey,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       Outside(); // if user taps on this dashboard tab will be active
      //                   _currentIndex = 1;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.pin_drop,
      //                     color: _currentIndex == 1 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'Outside PH',
      //                     style: TextStyle(
      //                       color: _currentIndex == 1 ? Colors.red : Colors.grey,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       Suspect(); // if user taps on this dashboard tab will be active
      //                   _currentIndex = 3;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.info_outline,
      //                     color: _currentIndex == 3 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'Suspect',
      //                     style: TextStyle(
      //                       color: _currentIndex == 3 ? Colors.red : Colors.grey,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       Search(); // if user taps on this dashboard tab will be active
      //                   _currentIndex = 4;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.search,
      //                     color: _currentIndex == 4 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'PUI',
      //                     style: TextStyle(
      //                       color: _currentIndex == 4 ? Colors.red : Colors.grey,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       Search(); // if user taps on this dashboard tab will be active
      //                   _currentIndex = 4;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.search,
      //                     color: _currentIndex == 4 ? Colors.red : Colors.grey,
      //                   ),
      //                   Text(
      //                     'PUI',
      //                     style: TextStyle(
      //                       color: _currentIndex == 4 ? Colors.red : Colors.grey,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
                  
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}