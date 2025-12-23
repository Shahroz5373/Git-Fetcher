// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepoNotifier)
const repoProvider = RepoNotifierProvider._();

final class RepoNotifierProvider
    extends $AsyncNotifierProvider<RepoNotifier, List<RepoModel>> {
  const RepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'repoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$repoNotifierHash();

  @$internal
  @override
  RepoNotifier create() => RepoNotifier();
}

String _$repoNotifierHash() => r'4282fd24c25771d05f4bd6f9fd61c955d848cc8f';

abstract class _$RepoNotifier extends $AsyncNotifier<List<RepoModel>> {
  FutureOr<List<RepoModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<RepoModel>>, List<RepoModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RepoModel>>, List<RepoModel>>,
              AsyncValue<List<RepoModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
