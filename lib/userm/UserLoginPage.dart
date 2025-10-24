import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class Userloginpage extends StatefulWidget {
  const Userloginpage({Key? key}) : super(key: key);


  @override
  State<Userloginpage> createState() => _UserloginpageState();
}

class _UserloginpageState extends State<Userloginpage> {

  final _phoneController = TextEditingController();

  bool showPhoneInputClearBtn = false;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Image.asset("assets/images/me_profile_tbgxw.webp",width: double.maxFinite,fit: BoxFit.fitWidth,),
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
                          backgroundColor: Color(0xff123157),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () {},
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

}
