import 'package:flutter/material.dart';
import 'package:flutter_api/presentation/dog/dog_view_model.dart';

class DogListScreen extends StatefulWidget {
  
  DogViewModel dogViewModel = DogViewModel();

  @override
  State<DogListScreen> createState() => _DogListScreenState();
}

class _DogListScreenState extends State<DogListScreen> {

  List<dynamic> listDog = <String>[];

  @override
  void initState(){
    super.initState();
    _getListDog();
  }

  _getListDog()async{
    listDog = await widget.dogViewModel.getDog();

  Future.delayed(const Duration(milliseconds: 500), (){
      setState(() {
              listDog = listDog;
            });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Dog List', style: TextStyle(fontSize: 50),),
            ),
            Expanded(
              child: Card(
                child: Scrollbar(
                  child: ListView.builder(
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: ListTile(
                                leading: Icon(Icons.list),
                                title: Text(listDog[index], style: TextStyle(fontWeight: FontWeight.w600),),
                                onTap: (){
                                  Navigator.pushNamed(context, '/subBreed', arguments: {'Breed' : listDog[index]});
                                },
                              )),
                            ],
                          ),
                          Divider(height: 2.0,color: Colors.green[200],)
                        ],
                      );
                    },
                    itemCount: listDog.length)),
              )
              )
          ],
        ),
      ),
      
    );
  }
}