import 'package:dio/dio.dart';
import 'package:eval/bloc/dog_bloc.dart';
import 'package:eval/data/local_data_source.dart';
import 'package:eval/data/remote_data_source.dart';
import 'package:eval/domain/dio_client.dart';
import 'package:eval/domain/local_cache.dart';
import 'package:eval/domain/repository.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void init() {
  // Remote Data
  injector.registerSingleton<Dio>(Dio());
  injector
      .registerSingleton<RemoteDataSource>(DioClient(client: injector<Dio>()));

  // Local Data
  injector.registerSingleton<LocalDataSource>(LocalCache());

  // Repository
  injector.registerSingleton<Repository>(Repository(
      remoteDataSource: injector<RemoteDataSource>(),
      localCache: injector<LocalDataSource>()));

  // Bloc
  injector.registerFactory<DogBloc>(() => DogBloc(repo: injector()));
}
