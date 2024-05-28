import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;

  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    final id = widget.item['_id'] as String;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${widget.index + 1}'),
        ),
        title: Text(widget.item['title']),
        subtitle: Text(widget.item['description']),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              widget.navigateEdit(widget.item);
            } else if (value == 'delete') {
              widget.deleteById(id);
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Edit'),
                value: 'edit',
              ),
              const PopupMenuItem(
                child: Text('Delete'),
                value: 'delete',
              ),
            ];
          },
        ),
      ),
    );
  }
}

