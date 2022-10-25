import 'package:get/get.dart';

class HomeController extends GetxController {
  final radioIndex = Rxn<int>();
  final listTileIndex = 0.obs;
  void updateRadioSelection(int index) {
    radioIndex.value = index;
  }

  void updateListTileSelection(int index) {
    listTileIndex.value = index;
  }
}
