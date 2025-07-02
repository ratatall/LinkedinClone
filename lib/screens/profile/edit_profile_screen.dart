import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String initialName;
  final String initialBio;
  final String initialAvatarUrl;

  const EditProfileScreen({
    required this.initialName,
    required this.initialBio,
    required this.initialAvatarUrl,
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _bio;
  late String _avatarUrl;

  @override
  void initState() {
    super.initState();
    _name = widget.initialName;
    _bio = widget.initialBio;
    _avatarUrl = widget.initialAvatarUrl;
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {
        'name': _name,
        'bio': _bio,
        'avatarUrl': _avatarUrl,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.isEmpty ? 'Enter name' : null,
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                initialValue: _bio,
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => _bio = value ?? '',
              ),
              TextFormField(
                initialValue: _avatarUrl,
                decoration: InputDecoration(labelText: 'Profile Picture URL'),
                onSaved: (value) => _avatarUrl = value ?? '',
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
