import 'package:flutter/material.dart' show Brightness, BuildContext, ColorScheme, Colors, MaterialApp, StatelessWidget, ThemeData, Widget, runApp;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_lab_assignment_3/data/services/api_services.dart';
import 'routes/app_router.dart';
import 'data/repos/album_repository.dart';
import 'data/repos/photo_repository.dart';
import '../logic/blocs/album_bloc.dart';
import '../logic/blocs/photo_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ApiServices apiServices = ApiServices(client: http.Client());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final albumRepository = AlbumRepository(apiServices: apiServices);
    final photoRepository = PhotoRepository(dio: dio);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlbumBloc(albumRepository: albumRepository, apiServices: apiServices),
        ),
        BlocProvider(
          create: (context) => PhotoBloc(photoRepository: photoRepository),
        ),
        BlocProvider(
          create: (context) => AlbumBloc(
            albumRepository: albumRepository,
            apiServices: apiServices,
          )..add(LoadAlbums()), // Load albums on startup
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Album App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blueAccent,
            brightness: Brightness.dark,
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}