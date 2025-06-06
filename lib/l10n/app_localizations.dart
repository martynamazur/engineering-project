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

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

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

  /// No description provided for @signUpFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed'**
  String get signUpFailed;

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

  /// No description provided for @seasonSubheader.
  ///
  /// In en, this message translates to:
  /// **'Pick appropriate seasons'**
  String get seasonSubheader;

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

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @removeFromFolderTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove from the folder'**
  String get removeFromFolderTitle;

  /// No description provided for @removeFromFolderContent.
  ///
  /// In en, this message translates to:
  /// **'This action will be permanent and cannot be undone.'**
  String get removeFromFolderContent;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @deleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'This action will be permanent and cannot be undone.'**
  String get deleteConfirmation;

  /// No description provided for @changeFolderNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Folder Name'**
  String get changeFolderNameTitle;

  /// No description provided for @enterNewFolderName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the new folder name:'**
  String get enterNewFolderName;

  /// No description provided for @folderNameHint.
  ///
  /// In en, this message translates to:
  /// **'Folder Name'**
  String get folderNameHint;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @changeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Folder name changed successfully.'**
  String get changeSuccess;

  /// No description provided for @changeFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to change folder name. Please try again.'**
  String get changeFailure;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategory;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @outerwear.
  ///
  /// In en, this message translates to:
  /// **'Outerwear'**
  String get outerwear;

  /// No description provided for @topwear.
  ///
  /// In en, this message translates to:
  /// **'Topwear'**
  String get topwear;

  /// No description provided for @bottomwear.
  ///
  /// In en, this message translates to:
  /// **'Bottomwear'**
  String get bottomwear;

  /// No description provided for @dresses.
  ///
  /// In en, this message translates to:
  /// **'Dresses & jumpsuits'**
  String get dresses;

  /// No description provided for @doYouWantToDelete.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete?'**
  String get doYouWantToDelete;

  /// No description provided for @deleteFolderSuccess.
  ///
  /// In en, this message translates to:
  /// **'Folder deleted successfully.'**
  String get deleteFolderSuccess;

  /// No description provided for @deleteFolderFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete the folder. Please try again.'**
  String get deleteFolderFailure;

  /// No description provided for @removeClothingSuccess.
  ///
  /// In en, this message translates to:
  /// **'Item removed from folder.'**
  String get removeClothingSuccess;

  /// No description provided for @removeClothingFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove item. Please try again.'**
  String get removeClothingFailure;

  /// No description provided for @addClothingSuccess.
  ///
  /// In en, this message translates to:
  /// **'Item successfully added to the folder.'**
  String get addClothingSuccess;

  /// No description provided for @addClothingFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to add item to the folder. Please try again.'**
  String get addClothingFailure;

  /// No description provided for @saveOutfitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Outfit saved successfully.'**
  String get saveOutfitSuccess;

  /// No description provided for @saveOutfitFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to save outfit. Please try again.'**
  String get saveOutfitFailure;

  /// No description provided for @deleteOutfitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your outfit has been removed.'**
  String get deleteOutfitSuccess;

  /// No description provided for @deleteOutfitFailure.
  ///
  /// In en, this message translates to:
  /// **'Oops! Couldn’t delete the outfit. Try again.'**
  String get deleteOutfitFailure;

  /// No description provided for @logoutSuccess.
  ///
  /// In en, this message translates to:
  /// **'You have been logged out successfully.'**
  String get logoutSuccess;

  /// No description provided for @logoutFailure.
  ///
  /// In en, this message translates to:
  /// **'Logout failed. Please try again.'**
  String get logoutFailure;

  /// No description provided for @areYouNewHere.
  ///
  /// In en, this message translates to:
  /// **'Are you new here?'**
  String get areYouNewHere;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAnAccount;

  /// No description provided for @confirmationEmailDescription.
  ///
  /// In en, this message translates to:
  /// **'Click the link in the email to verify your new email address. If you don’t see the email, check your spam folder.'**
  String get confirmationEmailDescription;

  /// No description provided for @resetPasswordInstruction.
  ///
  /// In en, this message translates to:
  /// **'Enter the email address you used when you joined and we\'ll send you instructions to reset your password.'**
  String get resetPasswordInstruction;

  /// No description provided for @resetPasswordConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'If registered, you\'ll receive an email shortly with password reset instructions. Please check your inbox and spam folder.'**
  String get resetPasswordConfirmationMessage;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get addPhoto;

  /// No description provided for @choosePhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose photo'**
  String get choosePhoto;

  /// No description provided for @noImageSelected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get noImageSelected;

  /// No description provided for @pickCategoryHeadline.
  ///
  /// In en, this message translates to:
  /// **'Pick category'**
  String get pickCategoryHeadline;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @findFasterLater.
  ///
  /// In en, this message translates to:
  /// **'It’ll be easier to find what you’re looking for later.'**
  String get findFasterLater;

  /// No description provided for @addTagHint.
  ///
  /// In en, this message translates to:
  /// **'Tap to add a tag'**
  String get addTagHint;

  /// No description provided for @emptyTagField.
  ///
  /// In en, this message translates to:
  /// **'This field can\'t be empty'**
  String get emptyTagField;

  /// No description provided for @invalidTag.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid tag'**
  String get invalidTag;

  /// No description provided for @passwordRuleMinLength.
  ///
  /// In en, this message translates to:
  /// **'Minimum of 6 characters'**
  String get passwordRuleMinLength;

  /// No description provided for @passwordRuleUppercase.
  ///
  /// In en, this message translates to:
  /// **'At least one uppercase letter (A-Z)'**
  String get passwordRuleUppercase;

  /// No description provided for @passwordRuleLowercase.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase letter (a-z)'**
  String get passwordRuleLowercase;

  /// No description provided for @passwordRuleSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'At least one special character (e.g., !, @, #, \\\$)'**
  String get passwordRuleSpecialChar;

  /// No description provided for @scheduleSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Outfit scheduled'**
  String get scheduleSuccessTitle;

  /// No description provided for @scheduleSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your outfit has been successfully scheduled.'**
  String get scheduleSuccessMessage;

  /// No description provided for @scheduleErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get scheduleErrorTitle;

  /// No description provided for @scheduleErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t schedule your outfit. Please try again later.'**
  String get scheduleErrorMessage;

  /// No description provided for @outfits.
  ///
  /// In en, this message translates to:
  /// **'Outfits'**
  String get outfits;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @errorGeneralMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGeneralMessage;

  /// No description provided for @addNewTag.
  ///
  /// In en, this message translates to:
  /// **'Add new tag'**
  String get addNewTag;

  /// No description provided for @enterNewTag.
  ///
  /// In en, this message translates to:
  /// **'Enter new tag'**
  String get enterNewTag;

  /// No description provided for @updateOutfitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Outfit updated successfully.'**
  String get updateOutfitSuccess;

  /// No description provided for @updateOutfitFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to update outfit. Please try again.'**
  String get updateOutfitFailure;

  /// No description provided for @filtr.
  ///
  /// In en, this message translates to:
  /// **'Filtr'**
  String get filtr;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @enterOldAndNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your old and then new password'**
  String get enterOldAndNewPassword;

  /// No description provided for @passwordRequirements.
  ///
  /// In en, this message translates to:
  /// **'Password Requirements'**
  String get passwordRequirements;

  /// No description provided for @consentRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Consent Required'**
  String get consentRequiredTitle;

  /// No description provided for @consentRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms and conditions to register.'**
  String get consentRequiredMessage;

  /// No description provided for @signupFailed.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed. Please try again later.'**
  String get signupFailed;

  /// No description provided for @createNewFolderTitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new folder'**
  String get createNewFolderTitle;

  /// No description provided for @emptyFolder.
  ///
  /// In en, this message translates to:
  /// **'Empty folder'**
  String get emptyFolder;

  /// No description provided for @notificationDescription.
  ///
  /// In en, this message translates to:
  /// **'Turn all app notifications on/off'**
  String get notificationDescription;

  /// No description provided for @removeFromScheduleSuccess.
  ///
  /// In en, this message translates to:
  /// **'Successfully removed from schedule.'**
  String get removeFromScheduleSuccess;

  /// No description provided for @removeFromScheduleFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove from schedule. Please try again.'**
  String get removeFromScheduleFailure;

  /// No description provided for @emptyPassword.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get emptyPassword;

  /// No description provided for @accountExistsMessage.
  ///
  /// In en, this message translates to:
  /// **'An account with this email already exists. Please use a different email or log in.\',\n'**
  String get accountExistsMessage;

  /// No description provided for @passwordResetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset link has been sent to your email.'**
  String get passwordResetEmailSent;
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
