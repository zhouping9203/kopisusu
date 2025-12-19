import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// Welcome!!!
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcome(Object name);

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @member.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get member;

  /// No description provided for @modify_information.
  ///
  /// In en, this message translates to:
  /// **'Modify information'**
  String get modify_information;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @customer_service_.
  ///
  /// In en, this message translates to:
  /// **'Customer service:'**
  String get customer_service_;

  /// No description provided for @phone_.
  ///
  /// In en, this message translates to:
  /// **'Phone:'**
  String get phone_;

  /// No description provided for @email_.
  ///
  /// In en, this message translates to:
  /// **'Email:'**
  String get email_;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get log_out;

  /// No description provided for @cancel_account.
  ///
  /// In en, this message translates to:
  /// **'Cancel account'**
  String get cancel_account;

  /// No description provided for @register_and_login.
  ///
  /// In en, this message translates to:
  /// **'Register and Login'**
  String get register_and_login;

  /// No description provided for @please_enter_your_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get please_enter_your_phone_number;

  /// No description provided for @login_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Login phone number'**
  String get login_phone_number;

  /// No description provided for @i_have_read_and_agree.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree '**
  String get i_have_read_and_agree;

  /// No description provided for @privacy_policy_.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy_;

  /// No description provided for @please_enter_the_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Please enter the verification code'**
  String get please_enter_the_verification_code;

  /// No description provided for @enter_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enter_verification_code;

  /// No description provided for @verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get verification_code;

  /// No description provided for @verification_code_sent_to.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent to'**
  String get verification_code_sent_to;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @otp_not_receive_contactus_tip.
  ///
  /// In en, this message translates to:
  /// **'Not receiving the verification code? Please contact our customer service'**
  String get otp_not_receive_contactus_tip;

  /// No description provided for @telephone.
  ///
  /// In en, this message translates to:
  /// **'Telephone'**
  String get telephone;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'Whatsapp'**
  String get whatsapp;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @change_your_phone_number.
  ///
  /// In en, this message translates to:
  /// **'change your phone number'**
  String get change_your_phone_number;

  /// No description provided for @set_password.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get set_password;

  /// No description provided for @set_up.
  ///
  /// In en, this message translates to:
  /// **'Set up'**
  String get set_up;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enter_password;

  /// No description provided for @please_enter_your_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get please_enter_your_password;

  /// No description provided for @please_enter_your_password_again.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password again'**
  String get please_enter_your_password_again;

  /// No description provided for @forget_the_password_.
  ///
  /// In en, this message translates to:
  /// **'Forget the password?'**
  String get forget_the_password_;

  /// No description provided for @password_set_tip.
  ///
  /// In en, this message translates to:
  /// **'Password is 6-12 characters long and can consist of letters or numbers.'**
  String get password_set_tip;

  /// No description provided for @the_two_passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'The two passwords do not match'**
  String get the_two_passwords_do_not_match;

  /// No description provided for @identity_verification.
  ///
  /// In en, this message translates to:
  /// **'Identity Verification'**
  String get identity_verification;

  /// No description provided for @login_phone_tip.
  ///
  /// In en, this message translates to:
  /// **'You will be using %s to log in/register. \nPlease ensure your mobile phone number is entered correctly.'**
  String get login_phone_tip;

  /// No description provided for @member_basic_information.
  ///
  /// In en, this message translates to:
  /// **'Member Basic Information'**
  String get member_basic_information;

  /// No description provided for @id_number.
  ///
  /// In en, this message translates to:
  /// **'ID Number'**
  String get id_number;

  /// No description provided for @please_enter_your_id_number_again.
  ///
  /// In en, this message translates to:
  /// **'Please enter your ID number again'**
  String get please_enter_your_id_number_again;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @supplementary_information.
  ///
  /// In en, this message translates to:
  /// **'Supplementary Information'**
  String get supplementary_information;

  /// No description provided for @education_level.
  ///
  /// In en, this message translates to:
  /// **'Education Level'**
  String get education_level;

  /// No description provided for @religion.
  ///
  /// In en, this message translates to:
  /// **'Religion'**
  String get religion;

  /// No description provided for @marital_status.
  ///
  /// In en, this message translates to:
  /// **'Marital Status'**
  String get marital_status;

  /// No description provided for @employment.
  ///
  /// In en, this message translates to:
  /// **'Employment'**
  String get employment;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @detailed_address.
  ///
  /// In en, this message translates to:
  /// **'Detailed Address'**
  String get detailed_address;

  /// No description provided for @please_select.
  ///
  /// In en, this message translates to:
  /// **'Please select'**
  String get please_select;

  /// No description provided for @please_enter.
  ///
  /// In en, this message translates to:
  /// **'Please Enter'**
  String get please_enter;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @basic_information.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basic_information;

  /// No description provided for @extra_information.
  ///
  /// In en, this message translates to:
  /// **'Extra Information'**
  String get extra_information;

  /// No description provided for @bank_information.
  ///
  /// In en, this message translates to:
  /// **'Bank Information'**
  String get bank_information;

  /// No description provided for @job_information.
  ///
  /// In en, this message translates to:
  /// **'Job Information'**
  String get job_information;

  /// No description provided for @monthly_income.
  ///
  /// In en, this message translates to:
  /// **'Monthly income'**
  String get monthly_income;

  /// No description provided for @payday.
  ///
  /// In en, this message translates to:
  /// **'Payday'**
  String get payday;

  /// No description provided for @emergency_contact.
  ///
  /// In en, this message translates to:
  /// **'Emergency contact'**
  String get emergency_contact;

  /// No description provided for @contact_1.
  ///
  /// In en, this message translates to:
  /// **'Contact 1'**
  String get contact_1;

  /// No description provided for @emergency_contact_tip.
  ///
  /// In en, this message translates to:
  /// **'Choosing \"parents\" or \"spouse\" has a higher approval rate.'**
  String get emergency_contact_tip;

  /// No description provided for @relationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get relationship;

  /// No description provided for @contact_name.
  ///
  /// In en, this message translates to:
  /// **'Contact Name'**
  String get contact_name;

  /// No description provided for @contact_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Contact Phone Number'**
  String get contact_phone_number;

  /// No description provided for @identification_information.
  ///
  /// In en, this message translates to:
  /// **'Identification Information'**
  String get identification_information;

  /// No description provided for @id_photo_tip.
  ///
  /// In en, this message translates to:
  /// **'%s, please take a photo of your ID card for verification.'**
  String get id_photo_tip;

  /// No description provided for @front_of_id_card.
  ///
  /// In en, this message translates to:
  /// **'Front of ID Card'**
  String get front_of_id_card;

  /// No description provided for @selfie.
  ///
  /// In en, this message translates to:
  /// **'Selfie'**
  String get selfie;

  /// No description provided for @id_card.
  ///
  /// In en, this message translates to:
  /// **'ID Card'**
  String get id_card;

  /// No description provided for @view_example.
  ///
  /// In en, this message translates to:
  /// **'View Example'**
  String get view_example;

  /// No description provided for @name_of_bank.
  ///
  /// In en, this message translates to:
  /// **'Name of Bank'**
  String get name_of_bank;

  /// No description provided for @beneficiary_account_number.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary Account Number'**
  String get beneficiary_account_number;

  /// No description provided for @retype_your_account_number.
  ///
  /// In en, this message translates to:
  /// **'Retype your account number'**
  String get retype_your_account_number;

  /// No description provided for @confirm_your_information_tip.
  ///
  /// In en, this message translates to:
  /// **'Confirm your information to complete membership registration.'**
  String get confirm_your_information_tip;

  /// No description provided for @sample_id_card_photo.
  ///
  /// In en, this message translates to:
  /// **'Sample ID card photo'**
  String get sample_id_card_photo;

  /// No description provided for @front_id_photo_tip1.
  ///
  /// In en, this message translates to:
  /// **'Please upload a photo of the front of your ID card.'**
  String get front_id_photo_tip1;

  /// No description provided for @id_card_is_clearly_visible_tip.
  ///
  /// In en, this message translates to:
  /// **'The information on the ID card is clearly visible.'**
  String get id_card_is_clearly_visible_tip;

  /// No description provided for @continue_uploading.
  ///
  /// In en, this message translates to:
  /// **'Continue uploading'**
  String get continue_uploading;

  /// No description provided for @sample_selfie_photo.
  ///
  /// In en, this message translates to:
  /// **'Selfie example photo'**
  String get sample_selfie_photo;

  /// No description provided for @selfie_tip1.
  ///
  /// In en, this message translates to:
  /// **'Please take a clear photo that shows your face.'**
  String get selfie_tip1;

  /// No description provided for @selfie_tip2.
  ///
  /// In en, this message translates to:
  /// **'Please point the camera at your face.'**
  String get selfie_tip2;

  /// No description provided for @selfie_tip3.
  ///
  /// In en, this message translates to:
  /// **'Make sure your face is in good lighting.'**
  String get selfie_tip3;

  /// No description provided for @penting.
  ///
  /// In en, this message translates to:
  /// **'Penting'**
  String get penting;

  /// No description provided for @bank_submit_penting_content.
  ///
  /// In en, this message translates to:
  /// **'Calon anggota menyetujut untukmembayar Simpanan Pokok sebesaRp 10.000 saat menjadi Anggotadan membayar totat Simpanan Wajitsebesar Rp 5.000 per bulan'**
  String get bank_submit_penting_content;

  /// No description provided for @sure.
  ///
  /// In en, this message translates to:
  /// **'Sure'**
  String get sure;

  /// No description provided for @signature.
  ///
  /// In en, this message translates to:
  /// **'Signature'**
  String get signature;

  /// No description provided for @signature_tip.
  ///
  /// In en, this message translates to:
  /// **'Please sign your name in the blank space below.'**
  String get signature_tip;

  /// No description provided for @rewrite.
  ///
  /// In en, this message translates to:
  /// **'Rewrite'**
  String get rewrite;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @please_sign_first.
  ///
  /// In en, this message translates to:
  /// **'Please sign first.'**
  String get please_sign_first;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
