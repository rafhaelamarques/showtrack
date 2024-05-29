import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showtrack/data/repositories/tv_show_repository.dart';
import 'package:showtrack/styles/colors.dart';
import 'package:showtrack/ui/home/bloc/home_bloc.dart';
import 'package:showtrack/ui/home/widgets/add_show_button.dart';
import 'package:showtrack/ui/home/widgets/show_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: lightRed,
        foregroundColor: white,
      ),
      body: RepositoryProvider(
        create: (context) => TvShowRepository,
        child: BlocProvider(
          create: (context) => HomeBloc()..add(HomeLoadEvent()),
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  AddShowButton(),
                  Expanded(
                    child: HomeShowPresentation(),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class HomeShowPresentation extends StatelessWidget {
  const HomeShowPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status.isInitial || state.status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isSuccess) {
          return ListView.builder(
            itemCount: state.shows.length,
            itemBuilder: (context, index) {
              return ShowCard(show: state.shows[index]);
            },
          );
        }
        if (state.status.isEmpty) {
          return const Center(
            child: Text(
              'Hmm.. parece que não temos séries para mostrar. \nQue tal tentar adicionar algumas?',
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state.status.isFailure) {
          return const Center(child: Text('Erro ao carregar as séries'));
        }
        return const SizedBox();
      },
    );
  }
}
