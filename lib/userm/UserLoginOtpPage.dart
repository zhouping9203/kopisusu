
import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserloginOtpPage extends StatefulWidget {

  final String phone;

  const UserloginOtpPage({Key? key,required this.phone}) : super(key: key);


  @override
  State<UserloginOtpPage> createState() => _UserloginOtpPageState();
}

class _UserloginOtpPageState extends State<UserloginOtpPage> {

  final _otpController = TextEditingController();

  bool showOtpInputClearBtn = false;
  bool _loginBtnEnable = false;

  int times = -1;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _otpController.addListener(_onOtpChange);

    _startOtpTimeCounter();
  }

  @override
  void activate() {
    super.activate();

  }

  @override
  void dispose() {
    _otpController.removeListener(_onOtpChange);
    _otpController.dispose();
    _stopTimer();
    super.dispose();
  }
  
  @override
  void deactivate() {
    super.deactivate();

  }

  void _onOtpChange(){
    print(_otpController.text);
    setState(() {
      _loginBtnEnable = _otpController.text.isNotEmpty;
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
                    child: Text(AppLocalizations.of(context)!.enter_verification_code,style: const TextStyle(color: Colors.white,fontSize: 23,)),
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
                              Text(AppLocalizations.of(context)!.verification_code_sent_to,style: TextStyle(fontSize: 15,color: Color(0xff666666)),),
                              SizedBox(height: 4,),
                              Text("+62 " + widget.phone,style: TextStyle(fontSize: 20,color: Color(0xff060518)),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18,),
                        _buildInputOtpItem(),
                        
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 4,bottom: 9),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              if(times <= 0) {
                                _onOtpResend();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 40,right: 40,top: 12,bottom: 12),
                              child: Text("${AppLocalizations.of(context)!.resend}${(times > 0 ? "(${times}s)" : "")}",style: TextStyle(color: Color(times > 0 ? 0xffCCCCCC : 0xffFF832A),fontSize: 16),),
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
                              child: Text(AppLocalizations.of(context)!.register_and_login,style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 17.5,right: 17.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8,),
                              Text(AppLocalizations.of(context)!.otp_not_receive_contactus_tip,style: const TextStyle(color: Color(0xff666666),fontSize: 15),),
                              SizedBox(height: 7,),
                              Row(
                                children: [
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: (){

                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 0,right: 17.5,top: 5,bottom: 5),
                                      child: Text(AppLocalizations.of(context)!.telephone,style: const TextStyle(color: Color(0xffFF832A),fontSize: 15,decoration: TextDecoration.underline,decorationColor: Color(0xffFF832A),),),
                                    ),
                                  ),
                                  SizedBox(width: 14,),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: (){

                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 0,right: 17.5,top: 5,bottom: 5),
                                      child: Text(AppLocalizations.of(context)!.whatsapp,style: const TextStyle(color: Color(0xffFF832A),fontSize: 15,decoration: TextDecoration.underline,decorationColor: Color(0xffFF832A),),),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                                    child: Text(AppLocalizations.of(context)!.or,style: const TextStyle(color: Color(0xff666666),fontSize: 15,),),
                                  ),
                                  SizedBox(width: 2,),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 0,right: 17.5,top: 5,bottom: 5),
                                      child: Text(AppLocalizations.of(context)!.change_your_phone_number,style: const TextStyle(color: Color(0xffFF832A),fontSize: 15,decoration: TextDecoration.underline,decorationColor: Color(0xffFF832A),),),
                                    ),
                                  ),
                                ],
                              )
                            ],
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
  
  Widget _buildInputOtpItem(){
    
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
                controller: _otpController,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enter_verification_code,
                  border: InputBorder.none
                ),
                style: TextStyle(color: Color(0xff060518),fontWeight: FontWeight.w500,fontSize: 20),
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black
              ),
            ),
          ),
          showOtpInputClearBtn ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              _otpController.clear();
            },
            child: Image.asset("assets/images/close_type1.webp"),
          ): Container(),
          const SizedBox(width: 15,),
        ],
      ),
    );
  }

  void _startLogin(){
    String phone = widget.phone;
    String otp = _otpController.text;
    if(otp.isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.please_enter_the_verification_code,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;
    }


  }

  void _onOtpResend(){
    _startOtpTimeCounter();
  }

  void _startOtpTimeCounter(){
    setState(() {
      times = 60;
    });
    _stopTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (time){
      --times;
      setState(() {
        times = times;
      });
      if(times < 0) {
        _stopTimer();
      }
    });
  }

  void _stopTimer(){
    _timer?.cancel();
    _timer = null;
  }

}
