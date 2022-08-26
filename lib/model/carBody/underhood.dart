import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class UnderHood1 extends StatefulWidget {
  @override
  _UnderHood1State createState() => _UnderHood1State();
}

class _UnderHood1State extends State<UnderHood1> {
  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider underhoodDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    underhoodDetail.vehicle.engine.condition = null;
    underhoodDetail.vehicle.alternator.condition = null;
    underhoodDetail.vehicle.compressor.condition = null;
    underhoodDetail.vehicle.radiator.condition = null;
    underhoodDetail.vehicle.battery.condition = null;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30, left: 20),
            child: Text(
              'Select underHood Condition',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ToggleBar(
            label: 'engine condition',
            partName: underhoodDetail.vehicle.engine,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'alternator condition',
                partName: underhoodDetail.vehicle.alternator),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'compressor condition',
                partName: underhoodDetail.vehicle.compressor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'radiator condition',
                partName: underhoodDetail.vehicle.radiator),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ToggleBar(
                label: 'battery condition',
                partName: underhoodDetail.vehicle.battery),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                   calculatePrice();
                  Navigator.pushNamed(context, '/generatebill');
                },
                label: Text('Next', style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void calculatePrice() {
    final vehicleDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    int totalPrice = 0;
    int underHoodPrice = vehicleDetail.vehicle.engine.calculatePrice() +
        vehicleDetail.vehicle.alternator.calculatePrice() +
        vehicleDetail.vehicle.compressor.calculatePrice() +
        vehicleDetail.vehicle.radiator.calculatePrice() +
        vehicleDetail.vehicle.battery.calculatePrice();

    int doorsPrice = 0;
    for (int i = 0; i < vehicleDetail.vehicle.doors.length; i++) {
      doorsPrice += vehicleDetail.vehicle.doors[i].calculatePrice();
    }

    int bodyPartPrice = doorsPrice +
        vehicleDetail.vehicle.hood.calculatePrice() +
        vehicleDetail.vehicle.bumpers[0].calculatePrice() +
        vehicleDetail.vehicle.bumpers[1].calculatePrice();

    for (int i = 0; i < vehicleDetail.vehicle.wheels.length; i++) {
      bodyPartPrice += vehicleDetail.vehicle.wheels[i].calculatePrice() +
          vehicleDetail.vehicle.tyres[i].calculatePrice() +
          vehicleDetail.vehicle.lights[i].calculatePrice();
    }
    totalPrice = underHoodPrice + bodyPartPrice;
    vehicleDetail.setVehiclePrice(totalPrice);
    print('Vehicle price : $totalPrice');
  }
  
}


void main(List<String> args) {

}