import 'package:gotit/models/item_details_model.dart';
import 'package:gotit/services/http_service.dart';

class ItemPresenter{
  List<ItemDetails> _items = [];
  ItemDetails _itemDetails;
  String message;
  
  Future<void> getItems(int pageNo, int pageSize, String endpoint, bool isLost) async{
    var result = await Http.send<List<ItemDetails>>(
      endpointUrl: endpoint,
      queryParameters: {
        'pageNo': pageNo,
        'pageSize': pageSize,
        'isLost': isLost
      },
      mapper: (dynamic data) => data != null ? List<ItemDetails>.generate(data.length, (index) => ItemDetails.fromJson(data[index])) : []
    );

    if(result.isSucceeded){
      _items = result.data;
    }
  }

  Future<void> getItemDetails(int id) async {
    var result = await Http.send<ItemDetails>(
      endpointUrl: '${'item/$id'}',
      mapper: (data) => ItemDetails.fromJson(data)
    );

    if(result.isSucceeded) {
      _itemDetails = result.data;
    }
    message = result.message;
  }
  
  List<ItemDetails> get items{
    return _items;
  }
  ItemDetails get itemDetails {
    return _itemDetails;
  }
}