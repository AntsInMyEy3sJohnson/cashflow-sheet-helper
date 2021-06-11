import 'package:cashflow_sheet_helper/body.dart';
import 'package:cashflow_sheet_helper/pages/init_page.dart';
import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/game_state.dart';
import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyScaffold extends StatelessWidget {
  const BodyScaffold();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      final showAppBarAndDrawer = state.currentPageRoute != InitPage.ROUTE_ID;
      return MultiBlocProvider(
          providers: [
            BlocProvider<PageBloc>(
              create: (_) => PageBloc(state.currentPageRoute),
            ),
            BlocProvider<PlayerBloc>(
              create: (_) => PlayerBloc(PlayerState.dummyState()),
            ),
          ],
          child: Scaffold(
            appBar: _appBar(showAppBarAndDrawer),
            drawer: _drawer(showAppBarAndDrawer),
            body: const Body(),
          ));
    });
  }

  AppBar? _appBar(bool showAppBar) {
    return showAppBar ? AppBar() : null;
  }

  Widget? _drawer(bool showAppBar) {
    return showAppBar ? const NavigationDrawer() : null;
  }
}
