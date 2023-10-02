import 'package:flutter/material.dart';

class DogSubBreedScreen extends StatelessWidget {
  const DogSubBreedScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    _img(){
      return Center(
        child: Container(
          child: Image.network('https://images.dog.ceo/breeds/hound-english/n02089973_4359.jpg',
          width: 200,
          height: 200,
          )
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Sub Breed List'),),
        // body: Center(child: Text(arguments['Breed']+ " "+ 'Sub Breeds'),
        body: Container(child: Column(children: [
          Center(child: Text(arguments['Breed']+ " "+ 'Sub Breeds')),
          _img()
        ],),)
        ));
  }
}