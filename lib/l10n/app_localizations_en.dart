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
}
