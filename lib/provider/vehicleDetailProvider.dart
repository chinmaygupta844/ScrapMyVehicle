
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:smv/model/VehicleModel/TwoWheeler/Cruiser.dart';
import 'package:smv/model/VehicleModel/TwoWheeler/Moped.dart';
import 'package:smv/model/VehicleModel/TwoWheeler/StreetBike.dart';
import 'package:smv/model/VehicleModel/Vehicle.dart';
import 'package:smv/model/VehicleModel/fourWheeler/Hatchback.dart';
import 'package:smv/model/VehicleModel/fourWheeler/SUV.dart';
import 'package:smv/model/VehicleModel/fourWheeler/sedan.dart';
import 'package:smv/model/dataModel.dart';
import 'package:smv/services/ExcelService.dart';


class VehicleDetailProvider extends ChangeNotifier {
  int _year;
  double _kerbWeight;
  int _vehiclePrice;
  String _vehicleNo;
  int _fireDamagecondition;
  int _towing;
  int _row;
  String _vehicleType;

  ExcelService _excelService;

  VehicleDetailProvider() {
    _excelService = GetIt.I<ExcelService>();
  }
  List<DataModel> _vehicleData = [];
  List<DataModel> get vehicledata => _vehicleData;

  Future<List<DataModel>> myData() async {
    var result = await _excelService.myData(_row);

    _vehicleData = result;
    return result;
  }

  String get vehicleType => _vehicleType;
  void setVehicleType(String type) {
    _vehicleType = type;
  }

  void setyear(int year) {
    _year = year;
    print(_year);
  }

  double get kerbWeight => _kerbWeight;
  void setKerbWeight(double weight) {
    _kerbWeight = weight;
    print(weight);
  }

  int get price => _vehiclePrice;
  void setVehiclePrice(int i) {
    _vehiclePrice = i;
    notifyListeners();
  }

  String get vehicleNumber => _vehicleNo;
  void setNumber(String number) {
    _vehicleNo = number;
    notifyListeners();
  }

  int get fireDamage => _fireDamagecondition;
  void setFireDamage(int i) {
    _fireDamagecondition = i;
    notifyListeners();
  }

  int get towingradio => _towing;
  void setTowing(int i) {
    _towing = i;
    notifyListeners();
  }

  int get rownum => _row;
  void setRow(int i) {
    _row = i;
    print(_row);

    notifyListeners();
  }

  Vehicle _vehicle;
  get vehicle => _vehicle;
  void setClassType(String type) {
    if (type == 'HATCHBACK') {
      _vehicle = HatchBack(year: _year, kerbWeight: _kerbWeight);
    }
    if (type == 'SEDAN') {
      _vehicle = Sedan(year: _year, kerbWeight: _kerbWeight);
    }
    if (type == 'SUV') {
      _vehicle = SUV(year: _year, kerbWeight: _kerbWeight);
    }
    if (type == 'STREET BIKE') {
      _vehicle = StreetBike(year: _year, kerbWeight: _kerbWeight);
    }
    if (type == 'CRUSIER') {
      _vehicle = Cruiser(year: _year, kerbWeight: _kerbWeight);
    }
    if (type == 'MOPED') {
      _vehicle = Moped(year: _year, kerbWeight: _kerbWeight);
    }

    print(type);
  }

  

}
