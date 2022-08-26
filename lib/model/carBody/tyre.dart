import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/carBody/wheels.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class Tyres extends StatefulWidget {
  @override
  _TyresState createState() => _TyresState();
}

class _TyresState extends State<Tyres> {
  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider tyreDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    tyreDetail.vehicle.tyres[0].condition = null;
    tyreDetail.vehicle.tyres[1].condition = null;
    tyreDetail.vehicle.tyres[2].condition = null;
    tyreDetail.vehicle.tyres[3].condition = null;
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
            padding: const EdgeInsets.only(top: 10, bottom: 30, left: 30),
            child: Text(
              'Select Tyres Condition',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ToggleBar(
              label: 'Tyre Condition', partName: tyreDetail.vehicle.tyres[0]),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Tyre condition', partName: tyreDetail.vehicle.tyres[1]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Tyre condition', partName: tyreDetail.vehicle.tyres[2]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'Tyre condition', partName: tyreDetail.vehicle.tyres[3]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed:
                    () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Wheels()));
                },
                label: Text('Next', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
