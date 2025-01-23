import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  //Variables
  final String TaskName;
  final Function(bool?)? ChangeCheckBox;
  final bool taskCompleted;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  const TodoTile({
    super.key,
    required this.TaskName,
    required this.ChangeCheckBox,
    required this.taskCompleted,
    required this.onDelete,
    required this.onEdit,
  });
//Functions

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Slidable(
        startActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: (_) => onDelete!(),
            label: "Delete",
            backgroundColor: Colors.red.shade200,
            icon: Icons.delete_forever,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          SlidableAction(
            onPressed: (_) => onEdit!(),
            label: "Edit",
            backgroundColor: Colors.blue.shade200,
            icon: Icons.mode_edit_outlined,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TaskName,
                style: TextStyle(
                    color: taskCompleted ? Colors.grey : Colors.black,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Checkbox(
                onChanged: ChangeCheckBox,
                value: taskCompleted,
                activeColor: Colors.green,
              ),
              // ElevatedButton(onPressed: onDelete, child: Text("Delete"))
            ],
          ),
        ),
      ),
    );
  }
}
