import 'package:flutter/material.dart';
import '../models/kos_models.dart';

class KosListItem extends StatelessWidget {
  final KosModel kos;

  const KosListItem({Key? key, required this.kos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to detail page
        // Get.toNamed('/kos-detail', arguments: kos);
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(kos.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kos.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(kos.location),
                  Text(kos.facilities.join(' - ')),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(kos.rating.toString()),
                    ],
                  ),
                  Text('${kos.price}/bln', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}