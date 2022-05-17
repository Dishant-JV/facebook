import 'package:json_annotation/json_annotation.dart';

part 'api_model.g.dart';

@JsonSerializable()
class ApiModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ApiModel({this.userId, this.id, this.title, this.body});

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);

  // userId = json['userId'];
  // id = json['id'];
  // title = json['title'];
  // body = json['body'];

  Map<String, dynamic> toJson() => _$ApiModelToJson(this);
// {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['userId'] = this.userId;
//   data['id'] = this.id;
//   data['title'] = this.title;
//   data['body'] = this.body;
//   return data;
// }
}
