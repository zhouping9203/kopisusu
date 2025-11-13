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

  @override
  String get customer_service_ => '客服:';

  @override
  String get phone_ => '电话:';

  @override
  String get email_ => '邮箱:';

  @override
  String get copied => '已复制';

  @override
  String get log_out => '退出登录';

  @override
  String get cancel_account => '注销账号';

  @override
  String get register_and_login => '注册登录';

  @override
  String get please_enter_your_phone_number => '请输入手机号码';

  @override
  String get login_phone_number => '登录手机号';

  @override
  String get i_have_read_and_agree => '我已阅读并同意';

  @override
  String get privacy_policy_ => '《隐私政策》';

  @override
  String get please_enter_the_verification_code => '请输入验证码';

  @override
  String get enter_verification_code => '输入验证码';

  @override
  String get verification_code => '验证码';

  @override
  String get verification_code_sent_to => '已发送验证码至';

  @override
  String get resend => '重新发送';

  @override
  String get otp_not_receive_contactus_tip => '收不到验证码？请联系我们的客服';

  @override
  String get telephone => '电话客服';

  @override
  String get whatsapp => 'Whatsapp';

  @override
  String get or => '或者';

  @override
  String get change_your_phone_number => '更换手机号';

  @override
  String get set_password => '设置密码';

  @override
  String get set_up => '设置';

  @override
  String get enter_password => '输入密码';

  @override
  String get please_enter_your_password => '请输入密码';

  @override
  String get please_enter_your_password_again => '请再次输入密码';

  @override
  String get forget_the_password_ => '忘记密码?';

  @override
  String get password_set_tip => '密码为6-12位字母或数字';

  @override
  String get the_two_passwords_do_not_match => '两次密码不一致';

  @override
  String get identity_verification => '身份认证';

  @override
  String get login_phone_tip => '将使用%s登录/注册\n请确保手机号码填写正确';

  @override
  String get member_basic_information => '会员基本信息';

  @override
  String get id_number => '身份证号';

  @override
  String get please_enter_your_id_number_again => '请再次输入身份证号';

  @override
  String get full_name => '姓名';

  @override
  String get supplementary_information => '补充信息';

  @override
  String get education_level => '教育水平';

  @override
  String get religion => '宗教';

  @override
  String get marital_status => '婚姻情况';

  @override
  String get employment => '工作';

  @override
  String get address => '住址';

  @override
  String get detailed_address => '详细地址';

  @override
  String get please_select => '请选择';

  @override
  String get please_enter => '请输入';

  @override
  String get next => '下一步';

  @override
  String get basic_information => '基本信息';

  @override
  String get extra_information => '附加信息';

  @override
  String get bank_information => '银行信息';
}
