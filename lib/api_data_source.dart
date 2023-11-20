import 'base_network.dart';

class ApiDataSourceNews {
  static ApiDataSourceNews instance = ApiDataSourceNews();

  Future<Map<String, dynamic>> loadNews() {
    return BaseNetworkNews.get("");
  }

  Future<Map<String, dynamic>> loadDetailNews(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetworkNews.get("$id");
  }
}

class ApiDataSourceReports {
  static ApiDataSourceReports instance = ApiDataSourceReports();

  Future<Map<String, dynamic>> loadReports() {
    return BaseNetworkReports.get("");
  }

  Future<Map<String, dynamic>> loadDetailReports(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetworkReports.get("$id");
  }
}

class ApiDataSourceBlogs {
  static ApiDataSourceBlogs instance = ApiDataSourceBlogs();

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetworkBlogs.get("");
  }

  Future<Map<String, dynamic>> loadDetailBlogs(int idDiterima){
    String id = idDiterima.toString();
    return BaseNetworkBlogs.get("$id");
  }
}

