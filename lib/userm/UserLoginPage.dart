import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class Userloginpage extends StatefulWidget {
  const Userloginpage({Key? key}) : super(key: key);


  @override
  State<Userloginpage> createState() => _UserloginpageState();
}

class _UserloginpageState extends State<Userloginpage> {

  @override
  void initState() {
    super.initState();


  }

  @override
  void activate() {
    super.activate();


  }

  @override
  void deactivate() {
    super.deactivate();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Image.asset("assets/images/me_profile_tbgxw.webp"),
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
                    _buildInputPhoneItem()
                  ],
                ),
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
        children: [
          Text("+62",style: TextStyle(color: Color(0xff060518),fontSize: 20),),

          Image.asset("assets/images/close_type1.webp")
        ],
      ),
    );
  }

}
