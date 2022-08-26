import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:smv/model/ui/appDrawer.dart';


class Myhomepage extends StatefulWidget {
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  List<String> photos = [
    'assets/vehicleImage/1.jpg',
    'assets/vehicleImage/2.jpg',
    'assets/vehicleImage/3.jpg',
    'assets/vehicleImage/4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 30),
            child: Container(
                height: 200,
                width: 300,
                child: CarouselSlider(
                    items: photos
                        .map((item) => Container(
                              child: Center(
                                  child: Image.asset(item,
                                      fit: BoxFit.cover, width: 1000)),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3)))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              child: ElevatedButton.icon(
                label: Text(
                  'Two Wheeler',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.directions_bike),
                onPressed: () {
                  
                  Navigator.pushNamed(context, '/selectVehicle');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: ElevatedButton.icon(
                label: Text(
                  'Three Wheeler',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.bike_scooter_sharp),
                onPressed: () {
                 
                  Navigator.pushNamed(context, '/selectVehicle');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: ElevatedButton.icon(
                label: Text(
                  'Four Wheeler',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.car_repair),
                onPressed: () {
                 

                  Navigator.pushNamed(context, '/selectVehicle');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: ElevatedButton.icon(
                label: Text(
                  'buses & heavy vehicles',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.bus_alert),
                onPressed: () {
                  Navigator.pushNamed(context, '/selectVehicle');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
