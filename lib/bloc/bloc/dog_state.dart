part of 'dog_bloc.dart';

@immutable
abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object> get props => [];
}

class DogInitial extends DogState {}

class DogInfoLoading extends DogState {}

class DogInfoLoaded extends DogState {
  final List<Breed> breeds;

  const DogInfoLoaded({@required this.breeds});

  @override
  List<Object> get props => [breeds];
}

class DogImagesLoaded extends DogState {
  final List<String> imageURLs;

  const DogImagesLoaded({@required this.imageURLs});

  @override
  List<Object> get props => [imageURLs];
}

class DogInfoFailed extends DogState {}
