import 'package:smv/model/VehicleModel/ComponentModel.dart';
import 'package:smv/model/VehicleModel/Vehicle.dart';

class Sedan extends Vehicle {
  ComponentModel engine;
  ComponentModel alternator;
  ComponentModel compressor;
  ComponentModel radiator;
  ComponentModel battery;
  //bodypart
  ComponentModel hood;
  List<ComponentModel> doors;
  List<ComponentModel> wheels;
  List<ComponentModel> tyres;
  List<ComponentModel> bumpers;
  List<ComponentModel> lights;
  int year;
  double kerbWeight;
  int price = 0;

  Sedan({
    this.year,
    this.kerbWeight,
  }) {
    doors = [];
    wheels = [];
    tyres = [];
    bumpers = [];
    lights = [];
    //underhood parts
    engine = ComponentModel(
        name: 'Engine',
        componentPercent: 19.2,
        kerbWeight: kerbWeight,
        rate: 17,
        lifespan: 13,
        makeYear: year);
    price = engine.calculatePrice();

    alternator = ComponentModel(
        name: 'Alternator',
        componentPercent: 0.8,
        kerbWeight: kerbWeight,
        rate: 143,
        lifespan: 13,
        makeYear: year);
    compressor = ComponentModel(
        name: 'Compressor',
        componentPercent: 0.82,
        kerbWeight: kerbWeight,
        rate: 143,
        lifespan: 13,
        makeYear: year);

    radiator = ComponentModel(
        name: 'Radiator',
        componentPercent: 0.5,
        kerbWeight: kerbWeight,
        rate: 143,
        lifespan: 13,
        makeYear: year);
    battery = ComponentModel(
        name: 'Battery',
        componentPercent: 1.5,
        kerbWeight: kerbWeight,
        rate: 96,
        lifespan: 0,
        makeYear: year);

    // body parts
    hood = ComponentModel(
        name: 'Hood',
        componentPercent: 0.5,
        kerbWeight: kerbWeight,
        rate: 48,
        lifespan: 15,
        makeYear: year);

    doors.add(ComponentModel(
        name: 'Driver Side Front',
        makeYear: year,
        componentPercent: 1.2,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'Passenger Side Front',
        makeYear: year,
        componentPercent: 1.2,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'Driver Side Rear',
        makeYear: year,
        componentPercent: 1.3,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'Passenger Side Rear',
        makeYear: year,
        componentPercent: 1.3,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'dicky',
        makeYear: year,
        componentPercent: 1.4,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    for (int i = 0; i < doors.length; i++) {
    }
    wheels.add(ComponentModel(
        name: 'Driver Front Wheels',
        makeYear: year,
        componentPercent: 1.04,
        kerbWeight: kerbWeight,
        lifespan: 12,
        rate: 102));
    wheels.add(ComponentModel(
        name: 'Passenger Front Wheels',
        makeYear: year,
        componentPercent: 1.04,
        kerbWeight: kerbWeight,
        lifespan: 12,
        rate: 102));
    wheels.add(ComponentModel(
        name: 'Driver Rear Wheels',
        makeYear: year,
        componentPercent: 1.04,
        kerbWeight: kerbWeight,
        lifespan: 12,
        rate: 102));
    wheels.add(ComponentModel(
        name: 'Passenger Front Wheels',
        makeYear: year,
        componentPercent: 1.04,
        kerbWeight: kerbWeight,
        lifespan: 12,
        rate: 102));
    // for (int i = 0; i < wheels.length; i++) {
    //   price += wheels[i].calculatePrice();
    // }
    tyres.add(ComponentModel(
        name: 'Driver Front Tyre',
        makeYear: year,
        componentPercent: 0.75,
        kerbWeight: kerbWeight,
        lifespan: 6,
        rate: 12));
    tyres.add(ComponentModel(
        name: 'Passenger Front Tyre',
        makeYear: year,
        componentPercent: 0.75,
        kerbWeight: kerbWeight,
        lifespan: 6,
        rate: 12));
    tyres.add(ComponentModel(
        name: 'Driver Rear Tyre',
        makeYear: year,
        componentPercent: 0.75,
        kerbWeight: kerbWeight,
        lifespan: 6,
        rate: 12));
    tyres.add(ComponentModel(
        name: 'Passenger Rear Tyre',
        makeYear: year,
        componentPercent: 0.75,
        kerbWeight: kerbWeight,
        lifespan: 6,
        rate: 12));
    // for (int i = 0; i < tyres.length; i++) {
    //   price += tyres[i].calculatePrice();
    // }
    bumpers.add(ComponentModel(
        name: 'Bumper Front',
        makeYear: year,
        componentPercent: 0.47,
        kerbWeight: kerbWeight,
        lifespan: 8,
        rate: 120));

    bumpers.add(ComponentModel(
        name: 'Bumper Rear',
        makeYear: year,
        componentPercent: 0.44,
        kerbWeight: kerbWeight,
        lifespan: 8,
        rate: 22));
    lights.add(ComponentModel(
        name: 'Driver HeadLight',
        makeYear: year,
        componentPercent: 0.45,
        kerbWeight: kerbWeight,
        lifespan: 0,
        rate: 22));
    lights.add(ComponentModel(
        name: 'Passenger HeadLight',
        makeYear: year,
        componentPercent: 0.45,
        kerbWeight: kerbWeight,
        lifespan: 0,
        rate: 22));
    lights.add(ComponentModel(
        name: 'Driver TailLight',
        makeYear: year,
        componentPercent: 0.25,
        kerbWeight: kerbWeight,
        lifespan: 0,
        rate: 22));
    lights.add(ComponentModel(
        name: 'Passenger TailLight',
        makeYear: year,
        componentPercent: 0.25,
        kerbWeight: kerbWeight,
        lifespan: 0,
        rate: 22));
  }
}
