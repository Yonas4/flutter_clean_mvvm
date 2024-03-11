import 'package:flutter_clean_mvvm/App/constants.dart';
import 'package:flutter_clean_mvvm/App/extensions.dart';
import 'package:flutter_clean_mvvm/data/response/repositories.dart';

import 'package:flutter_clean_mvvm/domain/Models/models.dart';

///CustomerResponseMapper
extension CustomerResponseMapper on CustomerRespons? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.nunOFNotiFicattons.orEmpty() ?? Constants.empty,
    );
  }
}

///ContactResponseMapper
extension ContactResponseMapper on ContactRespons? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

///AuthResponseMapper
extension AuthResponseMapper on AuthRespons? {
  Auth toDomain() {
    return Auth(
      this?.customerRespons.toDomain(),
      this?.contactRespons.toDomain(),
    );
  }
}
