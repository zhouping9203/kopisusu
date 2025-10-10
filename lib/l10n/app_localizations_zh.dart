// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get helloWorld => '你好世界！';

  @override
  String welcome(Object name) {
    return '欢迎, $name!';
  }

  @override
  String get profile => '我的';

  @override
  String get login => '登录';

  @override
  String get member => '会员';

  @override
  String get modify_information => '修改资料';

  @override
  String get help => '帮助';

  @override
  String get about => '关于';
}
