import 'package:smv/model/VehicleModel/ComponentModel.dart';
import 'package:smv/model/VehicleModel/Vehicle.dart';

import '../../conditionModel.dart';

class HatchBack extends Vehicle {
  // underhood part
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

  HatchBack({
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
        componentPercent: 18,
        kerbWeight: kerbWeight,
        rate: 17,
        lifespan: 13,
        makeYear: year);

    alternator = ComponentModel(
        name: 'Alternator',
        componentPercent: 0.8,
        kerbWeight: kerbWeight,
        rate: 143,
        lifespan: 13,
        makeYear: year);
    compressor = ComponentModel(
        name: 'Compressor',
        componentPercent: 0.78,
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
        componentPercent: 1.15,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'Passenger Side Front',
        makeYear: year,
        componentPercent: 1.15,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'Driver Side Rear',
        makeYear: year,
        componentPercent: 1.25,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'Passenger Side Rear',
        makeYear: year,
        componentPercent: 1.25,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    doors.add(ComponentModel(
        name: 'Hatchback',
        makeYear: year,
        componentPercent: 1.2,
        kerbWeight: kerbWeight,
        lifespan: 15,
        rate: 48));
    // int doorsPrice = 0;
    // for (int i = 0; i < doors.length; i++) {
    //   doorsPrice += doors[i].calculatePrice();
    // }
    wheels.add(ComponentModel(
        name: 'Driver Front Wheels',
        makeYear: year,
        componentPercent: 1,
        kerbWeight: kerbWeight,
        lifespan: 12,
        rate: 102));
    wheels.add(ComponentModel(
        name: 'Passenger Front Wheels',
        makeYear: year,
        componentPercent: 1,
        kerbWeight: kerbWeight,
        lifespan: 12,
        rate: 102));
    wheels.add(ComponentModel(
        name: 'Driver Rear Wheels',
        makeYear: year,
        componentPercent: 1,
        kerbWeight: kerbWeight,
        lifespan: 12,
        rate: 102));
    wheels.add(ComponentModel(
        name: 'Passenger Rear Wheels',
        makeYear: year,
        componentPercent: 1,
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

    // //calculating total price
    // int underHoodPrice = engine.calculatePrice() +
    //     alternator.calculatePrice() +
    //     compressor.calculatePrice() +
    //     radiator.calculatePrice() +
    //     battery.calculatePrice();

    // int bodyPartPrice = doorsPrice +
    //     hood.calculatePrice() +
    //     bumpers[0].calculatePrice() +
    //     bumpers[1].calculatePrice();
    // // print(doorsPrice);
    // // print(hood.calculatePrice());
    // for (int i = 0; i < wheels.length; i++) {
    //   bodyPartPrice += wheels[i].calculatePrice() +
    //       tyres[i].calculatePrice() +
    //       lights[i].calculatePrice();
    // }
    // price = underHoodPrice + bodyPartPrice;
  }
}

void main(List<String> args) {
  HatchBack x = HatchBack(year: 2021, kerbWeight: 695);
  x.engine.updateCondition(ComponentCondition.good);

  int price = x.engine.calculatePrice();
  int price2 = x.engine.calculatePrice();

  print(' price1 :$price');
  print("price2 : $price2");
}
