import 'package:gotit/models/item_details_model.dart';

class ItemDetailsPresenter{
  ItemDetails detailsModel;
  void getInnerDetails(){
    detailsModel = ItemDetails(comments: null,user: null, 
      images:[
        ('assets/images/salah.jpg'),
        ('assets/images/Capture.JPG'),
        ('assets/images/crying_cat.jpg'),
        ('assets/images/Sheka.jpeg'),
        ('assets/images/Sheka.jpg'),
      ] 
    );
  }
  ItemDetails get postDetails{
    return detailsModel;
  }
}