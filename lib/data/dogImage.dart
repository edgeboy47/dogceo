import 'package:equatable/equatable.dart';
import 'package:eval/data/breed.dart';

class DogImage extends Equatable {
  final String url;
  final Breed breed;

  DogImage(this.url, this.breed);

  @override
  List<Object> get props => [url, breed];
}
