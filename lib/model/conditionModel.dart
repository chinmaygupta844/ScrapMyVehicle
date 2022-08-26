class ItemCondition {
  String condition;
  int index;
  ItemCondition({this.condition, this.index});
}

List<ItemCondition> conditionList = [
  ItemCondition(
    index: 1,
    condition: "Good",
  ),
  ItemCondition(
    index: 2,
    condition: "Damaged",
  ),
  ItemCondition(
    index: 3,
    condition: "Missing",
  ),
];
List<ItemCondition> fireDamageList = [
  ItemCondition(
    index: 1,
    condition: "No flood or fire damage",
  ),
  ItemCondition(
    index: 2,
    condition: "Yes it has flood or fire damage",
  ),
];
List<ItemCondition> towCheckup = [
  ItemCondition(
    index: 3,
    condition: "Yes",
  ),
  ItemCondition(
    index: 4,
    condition: "No",
  ),
];
enum ComponentCondition { missing, damaged, good }
