// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<AccountSettingsRouteArgs>(
          orElse: () => const AccountSettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AccountSettingsScreen(key: args.key),
      );
    },
    AddClothesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddClothesScreen(),
      );
    },
    AddOutfitToCalendarRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AddOutfitToCalendarRouteArgs>(
          orElse: () => AddOutfitToCalendarRouteArgs(
              selectedDate: pathParams.getString('selectedDate')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddOutfitToCalendarScreen(
          key: args.key,
          selectedDate: args.selectedDate,
        ),
      );
    },
    BottomNavWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavWrapperScreen(),
      );
    },
    ChooseTemplateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseTemplateScreen(),
      );
    },
    ClosetFolderOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<ClosetFolderOverviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClosetFolderOverviewScreen(
          args.folderId,
          key: args.key,
        ),
      );
    },
    ClothingItemOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<ClothingItemOverviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClothingItemOverviewScreen(
          args.clothingItem,
          key: args.key,
        ),
      );
    },
    CreateOutfitRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateOutfitRouteArgs>(
          orElse: () => CreateOutfitRouteArgs(
              templateId: pathParams.getInt('templateId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateOutfitScreen(
          templateId: args.templateId,
          key: args.key,
        ),
      );
    },
    CreatedOutfitSuccessfulRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreatedOutfitSuccessfulScreen(),
      );
    },
    CreatedOutfitsRoute.name: (routeData) {
      final args = routeData.argsAs<CreatedOutfitsRouteArgs>(
          orElse: () => const CreatedOutfitsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreatedOutfitsScreen(key: args.key),
      );
    },
    EditClothingitemRoute.name: (routeData) {
      final args = routeData.argsAs<EditClothingitemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditClothingitemScreen(
          key: args.key,
          clothingItem: args.clothingItem,
        ),
      );
    },
    EditOutfitDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EditOutfitDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditOutfitDetailsScreen(
          args.outfit,
          key: args.key,
        ),
      );
    },
    EmailAddressSentConfirmationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmailAddressSentConfirmationScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilterScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyProfileScreen(),
      );
    },
    OutfitOverviewRoute.name: (routeData) {
      final args = routeData.argsAs<OutfitOverviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OutfitOverviewScreen(
          key: args.key,
          outfitId: args.outfitId,
        ),
      );
    },
    PickOwnedClothesRoute.name: (routeData) {
      final args = routeData.argsAs<PickOwnedClothesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickOwnedClothesScreen(
          args.folderId,
          key: args.key,
        ),
      );
    },
    PlannerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlannerScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationScreen(),
      );
    },
    RegistrationSuccessfulRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationSuccessfulScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordScreen(),
      );
    },
    SettingChangeEmailAddressRoute.name: (routeData) {
      final args = routeData.argsAs<SettingChangeEmailAddressRouteArgs>(
          orElse: () => const SettingChangeEmailAddressRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingChangeEmailAddressScreen(key: args.key),
      );
    },
    SettingChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingChangePasswordScreen(),
      );
    },
    SettingDeleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingDeleteAccountScreen(),
      );
    },
    SettingNotificationsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingNotificationsRouteArgs>(
          orElse: () => const SettingNotificationsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingNotificationsScreen(key: args.key),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountSettingsScreen]
class AccountSettingsRoute extends PageRouteInfo<AccountSettingsRouteArgs> {
  AccountSettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AccountSettingsRoute.name,
          args: AccountSettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AccountSettingsRoute';

  static const PageInfo<AccountSettingsRouteArgs> page =
      PageInfo<AccountSettingsRouteArgs>(name);
}

class AccountSettingsRouteArgs {
  const AccountSettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AccountSettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AddClothesScreen]
class AddClothesRoute extends PageRouteInfo<void> {
  const AddClothesRoute({List<PageRouteInfo>? children})
      : super(
          AddClothesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddClothesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddOutfitToCalendarScreen]
class AddOutfitToCalendarRoute
    extends PageRouteInfo<AddOutfitToCalendarRouteArgs> {
  AddOutfitToCalendarRoute({
    Key? key,
    required String selectedDate,
    List<PageRouteInfo>? children,
  }) : super(
          AddOutfitToCalendarRoute.name,
          args: AddOutfitToCalendarRouteArgs(
            key: key,
            selectedDate: selectedDate,
          ),
          rawPathParams: {'selectedDate': selectedDate},
          initialChildren: children,
        );

  static const String name = 'AddOutfitToCalendarRoute';

  static const PageInfo<AddOutfitToCalendarRouteArgs> page =
      PageInfo<AddOutfitToCalendarRouteArgs>(name);
}

class AddOutfitToCalendarRouteArgs {
  const AddOutfitToCalendarRouteArgs({
    this.key,
    required this.selectedDate,
  });

  final Key? key;

  final String selectedDate;

  @override
  String toString() {
    return 'AddOutfitToCalendarRouteArgs{key: $key, selectedDate: $selectedDate}';
  }
}

/// generated route for
/// [BottomNavWrapperScreen]
class BottomNavWrapperRoute extends PageRouteInfo<void> {
  const BottomNavWrapperRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseTemplateScreen]
class ChooseTemplateRoute extends PageRouteInfo<void> {
  const ChooseTemplateRoute({List<PageRouteInfo>? children})
      : super(
          ChooseTemplateRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseTemplateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClosetFolderOverviewScreen]
class ClosetFolderOverviewRoute
    extends PageRouteInfo<ClosetFolderOverviewRouteArgs> {
  ClosetFolderOverviewRoute({
    required int folderId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ClosetFolderOverviewRoute.name,
          args: ClosetFolderOverviewRouteArgs(
            folderId: folderId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ClosetFolderOverviewRoute';

  static const PageInfo<ClosetFolderOverviewRouteArgs> page =
      PageInfo<ClosetFolderOverviewRouteArgs>(name);
}

class ClosetFolderOverviewRouteArgs {
  const ClosetFolderOverviewRouteArgs({
    required this.folderId,
    this.key,
  });

  final int folderId;

  final Key? key;

  @override
  String toString() {
    return 'ClosetFolderOverviewRouteArgs{folderId: $folderId, key: $key}';
  }
}

/// generated route for
/// [ClothingItemOverviewScreen]
class ClothingItemOverviewRoute
    extends PageRouteInfo<ClothingItemOverviewRouteArgs> {
  ClothingItemOverviewRoute({
    required ClothingItem clothingItem,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ClothingItemOverviewRoute.name,
          args: ClothingItemOverviewRouteArgs(
            clothingItem: clothingItem,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ClothingItemOverviewRoute';

  static const PageInfo<ClothingItemOverviewRouteArgs> page =
      PageInfo<ClothingItemOverviewRouteArgs>(name);
}

class ClothingItemOverviewRouteArgs {
  const ClothingItemOverviewRouteArgs({
    required this.clothingItem,
    this.key,
  });

  final ClothingItem clothingItem;

  final Key? key;

  @override
  String toString() {
    return 'ClothingItemOverviewRouteArgs{clothingItem: $clothingItem, key: $key}';
  }
}

/// generated route for
/// [CreateOutfitScreen]
class CreateOutfitRoute extends PageRouteInfo<CreateOutfitRouteArgs> {
  CreateOutfitRoute({
    required int templateId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateOutfitRoute.name,
          args: CreateOutfitRouteArgs(
            templateId: templateId,
            key: key,
          ),
          rawPathParams: {'templateId': templateId},
          initialChildren: children,
        );

  static const String name = 'CreateOutfitRoute';

  static const PageInfo<CreateOutfitRouteArgs> page =
      PageInfo<CreateOutfitRouteArgs>(name);
}

class CreateOutfitRouteArgs {
  const CreateOutfitRouteArgs({
    required this.templateId,
    this.key,
  });

  final int templateId;

  final Key? key;

  @override
  String toString() {
    return 'CreateOutfitRouteArgs{templateId: $templateId, key: $key}';
  }
}

/// generated route for
/// [CreatedOutfitSuccessfulScreen]
class CreatedOutfitSuccessfulRoute extends PageRouteInfo<void> {
  const CreatedOutfitSuccessfulRoute({List<PageRouteInfo>? children})
      : super(
          CreatedOutfitSuccessfulRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatedOutfitSuccessfulRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatedOutfitsScreen]
class CreatedOutfitsRoute extends PageRouteInfo<CreatedOutfitsRouteArgs> {
  CreatedOutfitsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreatedOutfitsRoute.name,
          args: CreatedOutfitsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreatedOutfitsRoute';

  static const PageInfo<CreatedOutfitsRouteArgs> page =
      PageInfo<CreatedOutfitsRouteArgs>(name);
}

class CreatedOutfitsRouteArgs {
  const CreatedOutfitsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreatedOutfitsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EditClothingitemScreen]
class EditClothingitemRoute extends PageRouteInfo<EditClothingitemRouteArgs> {
  EditClothingitemRoute({
    Key? key,
    required ClothingItem clothingItem,
    List<PageRouteInfo>? children,
  }) : super(
          EditClothingitemRoute.name,
          args: EditClothingitemRouteArgs(
            key: key,
            clothingItem: clothingItem,
          ),
          initialChildren: children,
        );

  static const String name = 'EditClothingitemRoute';

  static const PageInfo<EditClothingitemRouteArgs> page =
      PageInfo<EditClothingitemRouteArgs>(name);
}

class EditClothingitemRouteArgs {
  const EditClothingitemRouteArgs({
    this.key,
    required this.clothingItem,
  });

  final Key? key;

  final ClothingItem clothingItem;

  @override
  String toString() {
    return 'EditClothingitemRouteArgs{key: $key, clothingItem: $clothingItem}';
  }
}

/// generated route for
/// [EditOutfitDetailsScreen]
class EditOutfitDetailsRoute extends PageRouteInfo<EditOutfitDetailsRouteArgs> {
  EditOutfitDetailsRoute({
    required Outfit outfit,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditOutfitDetailsRoute.name,
          args: EditOutfitDetailsRouteArgs(
            outfit: outfit,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditOutfitDetailsRoute';

  static const PageInfo<EditOutfitDetailsRouteArgs> page =
      PageInfo<EditOutfitDetailsRouteArgs>(name);
}

class EditOutfitDetailsRouteArgs {
  const EditOutfitDetailsRouteArgs({
    required this.outfit,
    this.key,
  });

  final Outfit outfit;

  final Key? key;

  @override
  String toString() {
    return 'EditOutfitDetailsRouteArgs{outfit: $outfit, key: $key}';
  }
}

/// generated route for
/// [EmailAddressSentConfirmationScreen]
class EmailAddressSentConfirmationRoute extends PageRouteInfo<void> {
  const EmailAddressSentConfirmationRoute({List<PageRouteInfo>? children})
      : super(
          EmailAddressSentConfirmationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailAddressSentConfirmationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FilterScreen]
class FilterRoute extends PageRouteInfo<void> {
  const FilterRoute({List<PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyProfileScreen]
class MyProfileRoute extends PageRouteInfo<void> {
  const MyProfileRoute({List<PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OutfitOverviewScreen]
class OutfitOverviewRoute extends PageRouteInfo<OutfitOverviewRouteArgs> {
  OutfitOverviewRoute({
    Key? key,
    required int outfitId,
    List<PageRouteInfo>? children,
  }) : super(
          OutfitOverviewRoute.name,
          args: OutfitOverviewRouteArgs(
            key: key,
            outfitId: outfitId,
          ),
          initialChildren: children,
        );

  static const String name = 'OutfitOverviewRoute';

  static const PageInfo<OutfitOverviewRouteArgs> page =
      PageInfo<OutfitOverviewRouteArgs>(name);
}

class OutfitOverviewRouteArgs {
  const OutfitOverviewRouteArgs({
    this.key,
    required this.outfitId,
  });

  final Key? key;

  final int outfitId;

  @override
  String toString() {
    return 'OutfitOverviewRouteArgs{key: $key, outfitId: $outfitId}';
  }
}

/// generated route for
/// [PickOwnedClothesScreen]
class PickOwnedClothesRoute extends PageRouteInfo<PickOwnedClothesRouteArgs> {
  PickOwnedClothesRoute({
    required int folderId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PickOwnedClothesRoute.name,
          args: PickOwnedClothesRouteArgs(
            folderId: folderId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PickOwnedClothesRoute';

  static const PageInfo<PickOwnedClothesRouteArgs> page =
      PageInfo<PickOwnedClothesRouteArgs>(name);
}

class PickOwnedClothesRouteArgs {
  const PickOwnedClothesRouteArgs({
    required this.folderId,
    this.key,
  });

  final int folderId;

  final Key? key;

  @override
  String toString() {
    return 'PickOwnedClothesRouteArgs{folderId: $folderId, key: $key}';
  }
}

/// generated route for
/// [PlannerScreen]
class PlannerRoute extends PageRouteInfo<void> {
  const PlannerRoute({List<PageRouteInfo>? children})
      : super(
          PlannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlannerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationSuccessfulScreen]
class RegistrationSuccessfulRoute extends PageRouteInfo<void> {
  const RegistrationSuccessfulRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationSuccessfulRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationSuccessfulRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingChangeEmailAddressScreen]
class SettingChangeEmailAddressRoute
    extends PageRouteInfo<SettingChangeEmailAddressRouteArgs> {
  SettingChangeEmailAddressRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingChangeEmailAddressRoute.name,
          args: SettingChangeEmailAddressRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingChangeEmailAddressRoute';

  static const PageInfo<SettingChangeEmailAddressRouteArgs> page =
      PageInfo<SettingChangeEmailAddressRouteArgs>(name);
}

class SettingChangeEmailAddressRouteArgs {
  const SettingChangeEmailAddressRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingChangeEmailAddressRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SettingChangePasswordScreen]
class SettingChangePasswordRoute extends PageRouteInfo<void> {
  const SettingChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          SettingChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingDeleteAccountScreen]
class SettingDeleteAccountRoute extends PageRouteInfo<void> {
  const SettingDeleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          SettingDeleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingDeleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingNotificationsScreen]
class SettingNotificationsRoute
    extends PageRouteInfo<SettingNotificationsRouteArgs> {
  SettingNotificationsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingNotificationsRoute.name,
          args: SettingNotificationsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingNotificationsRoute';

  static const PageInfo<SettingNotificationsRouteArgs> page =
      PageInfo<SettingNotificationsRouteArgs>(name);
}

class SettingNotificationsRouteArgs {
  const SettingNotificationsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingNotificationsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
