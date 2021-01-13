import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  final String title;
  final String slug;

  const Breed(this.title, this.slug);

  @override
  List<Object> get props => [title, slug];
}
