import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_app/helper/SizeHelper.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeHelper().init(context);
    return Container(
      height: SizeHelper.blockSizeVertical * 45,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "images/robot_loading.svg",
              height: SizeHelper.blockSizeVertical * 35,
            ),
            SpinKitThreeBounce(
              color: Color.fromRGBO(30, 180, 194, 1.0),
              size: 34,
            )
          ],
        ),
      ),
    );
  }
}
