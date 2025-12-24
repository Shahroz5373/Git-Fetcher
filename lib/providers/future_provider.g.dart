// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepos)
const getReposProvider = GetReposProvider._();

final class GetReposProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RepoModel>>,
          List<RepoModel>,
          FutureOr<List<RepoModel>>
        >
    with $FutureModifier<List<RepoModel>>, $FutureProvider<List<RepoModel>> {
  const GetReposProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getReposProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getReposHash();

  @$internal
  @override
  $FutureProviderElement<List<RepoModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RepoModel>> create(Ref ref) {
    return getRepos(ref);
  }
}

String _$getReposHash() => r'b8d99e857c27c781ca9cc710d2e6403431026fde';
