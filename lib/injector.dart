import 'package:eval/bloc/dog_bloc.dart';
import 'package:eval/domain/network.dart';
import 'package:eval/domain/repository.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void init() {
  injector.registerSingleton<NetworkDataSource>(NetworkDataSource());

  injector.registerSingleton<Repository>(Repository(injector()));

  injector.registerFactory<DogBloc>(() => DogBloc(repo: injector()));
}
