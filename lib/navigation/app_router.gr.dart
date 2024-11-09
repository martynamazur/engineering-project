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
    AddClothesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddClothesScreen(),
      );
    },
    AddOutfitToCallendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddOutfitToCallendarScreen(),
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
    CreatedOutfitsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreatedOutfitsScreen(),
      );
    },
    CreatedOutiftSucesfullRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreatedOutiftSucesfullScreen(),
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
          outfit: args.outfit,
        ),
      );
    },
    PlannerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlannerScreen(),
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
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(key: args.key),
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
/// [AddOutfitToCallendarScreen]
class AddOutfitToCallendarRoute extends PageRouteInfo<void> {
  const AddOutfitToCallendarRoute({List<PageRouteInfo>? children})
      : super(
          AddOutfitToCallendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddOutfitToCallendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [CreatedOutfitsScreen]
class CreatedOutfitsRoute extends PageRouteInfo<void> {
  const CreatedOutfitsRoute({List<PageRouteInfo>? children})
      : super(
          CreatedOutfitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatedOutfitsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatedOutiftSucesfullScreen]
class CreatedOutiftSucesfullRoute extends PageRouteInfo<void> {
  const CreatedOutiftSucesfullRoute({List<PageRouteInfo>? children})
      : super(
          CreatedOutiftSucesfullRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatedOutiftSucesfullRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
    required Outfit outfit,
    List<PageRouteInfo>? children,
  }) : super(
          OutfitOverviewRoute.name,
          args: OutfitOverviewRouteArgs(
            key: key,
            outfit: outfit,
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
    required this.outfit,
  });

  final Key? key;

  final Outfit outfit;

  @override
  String toString() {
    return 'OutfitOverviewRouteArgs{key: $key, outfit: $outfit}';
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
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
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
