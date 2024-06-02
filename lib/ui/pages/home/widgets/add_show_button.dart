import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showtrack/ui/pages/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/pages/search/search_page.dart';
import 'package:showtrack/ui/styles/colors.dart';

class AddShowButton extends StatelessWidget {
  const AddShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.midRed,
        fixedSize: const Size(250, 50),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: homeBloc,
              child: const SearchPage(),
            ),
          ),
        );
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
