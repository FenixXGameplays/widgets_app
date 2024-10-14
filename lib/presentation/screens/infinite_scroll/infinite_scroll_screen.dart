import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const routeName = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context, index) {
        return const FadeInImage(
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage('https://picsum.photos/id/1/500/300'),
        );
      }),
    );
  }
}
