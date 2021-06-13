import 'package:cashflow_sheet_helper/pages/assets.dart';
import 'package:cashflow_sheet_helper/pages/expenses.dart';
import 'package:cashflow_sheet_helper/pages/income.dart';
import 'package:cashflow_sheet_helper/pages/init_page.dart';
import 'package:cashflow_sheet_helper/pages/liabilities.dart';
import 'package:cashflow_sheet_helper/pages/overview.dart';
import 'package:cashflow_sheet_helper/state/game/events/game_restarted.dart';
import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:cashflow_sheet_helper/state/navigation/events/page_switched.dart';
import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/events/player_state_cleared.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/dialog_helper.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/yes_no_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    final pageBloc = context.watch<PageBloc>();
    final gameBloc = context.watch<GameBloc>();
    final playerBloc = context.watch<PlayerBloc>();

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: const Text("Cashflow Sheet Helper"),
                ),
                ListTile(
                  title: const Text("Overview"),
                  onTap: () {
                    pageBloc.add(_pageSwitchedEvent(Overview.ROUTE_ID));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Income"),
                  onTap: () {
                    pageBloc.add(_pageSwitchedEvent(Income.ROUTE_ID));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Expenses"),
                  onTap: () {
                    pageBloc.add(_pageSwitchedEvent(Expenses.ROUTE_ID));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Assets"),
                  onTap: () {
                    pageBloc.add(_pageSwitchedEvent(Assets.ROUTE_ID));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Liabilities"),
                  onTap: () {
                    pageBloc.add(_pageSwitchedEvent(Liabilities.ROUTE_ID));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Divider(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ListTile(
                    title: const Text("Restart Game"),
                    onTap: () =>
                        _processGameRestartPressed(context, gameBloc, pageBloc, playerBloc),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _processGameRestartPressed(
      BuildContext context, GameBloc gameBloc, PageBloc pageBloc, PlayerBloc playerBloc) async {
    final result = await DialogHelper<bool?>().displayDialog(context, YesNoAlertDialog(
      "Game Restart",
      const Text(
          "Are you sure you would like to restart the game? This will clear the current "
              "game state and redirect you to the profession configuration screen."),
    ));
    if (result ?? false) {
      gameBloc.add(const GameRestarted());
      playerBloc.add(const PlayerStateCleared());
      pageBloc.add(_pageSwitchedEvent(InitPage.ROUTE_ID));
      Navigator.pop(context);
    }
  }

  PageSwitched _pageSwitchedEvent(String targetRoute) =>
      PageSwitched(targetRoute);
}
