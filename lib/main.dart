import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_recipies/models/hive_boxes.dart';
import 'package:my_recipies/models/ingredient.m.dart';
import 'package:my_recipies/models/recipe.m.dart';
import 'package:my_recipies/models/recipe_image.m.dart';
import 'package:my_recipies/models/recipe_instruction.m.dart';
import 'package:my_recipies/screens/home/home.dart';
import 'package:my_recipies/screens/recipe.dart';
import 'package:my_recipies/state/home.s.dart';
import 'package:my_recipies/theme/color_schemes.g.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await Hive.initFlutter();
  Hive
    ..registerAdapter(RecipeAdapter())
    ..registerAdapter(IngredientAdapter())
    ..registerAdapter(RecipeInstructionAdapter())
    ..registerAdapter(RecipeImageAdapter());

  await Hive.openBox<Recipe>(HiveBox.recipies.name);

  runApp(const MYrecipies());
}

class MYrecipies extends StatelessWidget {
  const MYrecipies({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'recipies/:id',
              builder: (context, state) => const RecipeScreen(),
            ),
          ],
        ),
      ],
    );

    return Provider(
      create: (context) => HomeState()..loadRecipies(),
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          typography: Typography.material2021(
            colorScheme: lightColorScheme,
          ),
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          typography: Typography.material2021(
            colorScheme: darkColorScheme,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
