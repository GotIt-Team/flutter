import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/enums/request_state_enum.dart';
import 'package:gotit/enums/user_type_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/requests_presenter.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class RequestCard extends StatelessWidget {
  final int index;
  final int id;
  final String title;
  final String date;
  final String image;
  final RequestState state;
  final RequestsPresenter requestsPresenter;
  
  RequestCard({this.index, this.id, this.title, this.date, this.image, this.state, this.requestsPresenter});

  Text _getState(BuildContext context) {
    return Text(
      Helpers.getStringFromEnum(state),
      style: TextStyle(
        color: state == RequestState.approved ? Colors.green
          : state == RequestState.rejected ? Theme.of(context).colorScheme.error
          : Theme.of(context).primaryColor
      ),
    );
  }

  Future<void> _deleteRequest(BuildContext context) async {
    var value = await DialogBox.show(
      context: context,
      title: Text('Are You Sure ?'),
      content: Text(
        'Click yes if you want to delete this request',
        style: TextStyle(
          fontSize: 20
        ),
        textAlign: TextAlign.center
      ),
      dialogButton: DialogButtons.yes_no
    );

    if(value == DialogResult.yes) {
      await _deleteProgress(context);
    }
  }

  
  Future<void> _deleteProgress(BuildContext context) async {
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => requestsPresenter.deleteRequset(index, id, state)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03,
        top: MediaQuery.of(context).size.width * 0.01
      ),
      child: InkWell(
        onTap: () {
          //the function of clicked notification
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Sheka.jpg'),
            ),
            title: Text(Helpers.truncateWithEllipsis(title, 90)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_getState(context), Text(date)]
            ),
            isThreeLine: true,
            trailing: state != RequestState.approved && requestsPresenter.userType == UserType.regular 
            ? FlatButton.icon(
              onPressed: () => _deleteRequest(context), 
              icon: Icon(Icons.close), 
              label: Text('Remove')
            ) : null
          )
        )
      )
    );
  }

}