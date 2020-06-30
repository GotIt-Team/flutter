import 'package:flutter/material.dart';
import 'package:gotit/models/feedback_model.dart';
import 'package:gotit/services/http_service.dart';
import 'package:gotit/models/result_model.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class FeedbackPresenter{
  FeedbackModel feedbackModel = FeedbackModel() ;
  Result<bool> result;

  void setRate(double rateValue){
    feedbackModel.rate = rateValue.toInt();
  }

  void setOpinion(String opinion){
    feedbackModel.opinion = opinion;
  }

  Future<void> _sendFeedback() async{
    result = await Http.send(
      endpointUrl: 'system/feedback',
      body: feedbackModel,
      method: 'POST'
    );
  }

  Future<void> sendFeedback(BuildContext context) async {
    await ProgressDialog.show(
        context: context,
        isCircular: false,
        method: () => _sendFeedback()
    );
  }

}
