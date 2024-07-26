import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String id;
  final String date;
  final String user;
  final String status;
  final String total;
  final String quantityProducts;
  final Color colors;
  const CardView({
    super.key,
    required this.id,
    required this.date,
    required this.user,
    required this.status,
    required this.total,
    required this.quantityProducts,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 5,
          color: colors,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 8),
                Text(
                  id,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  user,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  status,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  total,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  quantityProducts,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )),
    );
  }
}
