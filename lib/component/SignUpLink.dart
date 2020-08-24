import 'package:flutter/material.dart';
import 'package:school_app/common/Constant.dart';
import 'package:school_app/common/SharedPrefencesKey.dart';
import 'package:school_app/helper/SharedPreferencesHelper.dart';

class SignUp extends StatelessWidget {
  SignUp();
  @override
  Widget build(BuildContext context) {
    return (new FlatButton(
      padding: const EdgeInsets.only(
        top: 0.0,
      ),
      onPressed: () async {
        SharedPreferencesHelper prefHelper = new SharedPreferencesHelper();
        String refCode = await prefHelper.get(SharedPreferencesKey.REFERAL_CODE, "default");
        int muridID = await prefHelper.get(SharedPreferencesKey.MURID_ID, 0);

//        prefHelper.remove(SharedPreferencesKey.REFERAL_CODE);
//        prefHelper.remove(SharedPreferencesKey.MURID_ID);

        print(" ss $refCode && $muridID");

        if (refCode == null && muridID == null){
          Navigator.pushNamed(context, Constant.REFERAL_CODE_SCREEN);
        }else{
          Navigator.pushNamed(context, Constant.REGISTER_SCREEN);
        }
      },
      child: new Text(
        "Don't have an account? Sign Up",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.white,
            fontSize: 14.0),
      ),
    ));
  }
}
