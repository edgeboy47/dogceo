import 'package:eval/bloc/bloc/dog_bloc.dart';
import 'package:eval/data/breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final String title;

  DetailsPage({this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<DogBloc>(context),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    BlocProvider.of<DogBloc>(context).add(LoadAllBreeds());
                    Navigator.pop(context);
                  }),
            ),
            body: Center(
              child: BlocBuilder<DogBloc, DogState>(
                builder: (context, state) {
                  if (state is DogImagesLoaded) {
                    List<String> images = state.imageURLs;

                    return GridView.builder(
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Image.network(images[index]);
                        });
                  }
                  if (state is DogInfoFailed)
                    return Text(
                        'Failed to load. Please check network connection');
                  return CircularProgressIndicator();
                },
              ),
            ),
          ),
        ));
  }
}
