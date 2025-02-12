import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/data/model/show.dart';
import 'package:showtrack/ui/pages/home/bloc/home_bloc.dart';

class FilterShowDialog extends StatelessWidget {
  const FilterShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = context.read<HomeBloc>();

    return AlertDialog(
      title: const Text('Status'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckBoxStatus(
            text: 'Em exibição',
            value: false,
            onChanged: (value) {
              homeBloc
                  .add(const HomeFilterShowEvent(ShowStatusEnum.emExibicao));
            },
          ),
          CheckBoxStatus(
            text: 'A ser anunciado (TBA)',
            value: false,
            onChanged: (value) {
              homeBloc.add(const HomeFilterShowEvent(ShowStatusEnum.tba));
            },
          ),
          CheckBoxStatus(
            text: 'Em desenvolvimento',
            value: false,
            onChanged: (value) {
              homeBloc.add(
                  const HomeFilterShowEvent(ShowStatusEnum.emDesenvolvimento));
            },
          ),
          CheckBoxStatus(
            text: 'Finalizado',
            value: false,
            onChanged: (value) {
              homeBloc
                  .add(const HomeFilterShowEvent(ShowStatusEnum.finalizada));
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

class CheckBoxStatus extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool) onChanged;
  const CheckBoxStatus({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(text),
      value: value,
      onChanged: onChanged(value),
    );
  }
}
