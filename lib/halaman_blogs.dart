import 'package:flutter/material.dart';
import 'package:latihanresponsi/detail_blogs.dart';
import 'api_data_source.dart';
import 'data_news_api.dart';
import 'detail_blogs.dart';

class PageListBlogs extends StatefulWidget {
  const PageListBlogs({super.key});

  @override
  State<PageListBlogs> createState() => _PageListBlogsState();
}

class _PageListBlogsState extends State<PageListBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs List'),
        centerTitle: true,
      ),
      body: _buildListUserBody(),
    );
  }

  Widget _buildListUserBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSourceBlogs.instance.loadBlogs(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            DataApi dataBlogs =
            DataApi.fromJson(snapshot.data);
            return _buildSuccesSection(dataBlogs);
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

  Widget _buildItemUsers(Results dataBlogs){
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailBlogs(blogsData: dataBlogs,),
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
                  child: Image.network(dataBlogs.imageUrl!),
                ),
                SizedBox(width: 20,),
                SizedBox(
                    width: 250,
                    height: 40,
                    child: Text(dataBlogs.title!)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

