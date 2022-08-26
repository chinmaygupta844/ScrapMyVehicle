import 'package:get_it/get_it.dart';

import 'package:smv/services/ExcelService.dart';

final locator = GetIt.instance;
void setup() {
  locator.registerSingleton(ExcelService(),
      signalsReady: true);
  print("registered");
}
