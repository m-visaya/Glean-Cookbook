import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 250,
          decoration: BoxDecoration(color: Colors.grey.shade300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    minRadius: 60.0,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/mrob.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Dr. Michael Morbius',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noto',
                  color: Colors.black,
                ),
              ),
              Text(
                'morbintime@gmail.com',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontFamily: 'Noto',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle, color: Colors.brown),
                  title: Text('Account Settings',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 20.0))),
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings, color: Colors.brown),
                  title: Text('Application Settings',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 20.0))),
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.info, color: Colors.brown),
                  title: Text('About',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 20.0))),
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.help, color: Colors.brown),
                  title: Text('Help',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 20.0))),
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.logout, color: Colors.brown),
                  title: Text('Log Out',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 20.0))),
            ],
          ),
        )
      ],
    );
  }
}
