import 'package:gotit/Models/item_model.dart';
import 'package:gotit/Services/home_service.dart';

class HomePresenter{
  HomeService _homeService = HomeService();
  List<Item> _items = [];
  
  void getItems({int pageNo, int pageSize = 10}){
    _items = _homeService.getItems();
  }
  
  List<Item> get items{
    return _items;
  }
}