

import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class UserInfoAuthPageTabBar extends StatefulWidget {

  final String phone;

  const UserInfoAuthPageTabBar({Key? key,required this.phone}) : super(key: key);


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
      child: Row(
        children: [
          Row(
            children: [
              Image.asset("assets/images/tab_focus.png"),
              Text(AppLocalizations.of(context)!.basic_information)
            ],
          ),
          Row(
            children: [
              Image.asset("assets/images/tab_unfocus.png"),
              Text(AppLocalizations.of(context)!.extra_information)
            ],
          ),
          Row(
            children: [
              Image.asset("assets/images/tab_unfocus.png"),
              Text(AppLocalizations.of(context)!.bank_information)
            ],
          )
        ],
      ),
    );

}
