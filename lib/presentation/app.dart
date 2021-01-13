import 'package:eval/bloc/bloc/dog_bloc.dart';
import 'package:eval/injector.dart';
import 'package:eval/presentation/pages/initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => injector<DogBloc>()..add(LoadAllBreeds()),
        child: MaterialApp(
          title: "Dog App",
          home: InitialPage(),
        ));
  }
}
