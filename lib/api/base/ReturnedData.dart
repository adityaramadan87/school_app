class ReturnedData {

  void onSuccess(Object data,{String flag}){}

//  void onProgress(){}

  void onError(String message){}

  bool onLoading(bool isLoading){
    return isLoading;
  }
}
