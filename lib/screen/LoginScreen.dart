import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:school_app/component/ButtonPrimary.dart';
import 'package:school_app/component/InputFieldArea.dart';
import 'package:school_app/component/SignUpLink.dart';
import 'package:school_app/helper/SizeHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController nikController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    this.nikController = new TextEditingController();
    this.passwordController = new TextEditingController();
  }

  @override
  void dispose() {
    this.nikController.dispose();
    this.passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeHelper().init(context);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark
        )
    );
    return (new Scaffold(
      body: new Container(
          decoration: new BoxDecoration(
            color: Colors.blue,
          ),
          child: new Container(
              decoration: new BoxDecoration(
                color: Colors.white
              ),
              child: new  ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 250.0,
                        height: SizeHelper.blockSizeVertical * 40,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: new ExactAssetImage('images/school_logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        height: SizeHelper.blockSizeVertical * 60,
                        width: SizeHelper.screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                            gradient: new LinearGradient(
                              colors: <Color>[
                                Colors.blue,
                                Colors.lightBlue,
                              ],
                              stops: [0.2, 1.0],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(0.0, 1.0),
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: new EdgeInsets.symmetric(horizontal: 20),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(height: SizeHelper.blockSizeVertical * 6,),
                                    new Form(
                                        child: new Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            new InputFieldArea(
                                              controller: nikController,
                                              hint: "Nik",
                                              obscure: false,
                                              icon: Icons.person_outline,
                                              textInputType: TextInputType.number,
                                              fillColor: Colors.white,
                                              borderColor: Colors.white,
                                              focusBorderColor: Colors.white,
                                              textColor: Colors.black54,
                                            ),
                                            SizedBox(height: 20,),
                                            new InputFieldArea(
                                              textInputType: TextInputType.text,
                                              controller: passwordController,
                                              hint: "Password",
                                              obscure: true,
                                              icon: Icons.lock_outline,
                                              fillColor: Colors.white,
                                              borderColor: Colors.white,
                                              focusBorderColor: Colors.white,
                                              textColor: Colors.black54,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: SizeHelper.blockSizeVertical *10,),
                              ButtonTheme(
                                minWidth: SizeHelper.blockSizeHorizontal * 88,
                                height: SizeHelper.blockSizeVertical * 8,
                                child: ButtonPrimary(
                                  titleButton: "Sign In",
                                  textColor: Colors.blue,
                                  buttonColor: Colors.white,
                                  onPressed: () {
                                    print("the fck");
                                  },
                                ),
                              ),
                              new SignUp(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
          )
      ),
    )
    );
  }
}
