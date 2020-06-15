
import 'package:gotit/Models/post_inner_details_model.dart';

class PostDetailsService{
  PostInnerDetailsModel getPost(){
    return PostInnerDetailsModel(comments: null,user: null, images:[
    ('assets/images/salah.jpg'),
    ('assets/images/Capture.JPG'),
    ('assets/images/crying_cat.jpg'),
    ('assets/images/Sheka.jpeg'),
    ('assets/images/Sheka.jpg'),
  ] );
  }
}