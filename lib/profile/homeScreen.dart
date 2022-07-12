import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final phone;
  const HomeScreen({Key? key,required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("You are successfully logged in with the user Id:$phone",textAlign: TextAlign.center,),
      ),
    );
  }
}
