import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
