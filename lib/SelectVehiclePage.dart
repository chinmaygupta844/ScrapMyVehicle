import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smv/model/dataModel.dart';
import 'package:smv/model/ui/appDrawer.dart';

import 'provider/vehicleDetailProvider.dart';

class SelectVehiclePage extends StatefulWidget {
  @override
  _SelectVehiclePageState createState() => _SelectVehiclePageState();
}

class _SelectVehiclePageState extends State<SelectVehiclePage> {
  List<DataModel> selectVehicle = [
    DataModel(
        maker: 'Tata',
        model: 'Nano',
        year: 2014,
        icon: Icon(Icons.directions_car_outlined),
        classType: 'Hatchback',
        row: 2),
    DataModel(
        maker: 'Fiat',
        model: 'Punto',
        year: 2018,
        icon: Icon(Icons.directions_car_outlined),
        classType: 'Hatchback',
        row: 3),
    DataModel(
        maker: 'Toyota',
        model: 'Liva',
        year: 2016,
        icon: Icon(Icons.directions_car_outlined),
        classType: 'Hatchback',
        row: 4),
    DataModel(
        maker: 'Maruti Suzui',
        model: 'Ciaz',
        year: 2017,
        icon: Icon(Icons.directions_car_outlined),
        classType: 'Sedan',
        row: 6),
    DataModel(
        maker: 'Volkswagon',
        model: 'Vento',
        year: 2011,
        icon: Icon(Icons.directions_car_outlined),
        classType: 'Sedan',
        row: 7),
    DataModel(
        maker: 'Tata',
        model: 'Nexon',
        year: 2005,
        icon: Icon(Icons.directions_car_outlined),
        classType: 'SUV',
        row: 8),
    DataModel(
        maker: 'Toyota',
        model: 'Fortuner',
        year: 2012,
        icon: Icon(Icons.directions_car_outlined),
        classType: 'SUV',
        row: 9),
    DataModel(
        maker: 'Yamaha',
        model: 'FZ',
        year: 2019,
        icon: Icon(Icons.two_wheeler_outlined),
        classType: 'STREET BIKE',
        row: 10),
    DataModel(
        maker: 'Hero',
        model: 'Extreme',
        year: 2018,
        icon: Icon(Icons.two_wheeler_outlined),
        classType: 'STREET BIKE',
        row: 11),
    DataModel(
        maker: 'Bajaj',
        model: 'Avenger',
        year: 2020,
        icon: Icon(Icons.two_wheeler_outlined),
        classType: 'CRUSIER',
        row: 13),
    DataModel(
        maker: 'Royal',
        model: 'Enfield',
        year: 2020,
        icon: Icon(Icons.two_wheeler_outlined),
        classType: 'CRUSIER',
        row: 14),
    DataModel(
        maker: 'Tvs',
        model: 'Jupiter',
        year: 2016,
        icon: Icon(Icons.directions_bike_outlined),
        classType: 'SCOOTER',
        row: 15),
    DataModel(
        maker: 'Honda',
        model: 'Activa',
        year: 2018,
        icon: Icon(Icons.directions_bike_outlined),
        classType: 'SCOOTER',
        row: 16),
  ];
  @override
  Widget build(BuildContext context) {
    final vehicleDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Select vehicle',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 500,
              child: ListView.builder(
                itemCount: selectVehicle.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          vehicleDetail.setRow(selectVehicle[index].row);
                          Navigator.pushNamed(context, '/vehicledetail');
                        },
                        leading: Icon(Icons.directions_car_outlined),
                        trailing: Text('${selectVehicle[index].classType}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        title: Center(
                          child: Text(
                              '${selectVehicle[index].maker} ${selectVehicle[index].model}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        subtitle: Center(
                          child: Text('Year - ${selectVehicle[index].year}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
