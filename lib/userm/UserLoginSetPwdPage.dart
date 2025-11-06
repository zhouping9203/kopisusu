
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kopisusu/userm/UserLoginOtpPage.dart';

import '../l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserloginSetPwdPage extends StatefulWidget {

  final String phone;

  const UserloginSetPwdPage({Key? key,required this.phone}) : super(key: key);


  @override
  State<UserloginSetPwdPage> createState() => _UserloginSetPwdPageState();
}

class _UserloginSetPwdPageState extends State<UserloginSetPwdPage> {

  final _pwdController = TextEditingController();
  final _pwdRetypeController = TextEditingController();

  bool _loginBtnEnable = false;

  bool _hidePwd = true;
  bool _hideRetypePwd = true;

  String? errorTip = null;

  @override
  void initState() {
    super.initState();

    _pwdController.addListener(_onPwdChange);
    _pwdRetypeController.addListener(_onPwdRetypeChange);
  }

  @override
  void activate() {
    super.activate();

  }

  @override
  void dispose() {
    _pwdController.removeListener(_onPwdChange);
    _pwdController.dispose();

    _pwdRetypeController.removeListener(_onPwdRetypeChange);
    _pwdRetypeController.dispose();
    super.dispose();
  }
  
  @override
  void deactivate() {
    super.deactivate();

  }

  void _onPwdChange(){
    print(_pwdController.text);
    setState(() {
      _loginBtnEnable = _pwdController.text.isNotEmpty && _pwdRetypeController.text.isNotEmpty;
    });
  }

  void _onPwdRetypeChange(){
    print(_pwdRetypeController.text);
    setState(() {
      _loginBtnEnable = _pwdController.text.isNotEmpty && _pwdRetypeController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Image.asset("assets/images/me_profile_tbgxw.webp",width: double.maxFinite,fit: BoxFit.fitWidth,),
          ListView(
            children: [
              Column(
                children: [
                  AppBar(leading: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close_sharp,color: Colors.white,),
                  ),centerTitle: true,backgroundColor: Colors.transparent,),

                  Container(
                    margin: const EdgeInsets.only(left: 18,top: 25),
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/app_name_type1.webp",width: 234.5),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 18,top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context)!.set_password,style: const TextStyle(color: Colors.white,fontSize: 23,)),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30.5,),
                        _buildInputPwdItem(),

                        const SizedBox(height: 10,),
                        _buildInputPwdRetypeItem(),

                        Container(
                          margin: EdgeInsets.only(left: 17.5,right: 17.5,top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.password_set_tip,style: TextStyle(fontSize: 15,color: Color(0xff666666)),),
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 17.5,right: 17.5,top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(_loginBtnEnable ? 0xff123157 : 0xffD6D5D6),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              if(_loginBtnEnable) {
                                _startLogin();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: 49,
                              child: Text(AppLocalizations.of(context)!.set_up,style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),

                        (errorTip?.length ?? 0) > 0 ?
                        Container(
                          margin: EdgeInsets.only(left: 17.5,right: 17.5,top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(errorTip!,style: TextStyle(fontSize: 17,color: Color(0xffFF2828)),),
                            ],
                          ),
                        ) : Container(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ]
      )
    );
  }
  
  Widget _buildInputPwdItem(){
    
    return Container(
      margin: const EdgeInsets.only(left: 17,right: 17),
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: const Color(0xffdedede),
          width: 1.0,
          style: BorderStyle.solid,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 11.5,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12,right: 12),
              child: TextField(
                  obscureText: _hidePwd,
                controller: _pwdController,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.please_enter_your_password,
                  border: InputBorder.none
                ),
                style: TextStyle(color: Color(0xff060518),fontWeight: FontWeight.w500,fontSize: 20),
                keyboardType: TextInputType.text,
                cursorColor: Colors.black
              ),
            ),
          ),

          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              setState(() {
                _hidePwd = !_hidePwd;
              });
            },
            child: Image.asset(_hidePwd ? "assets/images/eye_close.webp" : "assets/images/eye_open.webp"),
          ),

          const SizedBox(width: 15,),
        ],
      ),
    );
  }

  Widget _buildInputPwdRetypeItem(){

    return Container(
      margin: const EdgeInsets.only(left: 17,right: 17),
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: const Color(0xffdedede),
            width: 1.0,
            style: BorderStyle.solid,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 11.5,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12,right: 12),
              child: TextField(
                  obscureText: _hideRetypePwd,
                  controller: _pwdRetypeController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.please_enter_your_password_again,
                      border: InputBorder.none
                  ),
                  style: TextStyle(color: Color(0xff060518),fontWeight: FontWeight.w500,fontSize: 20),
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black
              ),
            ),
          ),

          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              setState(() {
                _hideRetypePwd = !_hideRetypePwd;
              });
            },
            child: Image.asset(_hideRetypePwd ? "assets/images/eye_close.webp" : "assets/images/eye_open.webp"),
          ),

          const SizedBox(width: 15,),
        ],
      ),
    );
  }

  void _startLogin(){
    String pwd = _pwdController.text;
    String pwdReType = _pwdRetypeController.text;
    if(pwd.isEmpty || pwdReType.isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.please_enter_your_password,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;
    }

    if(pwd != pwdReType) {
      setState(() {
        errorTip = AppLocalizations.of(context)!.the_two_passwords_do_not_match;
      });
      return;
    }

    setState(() {
      errorTip = null;
    });

  }

}
