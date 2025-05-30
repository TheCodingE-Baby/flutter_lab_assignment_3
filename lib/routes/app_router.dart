import 'package:go_router/go_router.dart' show GoRoute, GoRouter;
import '../data/models/album_model.dart';
import '../presentation/theme/screens/album_list_screen.dart';
import '../presentation/theme/screens/album_details_screen.dart';


final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AlbumListScreen(),
    ),
    GoRoute(
      path: '/album/:id',
      builder: (context, state) {
        final albumId = int.parse(state.pathParameters['id']!);
        return AlbumDetailScreen(album: AlbumModel(id: albumId, userId: 0, title: '', coverUrl: ''));
      },
    ),
  ],
);