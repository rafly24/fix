import 'package:flutter/material.dart';
import '../models/kos_models.dart';

class KosListItem extends StatelessWidget {
  final KosModel kos;

  const KosListItem({super.key, required this.kos});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // child: Image.network(
              //   kos.imageUrl,
              //   height: 100,
              //   width: 100,
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        label: Text('Best'),
                        backgroundColor: Colors.red[200],
                      ),
                      SizedBox(width: 4),
                      Chip(
                        label: Text('Most Viewed'),
                        backgroundColor: Colors.green[200],
                      ),
                    ],
                  ),
                  Text(
                    kos.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(kos.location),
                  Text(kos.facilities.join(' - ')),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text(kos.rating.toString()),
                    ],
                  ),
                  Text(
                    '${kos.price}/bln',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
