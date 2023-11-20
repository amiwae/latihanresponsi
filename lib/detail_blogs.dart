import 'package:flutter/material.dart';
import 'package:latihanresponsi/data_news_api.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailBlogs extends StatefulWidget {
  final Results blogsData;

  DetailBlogs({required this.blogsData});

  @override
  State<DetailBlogs> createState() => _DetailBlogsState();
}

class _DetailBlogsState extends State<DetailBlogs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOGS DETAIL"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Card(
                    color: Color(0xFFdcdcd4),
                    elevation: 8, // Memberikan bayangan pada Card
                    margin: const EdgeInsets.symmetric(horizontal: 25.0), // Memberikan jarak antara Card dengan elemen lain
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 400,
                              height: 200,
                              child: Image.network(widget.blogsData.imageUrl!),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.blogsData.title!,style: TextStyle(
                                    fontSize: 18
                                ),),
                                SizedBox(height: 20)
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.blogsData.summary!,style: TextStyle(
                                    fontSize: 12
                                ),),
                                SizedBox(height: 20)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchURL(widget.blogsData.url);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search),
            Text("More"),
          ],
        ),
      ),
    );
  }
  void _launchURL(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case where the URL is not valid
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Invalid URL"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}