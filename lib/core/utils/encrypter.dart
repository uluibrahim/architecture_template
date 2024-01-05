import 'package:encrypt/encrypt.dart';

import '../../product/constants/service_constants.dart';

class CustomEncrypter {
  static final Key _key = Key.fromUtf8(ServiceConstants.aesKey);
  static final IV _iv = IV.fromLength(16);
  static final Encrypter _encrypter =
      Encrypter(AES(CustomEncrypter._key, mode: AESMode.cbc));

  static String encrypt(String data) =>
      _encrypter.encrypt(data, iv: CustomEncrypter._iv).base64;

  static String decrypt(String data) =>
      _encrypter.decrypt(Encrypted.fromBase64(data), iv: CustomEncrypter._iv);
}
