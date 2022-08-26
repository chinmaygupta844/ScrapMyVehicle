import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:smv/model/dataModel.dart';


class ExcelService {
  
   
  Future<List<DataModel>> myData(int row) async {

    List<DataModel> _vehicleData = [];
    
    ByteData data = await rootBundle.load("assets/Registration Details.xlsx"); //accessing file in asset
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    Sheet sheet = excel['Sheet1'];
    double vyear = sheet.cell(CellIndex.indexByString('J$row')).value;
    String classType = sheet.cell(CellIndex.indexByString('H$row')).value;
    String vehicleImage;
    switch (classType) {
      case 'HATCHBACK':
        vehicleImage = 'assets/vehicleModelImage/hatchback.jpg';
        break;
      case 'SEDAN':
        vehicleImage = 'assets/vehicleModelImage/sedan.jpg';
        break;
      case 'SUV':
        vehicleImage = 'assets/vehicleModelImage/suv.jpg';
        break;
      case 'STREET BIKE':
        vehicleImage = 'assets/vehicleModelImage/bike.jpg';
        break;
      case 'CRUSIER':
        vehicleImage = 'assets/vehicleModelImage/bike.jpg';
        break;
      case 'MOPED':
        vehicleImage = 'assets/vehicleModelImage/scooter.jpg';
        break;
      default:
        vehicleImage = 'assets/vehicleModelImage/hatchback.jpg';
    }
    _vehicleData.add(DataModel(
        maker: sheet.cell(CellIndex.indexByString('C$row')).value,
        classType: classType,
        fuelType: sheet.cell(CellIndex.indexByString('G$row')).value,
        kerbWeight: sheet.cell(CellIndex.indexByString('K$row')).value,
        model: sheet.cell(CellIndex.indexByString('D$row')).value,
        varient: sheet.cell(CellIndex.indexByString('E$row')).value,
        vehicleType: sheet.cell(CellIndex.indexByString('B$row')).value,
        year: vyear.toInt(),
        vehicleImage: vehicleImage));

    return _vehicleData;
  }
}
