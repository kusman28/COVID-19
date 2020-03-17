import 'package:covidph19/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   Future<List<Cases>> _getCases() async
//   {
//     var data = await http.get("https://coronavirus-ph-api.now.sh/cases");

//     var jsonData = json.decode(data.body);

//     List<Cases> casess = [];

//     for(var c in jsonData)
//     {
//       Cases cases = Cases(c["case_no"], c["date"], c["age"], c["gender"], c["nationality"], c["hospital_admitted_to"], c["had_recent_travel_history_abroad"], c["status"], c["notes"]);
      
//       casess.add(cases);
      
//     }
//     print(casess.length);
//   }

//   int _currentIndex = 0;

//   final tabs = [
//     Center(
//       child: Text('Cases'),
//     ),
//     Center(child: Text('Outside PH')),
//     Center(child: Text('Suspect')),
//     Center(child: Text('Cases')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(widget.title),
//       ),
//       body: tabs[_currentIndex], 
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         // backgroundColor: Colors.blue,
//         iconSize: 30,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.healing),
//             title: Text('Cases'),
//             // backgroundColor: Colors.green
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pin_drop),
//             title: Text('Outside PH'),
//             // backgroundColor: Colors.blue
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             title: Text('Suspect'),
//             // backgroundColor: Colors.red
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             title: Text('Search'),
//             // backgroundColor: Colors.orange
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

// class Cases {
//   final int case_no;
//   final String date;
//   final String age;
//   final String gender;
//   final String nationality;
//   final String hospital_admitted_to;
//   final String had_recent_travel_history_abroad;
//   final String status;
//   final String notes;

//   Cases(this.case_no, this.date, this.age, this.gender, this.nationality, this.hospital_admitted_to, this.had_recent_travel_history_abroad, this.status, this.notes);
// }
