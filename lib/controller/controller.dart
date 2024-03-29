import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/serviece/todoserviece.dart';

class TodooController extends ChangeNotifier {
   TodooController(){
    getData();
  }
TextEditingController titleController=TextEditingController();
TextEditingController discriptioncontroller=TextEditingController();
TodoService todoService =TodoService();
 List <Item> allData=[];
 Future <void> getData()async{
  allData=await todoService.fetchData();

  notifyListeners();

 }
 Future<void> createDta()async{
  final requestmodel=Item( title: titleController.text, description: discriptioncontroller.text, isCompleted: false);
  await todoService.addDataaaa(requestmodel);
  titleController.text='';
discriptioncontroller.text="";
  getData();
 }
  Future<void> deleteById(String id)async{
 todoService.delete(id);
  allData.removeWhere((item) =>item.id==id,);
 notifyListeners();
  }
 Future <void> editted ( String id)async{
final requestmodel = Item(title: titleController.text, description: discriptioncontroller.text, isCompleted: false);
await todoService.edit(requestmodel,id);
getData();
notifyListeners();

  }
}