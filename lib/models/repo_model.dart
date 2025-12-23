class RepoModel {
  final int id;
  final String name;
  final String description;
  final String language;
  final String ownerName;
  final String avatarUrl;
  final String updatedAt;
  final String htmlUrl;
  bool isFav = false;

  RepoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
    required this.ownerName,
    required this.avatarUrl,
    required this.updatedAt,
    required this.htmlUrl,
  });

  factory RepoModel.fromjson(Map<String, dynamic> json) {
    return RepoModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? 'None',
      language: json['language'] ?? 'None',
      ownerName: json['owner']['login'],
      avatarUrl: json['owner']['avatar_url'],
      updatedAt: json['updated_at'],
      htmlUrl: json['html_url'],
    );
  }
}
