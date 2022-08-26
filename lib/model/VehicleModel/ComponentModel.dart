import 'package:flutter/cupertino.dart';
import 'package:smv/model/conditionModel.dart';

class ComponentModel {
  String name;
  ComponentCondition condition;

  final double rate;
  final double componentPercent;
  final double kerbWeight;
  final int lifespan;
  final int makeYear;

  ComponentModel(
      {@required this.name,
      @required this.rate,
      @required this.kerbWeight,
      @required this.componentPercent,
      @required this.makeYear,
      @required this.lifespan});

  int calculatePrice() {
    final double  weight = (componentPercent * kerbWeight) / 100;
    final double scrapValue = weight * rate;
    final int i = lifespan ~/ 3;

    int age = DateTime.now().year - makeYear;

    if (i == 0 &&
        (condition == ComponentCondition.good ||
            condition == ComponentCondition.damaged)) {
      return scrapValue.toInt();
    }

    if (condition == ComponentCondition.good) {
      if (age >= 0 && age <= i) {
        return (scrapValue * 3).toInt();
      }

      if (age > i && age <= i * 2) {
        return (scrapValue * 2).toInt();
      }

      if (age > i * 2 && age < lifespan) {
        return (scrapValue * 1.5).toInt();
      }
      if (age >= lifespan) {
        return scrapValue.toInt();
      }
    }

    if (condition == ComponentCondition.damaged) {
      return scrapValue.toInt();
    }

    return 0;
  }

  void updateCondition(ComponentCondition partCondition) {
    condition = partCondition;
  }
}

void main(List<String> args) {
  ComponentModel battery = ComponentModel(
      name: 'Battery',
      componentPercent: 1.5,
      kerbWeight: 695,
      rate: 96,
      lifespan: 0,
      makeYear: 2021);
      final price = battery.calculatePrice();
  battery.updateCondition(ComponentCondition.damaged);
  
  final price2 = battery.calculatePrice();
  print('price1 :$price');
  print('price2 : $price2');
}
