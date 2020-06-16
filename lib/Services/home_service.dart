import 'package:gotit/Models/item_model.dart';
import 'package:gotit/Models/user_model1.dart';

class HomeService{

  List<Item> getItems(){
    List<Item> items = List.generate(6, (index){
      return Item(
        user: User(
          name: "Badr",
          image: "assets/images/Sheka.jpg"
        ),
        id:1,
        content: "descripton",
        image: "assets/images/salah.jpg",
        creationData: "20-09-1998"
      );
    });
    return items;
  }

}