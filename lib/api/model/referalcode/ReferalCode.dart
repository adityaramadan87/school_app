import 'package:school_app/api/base/BaseModel.dart';
import 'package:school_app/api/model/referalcode/Data.dart';

class ReferalCode extends BaseModel{
  Data data;

  ReferalCode({status, message, this.data});

  ReferalCode.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}