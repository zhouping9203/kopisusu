
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kopisusu/userm/UserLoginOtpPage.dart';

import '../l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserloginPwdPage extends StatefulWidget {

  final String phone;

  const UserloginPwdPage({Key? key,required this.phone}) : super(key: key);


  @override
  State<UserloginPwdPage> createState() => _UserloginPwdPageState();
}

class _UserloginPwdPageState extends State<UserloginPwdPage> {

  final _pwdController = TextEditingController();

  bool showpwdInputClearBtn = false;
  bool _loginBtnEnable = false;

  bool _hidePwd = true;

  @override
  void initState() {
    super.initState();

    _pwdController.addListener(_onPwdChange);
  }

  @override
  void activate() {
    super.activate();

  }

  @override
  void dispose() {
    _pwdController.removeListener(_onPwdChange);
    _pwdController.dispose();
    super.dispose();
  }
  
  @override
  void deactivate() {
    super.deactivate();

  }

  void _onPwdChange(){
    print(_pwdController.text);
    setState(() {
      _loginBtnEnable = _pwdController.text.isNotEmpty;
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
                    child: Text(AppLocalizations.of(context)!.enter_password,style: const TextStyle(color: Colors.white,fontSize: 23,)),
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

                        Container(
                          margin: EdgeInsets.only(left: 17.5,right: 17.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.login_phone_number,style: TextStyle(fontSize: 15,color: Color(0xff666666)),),
                              SizedBox(height: 4,),
                              Text("+62 " + widget.phone,style: TextStyle(fontSize: 20,color: Color(0xff060518)),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18,),
                        _buildInputPwdItem(),

                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 4,bottom: 9),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              _onForgetPassword();
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 40,right: 40,top: 12,bottom: 12),
                              child: Text(AppLocalizations.of(context)!.forget_the_password_,style: TextStyle(color: Color(0xffFF832A),fontSize: 16),),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 17.5,right: 17.5),
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
                              child: Text(AppLocalizations.of(context)!.login,style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                        )
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
          showpwdInputClearBtn ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              _pwdController.clear();
            },
            child: Image.asset("assets/images/close_type1.webp"),
          ): Container(),

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

  void _startLogin(){
    String phone = widget.phone;
    String pwd = _pwdController.text;
    if(pwd.isEmpty) {
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


  }

  void _onForgetPassword(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return UserloginOtpPage(phone: widget.phone);
    }));
  }

}
