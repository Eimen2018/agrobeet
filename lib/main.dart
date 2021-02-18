import 'package:agro_beet/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  runApp(AfroBeet());
}

class AfroBeet extends StatelessWidget {
  const AfroBeet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afro Beet',
      home: Home(),
    );
  }
}
