import 'package:gotit/models/comment_model.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/services/user_data_service.dart';

class CommentPresenter {
  List<Comment> _comments = [];

  Future<void> addComment(int itemId, String content) async {
    var comment = Comment(
      content: content,
      date: DateTime.now(),
      user: User(
        name: UserData.user.name, 
        picture: UserData.user.picture
      )
    );

    var result = await Http.send<int>(
      endpointUrl: '${'item/$itemId/comment'}',
      method: 'POST',
      body: comment,
    );
    
    if(result.isSucceeded){
      comment.id = result.data;
      _comments.add(comment);
    }
  }
  

  List<Comment> get comments {
    return _comments;
  }
}