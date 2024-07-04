import 'package:classes_bloc/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  void initState() {
    context.read<ApiBloc>().add(ApiEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text('Api with Bloc'),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is LoadingApiState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessApiState) {
            return ListView.builder(
              itemCount: state.postModel.length,
              itemBuilder: (context, index) {
                final item = state.postModel[index];
                return Card(
                  child: ListTile(
                    leading: Text(item.id.toString()),
                    title: Text(item.title),
                    subtitle: Text(item.body),
                    trailing: Text(item.userId.toString()),
                  ),
                );
              },
            );
          } else if (state is ErrorApiState) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
      // body: BlocBuilder<ApiBloc, ApiState>(
      //   builder: (context, state) {
      //     if (state.status == FetchStatus.loading) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (state.status == FetchStatus.success &&
      //         state.postModel.isNotEmpty) {
      //       return ListView.builder(
      //         itemCount: state.postModel.length,
      //         itemBuilder: (context, index) {
      //           final item = state.postModel[index];
      //           return Card(
      //             child: ListTile(
      //               leading: Text(item.id.toString()),
      //               title: Text(item.title),
      //               subtitle: Text(item.body),
      //               trailing: Text(item.userId.toString()),
      //             ),
      //           );
      //         },
      //       );
      //     } else {
      //       return Center(child: Text(state.error ?? 'Error'));
      //     }
      //   },
      // ),
    );
  }
}
