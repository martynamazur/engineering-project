// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleRepositoryHash() =>
    r'85fb357cc129c9eacba355128d9132d718df1195';

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
    r'e62dba19d25b93d16953185c3699ea787e77e699';

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
  GetScheduleForMonthProvider call(
    int year,
    int month,
  ) {
    return GetScheduleForMonthProvider(
      year,
      month,
    );
  }

  @override
  GetScheduleForMonthProvider getProviderOverride(
    covariant GetScheduleForMonthProvider provider,
  ) {
    return call(
      provider.year,
      provider.month,
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
  GetScheduleForMonthProvider(
    int year,
    int month,
  ) : this._internal(
          (ref) => getScheduleForMonth(
            ref as GetScheduleForMonthRef,
            year,
            month,
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
    r'a2f18914b77f1e9e7cfebc50be4e073f97b8aa53';

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
    r'a688bc5c352cbed46d177580e3571c6b7b887ebc';

/// See also [removeFromSchedule].
@ProviderFor(removeFromSchedule)
const removeFromScheduleProvider = RemoveFromScheduleFamily();

/// See also [removeFromSchedule].
class RemoveFromScheduleFamily extends Family<AsyncValue<void>> {
  /// See also [removeFromSchedule].
  const RemoveFromScheduleFamily();

  /// See also [removeFromSchedule].
  RemoveFromScheduleProvider call(
    int scheduleId,
  ) {
    return RemoveFromScheduleProvider(
      scheduleId,
    );
  }

  @override
  RemoveFromScheduleProvider getProviderOverride(
    covariant RemoveFromScheduleProvider provider,
  ) {
    return call(
      provider.scheduleId,
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
  RemoveFromScheduleProvider(
    int scheduleId,
  ) : this._internal(
          (ref) => removeFromSchedule(
            ref as RemoveFromScheduleRef,
            scheduleId,
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

  final int scheduleId;

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
  int get scheduleId;
}

class _RemoveFromScheduleProviderElement
    extends AutoDisposeFutureProviderElement<void> with RemoveFromScheduleRef {
  _RemoveFromScheduleProviderElement(super.provider);

  @override
  int get scheduleId => (origin as RemoveFromScheduleProvider).scheduleId;
}

String _$scheduleOutfitHash() => r'cb44f89dc72338d0b5122cb5a1d3b1f69e6ec24c';

/// See also [scheduleOutfit].
@ProviderFor(scheduleOutfit)
const scheduleOutfitProvider = ScheduleOutfitFamily();

/// See also [scheduleOutfit].
class ScheduleOutfitFamily extends Family<void> {
  /// See also [scheduleOutfit].
  const ScheduleOutfitFamily();

  /// See also [scheduleOutfit].
  ScheduleOutfitProvider call(
    Schedule schedule,
  ) {
    return ScheduleOutfitProvider(
      schedule,
    );
  }

  @override
  ScheduleOutfitProvider getProviderOverride(
    covariant ScheduleOutfitProvider provider,
  ) {
    return call(
      provider.schedule,
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
  ScheduleOutfitProvider(
    Schedule schedule,
  ) : this._internal(
          (ref) => scheduleOutfit(
            ref as ScheduleOutfitRef,
            schedule,
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
