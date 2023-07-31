import 'package:document_recognition/app.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Document Classification',
      theme: ThemeData(
        primarySwatch: MaterialColor(const Color(0xffe65100).value, {
          100: Color(const Color(0xffffe0b2).value),
          200: Color(const Color(0xffffcc80).value),
          300: Color(const Color(0xffffb74d).value),
          400: Color(const Color(0xffffa726).value),
          50: Color(const Color(0xfffff3e0).value),
          500: Color(const Color(0xffff9800).value),
          600: Color(const Color(0xfffb8c00).value),
          700: Color(const Color(0xfff57c00).value),
          800: Color(const Color(0xffef6c00).value),
          900: Color(const Color(0xffe65100).value)
        }),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
