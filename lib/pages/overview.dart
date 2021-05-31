import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/events/baby_born.dart';
import 'package:cashflow_sheet_helper/state/game/events/balance_manually_modified.dart';
import 'package:cashflow_sheet_helper/state/game/events/cashflow_reached.dart';
import 'package:cashflow_sheet_helper/state/game/events/doodad_bought.dart';
import 'package:cashflow_sheet_helper/state/game/events/loan_paid_back.dart';
import 'package:cashflow_sheet_helper/state/game/events/loan_taken.dart';
import 'package:cashflow_sheet_helper/state/game/events/money_given_to_charity.dart';
import 'package:cashflow_sheet_helper/state/game/events/unemployment_incurred.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/perform_balance_modification_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/rows/button_row.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_doodad_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/pay_back_loan_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/take_up_loan_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/yes_no_alert_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/rows/overview_row.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Overview extends StatefulWidget {
  static const ROUTE_ID = "/";

  const Overview();

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  late final PlayerBloc _playerBloc;

  @override
  void initState() {
    super.initState();
    _playerBloc = context.read<PlayerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    // TODO Make dimensions dynamic with 'MediaQuery.of()'
    final player = Player.getInstance();

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const VariableSizeTextField(
                      "Income and balance overview", 25, TextAlign.center),
                ),
                OverviewRow("Income",
                    "${player.activeIncome} + ${state.passiveIncome}"),
                OverviewRow("Expenses", "${state.totalExpenses}"),
                OverviewRow("Cashflow", "${state.cashflow}"),
                OverviewRow("Account balance", "${state.balance}"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const VariableSizeTextField(
                      "Actions", 25, TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => _processCashflowDay(state),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const VariableSizeTextField(
                          "Cashflow Day!", 40, TextAlign.center),
                    ),
                  ),
                ),
                ButtonRow("Charity", "Doodad", () => _processCharity(state),
                    () => _processDoodad()),
                ButtonRow(
                    "Child (Current: ${state.numChildren})",
                    "Unemployed",
                    state.numChildren < 3
                        ? () => _processChildBorn(player, state)
                        : null,
                    () => _processUnemployment(state)),
                ButtonRow(
                  "Take up loan",
                  "Pay back loan",
                  () => _processLoanTaken(),
                  state.bankLoan > 0 ? () => _processLoanPaidBack() : null,
                ),
                ElevatedButton(onPressed: _processManualAccountBalanceModification,
                    child: const VariableSizeTextField("Manual Account Balance Modification", 18, TextAlign.center)),
              ],
            ),
          ),
        );
      },
    );
  }

  void _processManualAccountBalanceModification() async {
    final balanceManuallyModified = await showDialog<BalanceManuallyModified>(
        context: context,
        builder: (_) => PerformBalanceModificationDialog(),
    );
    if (balanceManuallyModified != null) {
      final String sign = balanceManuallyModified.increase ? "+" : "-";
      _playerBloc.add(balanceManuallyModified);
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          const Text("Account balance adapted."),
          Text("Balance $sign${balanceManuallyModified.amount}"),
        ]),
      );
    }

  }

  void _processLoanPaidBack() async {
    final loanPaidBack = await showDialog<LoanPaidBack>(
        context: context,
        builder: (context) {
          return BlocProvider<PlayerBloc>.value(
            value: _playerBloc,
            child: PayBackLoanDialog(),
          );
        });
    if (loanPaidBack != null) {
      _playerBloc.add(loanPaidBack);
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        const Text("Loan amount reduced."),
        Text("Balance -${loanPaidBack.amount}"),
        Text("Monthly expenses -${loanPaidBack.amount * 0.1}"),
      ]));
    }
  }

  void _processLoanTaken() async {
    final loanTaken = await showDialog<LoanTaken>(
        context: context,
        builder: (context) {
          return TakeUpLoanDialog();
        });
    if (loanTaken != null) {
      _playerBloc.add(loanTaken);
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        const Text("Loan taken."),
        Text("Balance +${loanTaken.amount}"),
        Text("Monthly expenses +${loanTaken.amount * 0.1}"),
      ]));
    }
  }

  void _processUnemployment(PlayerState state) async {
    final dialogResult = await showDialog<bool>(
        context: context,
        builder: (_) {
          return YesNoAlertDialog(
            "Oh no!",
            Text("Enter unemployed state for two rounds? This will deduct "
                "your total expenses (${state.totalExpenses}) from your account once."),
          );
        });
    if (dialogResult ?? false) {
      _playerBloc.add(const UnemploymentIncurred());
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          const Text("Incurred unemployment."),
          Text("Cash -${state.totalExpenses}"),
        ]),
      );
    }
  }

  void _processChildBorn(Player player, PlayerState state) async {
    final currentChildExpenses = state.totalChildExpenses;
    final newChildExpenses = currentChildExpenses + player.monthlyChildExpenses;
    final dialogResult = await showDialog<bool>(
        context: context,
        builder: (_) {
          return YesNoAlertDialog(
              "Get baby",
              Text(
                  "Get a baby? This will increase your monthly child expenses from $currentChildExpenses to $newChildExpenses."));
        });
    if (dialogResult ?? false) {
      _playerBloc.add(const BabyBorn());
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        const Text("Child added."),
        Text("Monthly expenses +${player.monthlyChildExpenses}"),
      ]));
    }
  }

  void _processCashflowDay(PlayerState state) {
    _playerBloc.add(const CashflowReached());
    ScaffoldMessenger.of(context)
        .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
      const Text("Monthly cashflow added to balance."),
      Text("Cash +${state.cashflow}"),
    ]));
  }

  void _processCharity(PlayerState state) async {
    final charityAmount = state.totalIncome * 0.1;
    final dialogResult = await showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return YesNoAlertDialog(
              "Give money to charity",
              Text(
                  "Give 10 % of your total income ($charityAmount) to charity?"));
        });

    if (dialogResult ?? false) {
      _playerBloc.add(const MoneyGivenToCharity());
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        const Text("10 % of income given to charity."),
        Text("Cash -$charityAmount"),
      ]));
    }
  }

  void _processDoodad() async {
    final TextEditingController amountController = TextEditingController();
    final doodadBought = await showDialog<DoodadBought>(
        context: context,
        builder: (context) {
          return BuyDoodadDialog(amountController);
        });
    if (doodadBought != null) {
      _playerBloc.add(doodadBought);
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        const Text("Doodad bought."),
        Text("Cash -${doodadBought.amount}"),
      ]));
    }
  }
}
