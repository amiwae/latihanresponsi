import 'package:flutter/material.dart';
import 'api_data_source.dart';
import 'data_news_api.dart';
import 'detail_news.dart';

class PageListNews extends StatefulWidget {
  const PageListNews({super.key});

  @override
  State<PageListNews> createState() => _PageListNewsState();
}

class _PageListNewsState extends State<PageListNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News List'),
        centerTitle: true,
      ),
      body: _buildListUserBody(),
    );
  }

  Widget _buildListUserBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSourceNews.instance.loadNews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            DataApi dataNews =
            DataApi.fromJson(snapshot.data);
            return _buildSuccesSection(dataNews);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text("Error Bos");
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccesSection(DataApi results){
    return ListView.builder(
        itemCount: results.results!.length,
        itemBuilder: (BuildContext context, int index){
          return _buildItemUsers(results.results![index]);
        }
    );
  }

  Widget _buildItemUsers(Results dataNews){
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailNews(newsData: dataNews,),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(dataNews.imageUrl!),
                ),
                SizedBox(width: 20,),
                SizedBox(
                  width: 250,
                    height: 40,
                    child: Text(dataNews.title!)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

