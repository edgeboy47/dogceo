import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eval/data/models/breed.dart';
import 'package:eval/domain/repository.dart';
import 'package:meta/meta.dart';

part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  Repository repo;
  DogBloc({@required this.repo}) : super(DogInitial());

  @override
  Stream<DogState> mapEventToState(
    DogEvent event,
  ) async* {
    yield DogInfoLoading();

    if (event is LoadAllBreeds) {
      try {
        List<Breed> breeds = await this.repo.getAllBreeds();

        yield DogInfoLoaded(breeds: breeds);
      } catch (e) {
        yield DogInfoFailed();
      }
    }

    if (event is LoadAllImagesForBreed) {
      try {
        Breed breed = event.breed;

        List<String> images = await this.repo.getAllImagesForBreed(breed);
        yield DogImagesLoaded(imageURLs: images);
      } catch (e) {
        yield DogInfoFailed();
      }
    }
  }
}
