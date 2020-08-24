import 'package:school_app/api/base/ReturnedData.dart';
import 'package:school_app/api/service/RestService.dart';
import 'package:school_app/common/Constant.dart';

class ReferalCodeTask {

  ReferalCodeTask(this.returnedData);
  ReturnedData returnedData;

  RestService restService = new RestService();

  fetch(String refCode) async {
    returnedData.onLoading(true);

    restService.getReferalCode(refCode).then((response) {
      if (response != null){
        returnedData.onLoading(false);
        returnedData.onSuccess(response);
      }else {
        returnedData.onLoading(false);
        returnedData.onError("Null Data");
      }
    }).catchError((error) {
      returnedData.onLoading(false);
      returnedData.onError(error.toString());
    }).timeout(Duration(seconds: 15), onTimeout: () {
      returnedData.onLoading(false);
      returnedData.onError(Constant.CONNECTION_TIMEOUT);
    });

  }

}