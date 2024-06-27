import 'package:api_with_cubit/constants/app_text.dart';
import 'package:api_with_cubit/cubit/user_cubit.dart';
import 'package:api_with_cubit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppText.appBar)),
      backgroundColor: AppColors.white,
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.userModel.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.userModel.length,
              itemBuilder: (context, index) {
                final user = state.userModel[index];
                return Card(
                  child: ListTile(
                    leading: Text(user.id.toString()),
                    title: Text(user.firstName),
                    subtitle: Text(user.lastName),
                    trailing: Image.network(user.avatar),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
