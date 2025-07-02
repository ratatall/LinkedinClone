import 'package:flutter/material.dart';

class CreatePostDialog extends StatefulWidget {
  final String userName;
  const CreatePostDialog({required this.userName, Key? key}) : super(key: key);

  @override
  State<CreatePostDialog> createState() => _CreatePostDialogState();
}

class _CreatePostDialogState extends State<CreatePostDialog> {
  final _formKey = GlobalKey<FormState>();
  String _content = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(_content);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Post'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          maxLines: 4,
          decoration: InputDecoration(labelText: 'What do you want to talk about?'),
          validator: (value) => value == null || value.isEmpty ? 'Enter something' : null,
          onSaved: (value) => _content = value ?? '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text('Post'),
        ),
      ],
    );
  }
}
