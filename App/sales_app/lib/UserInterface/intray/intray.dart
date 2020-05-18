import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/intray/intray_to_do.dart';
import 'package:salesapp/models/classes/venta.dart';
import 'package:salesapp/models/global.dart';

class IntrayPage extends StatefulWidget {


  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
List <Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    taskList = getList();

    return Container(
      color: darkGreyColor,
      child: _buildReorderableListSimple(context),
    );
  }

  List<Task> getList()
  {
    for(int i = 0; i < 21; i++)
      {
        Task t = new Task("My new task " + i.toString(), false, i.toString());
        taskList.add(t);
      }
    return taskList;
  }

  Widget _buildListTile(BuildContext context, Task item)
  {
    return ListTile(
      key: Key(item.taskId),
      title: IntrayTodo(
        title: item.title,
      )
    );
  }

  Widget _buildReorderableListSimple(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent
      ),
      child: ReorderableListView(
        padding: EdgeInsets.only(top: 210.0),
        children: taskList.map((Task item) => _buildListTile(context, item)).toList(),
        onReorder: (oldIndex, newIndex){
          setState(() {
            Task item = taskList[oldIndex];
            taskList.remove(item);
            taskList.insert(newIndex, item);
          });
        },
      ),
    );
  }

//  void _onReorder(int oldIndex, int newIndex)
//  {
//    setState(() {
//      if(newIndex > oldIndex){
//        newIndex -= 1;
//      }
//      final Task item = taskList.removeAt(oldIndex);
//      taskList.insert(newIndex, item);
//    });
//  }

}