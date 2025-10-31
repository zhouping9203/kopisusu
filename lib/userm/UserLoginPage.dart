import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kopisusu/userm/UserLoginOtpPage.dart';

import '../l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Userloginpage extends StatefulWidget {
  const Userloginpage({Key? key}) : super(key: key);


  @override
  State<Userloginpage> createState() => _UserloginpageState();
}

class _UserloginpageState extends State<Userloginpage> {

  final _phoneController = TextEditingController();

  bool showPhoneInputClearBtn = false;
  bool _loginBtnEnable = false;
  bool _onPravicyAgree = false;

  @override
  void initState() {
    super.initState();

    _phoneController.addListener(_onPhoneChange);

  }

  @override
  void activate() {
    super.activate();


  }

  @override
  void dispose() {
    _phoneController.removeListener(_onPhoneChange);
    _phoneController.dispose();
    super.dispose();
  }
  
  @override
  void deactivate() {
    super.deactivate();

  }

  void _onPhoneChange(){
    print(_phoneController.text);
    setState(() {
      showPhoneInputClearBtn = _phoneController.text.isNotEmpty;
      _loginBtnEnable = _phoneController.text.isNotEmpty;
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
                    child: Text(AppLocalizations.of(context)!.register_and_login,style: const TextStyle(color: Colors.white,fontSize: 23,)),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        const SizedBox(height: 30.5,),
                        _buildInputPhoneItem(),
                        Container(
                          margin: EdgeInsets.only(left: 17.5,right: 17.5,top: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(_loginBtnEnable && _onPravicyAgree ? 0xff123157 : 0xffD6D5D6),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              if(_loginBtnEnable && _onPravicyAgree) {
                                _startLogin();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: 49,
                              child: Text(AppLocalizations.of(context)!.register_and_login,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  _buildReadPravicyItem()
                ],
              )
            ],
          )
        ]
      )
    );
  }
  
  Widget _buildInputPhoneItem(){
    
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
          const SizedBox(width: 21.5,),
          Text("+62",style: TextStyle(color: Color(0xff060518),fontSize: 20),),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 12,right: 12),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.please_enter_your_phone_number,
                  border: InputBorder.none
                ),
                style: TextStyle(color: Color(0xff060518),fontWeight: FontWeight.w500,fontSize: 20),
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black
              ),
            ),
          ),
          showPhoneInputClearBtn ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              _phoneController.clear();
            },
            child: Image.asset("assets/images/close_type1.webp"),
          ): Container(),
          const SizedBox(width: 15,),
        ],
      ),
    );
  }

  Widget _buildReadPravicyItem(){
    return Row(
      children: [
        Checkbox(
          value: _onPravicyAgree,
          onChanged: (e){
            setState(() {
              _onPravicyAgree = e ?? false;
            });
          },
          shape: const CircleBorder(),
          activeColor: const Color(0xffFF8007),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.i_have_read_and_agree,
                style: TextStyle(color: Colors.grey[600]),
              ),
              // TextSpan(
              //   text: '《用户协议》',
              //   style: TextStyle(
              //     color: Colors.blue,
              //     decoration: TextDecoration.underline,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   recognizer: TapGestureRecognizer()
              //     ..onTap = () {
              //       _showDialog(context, '用户协议', '这里是用户协议内容...');
              //     },
              // ),
              // TextSpan(
              //   text: '和',
              //   style: TextStyle(color: Colors.grey[600]),
              // ),
              TextSpan(
                text: AppLocalizations.of(context)!.privacy_policy_,
                style: const TextStyle(
                  color: Color(0xffFF8007),
                  // decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {

                  },
              )
            ],
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  void _startLogin(){
    String phone = _phoneController.text;
    if(phone.isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.please_enter_your_phone_number,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return UserloginOtpPage(phone: phone);
    }));
  }

}
