import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_project/data/repository/user_repository.dart';
import 'package:nexo_project/ui/list/bloc/list_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final listBloc = ListBloc(userRepository: userRepository);
        listBloc.add(ListStarted());
        return listBloc;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              if (state is ListSuccess) {
                return Container(color: Colors.amber);
              } else if (state is ListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ListError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.exception.massage),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ListBloc>(context)
                                .add(ListRefresh());
                          },
                          child: Text('تلاش دوباره'))
                    ],
                  ),
                );
              } else {
                throw Exception('state is not supported');
              }
            },
          ),
        ),
      ),
    );
  }
}
