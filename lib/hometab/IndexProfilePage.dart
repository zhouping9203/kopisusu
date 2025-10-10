import 'package:flutter/material.dart';
import 'package:kopisusu/l10n/app_localizations.dart';

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
          Image.asset("assets/images/me_profile_tbgxw.webp"),
          Column(
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
                        child: Text(isLogin ? "data" : AppLocalizations.of(context)!.login,style: const TextStyle(color: Color(0xFF333333),fontSize: 24,fontWeight: FontWeight.w400),),
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
              _buildCommonItem(AppLocalizations.of(context)!.about,desc: "V1.0.0", onTap: (){

              }),

              const SizedBox(height: 15,),


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
        children: [
          Text(title,style: const TextStyle(color: Color(0xFF555555),fontSize: 16),),
          Expanded(
              child: desc == null ? Container() : Text(desc,style: const TextStyle(color: Color(0xFF999999),fontSize: 13),),
          ),
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

  void onHeadClick(){
    if(isLogin) return;


  }

}
