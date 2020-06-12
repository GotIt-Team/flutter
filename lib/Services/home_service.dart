import 'package:gotit/Models/item_model.dart';
import 'package:gotit/Models/user_model.dart';

class HomeService{

  List<Item> getItems(){
    List<Item> items = List.generate(6, (index){
      return Item(
        user: User(
          name: "Badr",
          image: "images/badr.jpg"
        ),
        content: "descripton",
        image: "images/item.jpg",
        creationData: "20-09-1998"
      );
    });
    return items;
  }

}