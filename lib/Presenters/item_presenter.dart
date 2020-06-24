import 'package:gotit/models/item_model.dart';
import 'package:gotit/services/http_service.dart';

class ItemPresenter{
  List<Item> _items = [];
  
  Future<void> getItems(int pageNo, int pageSize) async{
    var result = await Http.send<List<Item>>(
      endpointUrl: 'item',
      queryParameters: {
        'pageNo': pageNo,
        'pageSize': pageSize
      },
      mapper: (dynamic data) => List<Item>.generate(data.length, (index) => Item.fromJson(data[index]))
    );

    if(result.isSucceeded){
      _items = result.data;
    }
  }
  
  List<Item> get items{
    return _items;
  }
}