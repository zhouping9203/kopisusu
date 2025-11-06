
import 'package:flutter/material.dart';

import '../SafeSetStateMixin.dart';
import '../l10n/app_localizations.dart';


class AuthInputItemWidget extends StatefulWidget {

  final String title;

  final String? value;

  final Function(String)? onInputChange;

  final bool needBDividerLine;

  const AuthInputItemWidget({Key? key,required this.title,this.value,this.onInputChange,this.needBDividerLine = false}) : super(key: key);

  @override
  State<AuthInputItemWidget> createState() => _AuthInputItemWidgetState();

}

class _AuthInputItemWidgetState extends State<AuthInputItemWidget> with SafeSetStateMixin {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value ?? "");
    _controller.addListener(_onInputChange);

  }

  @override
  void didUpdateWidget(covariant AuthInputItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.value != oldWidget.value && oldWidget.value?.isNotEmpty != true) {
      setState(() {
        _controller.text = widget.value ?? "";
      });
    }
  }

  @override
  void activate() {
    super.activate();
  }

  @override
  void dispose() {
    _controller.removeListener(_onInputChange);
    _controller.dispose();
    super.dispose();
  }
  
  @override
  void deactivate() {
    super.deactivate();
  }

  void _onInputChange(){
    widget.onInputChange?.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 14,),
                Text(widget.title,style: TextStyle(color: Color(0xff333333),fontSize: 15),),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12,right: 14),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.please_enter,
                          hintStyle: TextStyle(color: Color(0xffcccccc),fontSize: 15),
                          border: InputBorder.none
                      ),
                      style: TextStyle(color: Color(0xff333333),fontSize: 15),
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
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
