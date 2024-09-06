import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/user_cubit.dart';


class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

double id = 5;

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: id,
          onChanged: (value) {
            setState(() {
              id = value;
            });
          },
          min: 1,
          max: 10,
          divisions: 9,
          label: "${id.toInt()}",
        ),
        GestureDetector(onTap: () {
          BlocProvider.of<UserCubit>(context).failureOrUser(id.toInt());
        },child: Container(
          height: 60,
          width: double.infinity,
          child: Center(child: Text("Get",style: TextStyle(fontSize: 30),)),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
          ),
        ),),
      ],
    );
  }
}
