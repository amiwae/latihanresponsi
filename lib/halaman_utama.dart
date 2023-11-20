import 'package:flutter/material.dart';
import 'package:latihanresponsi/halaman_blogs.dart';
import 'package:latihanresponsi/halaman_report.dart';

import 'halaman_news.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPACE FLIGHT NEWS'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageListNews()),
              );
            },
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: Image.network("https://cdn-icons-png.flaticon.com/512/190/190565.png"),
                      ),
                      SizedBox(width: 20,),
                      Text("News",style: TextStyle(fontSize: 18),),
                      SizedBox(width: 10,),
                      Text("Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites")
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageListBlogs()),
              );
            },
            child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          child: Image.network("https://cdn-icons-png.flaticon.com/512/1809/1809216.png"),
                        ),
                        SizedBox(width: 20,),
                        Text("Blogs",style: TextStyle(fontSize: 18),),
                        SizedBox(width: 10,),
                        Text("Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast")
                      ],
                    ),
                  ),
                ),
              ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageListReports()),
              );
            },
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          child: Image.network("https://cdn-icons-png.flaticon.com/512/2415/2415836.png"),
                        ),
                        SizedBox(width: 20,),
                        Text("Reports",
                        style: TextStyle(fontSize: 18),),
                        SizedBox(width: 10,),
                        Text("Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!")
                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
