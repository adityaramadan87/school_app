import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/common/Constant.dart';
import 'package:school_app/component/ButtonPrimary.dart';
import 'package:school_app/helper/SizeHelper.dart';

class BadRequestView extends StatelessWidget {

  BadRequestView({this.message});

  String message;

  @override
  Widget build(BuildContext context) {
    SizeHelper().init(context);
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        height: SizeHelper.blockSizeVertical * 50,
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "images/badrequest.svg",
                  height: SizeHelper.blockSizeVertical * 35,
                ),
                Text(
                  this.message,
                  style: TextStyle(
                    color: Colors.black87, fontSize: 18, fontFamily: Constant.POPPINS, fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: SizeHelper.blockSizeVertical*2,),
                ButtonPrimary(
                  buttonColor: Colors.deepPurple,
                  onPressed: () => Navigator.pop(context),
                  textColor: Colors.white,
                  titleButton: "Okay",
                )
              ],
            )
        ),
      ),
    );
  }
}
