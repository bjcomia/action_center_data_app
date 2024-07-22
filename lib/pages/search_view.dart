import 'package:action_center_data_app/pages/article_content_page.dart';
import 'package:action_center_data_app/tempData/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: theme.colorScheme.secondary),
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.inter(
          color: theme.colorScheme.secondary,
          fontSize: 18,
        ),
      ),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, String>> results = tempData
        .where((article) =>
            article['title']!.toLowerCase().contains(query.toLowerCase()) ||
            article['subTitle']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]['title']!),
          subtitle: Text(results[index]['subTitle']!),
          onTap: () {
            // Handle article selection
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticleContent(
                  articleTitle: results[index]['title']!,
                  photoTitle: results[index]['imageUrl']!,
                  articleContent: results[index]['subTitle']!,
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, String>> suggestions = tempData
        .where((article) =>
            article['title']!.toLowerCase().contains(query.toLowerCase()) ||
            article['subTitle']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]['title']!),
          onTap: () {
            query = suggestions[index]['title']!;
            showResults(context);
          },
        );
      },
    );
  }
}
