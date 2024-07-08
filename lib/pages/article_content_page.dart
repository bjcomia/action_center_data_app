import 'package:flutter/material.dart';

class ArticleContent extends StatefulWidget {
  final String articleTitle;
  final String photoTitle;
  final String articleContent;

  const ArticleContent(
      {super.key,
      required this.articleTitle,
      required this.photoTitle,
      required this.articleContent});

  @override
  State<ArticleContent> createState() => _ArticleContentState();
}

class _ArticleContentState extends State<ArticleContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: const Text("Article"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Article Image
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Image.asset(
              widget.photoTitle,
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.topLeft,
            child: Text(
              widget.articleTitle,
              style: TextStyle(
                  height: 1.1,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiaryContainer),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.articleContent,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          )
        ],
      ),
    );
  }
}
