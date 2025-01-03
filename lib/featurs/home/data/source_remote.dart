import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/api_const.dart';
class SourceRemote{
 Future <Either<http.Response,String>>  getSources({required String category}) async {
    try {
       Uri url=Uri.parse('${ApiConst.baseUrl}${ApiConst.sources}?category=$category&apiKey=${ApiConst.apiKey}');
    var response = await http.get(url);
    print(response);
    return Left(response);
    } catch (e) {
     return Right(e.toString());
    }

  }


    Future<http.Response> getArticles({required String sourceId}) async {
    Uri url=Uri.parse('${ApiConst.baseUrl}${ApiConst.articles}?sources=$sourceId&apiKey=${ApiConst.apiKey}');
    var response = await http.get(url);
    return response;
  }
}