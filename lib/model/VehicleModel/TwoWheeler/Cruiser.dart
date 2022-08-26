import 'package:smv/model/VehicleModel/ComponentModel.dart';
import 'package:smv/model/VehicleModel/Vehicle.dart';

class Cruiser extends Vehicle {
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

  Cruiser({
    this.year,
    this.kerbWeight,
  }) {
    engine = ComponentModel(
        name: 'Engine',
        componentPercent: 19.6,
        kerbWeight: kerbWeight,
        rate: 17,
        lifespan: 10,
        makeYear: year);

    suspensionFront = ComponentModel(
        name: 'Suspension Front',
        componentPercent: 10,
        kerbWeight: kerbWeight,
        rate: 48,
        lifespan: 10,
        makeYear: year);

    suspensionRear = ComponentModel(
        name: 'Suspension Rear',
        componentPercent: 9,
        kerbWeight: kerbWeight,
        rate: 48,
        lifespan: 10,
        makeYear: year);

    battery = ComponentModel(
        name: 'Battery',
        componentPercent: 3,
        kerbWeight: kerbWeight,
        rate: 22,
        lifespan: 0,
        makeYear: year);

    headLight = ComponentModel(
        name: 'HeadLight',
        componentPercent: 1.49,
        kerbWeight: kerbWeight,
        rate: 22,
        lifespan: 0,
        makeYear: year);

    tailLight = ComponentModel(
        name: 'TailLight',
        componentPercent: 1,
        kerbWeight: kerbWeight,
        rate: 22,
        lifespan: 0,
        makeYear: year);

    wheelFront = ComponentModel(
        name: 'Wheel Front',
        componentPercent: 8.41,
        kerbWeight: kerbWeight,
        rate: 102,
        lifespan: 10,
        makeYear: year);

    wheelRear = ComponentModel(
        name: 'Wheel Rear',
        componentPercent: 8.41,
        kerbWeight: kerbWeight,
        rate: 102,
        lifespan: 10,
        makeYear: year);

    tyreFront = ComponentModel(
        name: 'Tyre Front',
        componentPercent: 3.5,
        kerbWeight: kerbWeight,
        rate: 12,
        lifespan: 10,
        makeYear: year);

    tyreRear = ComponentModel(
        name: 'Tyre Rear',
        componentPercent: 3.36,
        kerbWeight: kerbWeight,
        rate: 12,
        lifespan: 10,
        makeYear: year);
  }
}
