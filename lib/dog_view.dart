import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium/cubit/dog_cubit.dart';

class DogView extends StatelessWidget {
  const DogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogCubit(),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocConsumer<DogCubit, DogState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is DogLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DogLoaded) {
                return Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<DogCubit>(context).loadDog();
                          },
                          child: Text("Yenile")),
                      Image.network(state.dog.message.toString()),
                    ],
                  ),
                );
              } else {
                final error = state as DogError;
                return Center(child: Text(error.error));
              }
            },
          )),
    );
  }
}
