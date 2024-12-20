import 'package:http/http.dart' as http;

import '../../../core/constants/api_const.dart';
class SourceRemote{
  Future<http.Response> getSources({required String category}) async {
    Uri url=Uri.parse('${ApiConst.baseUrl}${ApiConst.sources}?category=$category&apiKey=${ApiConst.apiKey}');
    var response = await http.get(url);
    return response;
  }


    Future<http.Response> getArticles({required String sourceId}) async {
    Uri url=Uri.parse('${ApiConst.baseUrl}${ApiConst.articles}?sources=$sourceId&apiKey=${ApiConst.apiKey}');
    var response = await http.get(url);
    return response;
  }
}