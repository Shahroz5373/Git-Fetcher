import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github_fetcher/providers/repos_provider.dart';

class FetchedRepos extends ConsumerStatefulWidget {
  const FetchedRepos({super.key});

  @override
  ConsumerState<FetchedRepos> createState() => _FetchedReposState();
}

class _FetchedReposState extends ConsumerState<FetchedRepos> {
  @override
  Widget build(BuildContext context) {
    final reposAsync = ref.watch(repoProvider);
    return reposAsync.when(
      loading: () =>
          Center(child: SpinKitChasingDots(color: Colors.blueAccent, size: 50)),
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
