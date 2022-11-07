import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:showtrack/core/features/common/widgets/buttons/add_serie_button.dart';
import 'package:showtrack/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _addShow() {
    Navigator.pushNamed(context, '/search');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: COR_PRIMARIA,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: AddSerieButton(
                  label: 'Nova Série',
                  icon: LineIcons.plusCircle,
                  onPressed: _addShow),
            ),
            const SizedBox(height: 200),
            const Text(
              'Hm parece que não há nada para ser exibido aqui... Que tal adicionar uma série?',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
