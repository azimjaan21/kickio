import 'package:flutter/material.dart';
import 'package:kickio/ui/screens/manage_product_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('User Information'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(ManageProductScreen.routeName);
              },
              icon: const Icon(Icons.settings_outlined),
              label: const Text('Manage Products'),),
        ));
  }
}
