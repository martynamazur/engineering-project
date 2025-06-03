// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleRepositoryHash() =>
    r'0961b45f21f081fbd866b70d750eac53db83f9a1';

/// See also [scheduleRepository].
@ProviderFor(scheduleRepository)
final scheduleRepositoryProvider =
    AutoDisposeProvider<ScheduleRepository>.internal(
  scheduleRepository,
  name: r'scheduleRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ScheduleRepositoryRef = AutoDisposeProviderRef<ScheduleRepository>;
String _$getScheduleForMonthHash() =>
    r'46f70cdc06ed25e5b2a528c7f52ea703fe117850';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getScheduleForMonth].
@ProviderFor(getScheduleForMonth)
const getScheduleForMonthProvider = GetScheduleForMonthFamily();

/// See also [getScheduleForMonth].
class GetScheduleForMonthFamily extends Family<AsyncValue<List<Schedule>>> {
  /// See also [getScheduleForMonth].
  const GetScheduleForMonthFamily();

  /// See also [getScheduleForMonth].
  GetScheduleForMonthProvider call({
    required int year,
    required int month,
  }) {
    return GetScheduleForMonthProvider(
      year: year,
      month: month,
    );
  }

  @override
  GetScheduleForMonthProvider getProviderOverride(
    covariant GetScheduleForMonthProvider provider,
  ) {
    return call(
      year: provider.year,
      month: provider.month,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getScheduleForMonthProvider';
}

/// See also [getScheduleForMonth].
class GetScheduleForMonthProvider
    extends AutoDisposeFutureProvider<List<Schedule>> {
  /// See also [getScheduleForMonth].
  GetScheduleForMonthProvider({
    required int year,
    required int month,
  }) : this._internal(
          (ref) => getScheduleForMonth(
            ref as GetScheduleForMonthRef,
            year: year,
            month: month,
          ),
          from: getScheduleForMonthProvider,
          name: r'getScheduleForMonthProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getScheduleForMonthHash,
          dependencies: GetScheduleForMonthFamily._dependencies,
          allTransitiveDependencies:
              GetScheduleForMonthFamily._allTransitiveDependencies,
          year: year,
          month: month,
        );

  GetScheduleForMonthProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
    required this.month,
  }) : super.internal();

  final int year;
  final int month;

  @override
  Override overrideWith(
    FutureOr<List<Schedule>> Function(GetScheduleForMonthRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetScheduleForMonthProvider._internal(
        (ref) => create(ref as GetScheduleForMonthRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
        month: month,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Schedule>> createElement() {
    return _GetScheduleForMonthProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetScheduleForMonthProvider &&
        other.year == year &&
        other.month == month;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetScheduleForMonthRef on AutoDisposeFutureProviderRef<List<Schedule>> {
  /// The parameter `year` of this provider.
  int get year;

  /// The parameter `month` of this provider.
  int get month;
}

class _GetScheduleForMonthProviderElement
    extends AutoDisposeFutureProviderElement<List<Schedule>>
    with GetScheduleForMonthRef {
  _GetScheduleForMonthProviderElement(super.provider);

  @override
  int get year => (origin as GetScheduleForMonthProvider).year;
  @override
  int get month => (origin as GetScheduleForMonthProvider).month;
}

String _$getScheduleForWeekHash() =>
    r'0229b862fe44a391ea4642b5e7e7598738793fe6';

/// See also [getScheduleForWeek].
@ProviderFor(getScheduleForWeek)
final getScheduleForWeekProvider =
    AutoDisposeFutureProvider<List<Schedule>>.internal(
  getScheduleForWeek,
  name: r'getScheduleForWeekProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getScheduleForWeekHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetScheduleForWeekRef = AutoDisposeFutureProviderRef<List<Schedule>>;
String _$removeFromScheduleHash() =>
    r'fc278f812e79fa4039805f2a50ec93368bb13cc0';

/// See also [removeFromSchedule].
@ProviderFor(removeFromSchedule)
const removeFromScheduleProvider = RemoveFromScheduleFamily();

/// See also [removeFromSchedule].
class RemoveFromScheduleFamily extends Family<AsyncValue<void>> {
  /// See also [removeFromSchedule].
  const RemoveFromScheduleFamily();

  /// See also [removeFromSchedule].
  RemoveFromScheduleProvider call({
    required String scheduleId,
  }) {
    return RemoveFromScheduleProvider(
      scheduleId: scheduleId,
    );
  }

  @override
  RemoveFromScheduleProvider getProviderOverride(
    covariant RemoveFromScheduleProvider provider,
  ) {
    return call(
      scheduleId: provider.scheduleId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeFromScheduleProvider';
}

/// See also [removeFromSchedule].
class RemoveFromScheduleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removeFromSchedule].
  RemoveFromScheduleProvider({
    required String scheduleId,
  }) : this._internal(
          (ref) => removeFromSchedule(
            ref as RemoveFromScheduleRef,
            scheduleId: scheduleId,
          ),
          from: removeFromScheduleProvider,
          name: r'removeFromScheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeFromScheduleHash,
          dependencies: RemoveFromScheduleFamily._dependencies,
          allTransitiveDependencies:
              RemoveFromScheduleFamily._allTransitiveDependencies,
          scheduleId: scheduleId,
        );

  RemoveFromScheduleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scheduleId,
  }) : super.internal();

  final String scheduleId;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveFromScheduleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveFromScheduleProvider._internal(
        (ref) => create(ref as RemoveFromScheduleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scheduleId: scheduleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveFromScheduleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveFromScheduleProvider &&
        other.scheduleId == scheduleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scheduleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveFromScheduleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `scheduleId` of this provider.
  String get scheduleId;
}

class _RemoveFromScheduleProviderElement
    extends AutoDisposeFutureProviderElement<void> with RemoveFromScheduleRef {
  _RemoveFromScheduleProviderElement(super.provider);

  @override
  String get scheduleId => (origin as RemoveFromScheduleProvider).scheduleId;
}

String _$scheduleOutfitHash() => r'4f3fd78cc82f96af889bccc5205f802a52597fe5';

/// See also [scheduleOutfit].
@ProviderFor(scheduleOutfit)
const scheduleOutfitProvider = ScheduleOutfitFamily();

/// See also [scheduleOutfit].
class ScheduleOutfitFamily extends Family<void> {
  /// See also [scheduleOutfit].
  const ScheduleOutfitFamily();

  /// See also [scheduleOutfit].
  ScheduleOutfitProvider call({
    required Schedule schedule,
  }) {
    return ScheduleOutfitProvider(
      schedule: schedule,
    );
  }

  @override
  ScheduleOutfitProvider getProviderOverride(
    covariant ScheduleOutfitProvider provider,
  ) {
    return call(
      schedule: provider.schedule,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scheduleOutfitProvider';
}

/// See also [scheduleOutfit].
class ScheduleOutfitProvider extends AutoDisposeProvider<void> {
  /// See also [scheduleOutfit].
  ScheduleOutfitProvider({
    required Schedule schedule,
  }) : this._internal(
          (ref) => scheduleOutfit(
            ref as ScheduleOutfitRef,
            schedule: schedule,
          ),
          from: scheduleOutfitProvider,
          name: r'scheduleOutfitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleOutfitHash,
          dependencies: ScheduleOutfitFamily._dependencies,
          allTransitiveDependencies:
              ScheduleOutfitFamily._allTransitiveDependencies,
          schedule: schedule,
        );

  ScheduleOutfitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.schedule,
  }) : super.internal();

  final Schedule schedule;

  @override
  Override overrideWith(
    void Function(ScheduleOutfitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleOutfitProvider._internal(
        (ref) => create(ref as ScheduleOutfitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        schedule: schedule,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _ScheduleOutfitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleOutfitProvider && other.schedule == schedule;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schedule.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScheduleOutfitRef on AutoDisposeProviderRef<void> {
  /// The parameter `schedule` of this provider.
  Schedule get schedule;
}

class _ScheduleOutfitProviderElement extends AutoDisposeProviderElement<void>
    with ScheduleOutfitRef {
  _ScheduleOutfitProviderElement(super.provider);

  @override
  Schedule get schedule => (origin as ScheduleOutfitProvider).schedule;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
