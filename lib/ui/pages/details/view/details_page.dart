import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/core/application.dart';
import 'package:showtrack/core/styles/app_colors.dart';
import 'package:showtrack/ui/pages/details/bloc/details_bloc.dart';
import 'package:showtrack/ui/pages/details/view/details_presentation.dart';

class DetailsPage extends StatelessWidget {
  final int showId;
  const DetailsPage({
    super.key,
    required this.showId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        backgroundColor: AppColors.midRed,
        foregroundColor: AppColors.white,
      ),
      body: BlocProvider(
        create: (context) =>
            getIt<DetailsBloc>()..add(DetailsLoadEvent(showId: showId)),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            return state.status.when(
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: () => DetailsPresentation(show: state.show!),
              failure: () => const Center(
                child: Text('Erro ao carregar informações'),
              ),
            );
          },
        ),
      ),
    );
  }
}
