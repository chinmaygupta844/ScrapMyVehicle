import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/carBody/lights.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class Bumper extends StatefulWidget {
  @override
  _BumperState createState() => _BumperState();
}

class _BumperState extends State<Bumper> {


  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider bumperDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    bumperDetail.vehicle.hood.condition = null;
    bumperDetail.vehicle.bumpers[0].condition = null;
    bumperDetail.vehicle.bumpers[1].condition = null;

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
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Text(
              'Select Hood and Bumper Condition',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ToggleBar(
              label: 'Hood Condition', partName: bumperDetail.vehicle.hood),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Bumper Condition',
                partName: bumperDetail.vehicle.bumpers[0]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Bumper Condition',
                partName: bumperDetail.vehicle.bumpers[1]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed:
                    () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Lights()));
                },
                label: Text('Next', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
