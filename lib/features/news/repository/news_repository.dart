import 'package:news_app/network/endpoints.dart';
import 'package:dio/dio.dart';
import '../../../network/dio/dio.dart';
import '../../../network/exception_handler/data_source.dart';
import '../model/data_model.dart';

class NewsRepository {
  static final NewsRepository _singleton = NewsRepository._internal();
  NewsRepository._internal();
  static NewsRepository get instance => _singleton;

  Future<NewsModel> getPost({String searchText = ''}) async {
    try {
      Response response = await getHttp(Endpoints.allNews(searchText));
      if (response.statusCode == 200) {
        NewsModel jsonData = NewsModel.fromJson(response.data);
        return jsonData;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }
}
