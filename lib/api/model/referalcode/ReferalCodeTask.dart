import 'package:school_app/api/base/ReturnedData.dart';
import 'package:school_app/api/service/RestService.dart';

class ReferalCodeTask {

  ReferalCodeTask(this.returnedData);
  ReturnedData returnedData;

  RestService restService = new RestService();

  fetch(String refCode) async {
    returnedData.loading = true;

    restService.getReferalCode(refCode).then((response) {
      if (response != null){
        returnedData.loading = false;
        returnedData.onSuccess(response);
      }else {
        returnedData.loading = false;
        returnedData.onError("Null Data");
      }
    }).catchError((error) {
      returnedData.loading = false;
      returnedData.onError(error.toString());
    }).timeout(Duration(seconds: 15), onTimeout: () {
      returnedData.loading = false;
      returnedData.onError("Connection Timeout");
    });
  }

}