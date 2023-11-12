// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNewsHash() => r'58d409b1c91085b06efb9e026251df3105b895f7';

/// See also [getNews].
@ProviderFor(getNews)
final getNewsProvider = AutoDisposeFutureProvider<List<News>>.internal(
  getNews,
  name: r'getNewsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNewsRef = AutoDisposeFutureProviderRef<List<News>>;
String _$getNewsByIdHash() => r'a0164cca6b8ad17faac143f1ccfd8d7e3815ade0';

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

/// See also [getNewsById].
@ProviderFor(getNewsById)
const getNewsByIdProvider = GetNewsByIdFamily();

/// See also [getNewsById].
class GetNewsByIdFamily extends Family<AsyncValue<News>> {
  /// See also [getNewsById].
  const GetNewsByIdFamily();

  /// See also [getNewsById].
  GetNewsByIdProvider call(
    String id,
  ) {
    return GetNewsByIdProvider(
      id,
    );
  }

  @override
  GetNewsByIdProvider getProviderOverride(
    covariant GetNewsByIdProvider provider,
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
  String? get name => r'getNewsByIdProvider';
}

/// See also [getNewsById].
class GetNewsByIdProvider extends AutoDisposeFutureProvider<News> {
  /// See also [getNewsById].
  GetNewsByIdProvider(
    String id,
  ) : this._internal(
          (ref) => getNewsById(
            ref as GetNewsByIdRef,
            id,
          ),
          from: getNewsByIdProvider,
          name: r'getNewsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNewsByIdHash,
          dependencies: GetNewsByIdFamily._dependencies,
          allTransitiveDependencies:
              GetNewsByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetNewsByIdProvider._internal(
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
    FutureOr<News> Function(GetNewsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNewsByIdProvider._internal(
        (ref) => create(ref as GetNewsByIdRef),
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
  AutoDisposeFutureProviderElement<News> createElement() {
    return _GetNewsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNewsByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNewsByIdRef on AutoDisposeFutureProviderRef<News> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetNewsByIdProviderElement extends AutoDisposeFutureProviderElement<News>
    with GetNewsByIdRef {
  _GetNewsByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetNewsByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
