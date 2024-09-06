
import 'package:clean_architecture_practice/features/users/presentation/manager/user_cubit.dart';
import 'package:clean_architecture_practice/features/users/presentation/manager/user_states.dart';
import 'package:clean_architecture_practice/features/users/presentation/widgets/custom_design_screen_widget.dart';
import 'package:clean_architecture_practice/features/users/presentation/widgets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: state is GetUserSuccessfully
                ? ListView(
                    children: [
                      CustomDesignScreenWidget(),
                      UserData(user: state.user),
                      CustomSearchBar(),
                    ],
                  )
                : state is GetUserFailure
                    ? Text(state.errMessage)
                    : Center(child: CircularProgressIndicator()));
      },
    );
  }
}
