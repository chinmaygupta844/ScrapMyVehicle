import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/model/ui/ToggleBar.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class BikePart2 extends StatefulWidget {
  @override
  _BikePart2State createState() => _BikePart2State();
}

class _BikePart2State extends State<BikePart2> {
  @override
  Widget build(BuildContext context) {
    final VehicleDetailProvider vehicleDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    vehicleDetail.vehicle.headLight.condition = null;
    vehicleDetail.vehicle.tailLight.condition = null;
    vehicleDetail.vehicle.wheelFront.condition = null;
    vehicleDetail.vehicle.wheelRear.condition = null;
    vehicleDetail.vehicle.tyreFront.condition = null;
    vehicleDetail.vehicle.tyreRear.condition = null;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Scrap my vehicle'),
        ),
        drawer: Mydrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                'Select parts Condition',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            ToggleBar(
              label: 'light condition',
              partName: vehicleDetail.vehicle.headLight,
            ),
            ToggleBar(
              label: 'light condition',
              partName: vehicleDetail.vehicle.tailLight,
            ),
            ToggleBar(
              label: 'wheels condition',
              partName: vehicleDetail.vehicle.wheelFront,
            ),
            ToggleBar(
              label: 'wheels condition',
              partName: vehicleDetail.vehicle.wheelRear,
            ),
            ToggleBar(
              label: 'tyre condition',
              partName: vehicleDetail.vehicle.tyreFront,
            ),
            ToggleBar(
              label: 'tyre condition',
              partName: vehicleDetail.vehicle.tyreRear,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    calculateBikePrice();
                    Navigator.pushNamed(context, '/generatebill');
                  },
                  label: Text('Next', style: TextStyle(color: Colors.black)),
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),
            ),
          ],
        ));
  }

  void calculateBikePrice() {
    final vehicleDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    int totalPrice = vehicleDetail.vehicle.engine.calculatePrice() +
        vehicleDetail.vehicle.suspensionFront.calculatePrice() +
        vehicleDetail.vehicle.suspensionRear.calculatePrice() +
        vehicleDetail.vehicle.battery.calculatePrice() +
        vehicleDetail.vehicle.headLight.calculatePrice() +
        vehicleDetail.vehicle.tailLight.calculatePrice() +
        vehicleDetail.vehicle.wheelFront.calculatePrice() +
        vehicleDetail.vehicle.wheelRear.calculatePrice() +
        vehicleDetail.vehicle.tyreFront.calculatePrice() +
        vehicleDetail.vehicle.tyreRear.calculatePrice();
    vehicleDetail.setVehiclePrice(totalPrice);
    print('Vehicle price : $totalPrice');
  }
}
