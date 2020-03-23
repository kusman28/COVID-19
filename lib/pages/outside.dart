import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Outside extends StatefulWidget {
  @override
  _OutsideState createState() => _OutsideState();
}

class _OutsideState extends State<Outside> {

  Future<List<Corona>> _getCases() async
  {
    var data = await http.get("https://coronavirus-ph-api.now.sh/cases-outside-ph");

    var jsonData = json.decode(data.body);

    List<Corona> casess = [];

    for(var c in jsonData)
    {
      Corona corona = Corona(c["country_territory_place"], c["confirmed"], c["recovered"], c["died"]);
      
      casess.add(corona);
      
    }
    print(casess.length);

    return casess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outside PH'),
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
                    // leading: CircleAvatar(
                    //   child: new CircleAvatar(child: 
                    //   new Text('C'),
                    //   ),
                    // ),
                    trailing: snapshot.data[index].recovered == 0 ?
                      Badge(
                      badgeColor: Colors.redAccent,
                      shape: BadgeShape.square,
                      borderRadius: 20,
                      toAnimate: false,
                      badgeContent:
                          Text('Recovered: ${snapshot.data[index].recovered}', style: TextStyle(color: Colors.white)),
                      ) : Badge(
                      badgeColor: Colors.green,
                      shape: BadgeShape.square,
                      borderRadius: 20,
                      toAnimate: false,
                      badgeContent:
                          Text('Recovered: ${snapshot.data[index].recovered}', style: TextStyle(color: Colors.white)),
                      ),
                    title: Text('${snapshot.data[index].country_territory_place}'),
                    subtitle: Text('Confirmed: ${snapshot.data[index].confirmed}',),
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

class Corona {
  final String country_territory_place;
  final int confirmed;
  final int recovered;
  final int died;

  Corona(this.country_territory_place, this.confirmed, this.recovered, this.died);
}