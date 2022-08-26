import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/BikeBody/bikePart1.dart';
import 'package:smv/model/carBody/Door.dart';
import 'package:smv/model/dataModel.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class CompanyModel {
  int id;
  String name;
  String logo;

  CompanyModel({this.id, this.name, this.logo});
}


List<String> year = List.generate(50, (index) => "${2021 - index}");

class VehicleStatus extends StatefulWidget {
  @override
  _VehicleStatusState createState() => _VehicleStatusState();
}

class _VehicleStatusState extends State<VehicleStatus> {
  List<CompanyModel> vehicleType = [
    CompanyModel(id: 1, name: 'CAR', logo: 'M'),
    CompanyModel(id: 2, name: 'BIKE', logo: 'H'),
    CompanyModel(id: 3, name: 'SCOOTER', logo: 'TT'),
  ];

  List<DataModel> vehicleData = [
    DataModel(classType: 'HATCHBACK'),
    DataModel(classType: 'SEDAN'),
    DataModel(classType: 'SUV'),
    DataModel(classType: 'CRUSIER'),
    DataModel(classType: 'MOPED'),
    DataModel(classType: 'STREET BIKE'),
  ];
  TextEditingController vehicleYear;
  TextEditingController kerbWeight;
  @override
  void initState() {
    super.initState();
    vehicleYear = TextEditingController();
    kerbWeight = TextEditingController();
  }

  @override
  void dispose() {
    vehicleYear.dispose();
    kerbWeight.dispose();
    super.dispose();
  }

  String selectedVehicle;
  String selectedClass;
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
            Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Year',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: vehicleYear,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Find a year',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    )),
                onTap: () {
                  showSearch(
                      context: context, delegate: Search(year, vehicleYear));
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  hint: Text('Vehicle type'),
                  value: selectedVehicle,
                  onChanged: (newValue) {
                    setState(() {
                      selectedVehicle = newValue;
                    });
                    vehicleDetail.setVehicleType(selectedVehicle);
                  },
                  items: vehicleType.map((e) {
                    return DropdownMenuItem(
                      child: new Text(e.name),
                      value: e.name,
                    );
                  }).toList(),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  hint: Text('Class Type'),
                  value: selectedClass,
                  onChanged: (newValue) {
                    setState(() {
                      selectedClass = newValue;
                    });
                    vehicleDetail.setClassType(selectedClass);
                  },
                  items: vehicleData.map((e) {
                    return DropdownMenuItem(
                      child: new Text(e.classType),
                      value: e.classType
                    );
                  }).toList(),
                )),
            Container(
              height: 50,
              width: 150,
              child: TextField(
                controller: kerbWeight,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter KerbWeight',
                ),
                onChanged: (value) {
                  vehicleDetail.setKerbWeight(double.parse(value));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                child: Text(
                  'submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: selectedClass != null &&
                        selectedVehicle != null &&
                        vehicleYear != null &&
                        kerbWeight != null
                    ? () {
                        if (vehicleDetail.vehicleType == 'CAR') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Door()));
                        }
                        if (vehicleDetail.vehicleType == 'BIKE' ||
                            vehicleDetail.vehicleType == 'SCOOTER') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BikePart1()));
                        }
                      }
                    : null,
              ),
            )
          ],
        ));
  }
}

class Search extends SearchDelegate {
  final List<String> selectYear;
  TextEditingController controller;
  Search(this.selectYear, this.controller);
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  String selectedText;
  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = year
        : suggestionList
            .addAll(selectYear.where((element) => element.contains(query)));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            final vehicleDetail =
                Provider.of<VehicleDetailProvider>(context, listen: false);

            selectedText = suggestionList[index];
            showResults(context);
            controller.text = selectedText;
            vehicleDetail.setyear(int.parse(selectedText));
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
