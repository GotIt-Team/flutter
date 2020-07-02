import 'package:flutter/material.dart';
import 'package:gotit/enums/request_state_enum.dart';
import 'package:gotit/presenters/requests_presenter.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';
import 'package:gotit/views/widgets/request_card.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserRequestsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserRequestsState();
}

class UserRequestsState extends State<UserRequestsTab> {
  int requestsCount;
  RequestsPresenter requestPresenter = RequestsPresenter();
  RequestState state;

  void loadRequests() {
    if(context == null) return;
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () =>  requestPresenter.getRequests(state).then((value) {
        if(!mounted) return;
        setState(() {
          if(requestPresenter.requests != null) {
            requestsCount = requestPresenter.requests.length;
          } else {
            requestsCount = 0;
          }
        });
      })
    );
  }

  @override
  void initState() {
    super.initState();
    requestsCount = 0;
    Future.delayed(Duration.zero, loadRequests);
    requestPresenter.addListener((){
      setState(() {
        requestsCount = requestPresenter.requests.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return requestsCount > 0 ? ListView.builder(
      itemCount: requestsCount,
      itemBuilder: (context, index) {
        var request = requestPresenter.requests[index];
        return RequestCard(
          index: index,
          id: request.id,
          title: request.title,
          date: timeago.format(request.sendDate),
          image: request.receiver.picture,
          state: request.state,
          requestsPresenter: requestPresenter,
        );
      },
    ) : EmptyState(
      image: 'assets/images/no_requests.png',
      message: 'There is no requests',
    );
  }
}
