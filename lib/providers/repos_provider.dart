import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:github_fetcher/models/repo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repos_provider.g.dart';

@riverpod
class RepoNotifier extends _$RepoNotifier {
  @override
  Future<List<RepoModel>> build() async {
    return getRepos();
  }

  Future<List<RepoModel>> getRepos() async {
    final pat = dotenv.env['GITHUB_PAT'];
    if (pat == null || pat.isEmpty) {
      throw Exception(
        'GitHub PAT not configured. Please create a .env file with GITHUB_PAT=your_token',
      );
    }

    // ten hours time
    DateTime nowUtc = DateTime.now().toUtc();
    DateTime ten = nowUtc.subtract(Duration(hours: 10));
    String time = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(ten);

    // query parameters
    const languages = ['Python', 'JavaScript', 'Java', 'C++', 'TypeScript'];
    final languageQuery = languages.map((l) => 'language:$l').join('+');
    final url = Uri.https('api.github.com', '/search/repositories', {
      'q': 'pushed:>=$time+$languageQuery',
      'sort': 'updated',
      'order': 'desc',
      'per_page': '20',
    });

    // authentication endpoints in url
    final headers = {
      'Authorization': 'token $pat',
      'Accept': 'application/vnd.github.v3+json',
    };

    // fetches data from api
    final response = await http.get(url, headers: headers);

    // extracting data from json
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> items = data['items'];
      final List<RepoModel> fetchedRepos = items
          .map((d) => RepoModel.fromJson(d))
          .toList();

      return fetchedRepos; // returns the fetched/cleaned 20 repos
    }
    // returns the error
    else {
      throw Exception('Failed to load repos: ${response.statusCode}');
    }
  }
}
