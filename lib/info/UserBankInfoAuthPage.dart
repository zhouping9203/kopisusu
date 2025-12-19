

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
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: (){
                                        _showIdCardPhotoTipDialog();
                                      },
                                      child: Text(AppLocalizations.of(context)!.view_example,style: TextStyle(color: Color(0xffFF832A),fontSize: 15,decoration: TextDecoration.underline,decorationColor: Color(0xffFF832A)),),
                                    ),
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
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: (){
                                        _showSelfieTipDialog();
                                      },
                                      child: Text(AppLocalizations.of(context)!.view_example,style: TextStyle(color: Color(0xffFF832A),fontSize: 15,decoration: TextDecoration.underline,decorationColor: Color(0xffFF832A)),),
                                    ),
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
                              if(!_submitBtnEnable) {
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

  void _showIdCardPhotoTipDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder:  (context, animation, secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.only(left: 16,right: 16,top: 17.5,bottom: 23),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.only(top: 15.5,left: 23),
                        alignment: Alignment.center,
                        child: Text(AppLocalizations.of(context)!.sample_id_card_photo,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff333333),decoration: TextDecoration.none),),
                      )),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/close_type2.png",width: 23,height: 23,),
                      )
                    ],
                  ),
                  SizedBox(height: 15.5,),
                  Image.asset("assets/images/id_front_demo.png",width: 310),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(". ${AppLocalizations.of(context)!.front_id_photo_tip1}",style: TextStyle(fontSize: 13,color: Color(0xff999999),decoration: TextDecoration.none),),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(". ${AppLocalizations.of(context)!.id_card_is_clearly_visible_tip}",style: TextStyle(fontSize: 13,color: Color(0xff999999),decoration: TextDecoration.none),),
                  ),
                  SizedBox(height: 15.5,),
                  Container(
                    width: double.maxFinite,
                    height: 49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff123157), // 背景颜色
                        foregroundColor: Colors.white, // 文字/图标颜色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.continue_uploading,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void _showSelfieTipDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder:  (context, animation, secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.only(left: 16,right: 16,top: 17.5,bottom: 23),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.only(top: 15.5,left: 23),
                        alignment: Alignment.center,
                        child: Text(AppLocalizations.of(context)!.sample_selfie_photo,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff333333),decoration: TextDecoration.none),),
                      )),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/close_type2.png",width: 23,height: 23,),
                      )
                    ],
                  ),
                  SizedBox(height: 15.5,),
                  Image.asset("assets/images/selfie_demo.png",width: 255),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(". ${AppLocalizations.of(context)!.selfie_tip1}",style: TextStyle(fontSize: 13,color: Color(0xff999999),decoration: TextDecoration.none),),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(". ${AppLocalizations.of(context)!.selfie_tip2}",style: TextStyle(fontSize: 13,color: Color(0xff999999),decoration: TextDecoration.none),),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(". ${AppLocalizations.of(context)!.selfie_tip3}",style: TextStyle(fontSize: 13,color: Color(0xff999999),decoration: TextDecoration.none),),
                  ),
                  SizedBox(height: 15.5,),
                  Container(
                    width: double.maxFinite,
                    height: 49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff123157), // 背景颜色
                        foregroundColor: Colors.white, // 文字/图标颜色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.continue_uploading,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void _showSubmitPentingTipDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder:  (context, animation, secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              padding: EdgeInsets.only(left: 0,right: 0,top: 18,bottom: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 0),
                    alignment: Alignment.center,
                    child: Text(AppLocalizations.of(context)!.penting,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xff333333),decoration: TextDecoration.none),),
                  ),
                  SizedBox(height: 15.5,),
                  Container(
                    margin: EdgeInsets.only(left: 28,right: 28),
                    alignment: Alignment.center,
                    child: Text(AppLocalizations.of(context)!.bank_submit_penting_content,style: TextStyle(fontSize: 14,color: Color(0xff9A9A9A),decoration: TextDecoration.none),),
                  ),
                  SizedBox(height: 18.5,),
                  Container(
                    width: double.maxFinite,
                    height: 49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffffffff), // 背景颜色
                        foregroundColor: Color(0xff333333), // 文字/图标颜色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.sure,style: TextStyle(fontSize: 17,color: Color(0xff333333))),
                    ),
                  )
                ],
              ),
            ),
          );
        }
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
    _showSubmitPentingTipDialog();

  }

}
