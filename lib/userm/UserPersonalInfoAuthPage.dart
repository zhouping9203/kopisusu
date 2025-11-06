

import 'package:flutter/material.dart';

import '../component/AuthInputItemWidget.dart';
import '../component/AuthSelectItemWidget.dart';
import '../data/PersonalInfoData.dart';
import '../l10n/app_localizations.dart';

class UserPersonalInfoAuthPage extends StatefulWidget {

  final String phone;

  const UserPersonalInfoAuthPage({Key? key,required this.phone}) : super(key: key);


  @override
  State<UserPersonalInfoAuthPage> createState() => _UserPersonalInfoAuthPageState();
}

class _UserPersonalInfoAuthPageState extends State<UserPersonalInfoAuthPage> {

  bool _submitBtnEnable = false;

  PersonalInfoData _infoDataInput = PersonalInfoData();

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
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 18.5,right: 18.5,top: 8,bottom: 5.5),
                    margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFADF),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Image.asset('assets/images/warning.png', width: 20, height: 20),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(
                            text: " ${AppLocalizations.of(context)!.login_phone_tip.replaceAll("%s", "+62 ${widget.phone}")}",
                            style: TextStyle(color: Color(0xffFC8433), fontSize: 15),
                          ),
                        ],
                      ),
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
                          child: Text(AppLocalizations.of(context)!.member_basic_information,style: TextStyle(color: Color(0xff333333),fontSize: 20,fontWeight: FontWeight.w500),),
                        ),
                        SizedBox(height: 18,),
                        AuthInputItemWidget(title: AppLocalizations.of(context)!.id_number,value: "131313131",onInputChange: (s) => {
                          _infoDataInput.id = s,
                          _submitEnableCheck()
                        }),
                        AuthInputItemWidget(title: AppLocalizations.of(context)!.please_enter_your_id_number_again,onInputChange: (s) => {
                          _infoDataInput.retypeId = s,
                          _submitEnableCheck()
                        }),
                        AuthInputItemWidget(title: AppLocalizations.of(context)!.full_name,needBDividerLine: false,onInputChange: (s) => {
                          _infoDataInput.fullName = s,
                          _submitEnableCheck()
                        }),
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
                          child: Text(AppLocalizations.of(context)!.supplementary_information,style: TextStyle(color: Color(0xff333333),fontSize: 20,fontWeight: FontWeight.w500),),
                        ),
                        SizedBox(height: 18,),
                        AuthSelectItemWidget(title: AppLocalizations.of(context)!.education_level),
                        AuthSelectItemWidget(title: AppLocalizations.of(context)!.marital_status),
                        AuthSelectItemWidget(title: AppLocalizations.of(context)!.religion),
                        AuthSelectItemWidget(title: AppLocalizations.of(context)!.employment),
                        AuthSelectItemWidget(title: AppLocalizations.of(context)!.address),
                        AuthInputItemWidget(title: AppLocalizations.of(context)!.detailed_address,needBDividerLine: false,),
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
                  SizedBox(height: 80,),
                ],
              )
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset('assets/images/app_name_jiaobiao.png', width: 75, height: 75),
          ),
        ],
      )

    );
  }

  void loadData(){

  }

  void _submitEnableCheck(){
    setState(() {
      _submitBtnEnable = _infoDataInput.isInputFull();
    });
  }

  void _startUploadInfo(){


  }

}
