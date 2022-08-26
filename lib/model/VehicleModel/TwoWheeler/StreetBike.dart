import 'package:smv/model/VehicleModel/ComponentModel.dart';
import 'package:smv/model/VehicleModel/Vehicle.dart';

class StreetBike extends Vehicle {
  ComponentModel engine;
  ComponentModel suspensionFront;
  ComponentModel suspensionRear;
  ComponentModel battery;
  ComponentModel headLight;
  ComponentModel tailLight;
  ComponentModel wheelFront;
  ComponentModel wheelRear;
  ComponentModel tyreFront;
  ComponentModel tyreRear;

  int year;
  double kerbWeight;

  StreetBike({
    this.year,
    this.kerbWeight,
  }) {
    engine = ComponentModel(
        name: 'Engine',
        componentPercent: 21.80,
        kerbWeight: kerbWeight,
        rate: 17,
        lifespan: 10,
        makeYear: year);

    suspensionFront = ComponentModel(
        name: 'Suspension Front',
        componentPercent: 10.21,
        kerbWeight: kerbWeight,
        rate: 48,
        lifespan: 10,
        makeYear: year);

    suspensionRear = ComponentModel(
        name: 'Suspension Rear',
        componentPercent: 4.79,
        kerbWeight: kerbWeight,
        rate: 48,
        lifespan: 10,
        makeYear: year);

    battery = ComponentModel(
        name: 'Battery',
        componentPercent: 1.75,
        kerbWeight: kerbWeight,
        rate: 22,
        lifespan: 0,
        makeYear: year);

    headLight = ComponentModel(
        name: 'HeadLight',
        componentPercent: 1.43,
        kerbWeight: kerbWeight,
        rate: 22,
        lifespan: 0,
        makeYear: year);

    tailLight = ComponentModel(
        name: 'TailLight',
        componentPercent: 0.75,
        kerbWeight: kerbWeight,
        rate: 22,
        lifespan: 0,
        makeYear: year);

    wheelFront = ComponentModel(
        name: 'Wheel Front',
        componentPercent: 7.83,
        kerbWeight: kerbWeight,
        rate: 102,
        lifespan: 10,
        makeYear: year);

    wheelRear = ComponentModel(
        name: 'Wheel Rear',
        componentPercent: 7.83,
        kerbWeight: kerbWeight,
        rate: 102,
        lifespan: 10,
        makeYear: year);

    tyreFront = ComponentModel(
        name: 'Tyre Front',
        componentPercent: 3.2,
        kerbWeight: kerbWeight,
        rate: 12,
        lifespan: 10,
        makeYear: year);

    tyreRear = ComponentModel(
        name: 'Tyre Rear',
        componentPercent: 3.6,
        kerbWeight: kerbWeight,
        rate: 12,
        lifespan: 10,
        makeYear: year);
  }
}
