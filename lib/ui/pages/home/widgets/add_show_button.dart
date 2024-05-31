import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showtrack/ui/pages/search/search_page.dart';
import 'package:showtrack/ui/styles/colors.dart';

class AddShowButton extends StatelessWidget {
  const AddShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: white,
        backgroundColor: midRed,
        fixedSize: const Size(250, 50),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchPage()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Adicionar nova série',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            MdiIcons.plusCircle,
            size: 30,
          ),
        ],
      ),
    );
  }
}
