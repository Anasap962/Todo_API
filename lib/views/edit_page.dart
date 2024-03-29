import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/views/todoolist.dart';
import 'package:provider/provider.dart';

class edittodoo extends StatefulWidget {
  Item? itemModel;
   edittodoo({super.key,this.itemModel});

  @override
  State<edittodoo> createState() => _homeState();
}

class _homeState extends State<edittodoo> {
  @override
  void initState() {
    // TODO: implement initState
    final pro=Provider.of<TodooController>(context,listen: false);
    pro.titleController.text=widget.itemModel!.title;
    pro.discriptioncontroller.text=widget.itemModel!.description;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
     final pro = Provider.of<TodooController>(context,listen: false);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: const Text('Add Todoo',style: TextStyle(fontWeight: FontWeight.w800),),centerTitle: true,),
      body: Center(
        child: Column( children: [ 
          TextFormField(controller: pro.titleController,
            decoration: const InputDecoration(
           hintText: 'name' 
          ),),  TextFormField(controller: pro.discriptioncontroller,
            decoration: const InputDecoration(
           hintText: 'address' 
          ),),ElevatedButton(onPressed: ()async{
           await pro.editted(widget.itemModel!.id!);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => listtodoo(),));
          }, child: const Text('DONE'))
        ],),
      ),
     
    );
  }
}