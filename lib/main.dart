import 'package:flutter/material.dart';
import 'package:foodly/bloc/product_bloc/product_bloc_bloc.dart';
import 'package:foodly/models/menu.dart';
import 'package:foodly/models/shop.dart';
import 'package:foodly/pages/detailsPage.dart';
import 'package:foodly/restaurant_page.dart';
import 'package:foodly/routes/routed.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ProductBlocBloc>(
          lazy: false,
          create: (BuildContext context) =>
              ProductBlocBloc()..add(GetProducts()),
        )
      ],
      child: BlocBuilder<ProductBlocBloc, ProductBlocState>(
        builder: (context, state) {
          if (state is ProductIsLoaded) {
            List<CategoryMenu> product = state.demoCategoryMenus;

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                "/": (context) => RestaurantPage(
                      demoCategoryMenus: product,
                    ),
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
