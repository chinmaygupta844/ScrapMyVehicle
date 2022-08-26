import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smv/model/ui/appDrawer.dart';

class SellingComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Congratulations your Selling is completed we will be in touch in your provided information',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.check,
            size: 60,
          ),
          Container(
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/smv.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text('Exit'))
        ],
      ),
    );
  }
}
