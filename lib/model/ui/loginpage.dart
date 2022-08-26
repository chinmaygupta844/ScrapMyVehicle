import 'package:flutter/material.dart';

class Userlogin extends StatefulWidget {
  @override
  _UserloginState createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user login page'),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'The kabadiwala',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mobile Number',
              ),
              onSubmitted: (val) {
                // FirebaseAnalytics().setUserId(val);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    //  FirebaseAnalytics().logLogin();
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )),
          ),
        ],
      ),
    );
  }
}
