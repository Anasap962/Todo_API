import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/views/todoolist.dart';
import 'package:provider/provider.dart';

class addtodoo extends StatefulWidget {
  const addtodoo({super.key});

  @override
  State<addtodoo> createState() => _homeState();
}

class _homeState extends State<addtodoo> {
  
  @override
  Widget build(BuildContext context) {
     final pro = Provider.of<TodooController>(context,listen: false);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: const Text('Add Todoo',style: TextStyle(fontWeight: FontWeight.w800),),centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column( children: [ 
            TextFormField(controller: pro.titleController,
              decoration: const InputDecoration(
             hintText: 'name' 
            ),),  TextFormField(controller: pro.discriptioncontroller,
              decoration: const InputDecoration(
             hintText: 'address' 
            ),),SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
             await pro.createDta();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const listtodoo(),));
            }, child: const Text('DONE'))
          ],),
        ),
      ),
     
    );
  }
}