import 'package:flutter/material.dart';
import 'package:github_fetcher/models/repo_model.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class RepoCard extends StatefulWidget {
  final RepoModel repos;
  const RepoCard({super.key, required this.repos});

  @override
  State<RepoCard> createState() => _RepoCardState();
}

class _RepoCardState extends State<RepoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: GlassContainer(
          blur: 10,
          color: Colors.white.withValues(alpha: 0.8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: 0.3),
              Colors.blue.withValues(alpha: 0.4),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(20),
            //height: double.maxFinite,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image.network(
                        widget.repos.avatarUrl,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.star_border_outlined, size: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'Repo Name: ${widget.repos.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  'Owner Name: ${widget.repos.ownerName}',
                  maxLines: 2,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.28),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      'Description: ${widget.repos.description}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      '${widget.repos.language}',
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                    icon: Icon(
                      Icons.circle,
                      color: getLanguageColor(
                        language: widget.repos.language.toString(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'updatedAt:${widget.repos.updatedAt} ',
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                    icon: Icon(
                      Icons.history_outlined,
                      color: Colors.green,
                      size: 25,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color getLanguageColor({String language = 'none'}) {
  switch (language) {
    case 'Java':
      return Colors.red;
    case 'Python':
      return Colors.blue;
    case 'TypeScript':
      return Colors.cyan;
    case 'JavaScript':
      return Colors.yellow;
    case 'C++':
      return Colors.purple;
    default:
      return Colors.green;
  }
}
