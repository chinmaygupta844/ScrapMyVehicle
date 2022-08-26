
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smv/model/ui/appDrawer.dart';
import 'package:smv/provider/vehicleDetailProvider.dart';

class Registrationdetail extends StatefulWidget {
  @override
  _RegistrationdetailState createState() => _RegistrationdetailState();
}

class _RegistrationdetailState extends State<Registrationdetail> {
  TextEditingController vehicleNumberController = TextEditingController();
  bool submit = false;
  int row;
  // void myData() {
  //   final vehicleDetail =
  //       Provider.of<VehicleDetailProvider>(context, listen: false);
  //  // Sheet sheet = vehicleDetail.sheet;
  //   for (int i = 2; i < sheet.maxRows; i++) {
  //     String vc = sheet.cell(CellIndex.indexByString('A$i')).value;
  //     // String car = sheet.cell(CellIndex.indexByString('D$i')).value;
  //     if (vehicleDetail.vehicleNumber == vc) {
  //       row = i;
  //       break;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final myProvider =
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
              padding: const EdgeInsets.only(top: 30, left: 50),
              child: SizedBox(
                  child: Text(
                'Enter Your vehicle registration No.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ))),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 12,
                controller: vehicleNumberController,
                decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                    hintText: 'Eg. MP04 CT 2839'),
                onChanged: (as) {
                  if (as.length == 12) {
                    myProvider.setNumber(as);
                    setState(() {
                      submit = true;
                    });
                  }
                },
                onSubmitted: (value) => setState(() {
                  submit = true;
                }),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: ElevatedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: submit
                    ? () {
                      //  myData();
                        myProvider.setRow(row);
                        if (myProvider.rownum != null)
                          Navigator.pushNamed(context, '/vehicledetail');
                        else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text('ERROR'),
                                    content:
                                        Text('registration number is invalid'),
                                  ));
                        }
                      }
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
