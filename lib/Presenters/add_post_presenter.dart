

import 'package:flutter/material.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/models/add_post_model.dart';
import 'package:gotit/models/detected_result_model.dart';
import 'package:gotit/models/item_details_model.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class AddPostPresenter{
  ItemDetails itemDetails= ItemDetails();
  ItemDetails get postModel{return itemDetails;}
  AddPostPresenter() {
    itemDetails.images = [];
  }
  List<DetectionResult> data;
  void setIsLost(bool isLost) {
    itemDetails.isLost = isLost;
  }
  Future<void> _detectObjects() async {
    var result = await Http.send<List<DetectionResult>>(
      endpointUrl: '${Helpers.getStringFromEnum(itemDetails.type)}/detect',
      method: 'POST',
      body: itemDetails.images,
      mapper: (data) => List.generate(data.length, (index) => DetectionResult.fromJson(data[index])),
      isCsharp: false
    );
    
    if(result.isSucceeded) {
      data = result.data;
    }
  }
  Future<void> detectObjects(BuildContext context) async {
    await ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => _detectObjects()
    );
  }

}