import 'package:flutter/material.dart';
import 'provider/favorites_provider.dart';
import 'screens/book.dart';
import 'screens/book_details.dart';
import 'screens/home.dart';
import 'screens/favorites.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MaterialApp(
        title: 'My Books',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => BooksPage(),
          '/favorites': (context) => MyFavoritesPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/book_details') {
            final BookDetailsArguments args = settings.arguments as BookDetailsArguments;
            return MaterialPageRoute(
              builder: (context) => BookDetailsPage(book: args.book),
            );
          }
          return null;
        },
      ),
    );
  }
}

class BookDetailsArguments {
  final Book book;

  BookDetailsArguments({required this.book});
}