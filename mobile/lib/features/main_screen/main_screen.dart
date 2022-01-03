import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/backet_screen/backet_screen.dart';
import 'package:furniture_shop/features/favorites_screen/favorites_screen.dart';
import 'package:furniture_shop/features/main_screen/bottom_bar.dart';
import 'package:furniture_shop/features/main_screen/main_screen_cubit.dart';
import 'package:furniture_shop/features/products_screen/products_screen.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/profile_screen/profile_screen.dart';
import 'package:furniture_shop/profile_screen/profile_screen_cubit.dart';
import 'package:provider/provider.dart';

class MainScreen extends HookWidget {
  MainScreen({Key? key}) : super(key: key);

  final screens = [
    const ProductsScreen(),
    const FavoritesScreen(),
    const BacketScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      fetchAll(context);
    });

    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocConsumer<MainScreenCubit, Screen>(
        listener: _mainScreenCubitListener,
        builder: (context, state) {
          return Stack(
            children: [
              IndexedStack(
                index: state.index,
                children: screens,
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomBar(),
              ),
            ],
          );
        },
      ),
    );
  }

  void _mainScreenCubitListener(BuildContext context, Screen state) {
    switch (state) {
      case Screen.products:
        context.read<ProductsScreenCubit>().fetch();
        break;
      case Screen.profile:
        context.read<ProfileScreenCubit>().fetch();
        break;
      default:
        break;
    }
  }

  Future<void> fetchAll(BuildContext context) async {
    await Future.wait([
      context.read<ProductsScreenCubit>().fetch(),
    ]);
  }
}

class MainPage extends MaterialPage<void> {
  MainPage()
      : super(
          child: MainScreen(),
        );
}
