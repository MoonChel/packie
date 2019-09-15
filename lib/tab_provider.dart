import 'package:flutter/foundation.dart';

class TabProvider with ChangeNotifier {
  int _index = 0;

  get index {
    return _index;
  }

  set index(value) {
    _index = value;
    notifyListeners();
  }
}
