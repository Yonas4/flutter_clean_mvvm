import 'package:json_annotation/json_annotation.dart';

part 'repositories.g.dart';

@JsonSerializable()
class BaseRespons {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomerRespons {
  CustomerRespons(this.id, this.name, this.nunOFNotiFicattons);

  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'nunOFNotiFicattons')
  String? nunOFNotiFicattons;

  // from json
  factory CustomerRespons.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponsFromJson(json);

// tojson
  Map<String, dynamic> toJson() => _$CustomerResponsToJson(this);
}

@JsonSerializable()
class ContactRespons {
  ContactRespons(this.phone, this.email, this.link);

  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'link')
  String? link;

  // from json
  factory ContactRespons.fromJson(Map<String, dynamic> json) =>
      _$ContactResponsFromJson(json);

// tojson
  Map<String, dynamic> toJson() => _$ContactResponsToJson(this);
}

@JsonSerializable()
class AuthRespons extends BaseRespons {
  AuthRespons(this.customerRespons, this.contactRespons);

  @JsonKey(name: 'customer ')
  CustomerRespons? customerRespons;
  @JsonKey(name: 'contact')
  ContactRespons? contactRespons;

  // from json
  factory AuthRespons.fromJson(Map<String, dynamic> json) =>
      _$AuthResponsFromJson(json);

// tojson
  Map<String, dynamic> toJson() => _$AuthResponsToJson(this);
}
