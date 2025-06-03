import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

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
    Locale('pl')
  ];

  /// Translation for loginHeader
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginHeader;

  /// Translation for loginFailedTitle
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailedTitle;

  /// Translation for loginFailedMessage
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get loginFailedMessage;

  /// Translation for emptyEmail
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emptyEmail;

  /// Translation for invalidEmail
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// Translation for resetPasswordHeader
  ///
  /// In en, this message translates to:
  /// **'Password reset'**
  String get resetPasswordHeader;

  /// Translation for signIn
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// Translation for settingsHeader
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsHeader;

  /// Translation for notificationSettingsHeader
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettingsHeader;

  /// Translation for privacySettingsHeader
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettingsHeader;

  /// Translation for helpAndSupportHeader
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpAndSupportHeader;

  /// Translation for accountSettingsHeader
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get accountSettingsHeader;

  /// Translation for changePasswordTitle
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordTitle;

  /// Translation for changeEmailAddress
  ///
  /// In en, this message translates to:
  /// **'Change email adress'**
  String get changeEmailAddress;

  /// Translation for deleteMyAccountTitle
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get deleteMyAccountTitle;

  /// Translation for logOutHeader
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOutHeader;

  /// Translation for deleteAccountHeader
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccountHeader;

  /// Translation for deleteAccountWarningText
  ///
  /// In en, this message translates to:
  /// **'Your account will be deleted 30 days after logging out. If you log in again within this time, your account access will be restored and the account will not be deleted.'**
  String get deleteAccountWarningText;

  /// Translation for invalidEmailAddress
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmailAddress;

  /// Translation for newEmailAddressLabel
  ///
  /// In en, this message translates to:
  /// **'New email address'**
  String get newEmailAddressLabel;

  /// Translation for changeLabel
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeLabel;

  /// Translation for registrationSuccessful
  ///
  /// In en, this message translates to:
  /// **'Registration Successful!'**
  String get registrationSuccessful;

  /// Translation for accountCreationConfirmationMessage
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully created. Please check your email to confirm your account before logging in.'**
  String get accountCreationConfirmationMessage;

  /// Translation for goToLogin
  ///
  /// In en, this message translates to:
  /// **'Go to login'**
  String get goToLogin;

  /// Translation for createAccountHeader
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountHeader;

  /// Translation for fillInformationMessage
  ///
  /// In en, this message translates to:
  /// **'Fill your information below'**
  String get fillInformationMessage;

  /// Translation for signUp
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// Translation for nameLabel
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// Translation for emailLabel
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Translation for passwordLabel
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Translation for agreeWith
  ///
  /// In en, this message translates to:
  /// **'Agree with'**
  String get agreeWith;

  /// Translation for termsAndConditions
  ///
  /// In en, this message translates to:
  /// **'Terms & Condition'**
  String get termsAndConditions;

  /// Translation for monthlyHeader
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthlyHeader;

  /// Translation for weeklyHeader
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weeklyHeader;

  /// Translation for yourOutfitsHeader
  ///
  /// In en, this message translates to:
  /// **'Your Outfits'**
  String get yourOutfitsHeader;

  /// Translation for addAnother
  ///
  /// In en, this message translates to:
  /// **'Add another'**
  String get addAnother;

  /// Translation for pickClothesHeader
  ///
  /// In en, this message translates to:
  /// **'Pick clothes'**
  String get pickClothesHeader;

  /// Translation for youDoNotOwnClothesMessages
  ///
  /// In en, this message translates to:
  /// **'You do not own any clothes'**
  String get youDoNotOwnClothesMessages;

  /// Translation for close
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Translation for next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Translation for send
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Translation for success
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// Translation for delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Translation for edit
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Translation for save
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Translation for previous
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Translation for cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Translation for add
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Translation for seasonHeader
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get seasonHeader;

  /// Translation for tagsHeader
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tagsHeader;

  /// Translation for noTagsAvailableMessage
  ///
  /// In en, this message translates to:
  /// **'No tags available'**
  String get noTagsAvailableMessage;

  /// Translation for addAnewTag
  ///
  /// In en, this message translates to:
  /// **'Add a new tag'**
  String get addAnewTag;

  /// Translation for profileHeader
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profileHeader;

  /// Translation for unknownUserHeader
  ///
  /// In en, this message translates to:
  /// **'Unknown user'**
  String get unknownUserHeader;

  /// Translation for coat
  ///
  /// In en, this message translates to:
  /// **'Coat'**
  String get coat;

  /// Translation for top
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get top;

  /// Translation for bottom
  ///
  /// In en, this message translates to:
  /// **'Bottom'**
  String get bottom;

  /// Translation for dress
  ///
  /// In en, this message translates to:
  /// **'Dress'**
  String get dress;

  /// Translation for underwear
  ///
  /// In en, this message translates to:
  /// **'Underwear'**
  String get underwear;

  /// Translation for accessories
  ///
  /// In en, this message translates to:
  /// **'Accesories'**
  String get accessories;

  /// Translation for shoes
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get shoes;

  /// Translation for newTag
  ///
  /// In en, this message translates to:
  /// **'New tag'**
  String get newTag;

  /// Translation for addTag
  ///
  /// In en, this message translates to:
  /// **'Add tag'**
  String get addTag;

  /// Translation for seasonInformationMessage
  ///
  /// In en, this message translates to:
  /// **'This outfit I can wear in ...'**
  String get seasonInformationMessage;

  /// Translation for noSeasonAvailableMessage
  ///
  /// In en, this message translates to:
  /// **'No seasons available'**
  String get noSeasonAvailableMessage;

  /// Translation for applyFilters
  ///
  /// In en, this message translates to:
  /// **'Apply filters'**
  String get applyFilters;

  /// Translation for editInformationHeader
  ///
  /// In en, this message translates to:
  /// **'Edit information'**
  String get editInformationHeader;

  /// Translation for savedOutfitMessage
  ///
  /// In en, this message translates to:
  /// **'Outfit has been saved!'**
  String get savedOutfitMessage;

  /// Translation for createAnother
  ///
  /// In en, this message translates to:
  /// **'Create another'**
  String get createAnother;

  /// Translation for redirectToOutfitGalleryMessage
  ///
  /// In en, this message translates to:
  /// **'Go to the outfit gallery'**
  String get redirectToOutfitGalleryMessage;

  /// Translation for templateHeader
  ///
  /// In en, this message translates to:
  /// **'Template'**
  String get templateHeader;

  /// Translation for createFromEmptyMessage
  ///
  /// In en, this message translates to:
  /// **'Create from empty'**
  String get createFromEmptyMessage;

  /// Translation for pickOutfitMessage
  ///
  /// In en, this message translates to:
  /// **'Pick Outfit for a day'**
  String get pickOutfitMessage;

  /// Translation for noDataToDisplayMessage
  ///
  /// In en, this message translates to:
  /// **'No data to display'**
  String get noDataToDisplayMessage;

  /// Translation for changeFolderName
  ///
  /// In en, this message translates to:
  /// **'Change folder name'**
  String get changeFolderName;

  /// Translation for deleteFolder
  ///
  /// In en, this message translates to:
  /// **'Delete folder'**
  String get deleteFolder;

  /// Translation for emptyCloset
  ///
  /// In en, this message translates to:
  /// **'Empty closet'**
  String get emptyCloset;

  /// Translation for imageNotAvailable
  ///
  /// In en, this message translates to:
  /// **'Image not available'**
  String get imageNotAvailable;

  /// No description provided for @closetHeader.
  ///
  /// In en, this message translates to:
  /// **'Closet'**
  String get closetHeader;

  /// No description provided for @addNewPieces.
  ///
  /// In en, this message translates to:
  /// **'Start adding new pieces of your outfit'**
  String get addNewPieces;

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found for'**
  String get noItemsFound;

  /// No description provided for @failedToLoadImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load image'**
  String get failedToLoadImage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
