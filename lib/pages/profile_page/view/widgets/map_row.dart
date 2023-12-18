import 'package:flutter/material.dart';

class MapRow extends StatelessWidget {
  const MapRow({
    Key? key,
    required this.title,
    required this.descr,
  }) : super(key: key);

  final String title;
  final String descr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 24),
          Text(
            descr,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 18,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
