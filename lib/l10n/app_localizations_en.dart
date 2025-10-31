// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String welcome(Object name) {
    return 'Welcome, $name!';
  }

  @override
  String get profile => 'Profile';

  @override
  String get login => 'Login';

  @override
  String get member => 'Member';

  @override
  String get modify_information => 'Modify information';

  @override
  String get help => 'Help';

  @override
  String get about => 'About';

  @override
  String get customer_service_ => 'Customer service:';

  @override
  String get phone_ => 'Phone:';

  @override
  String get email_ => 'Email:';

  @override
  String get copied => 'Copied';

  @override
  String get log_out => 'Log out';

  @override
  String get cancel_account => 'Cancel account';

  @override
  String get register_and_login => 'Register and Login';

  @override
  String get please_enter_your_phone_number => 'Please enter your phone number';

  @override
  String get i_have_read_and_agree => 'I have read and agree ';

  @override
  String get privacy_policy_ => 'Privacy Policy';

  @override
  String get please_enter_the_verification_code => 'Please enter the verification code';

  @override
  String get enter_verification_code => 'Enter verification code';

  @override
  String get verification_code => 'Verification code';

  @override
  String get verification_code_sent_to => 'Verification code sent to';

  @override
  String get resend => 'Resend';

  @override
  String get otp_not_receive_contactus_tip => 'Not receiving the verification code? Please contact our customer service';

  @override
  String get telephone => 'Telephone';

  @override
  String get whatsapp => 'Whatsapp';

  @override
  String get or => 'or';

  @override
  String get change_your_phone_number => 'change your phone number';

  @override
  String get set_password => 'Set Password';

  @override
  String get enter_password => 'Enter Password';

  @override
  String get please_enter_your_password => 'Please enter your password';

  @override
  String get please_enter_your_password_again => 'Please enter your password again';
}
