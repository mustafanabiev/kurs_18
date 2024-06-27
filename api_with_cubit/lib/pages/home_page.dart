import 'package:api_with_cubit/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api with Cubit'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              if (state.userModel == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Card(
                  child: ListTile(
                    title: Text(
                      '${state.userModel!.firstName} ${state.userModel!.lastName}',
                    ),
                    subtitle: Text(state.userModel!.email),
                    trailing: Image.network(state.userModel!.avatar),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
