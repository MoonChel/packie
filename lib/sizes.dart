// iphone xs max viewport
const sWidth = 414.0;
const sHeight = 896.0;

class Sizes {
  double widthCoe = 1;
  double heightCoe = 1;
  static final Sizes _singleton = Sizes._internal();

  factory Sizes() {
    return _singleton;
  }

  void setCoe(double width, height) {
    _singleton.widthCoe = width / sWidth;
    _singleton.heightCoe = height / sHeight;
  }

  double w(double value) {
    return _singleton.widthCoe * value;
  }

  double h(double value) {
    return _singleton.heightCoe * value;
  }

  Sizes._internal();
}
