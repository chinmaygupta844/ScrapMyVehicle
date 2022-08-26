import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/carBody/bumper.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class Door extends StatefulWidget {
  @override
  _DoorState createState() => _DoorState();
}

class _DoorState extends State<Door> {
  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider doorDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    doorDetail.vehicle.doors[0].condition = null;
    doorDetail.vehicle.doors[1].condition = null;
    doorDetail.vehicle.doors[2].condition = null;
    doorDetail.vehicle.doors[3].condition = null;
    doorDetail.vehicle.doors[4].condition = null;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30),
            child: Text(
              'Select Doors Condition',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ToggleBar(
            label: 'Door Condition',
            partName: doorDetail.vehicle.doors[0],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Door Condition', partName: doorDetail.vehicle.doors[1]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Door Condition', partName: doorDetail.vehicle.doors[2]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Door Condition', partName: doorDetail.vehicle.doors[3]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Door Condition', partName: doorDetail.vehicle.doors[4]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bumper()));
                },
                label: Text('Next', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
