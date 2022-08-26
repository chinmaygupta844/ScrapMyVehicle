import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class DisplayBill extends StatefulWidget {
  @override
  _DisplayBillState createState() => _DisplayBillState();
}

class _DisplayBillState extends State<DisplayBill> {
  final givenPrice = TextEditingController();

  int scrapPrice;
  int towCost;
  int otherCharges;
  int estimatedPrice;
  void finalPrice() {
    final vehicleDetail =
        Provider.of<VehicleDetailProvider>(context, listen: false);
    double scrapValue = 15 * vehicleDetail.kerbWeight;
    scrapPrice = vehicleDetail.price;

    if (vehicleDetail.fireDamage == 2) {
      if (scrapPrice < scrapValue) {
        scrapPrice = 0;
      } else
        scrapPrice = scrapValue.toInt();
    }
    if (vehicleDetail.towingradio == 3) {
      towCost = 1000;
    } else
      towCost = 0;
    if (vehicleDetail.vehicleType == 'CAR') {
      otherCharges = 4000;
    } else {
      otherCharges = 500;
    }
    estimatedPrice = scrapPrice - towCost - otherCharges;
    if (estimatedPrice <= 0) {
      estimatedPrice = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    finalPrice();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrap my vehicle'),
      ),
      drawer: Mydrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                'We Pick up and pay',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      ' Rs $estimatedPrice  Estimated',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var my = Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            child: Container(
                              height: 300,
                              width: 400,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      child: Text(
                                        'price detail breakup',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Scrap value of your vehicle',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rs $scrapPrice',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Tow Cost',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rs $towCost',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Other charges',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rs $otherCharges',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'total',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rs $estimatedPrice',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('close')),
                                  )
                                ],
                              ),
                            ));

                        showDialog(
                            context: context,
                            builder: (gf) {
                              return my;
                            });
                      },
                      child: Text('view breakdown'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 20),
              child: Text(
                'After you accept this offer, we will contact you to arrange a time to pick up your car at time of pickup, we will inspect your cars condition and documentation they pay you on spot according to your condition and tow it away ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/requirements');
                },
                child: Text('Sell Instantly')),
            Text(
              'OR',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              width: 150,
              child: TextField(
                controller: givenPrice,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name your price',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
