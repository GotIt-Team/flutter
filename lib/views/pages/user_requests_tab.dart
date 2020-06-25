import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/widgets/empty_state.dart';

class UserRequestsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyState(
      image: 'assets/images/no_requests.png',
      message: 'There is no requests',
    );
  }
  
}