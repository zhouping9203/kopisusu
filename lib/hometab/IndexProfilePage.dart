import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopisusu/l10n/app_localizations.dart';
import 'package:kopisusu/userm/UserLoginPage.dart';
import 'package:package_info_plus/package_info_plus.dart';

class IndexProfilePage extends StatefulWidget {
  const IndexProfilePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<IndexProfilePage> createState() => _IndexProfilePageState();
}

class _IndexProfilePageState extends State<IndexProfilePage> {

  bool isLogin = false;

  String version = "";

  String email = "test@gmail.com";

  var phones = ["+2738843884993","+2382842994242"];

  String userPhone = "";

  @override
  void initState() {
    super.initState();


    getAppVersionName();
  }

  @override
  void deactivate() {
    super.deactivate();


  }

  @override
  void activate() {
    super.activate();


  }

  void getAppVersionName() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = "V" + packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Image.asset("assets/images/me_profile_tbgxw.webp",width: double.maxFinite,fit: BoxFit.fitWidth,),
          ListView(
            children: [
              AppBar(title: Text(AppLocalizations.of(context)!.profile,style: const TextStyle(color: Colors.white,fontSize: 17),),centerTitle: true,backgroundColor: Colors.transparent,),
              Container(
                margin: const EdgeInsets.only(top: 55),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          color: Colors.white
                      ),
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: (){
                        onHeadClick();
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        margin: const EdgeInsets.only(left: 27.5),
                        child: Image.asset("assets/images/me_profile_headrd.webp",width: 80,height: 80,),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        onHeadClick();
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        margin: const EdgeInsets.only(left: 121.5,top: 40),
                        height: 40,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(isLogin ? userPhone : AppLocalizations.of(context)!.login,style: const TextStyle(color: Color(0xFF333333),fontSize: 24,fontWeight: FontWeight.w400),),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 12,
                color: Colors.white,
              ),
              _buildCommonItem(AppLocalizations.of(context)!.member,onTap: (){

              }),
              _buildCommonItem(AppLocalizations.of(context)!.modify_information,onTap: (){

              }),

              const SizedBox(height: 15,),

              _buildCommonItem(AppLocalizations.of(context)!.help,needLineBottom:true,onTap: (){

              }),
              _buildCommonItem(AppLocalizations.of(context)!.about,desc: version, onTap: (){

              }),

              const SizedBox(height: 15,),

              _customServiceItem(),

              SizedBox(height: isLogin ? 12.5 : 0,),

              isLogin ? GestureDetector(
                onTap: (){
                  onLogoutItemClick();
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: 60,
                  child: Text(AppLocalizations.of(context)!.log_out,style: const TextStyle(color: Color(0xffFF4600),fontSize: 16),),
                ),
              ) : Container(),

              SizedBox(height: isLogin ? 13 : 0,),

              isLogin ? GestureDetector(
                onTap: (){
                  onDeleteAccountClick();
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(AppLocalizations.of(context)!.cancel_account,style: const TextStyle(color: Color(0xff999999),fontSize: 16),),
                ),
              ) : Container(),
              const SizedBox(height: 28.5)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCommonItem(String title,{String? desc,Function? onTap,bool needLineBottom = false}){
    Widget contentW = Container(
      color: Colors.white,
      height: 60,
      padding: const EdgeInsets.only(left: 20,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: const TextStyle(color: Color(0xFF555555),fontSize: 16),),
          Expanded(
              child: desc == null ? Container() : Text(desc,style: const TextStyle(color: Color(0xFF999999),fontSize: 13,),textAlign: TextAlign.end,),
          ),
          const SizedBox(width: 5,),
          Image.asset("assets/images/me_profile_right_rrrow.webp")
        ],
      ),
    );

    return needLineBottom ? Column(
      children: [
        contentW,
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20,right: 15),
          child: Container(
            color: const Color(0xFFDBDBDB),
            height: 1,
          ),
        )
      ],
    ) : contentW;
  }

  Widget _customServiceItem(){

    List<Widget> phoneItems = [];
    for (var e in phones) {
      phoneItems.add(
        GestureDetector(
          onTap: (){
            onCopyText(e);
          },
          behavior: HitTestBehavior.opaque,
          child: Text(e,style: const TextStyle(color: Color(0xFFFCAE31),fontSize: 15),),
        )
      );
    }

      return Container(
        color: Colors.white,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 19,right: 19,top: 12,bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.customer_service_,style: const TextStyle(color: Color(0xFF555555),fontSize: 16),),
            const SizedBox(height: 7.5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.phone_,style: const TextStyle(color: Color(0xFF999999),fontSize: 15),),
                const SizedBox(width: 5,),
                Column(
                  children: phoneItems
                )
              ],
            ),
            SizedBox(height: (email.isNotEmpty) ? 7.5 : 0,),
            (email.isNotEmpty) ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.email_,style: const TextStyle(color: Color(0xFF999999),fontSize: 15),),
                const SizedBox(width: 5,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        onCopyText(email);
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Text(email,style: const TextStyle(color: Color(0xFFFCAE31),fontSize: 15),)
                    )
                  ]
                )
              ]
            ): Container(),
          ],
        ),
      );
  }

  void onCopyText(String s) async{
    await Clipboard.setData(ClipboardData(text: s));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.copied)));
  }

  void onHeadClick(){
    if(isLogin) return;

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return const Userloginpage();
    }));
  }

  void onLogoutItemClick(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.log_out)));
  }

  void onDeleteAccountClick(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.cancel_account)));
  }

}
