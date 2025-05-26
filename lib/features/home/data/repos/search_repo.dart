import 'package:furni_quest/features/home/data/models/search_model/search_model.dart';
import 'package:furni_quest/features/home/data/web/category_web_services.dart';

class SearchRepo {
  final CategoryWebServices _categoryWebServices;

  SearchRepo(this._categoryWebServices);

  Future<List<SearchModel>> searchProduct (SearchModel searchModel) async{
    return await _categoryWebServices.searchProduct(searchModel);
  }
}