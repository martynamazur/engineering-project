import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:ootd/presentation/account_settings.dart';
import '../presentation/edit_clothingitem.dart';
import '../presentation/setting_change_email_adress.dart';
import '../presentation/setting_change_password.dart';
import 'package:ootd/presentation/add_outfit_to_planer.dart';
import 'package:ootd/presentation/settings.dart';
import 'package:ootd/presentation/splash_screen.dart';
import 'package:ootd/presentation/closet_folder_overfiew.dart';
import 'package:ootd/presentation/clothing_item_overview.dart';
import 'package:ootd/presentation/login.dart';
import 'package:ootd/presentation/home.dart';
import 'package:ootd/presentation/add_clothes.dart';
import 'package:ootd/presentation/created_outfits_overfiew.dart';
import 'package:ootd/presentation/my_profile.dart';
import 'package:ootd/presentation/bottom_nav_wrapper.dart';
import 'package:ootd/presentation/filter_outfits.dart';
import 'package:ootd/presentation/registration.dart';
import 'package:ootd/presentation/registration_successful.dart';
import 'package:ootd/presentation/reset_password.dart';
import 'package:ootd/presentation/create_outfit.dart';

import '../model/clothing_item.dart';
import '../model/outfit.dart';
import '../presentation/created_outift_sucesfull.dart';
import '../presentation/choose_template.dart';
import '../presentation/outfit_overfiew.dart';
import '../presentation/pick_owned_clothes.dart';
import '../presentation/planer.dart';
import '../presentation/edit_outfit_details.dart';
import '../presentation/account_settings.dart';
import '../presentation/setting_change_email_adress.dart';
import '../presentation/setting_change_password.dart';
import '../presentation/setting_delete_account.dart';
import '../presentation/setting_email_adress_sent_confirmation.dart';
import '../presentation/setting_notifications.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: BottomNavWrapperRoute.page, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: AddClothesRoute.page),
          AutoRoute(page: CreatedOutfitsRoute.page),
          AutoRoute(page: MyProfileRoute.page),
          AutoRoute(page: PlannerRoute.page)
        ]),
        AutoRoute(page: ClosetFolderOverviewRoute.page),
        AutoRoute(page: ClothingItemOverviewRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: RegistrationSuccessfulRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: FilterRoute.page),
        AutoRoute(page: AddClothesRoute.page),
        AutoRoute(page: CreateOutfitRoute.page, path: '/create-outfit/:templateId' ),
        AutoRoute(page: CreatedOutfitSuccessfulRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: OutfitOverviewRoute.page),
        AutoRoute(page: ChooseTemplateRoute.page),
        AutoRoute(page: EditOutfitDetailsRoute.page),
        AutoRoute(page: AddOutfitToCalendarRoute.page),
        AutoRoute(page: PickOwnedClothesRoute.page),

        AutoRoute(page: AccountSettingsRoute.page),
        AutoRoute(page: SettingChangeEmailAdressRoute.page),
        AutoRoute(page: SettingChangePasswordRoute.page),
        AutoRoute(page: EmailAddressSentConfirmationRoute.page),
        AutoRoute(page: SettingDeleteAccountRoute.page),
        AutoRoute(page: SettingNotificationsRoute.page),
        AutoRoute(page: EditClothingitemRoute.page)
    
      ];
}
