import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({
    super.key,
    required this.articles,
  });

  final Articles articles;

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.articles.author}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffFE5722),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Text(
                '\t\t\t\t${widget.articles.title}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              widget.articles.urlToImage != null
                  ? Image.network(
                      widget.articles.urlToImage!,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      'assets/Rectangle.png',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
              const SizedBox(height: 10),
              Text(
                '\t\t\t\t${widget.articles.description}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\t\t\t\t${widget.articles.content}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  openUrl(widget.articles.url);
                },
                child: Text(
                  widget.articles.url,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('d MMM, yyyy')
                        .format(DateTime.parse(widget.articles.publishedAt))
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
