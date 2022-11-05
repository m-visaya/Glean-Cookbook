import 'package:flutter/material.dart';
import 'package:glean_cookbook/utils/auth.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  String? email = AuthUser().user?.email;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(color: Colors.grey.shade300),
            ),
            Positioned(
              top: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        minRadius: 60.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "firstname lastname",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Noto',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    email!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Noto',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 160,
        ),
        Container(
          padding: EdgeInsets.only(left: 14),
          child: Wrap(
            runSpacing: 10,
            children: <Widget>[
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle, color: Colors.black54),
                  title: Text('Account Settings',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings, color: Colors.black54),
                  title: Text('Application Settings',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.info, color: Colors.black54),
                  title: Text('About',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {},
                  leading: Icon(Icons.help, color: Colors.black54),
                  title: Text('Help',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
              ListTile(
                  onTap: () {
                    AuthUser().logout();
                  },
                  leading: Icon(Icons.logout, color: Colors.black54),
                  title: Text('Log Out',
                      style: TextStyle(
                          fontFamily: 'Noto',
                          color: Colors.grey.shade900,
                          fontSize: 18))),
            ],
          ),
        )
      ],
    );
  }
}
