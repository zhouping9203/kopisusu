


import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import '../l10n/app_localizations.dart';

class SignaturePage extends StatefulWidget {

  const SignaturePage({Key? key}) : super(key: key);


  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Color(0xff333333),
    exportBackgroundColor: Colors.white,
  );

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
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.signature),backgroundColor: Colors.white,),
        body: Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 17.5,right: 17.5,top: 19,bottom: 17.5),
                    child: Text(AppLocalizations.of(context)!.signature_tip,style: TextStyle(color: Color(0xff333333),fontSize: 15),),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 17.5,right: 17.5,top: 0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Signature(
                            controller: _controller,
                            width: double.infinity,
                            height: double.infinity,
                            backgroundColor: Color(0xffFAFAFA),
                          )
                        ),
                        Container(
                          color: Color(0xffFAFAFA),
                          padding: EdgeInsets.only(bottom: 13.5,left: 19.5,right: 19.5),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 49,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffffffff), // 背景颜色
                                        foregroundColor: Colors.white, // 文字/图标颜色
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          side: BorderSide(
                                            color: Color(0xff123157),
                                            width: 1
                                          )
                                        ),
                                      ),
                                      onPressed: () {
                                        _controller.clear();
                                      },
                                      child: Text(AppLocalizations.of(context)!.rewrite,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff041726)),),
                                    ),
                                  )
                              ),
                              SizedBox(width: 11,),
                              Expanded(
                                  flex: 1,
                                  child: Container(
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
                                        _submit();
                                      },
                                      child: Text(AppLocalizations.of(context)!.submit,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  )
                )
              ],
            ),
        )
    );
  }

  void _submit() async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.please_sign_first),
        ),
      );
      return;
    }

    // 导出签名图片
    final Uint8List? signatureData = await _controller.toPngBytes();
    if (signatureData != null) {
      // 处理签名数据，比如保存或上传

      String base64Data = base64Encode(signatureData);
      //上传
    }
  }
}
