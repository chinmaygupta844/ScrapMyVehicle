import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/carBody/tyre.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class Lights extends StatefulWidget {
  @override
  _LightsState createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider lightDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    lightDetail.vehicle.lights[0].condition = null;
    lightDetail.vehicle.lights[1].condition = null;
    lightDetail.vehicle.lights[2].condition = null;
    lightDetail.vehicle.lights[3].condition = null;
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
            padding: const EdgeInsets.only(top: 10, bottom: 30, left: 20),
            child: Text(
              'Select Headlight and Taillight Condition',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ToggleBar(
              label: 'Light Condition',
              partName: lightDetail.vehicle.lights[0]),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Light Condition',
                partName: lightDetail.vehicle.lights[1]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Light Condition',
                partName: lightDetail.vehicle.lights[2]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Light Condition',
                partName: lightDetail.vehicle.lights[3]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tyres()));
                },
                label: Text('Next', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
