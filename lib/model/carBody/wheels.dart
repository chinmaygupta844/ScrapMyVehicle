import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/carBody/underhood.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class Wheels extends StatefulWidget {
  @override
  _WheelsState createState() => _WheelsState();
}

class _WheelsState extends State<Wheels> {
  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider wheelsDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    wheelsDetail.vehicle.wheels[0].condition = null;
    wheelsDetail.vehicle.wheels[1].condition = null;
    wheelsDetail.vehicle.wheels[2].condition = null;
    wheelsDetail.vehicle.wheels[3].condition = null;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Text(
              'Select wheels Condition',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ToggleBar(
              label: 'Wheels condition',
              partName: wheelsDetail.vehicle.wheels[0]),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Wheels condition',
                partName: wheelsDetail.vehicle.wheels[1]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Wheels condition',
                partName: wheelsDetail.vehicle.wheels[2]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Wheels condition',
                partName: wheelsDetail.vehicle.wheels[3]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UnderHood1()));
                },
                label: Text('Next', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
