import 'package:action_center_data_app/pages/article_content_page.dart';
import 'package:action_center_data_app/tempData/dummy_data.dart';
import 'package:flutter/material.dart';

class ArticleMenu extends StatefulWidget {
  const ArticleMenu({
    super.key,
});

  @override
  State<ArticleMenu> createState() => _ArticleMenuState();
}

class _ArticleMenuState extends State<ArticleMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: Text(
          "Articles",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int index = 0; index < tempData.length; index++)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ArticleContent(
                            articleTitle: "${tempData[index]["title"]}",
                            photoTitle: "${tempData[index]["imageUrl"]}",
                            articleContent: "${tempData[index]["subTitle"]}");
                      },
                    ),
                  );
                },
                child: Container(
                  height: 270,
                  margin: const EdgeInsets.only(
                      top: 5, right: 10, left: 10, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: const Offset(2.5, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                    "${tempData[index]["imageUrl"]}"),
                                fit: BoxFit.fill)),
                        width: double.infinity,
                        height: 205,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "${tempData[index]["title"]}",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
