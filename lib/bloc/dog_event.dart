part of 'dog_bloc.dart';

@immutable
abstract class DogEvent extends Equatable {
  const DogEvent();

  @override
  List<Object> get props => [];
}

class LoadAllBreeds extends DogEvent {}

class LoadAllImagesForBreed extends DogEvent {
  final Breed breed;

  LoadAllImagesForBreed({@required this.breed});
}
