

import 'package:gotit/models/add_post_model.dart';
import 'package:gotit/models/detected_result_model.dart';
import 'package:gotit/models/item_details_model.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/services/http_service.dart';

class AddPostPresenter{
  ItemDetails itemDetails= ItemDetails();
  ItemDetails get postModel{return itemDetails;}
  AddPostPresenter() {
    itemDetails.images = [];
  }
  Result result;
  void setIsLost(bool isLost) {
    itemDetails.isLost = isLost;
  }
 Future<void> detectObjects() async{
    result = await Http.send(
      endpointUrl: '${itemDetails.type}/detect',
      method: 'POST',
      body: itemDetails.images,
      mapper: (data) => DetectionResult.fromJson(data),
    );
  }

}