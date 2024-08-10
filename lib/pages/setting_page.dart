import 'package:flutter/material.dart';
import '../components/my_appbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage();

  Widget Build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        title: "S E T T I N G S",
        actions: [],
      ),
      body: Center(
        child: Container(
          width: 600,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
            
            ]
          ),

        ),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
