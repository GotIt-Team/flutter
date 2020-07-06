import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/models/comment_model.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/models/item_details_model.dart';

class ItemDetailsPresenter {
  ItemDetails detailsModel;
  void getInnerDetails() {
    detailsModel = ItemDetails(attributes: {0:'huawie',1:'note8',2:'5inch',4:'female',5:'23 years old',5:'0123546'},
        comments: [
          Comment(
            user: User(
                name: 'sayed', id: 1, picture: 'assets/images/Capture.JPG'),
            id: 1,
            date: DateTime.now(),
            content: 'ana l2eto ya om a7mad'
          ),
          Comment(
            user: User(
                name: 'sayed', id: 2, picture: 'assets/images/Capture.JPG'),
            id: 1,
            date: DateTime.now(),
            content: 'a7mad rage3'
          ),
          Comment(
            user: User(
                name: 'sayed', id: 3, picture: 'assets/images/Capture.JPG'),
            id: 1,
            date: DateTime.now(),
            content:'lololololololoy'
          )
        ],
        user: User(name: 'dsd', id: 5, picture: 'assets/images/Capture.JPG'),
        content:
            "el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines el7a2onyyyy ebnyyy daaaa3 mnyyy ya naaaas 7ad ykalem 7aaaaad el7a2ona ya 5wana 3ayez azawed fe l lines blablablalbalbal",
        images: [
          ('assets/images/salah.jpg'),
          ('assets/images/Capture.JPG'),
          ('assets/images/crying_cat.jpg'),
          ('assets/images/Sheka.jpeg'),
          ('assets/images/Sheka.jpg'),
        ],
        creationDate: DateTime.now());
  }
  void addComment(String content ){
    int statusCode=200;
    
    if(statusCode==200)
    detailsModel.comments.add(Comment(content: content,date: DateTime.now(),id: 10,user: User(address: 'keymanFares msakenT3awnyat',id: 10,name: 'dsddsd',picture: 'assets/images/Capture.JPG',phoneNumber: '010852345'),),); 
  }
 

 
  ItemDetails get postDetails {
    return detailsModel;
  }
}
