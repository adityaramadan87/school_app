import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/component/ButtonPrimary.dart';
import 'package:school_app/helper/SizeHelper.dart';

class TimeoutView extends StatelessWidget {
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
        height: SizeHelper.blockSizeVertical * 45,
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "images/timeout.svg",
                  height: SizeHelper.blockSizeVertical * 35,
                ),
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
