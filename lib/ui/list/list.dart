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
        appBar: AppBar(
          title: const Text(
            'Contacts',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is ListSuccess) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //   BlocProvider.of<profileBloc>(context)
                      // .add(CartAddButtonClick(widget.product.id));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.asset(
                              'assets/img/profile_$index.jpg',
                              width: 56,
                              height: 56,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.users[index].name,
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.users[index].date,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
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
                          BlocProvider.of<ListBloc>(context).add(ListRefresh());
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
    );
  }
}
