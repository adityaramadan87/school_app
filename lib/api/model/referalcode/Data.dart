class Data {
  int id;
  String referalCode;
  int muridId;
  bool used;

  Data({this.id, this.referalCode, this.muridId, this.used});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referalCode = json['referal_code'];
    muridId = json['murid_id'];
    used = json['used'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referal_code'] = this.referalCode;
    data['murid_id'] = this.muridId;
    data['used'] = this.used;
    return data;
  }
}