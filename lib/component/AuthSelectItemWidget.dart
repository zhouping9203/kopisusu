

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';


class AuthSelectItemWidget extends StatefulWidget {

  final String title;

  final String? value;

  final bool needBDividerLine;

  final Function? onTap;

  const AuthSelectItemWidget({Key? key,required this.title,this.value,this.needBDividerLine = true,this.onTap}) : super(key: key);

  @override
  State<AuthSelectItemWidget> createState() => _AuthSelectItemWidgetState();

}

class _AuthSelectItemWidgetState extends State<AuthSelectItemWidget> {


  @override
  void initState() {
    super.initState();

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
    
    return Container(
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              widget.onTap?.call();
            },
            child: Container(
              width: double.maxFinite,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 14,),
                  Text(widget.title,style: TextStyle(color: Color(0xff333333),fontSize: 15),),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Text(
                        widget.value ?? AppLocalizations.of(context)!.please_select,
                        style: TextStyle(color: Color(widget.value?.isNotEmpty == true ? 0xff333333 : 0xffcccccc),fontSize: 15),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Image.asset("assets/images/me_profile_right_rrrow.webp",width: 6,height: 10,),
                  SizedBox(width: 14,)
                ],
              ),
            ),
          ),
          widget.needBDividerLine ? Container(
            height: 1,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 14,right: 14),
            color: Color(0xffEAEAEA),
          ) : Container()
        ],
      ),
    );
  }

}
