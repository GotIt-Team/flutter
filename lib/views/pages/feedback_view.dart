import 'package:flutter/material.dart';
import 'package:gotit/presenters/feedback_presenter.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/enums/result_message_enum.dart';


class FeedbackPage extends StatelessWidget {
  FeedbackPresenter feedbackPresenter = FeedbackPresenter() ;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  void _sendFeedback(BuildContext context, DialogResult result) {
    if(result == DialogResult.ok) {
      if(formkey.currentState.validate()){
        formkey.currentState.save();
        feedbackPresenter.sendFeedback(context);
        var flag = !feedbackPresenter.result.isSucceeded || !feedbackPresenter.result.data;
        var resultMessage = Helpers.getEnumFromString(ResultMessage.values, feedbackPresenter.result.message);
        DialogBox.show(
            context: context,
            title: Text(flag ? 'Error' : 'Done'),
            content: Text(
                StateMessage.get(resultMessage),
                style: TextStyle(
                    fontSize: 20
                ),
                textAlign: TextAlign.center
            ),
            dialogButton: DialogButtons.ok
        ).then((value) {
          formkey.currentState.reset();
        });
      }
    } else {
      formkey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DialogBox.dialog(
        context: context,
        title: ListTile(
          title:Text(
              'Rate Our App',
              style: TextStyle(
                  color: Theme.of(context).textTheme.title.color,
                  fontSize: 15
              )
          ),
          trailing: Icon(
            Icons.feedback,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        content: Container(
          child:Form(
            key: formkey,
           child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:  RatingBar(
                    onRatingChanged: (rating) =>feedbackPresenter.setRate(rating),
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    filledColor: Colors.amber,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Opinion',
                      hintText: ('Enter Your Opinion'),
                    ),
                   onSaved: feedbackPresenter.setOpinion,
                  ),
                ),

              ],
            ),
          ),
        ),
        dialogButton: DialogButtons.ok_cancel,
        onPress: (DialogResult result) => _sendFeedback(context,result)
    );
  }
}