class AssetConstants {
  static const String _imagePath = 'assets/images/';
  static const String _iconPath = 'assets/icons/';
  static const String _gifPatg = 'assets/gif/';

  static String _toPng(String name, [String path = _imagePath]) =>
      '$path$name.png';
  static String _toSvg(String name, [String path = _imagePath]) =>
      '$path$name.svg';
  static String _toGif(String name, [String path = _gifPatg]) =>
      '$path$name.gif';

  // If you want to add a photo you can add it here.
  static String get example => _toPng('example');
  static String get exampleSvg => _toSvg('exampleSvg');
  static String get exampleGif => _toGif('exampleGif');
  static String get exampleIcon => _toPng('exampleIcon', _iconPath);
}
