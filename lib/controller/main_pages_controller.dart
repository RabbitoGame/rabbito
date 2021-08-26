import 'package:get/get.dart';
import 'package:meta/meta.dart';

class MainPagesController extends GetxController {
  Rx<int> _selectedIndex = 0.obs;


  Rx<int> get selectedIndex => _selectedIndex;

  set selectedIndex(Rx<int> value) {
    _selectedIndex = value;
  }

  void onTap(int index){
    _selectedIndex.value = index;
  }
}