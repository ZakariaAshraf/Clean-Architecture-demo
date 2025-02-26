import 'package:flutter/material.dart';

import '../../domain/entities/user_entity.dart';

class UserData extends StatelessWidget {
  const UserData({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          iconColor: Colors.red,
          title: Text(user.name),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          iconColor: Colors.red,
          title: Text(user.email),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          iconColor: Colors.red,
          title: Text(user.phone),
        ),
        ListTile(
          leading: const Icon(Icons.location_city),
          iconColor: Colors.red,
          title: Text(user.address.city),
        ),
      ],
    );
  }
}