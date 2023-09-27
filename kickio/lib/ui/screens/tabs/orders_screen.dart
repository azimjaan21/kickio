import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: orders.orderItems.length,
            itemBuilder: (context, i) {
              final order = orders.orderItems[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: ExpansionTile(
                    leading: const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.pending_actions_outlined,
                        size: 40,
                        color: Color.fromARGB(255, 27, 222, 111),
                      ),
                    ),
                    title: Text(
                      '\$${order.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 22),
                    ),
                    subtitle: Text(
                      DateFormat(
                        'd / MM / yyyy hh:mm',
                      ).format(order.date),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 54, 54, 54),
                      ),
                    ),
                    children: [
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          itemCount: order.products.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: 
                                order.products[index].quantity > 1 ? Text(
                                  '${order.products[index].title}   x ${order.products[index].quantity}',
                                  style: const TextStyle(fontSize: 18),
                                ): Text(
                                  order.products[index].title,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
