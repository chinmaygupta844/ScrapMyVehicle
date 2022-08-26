import 'package:flutter/material.dart';
import 'package:smv/model/VehicleModel/ComponentModel.dart';
import 'package:smv/model/conditionModel.dart';

class ToggleBar extends StatefulWidget {
  final String label;
  final ComponentModel partName;

  ToggleBar({
    @required this.label,
    @required this.partName,
  });
  @override
  _ToggleBarState createState() => _ToggleBarState();
}

class _ToggleBarState extends State<ToggleBar> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.partName.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Missing',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Damaged',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Good',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
              
              selectedBorderColor: Colors.lightGreen,
              borderWidth: 2,
              isSelected: isSelected,
              borderColor: Colors.lightGreen,
              borderRadius: BorderRadius.circular(5),
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
                switch (index) {
                  case 0:
                    widget.partName.updateCondition(ComponentCondition.missing);

                    break;
                  case 1:
                    widget.partName.updateCondition(ComponentCondition.damaged);
                    break;
                  case 2:
                    widget.partName.updateCondition(ComponentCondition.good);
                    break;
                  default:
                    widget.partName.updateCondition(ComponentCondition.missing);
                }
                print(widget.partName.condition);
              },
            ),
          ),
        ],
      ),
    );
  }
}
