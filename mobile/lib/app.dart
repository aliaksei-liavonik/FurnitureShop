import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/features/auth/auth_router.dart';
import 'package:furniture_shop/features/favorites_screen/favorites_screen_cubit.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/features/profile_screen/profile_screen_cubit.dart';
import 'package:furniture_shop/features/shopping_cart_screen/shopping_cart_screen_cubit.dart';
import 'package:furniture_shop/resources/app_theme.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: GlobalProvider(
        child: MaterialApp(
          title: 'Furniture Shop',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: const AuthRouter(),
        ),
      ),
    );
  }
}

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsScreenCubit(cqrs: context.read()),
        ),
        BlocProvider(
          create: (context) => ProfileScreenCubit(cqrs: context.read()),
        ),
        BlocProvider(
          create: (context) => ShoppingCartScreenCubit(cqrs: context.read()),
        ),
        BlocProvider(
          create: (context) => FavouritesScreenCubit(cqrs: context.read()),
        ),
      ],
      child: child,
    );
  }
}
