import 'package:cached_network_image/cached_network_image.dart';
import 'package:eval/bloc/dog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailsPage extends StatelessWidget {
  final String title;

  DetailsPage({this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<DogBloc>(context),
        child: WillPopScope(
          onWillPop: () {
            BlocProvider.of<DogBloc>(context).add(LoadAllBreeds());
            return Future.value(true);
          },
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Center(
                child: BlocBuilder<DogBloc, DogState>(
                  builder: (context, state) {
                    if (state is DogImagesLoaded) {
                      List<String> images = state.imageURLs;

                      return GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: images[index],
                              placeholder: (context, url) => Shimmer.fromColors(
                                  child: Container(
                                    color: Colors.black,
                                  ),
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.white),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            );
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
          ),
        ));
  }
}
