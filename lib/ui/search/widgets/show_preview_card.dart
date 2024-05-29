import 'package:flutter/material.dart';
import 'package:showtrack/data/model/show.dart';

class ShowPreviewCard extends StatelessWidget {
  final Show show;
  const ShowPreviewCard({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(show.image?.medium ?? ''),
        title: Text(show.name),
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
