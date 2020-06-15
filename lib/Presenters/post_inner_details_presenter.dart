import 'package:gotit/Models/post_inner_details_model.dart';
import 'package:gotit/Services/post_inner_details_service.dart';

class PostInnerDetalsPres{
  PostDetailsService _detailsService= PostDetailsService();
  PostInnerDetailsModel detailsModel;
  void getInnerDetails(){
    detailsModel = _detailsService.getPost();
  }
  PostInnerDetailsModel get postDetails{
    return detailsModel;
  }
}