import 'package:flutter/material.dart';

class DataModel {
  String maker;
  String model;
  String varient;
  String fuelType;
  int year;
  String vehicleType;
  String classType;
  double kerbWeight;
  String vehicleImage;
  int row;
  Icon icon;
  DataModel(
      {this.classType,
      this.fuelType,
      this.kerbWeight,
      this.maker,
      this.model,
      this.varient,
      this.vehicleType,
      this.year,
      this.vehicleImage,
      this.row
      ,this.icon});
}
