import 'package:flutter/material.dart';
import 'package:smv/model/ui/appDrawer.dart';

class Requirements extends StatefulWidget {
  @override
  _RequirementsState createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> {
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Requirements',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Text('In order to accept the following',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('You will need following',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Text('1. To be registered owner of vehicle ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Padding(
            padding: const EdgeInsets.only(left: 78, right: 20),
            child: Text(
                '2. licence, Aadhar or other acceptable forms of identification ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text('Are you able to meet the requirements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/customerinfo');
                    },
                    child: Text('Yes')),
                ElevatedButton(onPressed: () {}, child: Text('No')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
