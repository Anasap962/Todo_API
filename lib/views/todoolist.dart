import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/views/addtodoo.dart';
import 'package:flutter_application_1/views/edit_page.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class listtodoo extends StatefulWidget {
  const listtodoo({super.key});

  @override
  State<listtodoo> createState() => _listtodooState();
}

class _listtodooState extends State<listtodoo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,
          title: const Text('Todo',style: TextStyle(fontWeight: FontWeight.w800),),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const addtodoo(),
              ));
            },
            label: const Text('AddTodo',style: TextStyle(color: Colors.blue),)),
        body: Consumer<TodooController>(
          builder: (context, pro, child) {
            return ListView.builder(
              itemCount: pro.allData.length,
              itemBuilder: (context, index) {
                final items = pro.allData[index];
                return ListTile(
                  title: Text(
                    '${items.title}',
                  ),
                  subtitle: Text("${items.description}"),
                  leading: Text('${index + 1}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {
                     Provider.of<TodooController>(context,listen: false).deleteById(items.id!);
                      }, icon: Icon(Icons.delete,color: Colors.red,)),SizedBox(width: 10,),
                      IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => edittodoo(itemModel: items,)));
                      }, icon: Icon(Icons.edit,color: Colors.red,))
                    ],
                  ),
                );
              },
            );
          },
        ));
  }

}
