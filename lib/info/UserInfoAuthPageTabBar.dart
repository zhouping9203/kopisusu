

import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class UserInfoAuthPageTabBar extends StatefulWidget {

  final int tabIndex;

  const UserInfoAuthPageTabBar({Key? key,required this.tabIndex}) : super(key: key);


  @override
  State<UserInfoAuthPageTabBar> createState() => _UserInfoAuthPageTabBarState();
}

class _UserInfoAuthPageTabBarState extends State<UserInfoAuthPageTabBar> {

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
      height: 61,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Image.asset(widget.tabIndex > 0 ? "assets/images/tab_ok.png" : (widget.tabIndex == 0 ? "assets/images/tab_focus.png" : "assets/images/tab_unfocus.png")),
                SizedBox(width: 10.5,),
                Text(AppLocalizations.of(context)!.basic_information,style: TextStyle(color: Color(widget.tabIndex > 0 ? 0xffF7941E : (widget.tabIndex == 0 ? 0xff333333 : 0xffB9B9B9)),fontSize: 15))
              ],
            )
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Image.asset(widget.tabIndex > 1 ? "assets/images/tab_ok.png" : (widget.tabIndex == 1 ? "assets/images/tab_focus.png" : "assets/images/tab_unfocus.png")),
                SizedBox(width: 10.5,),
                Text(AppLocalizations.of(context)!.extra_information,style: TextStyle(color: Color(widget.tabIndex > 1 ? 0xffF7941E : (widget.tabIndex == 1 ? 0xff333333 : 0xffB9B9B9)),fontSize: 15),)
              ],
            )
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset(widget.tabIndex > 2 ? "assets/images/tab_ok.png" : (widget.tabIndex == 2 ? "assets/images/tab_focus.png" : "assets/images/tab_unfocus.png")),
                  SizedBox(width: 10.5,),
                  Text(AppLocalizations.of(context)!.bank_information,style: TextStyle(color: Color(widget.tabIndex > 2 ? 0xffF7941E : (widget.tabIndex == 2 ? 0xff333333 : 0xffB9B9B9)),fontSize: 15))
                ],
              )
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}
