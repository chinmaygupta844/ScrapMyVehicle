import 'package:flutter/material.dart';

import 'appDrawer.dart';

final customerName = TextEditingController();
final phoneNumber = TextEditingController();
final emailAddress = TextEditingController();
final addressLine1 = TextEditingController();
final addressLine2 = TextEditingController();
final pincode = TextEditingController();
final locality = TextEditingController();

class CustomerInfo extends StatefulWidget {
  @override
  _CustomerInfoState createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: customerName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Legal Name',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: phoneNumber,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.mail),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: addressLine1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address Line 1',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: addressLine2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address line 2',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: pincode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pin Code',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: locality,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Locality',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sellingcomplete');
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}
