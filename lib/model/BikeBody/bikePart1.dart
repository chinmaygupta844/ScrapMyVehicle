import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/BikeBody/bikePart2.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class BikePart1 extends StatefulWidget {
  @override
  _BikePart1State createState() => _BikePart1State();
}

class _BikePart1State extends State<BikePart1> {
  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider vehicleDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    vehicleDetail.vehicle.engine.condition = null;
    vehicleDetail.vehicle.suspensionFront.condition = null;
    vehicleDetail.vehicle.suspensionRear.condition = null;
    vehicleDetail.vehicle.battery.condition = null;
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
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                'Select parts Condition',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            ToggleBar(
              label: 'engine condition',
              partName: vehicleDetail.vehicle.engine,
            ),
            ToggleBar(
                label: 'suspension condition',
                partName: vehicleDetail.vehicle.suspensionFront),
            ToggleBar(
              label: 'suspension condition',
              partName: vehicleDetail.vehicle.suspensionRear,
            ),
            ToggleBar(
              label: 'battery condition',
              partName: vehicleDetail.vehicle.battery,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BikePart2()));
                  },
                  label: Text('Next', style: TextStyle(color: Colors.black)),
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
            ),
          ],
        ));
  }
}
