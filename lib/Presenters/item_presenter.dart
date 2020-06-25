import 'package:gotit/models/item_model.dart';
import 'package:gotit/services/http_service.dart';

class ItemPresenter{
  List<Item> _items = [];
  
  Future<void> getItems(int pageNo, int pageSize, String endpoint, bool isLost) async{
    var result = await Http.send<List<Item>>(
      endpointUrl: endpoint,
      queryParameters: {
        'pageNo': pageNo,
        'pageSize': pageSize,
        'isLost': isLost
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