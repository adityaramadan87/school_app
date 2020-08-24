import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:school_app/api/base/ReturnedData.dart';
import 'package:school_app/api/model/referalcode/ReferalCode.dart';
import 'package:school_app/api/model/referalcode/ReferalCodeTask.dart';
import 'package:school_app/common/Constant.dart';
import 'package:school_app/common/SharedPrefencesKey.dart';
import 'package:school_app/component/BadRequestView.dart';
import 'package:school_app/component/ButtonPrimary.dart';
import 'package:school_app/component/InputFieldArea.dart';
import 'package:school_app/component/LoadingView.dart';
import 'package:school_app/component/TimeoutView.dart';
import 'package:school_app/helper/SharedPreferencesHelper.dart';
import 'package:school_app/helper/SizeHelper.dart';

class CheckReferalCodeScreen extends StatefulWidget {
  @override
  _CheckReferalCodeScreenState createState() => _CheckReferalCodeScreenState();
}

class _CheckReferalCodeScreenState extends State<CheckReferalCodeScreen> with ReturnedData {

  ReferalCodeTask referalCodeTask;

  TextEditingController referalController;
  bool sLoading;
  ProgressDialog pd;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() {
    this.referalCodeTask = new ReferalCodeTask(this);
    this.referalController = new TextEditingController();
    this.sLoading = false;
    this.pd = ProgressDialog(
        context ,
        type: ProgressDialogType.Normal,
        isDismissible: false,
        customBody: LoadingView()
    );
  }

  @override
  bool onLoading(bool isLoading) {
    // TODO: implement onLoading
    setState(() {
      this.sLoading = isLoading;

      if (isLoading){
        pd.show();
      }else{
        pd.hide();
      }
    });
  }

  @override
  void onSuccess(Object data, {String flag}) {
    setState(() {
      if (data is ReferalCode){
        ReferalCode referalCode = data;

        if (referalCode.status == Constant.BAD_REQUEST) {
          //show dialog dengan message dari referalCode.message
          showDialog(
            context: context,
            builder: (ctx) => BadRequestView(message: referalCode.message,)
          );
        }else {
          // Next kehalaman form register dan input
          // referalCode.data.referalCode dan referalCode.data.muridId ke SharedPreferences
          SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();
          preferencesHelper.put(SharedPreferencesKey.REFERAL_CODE, referalCode.data.referalCode);
          preferencesHelper.put(SharedPreferencesKey.MURID_ID, referalCode.data.muridId);

          Navigator.popAndPushNamed(context, Constant.REGISTER_SCREEN);

        }

      }
    });
  }

  @override
  void onError(String message) {
    if (message == Constant.CONNECTION_TIMEOUT){
      showDialog(
          context: context,
          builder: (BuildContext ctx) => TimeoutView()
      );
    }else {
      pd.hide();
      print(message);
    }
  }



  @override
  Widget build(BuildContext context) {
    SizeHelper().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                iconSize: 34,
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: SizeHelper.blockSizeVertical * 7,),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeHelper.blockSizeHorizontal * 5,
                                top: SizeHelper.blockSizeVertical * 5
                            ),
                            child: Text(
                              "Please! \nInput Referral Code",
                              style: TextStyle(
                                  fontFamily: Constant.POPPINS,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 28
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child:  SvgPicture.asset(
                              "images/undraw_tf.svg",
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeHelper.blockSizeVertical * 30,
                                left: SizeHelper.blockSizeHorizontal * 25
                            ),
                            width: SizeHelper.blockSizeHorizontal * 15,
                            height: SizeHelper.blockSizeVertical * 5,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeHelper.blockSizeVertical * 23,
                                right: SizeHelper.blockSizeHorizontal * 40,
                                left: SizeHelper.blockSizeHorizontal * 5
                            ),
                            child: InputFieldArea(
                              obscure: false,
                              controller: this.referalController,
                              textInputType: TextInputType.text,
                              hint: "Referral Code",
                              icon: Icons.vpn_key,
                              textColor: Colors.black54,
                              focusBorderColor: Colors.black54,
                              borderColor: Colors.black54,
                              fillColor: Colors.white,
                            ),
                          ),
                          Container(
                            height: SizeHelper.blockSizeVertical * 15,
                            width: SizeHelper.screenWidth,
                            margin: EdgeInsets.only(top: SizeHelper.blockSizeVertical * 42),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ButtonTheme(
                                  minWidth: SizeHelper.blockSizeHorizontal * 85,
                                  height: SizeHelper.blockSizeVertical * 7,
                                  child: ButtonPrimary(
                                    titleButton: "Check",
                                    textColor: Colors.white,
                                    buttonColor: Colors.blue,
                                    onPressed: () {
                                      print("checked");
                                      this.referalCodeTask.fetch(this.referalController.text);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: SizeHelper.blockSizeVertical * 0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Already have an account? Login",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ],
          ),
//          Visibility(
//            visible: this.sLoading,
//            child: LoadingView(),
//          )
        ],
      )
    );
  }
}
