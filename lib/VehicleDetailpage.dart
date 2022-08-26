import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smv/model/BikeBody/bikePart1.dart';
import 'package:smv/model/carBody/Door.dart';
import 'package:smv/model/dataModel.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class VehicleDetail extends StatefulWidget {
  @override
  _VehicleDetailState createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  List<DataModel> _vehicleData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final vehicleDetail =
          Provider.of<VehicleDetailProvider>(context, listen: false);
      var result = await vehicleDetail.myData();

      setState(() {
        _vehicleData = result;
        isLoading = false;
      });
      vehicleDetail.setClassType(_vehicleData[0].classType);
      vehicleDetail.setyear(_vehicleData[0].year);
      vehicleDetail.setKerbWeight(_vehicleData[0].kerbWeight);
      vehicleDetail.setVehicleType(_vehicleData[0].vehicleType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: SizedBox(
                        child: Text(
                      'Vehicle Details',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ))),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Container(
                    child: Text('Manufacturer : ${_vehicleData[0].maker} ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Container(
                    child: Text('Model : ${_vehicleData[0].model}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Container(
                    child: Text('Varient : ${_vehicleData[0].varient}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Container(
                    child: Text('Fuel Type : ${_vehicleData[0].fuelType}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Container(
                    child: Text('Registration Year : ${_vehicleData[0].year}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Container(
                    child: Text('Vehicle Type : ${_vehicleData[0].vehicleType}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Container(
                    child: Text('Class Type : ${_vehicleData[0].classType}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    height: 200,
                    width: 500,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(_vehicleData[0].vehicleImage),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 50),
                      child: Container(
                        child: ElevatedButton(
                          child: Text(
                            'Yes this is my vehicle',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_vehicleData[0].vehicleType == 'CAR') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Door()));
                              print('pressed');
                            }
                            if (_vehicleData[0].vehicleType == 'BIKE' ||
                                _vehicleData[0].vehicleType == 'SCOOTER') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BikePart1()));
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 50),
                      child: Container(
                        child: ElevatedButton(
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/vehiclestatus');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
