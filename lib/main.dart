import 'package:flutter/material.dart';

import 'screens/detail_screen.dart';
import 'screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail_page': (context) => const DetailPage(),
      },
    ),
  );
}
