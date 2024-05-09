import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/api/api_const.dart';
import 'package:news_app/components/custom_card.dart';
import 'package:news_app/models/top_headlines_model.dart';
import 'package:news_app/pages/home_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TopHeadlinesModel? topHeadlinesModel;
  Future<void> searchData({String? title}) async {
    try {
      final dio = Dio();
      final response = await dio.get(ApiConst.searchApi(title ?? 'flutter'));
      if (response.statusCode == 200) {
        setState(() {
          topHeadlinesModel = TopHeadlinesModel.fromJson(response.data);
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    searchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffFE5722),
        title: TextField(
          onChanged: (value) {
            log(value);
            searchData(title: value);
          },
          autofocus: true,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search ...',
            hintStyle: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      body: topHeadlinesModel != null
          ? ListView.builder(
              itemCount: topHeadlinesModel!.articles.length,
              itemBuilder: (context, index) {
                final news = topHeadlinesModel!.articles[index];
                return CustomCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetailPage(articles: news),
                      ),
                    );
                  },
                  image: news.urlToImage,
                  author: news.author ?? '',
                  description: news.description ?? '',
                  time: DateFormat('d MMM, yyyy')
                      .format(DateTime.parse(news.publishedAt))
                      .toString(),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
