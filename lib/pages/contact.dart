import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(15.0),
                  leading: CircleAvatar(
                    child: new CircleAvatar(child: 
                    new Icon(Icons.phone_android),
                    ),
                  ),
                  title: Text('GLOBE HOTLINES'),
                  subtitle: Text('0975-073-0150\n0975-073-0151\n0975-073-7221',),
                  isThreeLine: true,
                  // title: Text(snapshot.data[index].gender),
              ),
            ),
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(15.0),
                  leading: CircleAvatar(
                    child: new CircleAvatar(child: 
                    new Icon(Icons.phone_android),
                    ),
                  ),
                  title: Text('SMART HOTLINES'),
                  subtitle: Text('0998-075-8705\n0998-175-8709\n0938-300-4110\n0938-300-4007\n0938-300-4004',),
                  isThreeLine: true,
                  // title: Text(snapshot.data[index].gender),
              ),
            ),
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(15.0),
                  leading: CircleAvatar(
                    child: new CircleAvatar(child: 
                    new Icon(Icons.phone)
                    ),
                  ),
                  title: Text('HEALTH LINES'),
                  subtitle: Text('0966-175-4298\n975-3802',),
                  isThreeLine: true,
                  // title: Text(snapshot.data[index].gender),
              ),
            ),
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(15.0),
                  leading: CircleAvatar(
                    child: new CircleAvatar(child: 
                    new Icon(Icons.phone)
                    ),
                  ),
                  title: Text('PLDT HOTLINES'),
                  subtitle: Text('975-3800\n975-3801',),
                  isThreeLine: true,
                  // title: Text(snapshot.data[index].gender),
              ),
            ),
            Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(15.0),
                  leading: CircleAvatar(
                    child: new CircleAvatar(child: 
                    new Icon(Icons.phone)
                    ),
                  ),
                  title: Text('ZCDRRMO'),
                  subtitle: Text('955-9601',),
                  isThreeLine: true,
                  // title: Text(snapshot.data[index].gender),
              ),
            ),
          ],
        ) 
      ),
    );
  }
}