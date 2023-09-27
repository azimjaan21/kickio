import 'package:kickio/tools/file_importer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData theme = MyAppStyles.theme;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider<Orders>(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kickio',
        theme: theme,
        home: const TabsScreen(),
        routes: {
          NewestShoesDetailsScreen.routeName: (_) =>
              const NewestShoesDetailsScreen(),
          CartScreen.routeName: (_) => const CartScreen(),
          ManageProductScreen.routeName: (_) => const ManageProductScreen(),
          AddProductScreen.routeName: (_) => const AddProductScreen(),
        },
      ),
    );
  }
}
