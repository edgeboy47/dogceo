import 'package:eval/bloc/bloc/dog_bloc.dart';
import 'package:eval/data/breed.dart';
import 'package:eval/presentation/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dog App'),
        ),
        body: Center(
          child: BlocBuilder<DogBloc, DogState>(
            builder: (context, state) {
              if (state is DogInitial || state is DogInfoLoading)
                return CircularProgressIndicator();
              else if (state is DogInfoLoaded) {
                List<Breed> breeds = state.breeds;

                return ListView.builder(
                    itemCount: breeds.length,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        title: Text('${breeds[i].title}'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          BlocProvider.of<DogBloc>(context)
                              .add(LoadAllImagesForBreed(breed: breeds[i]));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(title: breeds[i].title)));
                        },
                      );
                    });
              } else if (state is DogInfoFailed)
                return Text('Failed to load. Please check network connection.');
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
