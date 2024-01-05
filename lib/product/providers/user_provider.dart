import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';

abstract class IUserProvider implements ValueListenable<UserModel?> {
  set value(UserModel? newValue);
  set email(String email);
  set phone(String phone);
}

@Singleton(as: IUserProvider)
class UserProvider implements IUserProvider {
  UserProvider() : _stateDataNotifier = ValueNotifier(null);

  final ValueNotifier<UserModel?> _stateDataNotifier;

  @override
  UserModel? get value => _stateDataNotifier.value;

  @override
  set value(UserModel? newValue) => _stateDataNotifier.value = newValue;

  @override
  void addListener(VoidCallback listener) {
    _stateDataNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateDataNotifier.removeListener(listener);
  }

  @mustCallSuper
  void dispose() {
    _stateDataNotifier.dispose();
  }

  @override
  set email(String email) => updateState(email: email);

  @override
  set phone(String phone) => updateState(phone: phone);

  void updateState({
    String? email,
    String? phone,
  }) {
    value = UserModel(
      identityNumber: value?.identityNumber,
      name: value?.name,
      surname: value?.surname,
      email: email ?? value?.email,
      phoneNumber: phone ?? value?.phoneNumber,
    );
  }
}
