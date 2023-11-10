// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteering_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getVolunteeringsHash() => r'ec84b5001d7a556ee95a8707b2f903d2bff88a64';

/// See also [getVolunteerings].
@ProviderFor(getVolunteerings)
final getVolunteeringsProvider = FutureProvider<List<Volunteering>>.internal(
  getVolunteerings,
  name: r'getVolunteeringsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getVolunteeringsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetVolunteeringsRef = FutureProviderRef<List<Volunteering>>;
String _$getVolunteeringDetailsHash() =>
    r'028371acf34af8b2d28bbf7ffa1dda3116fd2bff';

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

/// See also [getVolunteeringDetails].
@ProviderFor(getVolunteeringDetails)
const getVolunteeringDetailsProvider = GetVolunteeringDetailsFamily();

/// See also [getVolunteeringDetails].
class GetVolunteeringDetailsFamily
    extends Family<AsyncValue<VolunteeringDetails>> {
  /// See also [getVolunteeringDetails].
  const GetVolunteeringDetailsFamily();

  /// See also [getVolunteeringDetails].
  GetVolunteeringDetailsProvider call(
    String id,
  ) {
    return GetVolunteeringDetailsProvider(
      id,
    );
  }

  @override
  GetVolunteeringDetailsProvider getProviderOverride(
    covariant GetVolunteeringDetailsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getVolunteeringDetailsProvider';
}

/// See also [getVolunteeringDetails].
class GetVolunteeringDetailsProvider
    extends FutureProvider<VolunteeringDetails> {
  /// See also [getVolunteeringDetails].
  GetVolunteeringDetailsProvider(
    String id,
  ) : this._internal(
          (ref) => getVolunteeringDetails(
            ref as GetVolunteeringDetailsRef,
            id,
          ),
          from: getVolunteeringDetailsProvider,
          name: r'getVolunteeringDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVolunteeringDetailsHash,
          dependencies: GetVolunteeringDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetVolunteeringDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  GetVolunteeringDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<VolunteeringDetails> Function(GetVolunteeringDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVolunteeringDetailsProvider._internal(
        (ref) => create(ref as GetVolunteeringDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<VolunteeringDetails> createElement() {
    return _GetVolunteeringDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVolunteeringDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetVolunteeringDetailsRef on FutureProviderRef<VolunteeringDetails> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetVolunteeringDetailsProviderElement
    extends FutureProviderElement<VolunteeringDetails>
    with GetVolunteeringDetailsRef {
  _GetVolunteeringDetailsProviderElement(super.provider);

  @override
  String get id => (origin as GetVolunteeringDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
