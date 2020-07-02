

import 'package:gotit/models/add_post_model.dart';
import 'package:gotit/models/item_details_model.dart';

class AddPostPresenter{
  AddPostModel addPostModel=new AddPostModel(itemDetails: ItemDetails());
  AddPostModel get postModel{return addPostModel;}
 
  void setIsLost(bool isLost) {
    addPostModel.itemDetails.isLost = isLost;
  }

}