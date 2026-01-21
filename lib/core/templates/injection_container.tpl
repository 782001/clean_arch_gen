// {{feature}}

sl.registerFactory<{{Module}}Cubit>(() => {{Module}}Cubit(
  k{{Feature}}UseCase: sl(),
));

sl.registerLazySingleton<{{Feature}}UseCase>(
  () => {{Feature}}UseCase(baseRepository: sl()),
);

sl.registerLazySingleton<{{Feature}}BaseRepository>(
  () => {{Feature}}Repository(sl()),
);

sl.registerLazySingleton<{{Feature}}BaseRemoteDataSource>(
  () => {{Feature}}RemoteDataSource(),
);
