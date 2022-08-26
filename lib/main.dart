import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/RegistrationDetailpage.dart';
import 'package:smv/SelectVehiclePage.dart';
import 'package:smv/VehicleDetailpage.dart';
import 'package:smv/VehicleStatus.dart';
import 'package:smv/homepage.dart';
import 'package:smv/model/billingpages/billGenerationpage.dart';

import 'package:smv/model/billingpages/displayBillPage.dart';
import 'package:smv/model/billingpages/requirementsPage.dart';
import 'package:smv/model/ui/sellingCompletepage.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';
import 'package:smv/services/locator.dart';

import 'model/ui/customerinfopage.dart';
import 'model/ui/loginpage.dart';

void main() {
  // analytics = FirebaseAnalytics();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VehicleDetailProvider>(
      create: (context) => VehicleDetailProvider(),
      child: MaterialApp(
        title: 'scrap my vehicle',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Myhomepage(),
          '/Registrationdetail': (context) => Registrationdetail(),
          '/login': (context) => Userlogin(),
          '/vehicledetail': (context) => VehicleDetail(),
          '/vehiclestatus': (context) => VehicleStatus(),
          '/customerinfo': (context) => CustomerInfo(),
          '/generatebill': (context) => GenerateBill(),
          '/displaybill': (context) => DisplayBill(),
          '/requirements': (context) => Requirements(),
          '/sellingcomplete': (context) => SellingComplete(),
          '/selectVehicle': (context) => SelectVehiclePage(),
        },
      ),
    );
  }
}
