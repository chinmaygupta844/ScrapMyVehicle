import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        children: [
          ListTile(
            tileColor: Colors.white,
            title: Center(
              child: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //  trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            focusColor: Colors.green,
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
                child: Text(
              "My Profile",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            // trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
              child: Text(
                "My Request",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
              child: Text(
                "Language",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
                child: Text(
              "Scrapping policy",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            //  trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
              child: Text(
                "My Docs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
                child: Text(
              "FAQ",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            //   trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
              child: Text(
                "Blogs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //   trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          ListTile(
            tileColor: Colors.white,
            leading: Icon(Icons.info_outline),
            title: Text(
              "About Us",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //   trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            tileColor: Colors.white,
            title: Center(
              child: Text(
                "Contact Us",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListTile(
              tileColor: Colors.white,
              title: Text(
                "Log Out",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.power_settings_new),
            ),
          ),
        ],
      ),
    );
  }
}
