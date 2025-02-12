import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showtrack/core/application.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';
import 'package:showtrack/ui/pages/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/pages/home/widgets/add_show_button.dart';
import 'package:showtrack/ui/pages/home/widgets/filter_show_dialog.dart';
import 'package:showtrack/ui/pages/home/widgets/show_preview_card.dart';
import 'package:showtrack/ui/styles/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = getIt<HomeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
        backgroundColor: AppColors.midRed,
        foregroundColor: AppColors.white,
        actions: [
          IconButton(
            icon: Icon(MdiIcons.filterVariant),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                        value: homeBloc,
                        child: const FilterShowDialog(),
                      ));
            },
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: RepositoryProvider(
        create: (context) => TvShowRepository,
        child: BlocProvider(
          create: (context) => homeBloc..add(HomeLoadEvent()),
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  AddShowButton(),
                  SizedBox(height: 20),
                  Expanded(
                    child: HomeShowLayout(),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class HomeShowLayout extends StatelessWidget {
  const HomeShowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.status.when(
          initial: () => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          empty: () => const Center(
            child: Text(
              'Hmm.. parece que não temos séries para mostrar. \nQue tal adicionar algumas?',
              textAlign: TextAlign.center,
            ),
          ),
          success: () => ListView.builder(
            itemCount: state.shows.length,
            itemBuilder: (context, index) {
              return ShowPreviewCard(show: state.shows[index]);
            },
          ),
          failure: () => const Center(
            child: Text('Erro ao carregar suas séries'),
          ),
        );
      },
    );
  }
}
