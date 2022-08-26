import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class GenerateBill extends StatefulWidget {
  @override
  _GenerateBillState createState() => _GenerateBillState();
}

class _GenerateBillState extends State<GenerateBill> {
  int fireDamage;
  int towing;

  @override
  Widget build(BuildContext context) {
    final vehicleDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              child: Text(
                'Any flood or fire damage in vehicle',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Radio(
                value: 1,
                groupValue: fireDamage,
                onChanged: (value) {
                  setState(() {
                    fireDamage = value;
                  });
                  vehicleDetail.setFireDamage(fireDamage);
                  print(fireDamage);
                },
              ),
            ),
            Text(
              'No flood or fire damage',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Radio(
                value: 2,
                groupValue: fireDamage,
                onChanged: (value) {
                  setState(() {
                    fireDamage = value;
                  });
                  vehicleDetail.setFireDamage(fireDamage);
                  print(fireDamage);
                },
              ),
            ),
            Text(
              'Yes it has flood or fire damage',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              child: Text(
                'Do you want to tow ?',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Radio(
                value: 3,
                groupValue: towing,
                onChanged: (value) {
                  setState(() {
                    towing = value;
                  });
                  vehicleDetail.setTowing(towing);
                  print(towing);
                },
              ),
            ),
            Text(
              'Yes',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Radio(
                value: 4,
                groupValue: towing,
                onChanged: (value) {
                  setState(() {
                    towing = value;
                  });
                  vehicleDetail.setTowing(towing);

                  print(towing);
                },
              ),
            ),
            Text(
              'No',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              child: Text(
                'Location',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.grey,
            child: SizedBox(
              child: Text('your location'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
                onPressed: fireDamage != null && towing != null
                    ? () {
                        Navigator.pushNamed(context, '/displaybill');
                      }
                    : null,
                child: Text('Get Quote')),
          )
        ],
      ),
    );
  }


}
