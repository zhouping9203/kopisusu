

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kopisusu/info/UserInfoAuthPageTabBar.dart';

import '../component/AuthInputItemWidget.dart';
import '../component/AuthSelectItemWidget.dart';
import '../data/PersonalInfoData.dart';
import '../l10n/app_localizations.dart';

class UserBankInfoAuthPage extends StatefulWidget {

  final String phone;

  const UserBankInfoAuthPage({Key? key,required this.phone}) : super(key: key);


  @override
  State<UserBankInfoAuthPage> createState() => _UserBankInfoAuthPageState();
}

class _UserBankInfoAuthPageState extends State<UserBankInfoAuthPage> {

  bool _submitBtnEnable = false;

  PersonalInfoData? _infoDataInputServer;

  PersonalInfoData _infoDataInput = PersonalInfoData();

  bool _onPravicyAgree = false;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void activate() {
    super.activate();

  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  void deactivate() {
    super.deactivate();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.identity_verification),backgroundColor: Colors.white,),
      body: Stack(
        children: [
          Container(
            height: 363,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x66F7941E),
                  Color(0x00F7941E),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const UserInfoAuthPageTabBar(tabIndex: 2),
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,top: 21.5,right: 15),
                          padding: EdgeInsets.only(top: 14),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 14,right: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppLocalizations.of(context)!.identification_information,style: TextStyle(color: Color(0xff333333),fontSize: 20,fontWeight: FontWeight.w500),),
                                    Text(AppLocalizations.of(context)!.id_photo_tip,style: TextStyle(color: Color(0xffFFBE00),fontSize: 13),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 18,),

                              Container(
                                margin: EdgeInsets.only(left: 14,right: 14),
                                child: Row(
                                  children: [
                                    Text(AppLocalizations.of(context)!.id_card,style: TextStyle(color: Color(0xff333333),fontSize: 15),),
                                    SizedBox(width: 6,),
                                    Text(AppLocalizations.of(context)!.view_example,style: TextStyle(color: Color(0xffFF832A),fontSize: 15,decoration: TextDecoration.underline,decorationColor: Color(0xffFF832A)),),
                                  ],
                                ),
                              ),
                              
                              Container(
                                margin: EdgeInsets.only(top: 17),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: (){

                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.asset("assets/images/default_camera_img.png",width: 193,height: 126.5,),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(AppLocalizations.of(context)!.front_of_id_card,style: TextStyle(color: Color(0xff333333),fontSize: 15),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 30,),

                              Container(
                                margin: EdgeInsets.only(left: 14,right: 14),
                                child: Row(
                                  children: [
                                    Text(AppLocalizations.of(context)!.selfie,style: TextStyle(color: Color(0xff333333),fontSize: 15),),
                                    SizedBox(width: 6,),
                                    Text(AppLocalizations.of(context)!.view_example,style: TextStyle(color: Color(0xffFF832A),fontSize: 15,decoration: TextDecoration.underline,decorationColor: Color(0xffFF832A)),),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 17),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: (){

                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.asset("assets/images/default_camera_img.png",width: 193,height: 126.5,),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(AppLocalizations.of(context)!.selfie,style: TextStyle(color: Color(0xff333333),fontSize: 15),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,)
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 15,top: 15,right: 15),
                          padding: EdgeInsets.only(top: 14),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 14,right: 14),
                                child:  Text(AppLocalizations.of(context)!.bank_information,style: TextStyle(color: Color(0xff333333),fontSize: 20,fontWeight: FontWeight.w500),),
                              ),
                              SizedBox(height: 18,),
                              AuthSelectItemWidget(title: AppLocalizations.of(context)!.name_of_bank),
                              AuthInputItemWidget(title: AppLocalizations.of(context)!.beneficiary_account_number,value: _infoDataInputServer?.id,onInputChange: (s) => {
                                _infoDataInput.id = s,
                                _submitEnableCheck()
                              },needBDividerLine: true,),
                              AuthInputItemWidget(title: AppLocalizations.of(context)!.retype_your_account_number,value: _infoDataInputServer?.id,onInputChange: (s) => {
                                _infoDataInput.id = s,
                                _submitEnableCheck()
                              }),
                              SizedBox(height: 6,)
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 17.5,right: 17.5,top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(_submitBtnEnable ? 0xff123157 : 0xffD6D5D6),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              if(_submitBtnEnable) {
                                _startUploadInfo();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: 49,
                              child: Text(AppLocalizations.of(context)!.next,style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.5,),
                        Row(
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
                            Text(AppLocalizations.of(context)!.confirm_your_information_tip,style: const TextStyle(color: Color(0xff999999),fontSize: 12),),
                          ],
                        ),
                        SizedBox(height: 80,),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 61),
            child: Image.asset('assets/images/app_name_jiaobiao.png', width: 75, height: 75),
          ),
        ],
      )

    );
  }

  void loadData(){
    Future.delayed(Duration(milliseconds: 1000),(){
      PersonalInfoData datax = PersonalInfoData();
      setState(() {
        _infoDataInputServer = datax;
      });
    });
  }

  void _submitEnableCheck(){
    Future.delayed(Duration(milliseconds: 100),(){
      setState(() {
        _submitBtnEnable = _infoDataInput.isInputFull();
      });
    });

  }

  void _startUploadInfo(){


  }

}
