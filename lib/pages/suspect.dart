import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Suspect extends StatefulWidget {
  @override
  _SuspectState createState() => _SuspectState();
}

class _SuspectState extends State<Suspect> {

  Future<List<Corona>> _getCases() async
  {
    var data = await http.get("http://cryptic-fortress-21094.herokuapp.com/api/covid");

    var jsonData = json.decode(data.body);

    List<Corona> casess = [];

    for(var c in jsonData)
    {
      Corona corona = Corona(c["id"], c["confirmed"], c["pui"], c["cleared_pui"], c["pum"], c["cleared_pum"]);
      
      casess.add(corona);
      
    }
    print(casess.length);

    return casess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZC Updates'),
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
                  return Column(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(23.0),
                            leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Image.asset('assets/images/ilovezc.png', fit: BoxFit.cover),
                            ),
                            title: Text('Zamboanga City COVID-19'),
                            subtitle: Text('This is the updated information about Covid-19. Data from DOH Region IX',),
                            isThreeLine: true,
                            // title: Text(snapshot.data[index].gender),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15.0),
                            leading: CircleAvatar(
                              child: new CircleAvatar(child: 
                              new Text('${snapshot.data[index].confirmed}'),
                              ),
                            ),
                            title: Text('Confirmed Cases'),
                            subtitle: Text('Total No. of Person Confirmed from Covid-19',),
                            // title: Text(snapshot.data[index].gender),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15.0),
                            leading: CircleAvatar(
                              child: new CircleAvatar(child: 
                              new Text('${snapshot.data[index].pui}'),
                              ),
                            ),
                            title: Text('PUI (Person Under Investigation)'),
                            subtitle: Text('Total No. of Person Under Investigation',),
                            // title: Text(snapshot.data[index].gender),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15.0),
                            leading: CircleAvatar(
                              child: new CircleAvatar(child: 
                              new Text('${snapshot.data[index].cleared_pui}'),
                              ),
                            ),
                            title: Text('Cleared PUI'),
                            subtitle: Text('Total No. of Cleared PUIs',),
                            // title: Text(snapshot.data[index].gender),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15.0),
                            leading: CircleAvatar(
                              child: new CircleAvatar(child: 
                              new Text('${snapshot.data[index].pum}'),
                              ),
                            ),
                            title: Text('PUM (Person Under Monitoring)'),
                            subtitle: Text('Total No. of Person Under Monitoring',),
                            // title: Text(snapshot.data[index].gender),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15.0),
                            leading: CircleAvatar(
                              child: new CircleAvatar(child: 
                              new Text('${snapshot.data[index].cleared_pum}'),
                              ),
                            ),
                            title: Text('Cleared PUM'),
                            subtitle: Text('Total No. of Cleared PUMs',),
                            // title: Text(snapshot.data[index].gender),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Corona {
  final int id;
  final String confirmed;
  final String pui;
  final String cleared_pui;
  final String pum;
  final String cleared_pum;

  Corona(
    this.id, 
    this.confirmed, 
    this.pui,
    this.cleared_pui,
    this.pum,
    this.cleared_pum,
  );
}