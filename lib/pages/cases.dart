import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cases extends StatefulWidget {
  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {

  Future<List<Corona>> _getCases() async
  {
    var data = await http.get("https://coronavirus-ph-api.now.sh/cases");

    var jsonData = json.decode(data.body);

    List<Corona> casess = [];

    for(var c in jsonData)
    {
      Corona corona = Corona(c["case_no"], c["date"], c["gender"], c["nationality"], c["hospital_admitted_to"], c["had_recent_travel_history_abroad"], c["status"], c["other_information"]);
      
      casess.add(corona);
      
    }
    print(casess.length);

    return casess;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PH Cases'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: _getCases(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                )
              );
            } else {
                return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: CircleAvatar(
                      child: new CircleAvatar(child: snapshot.data[index].nationality == 'Filipino' ?
                      new Image.asset("assets/images/ph.png") : snapshot.data[index].nationality == 'Taiwanese' ?
                      new Image.asset("assets/images/taiwan.png") : snapshot.data[index].nationality == 'China' ?
                      new Image.asset("assets/images/china.png") : snapshot.data[index].nationality == 'American' ?
                      new Image.asset("assets/images/usa.png") : new Image.asset("assets/images/china.png")),
                    ),
                    trailing: 
                    snapshot.data[index].status == 'Died' ? 
                    Badge(
                      badgeColor: Colors.redAccent,
                      shape: BadgeShape.square,
                      borderRadius: 20,
                      toAnimate: false,
                      badgeContent:
                          Text('Deceased', style: TextStyle(color: Colors.white)),
                      ) : snapshot.data[index].status == 'Admitted' ? 
                      Badge(
                      badgeColor: Colors.blueAccent,
                      shape: BadgeShape.square,
                      borderRadius: 20,
                      toAnimate: false,
                      badgeContent:
                          Text('${snapshot.data[index].status}', style: TextStyle(color: Colors.white)),
                      ) : Badge(
                      badgeColor: Colors.green,
                      shape: BadgeShape.square,
                      borderRadius: 20,
                      toAnimate: false,
                      badgeContent:
                          Text('${snapshot.data[index].status}', style: TextStyle(color: Colors.white)),
                      ), 
                    title: Text('Case No. ${snapshot.data[index].case_no}'),
                    subtitle: Text('Nationality: ${snapshot.data[index].nationality}',),
                    onTap: () {
                      Navigator.push(context, 
                      new MaterialPageRoute(builder: (context) => DetailsPage(snapshot.data[index]))
                      );
                    },
                    // title: Text(snapshot.data[index].gender),
                  );
                }
              );
            }
          },
        )
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {

  final Corona corona;

  DetailsPage(this.corona);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case No. ${corona.case_no}'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Text('\n Case No: ${corona.case_no}\n Date: ${corona.date}\n Gender: ${corona.gender} \n Nationality: ${corona.nationality}\n Admitted to:\n ${corona.hospital_admitted_to}\n Travel History: ${corona.had_recent_travel_history_abroad}\n Status: ${corona.status}\n Other Info:\n ${corona.other_information}',
        style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class Corona {
  final int case_no;
  final String date;
  // final int age;
  final String gender;
  final String nationality;
  final String hospital_admitted_to;
  final String had_recent_travel_history_abroad;
  final String status;
  final String other_information;

  Corona(
    this.case_no, 
    this.date, 
    // this.age, 
    this.gender, 
    this.nationality, 
    this.hospital_admitted_to, 
    this.had_recent_travel_history_abroad, 
    this.status, 
    this.other_information
  );
}