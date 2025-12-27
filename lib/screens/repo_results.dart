import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github_fetcher/providers/future_provider.dart';
import 'package:github_fetcher/screens/repo_card.dart';

class FetchedRepos extends ConsumerStatefulWidget {
  const FetchedRepos({super.key});

  @override
  ConsumerState<FetchedRepos> createState() => _FetchedReposState();
}

class _FetchedReposState extends ConsumerState<FetchedRepos> {
  @override
  Widget build(BuildContext context) {
    final reposAsync = ref.watch(getReposProvider);
    return Scaffold(
      body: reposAsync.when(
        //loading bar
        loading: () => Center(
          child: SpinKitChasingDots(color: Colors.blueAccent, size: 50),
        ),

        error: (error, stackTrace) => Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Error :$error',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        data: (data) => data.isEmpty
            ? Center(child: Text('No repositories found'))
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final repo = data[index];
                  return RepoCard(repos: repo);
                },
              ),
      ),
    );
  }
}
