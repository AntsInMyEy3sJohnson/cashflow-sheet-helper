import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/player/events/baby_born.dart';
import 'package:cashflow_sheet_helper/state/player/events/balance_manually_modified.dart';
import 'package:cashflow_sheet_helper/state/player/events/business_boom_occurred.dart';
import 'package:cashflow_sheet_helper/state/player/events/cashflow_reached.dart';
import 'package:cashflow_sheet_helper/state/player/events/doodad_bought.dart';
import 'package:cashflow_sheet_helper/state/player/events/loan_paid_back.dart';
import 'package:cashflow_sheet_helper/state/player/events/loan_taken.dart';
import 'package:cashflow_sheet_helper/state/player/events/money_given_to_charity.dart';
import 'package:cashflow_sheet_helper/state/player/events/unemployment_incurred.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/constants/dimension_constants.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_doodad_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/configure_business_boom_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dialog_helper.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/pay_back_loan_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/perform_balance_modification_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/take_up_loan_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/yes_no_alert_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dimension_helper.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/adjustable_padding.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/rows/button_row.dart';
import 'package:cashflow_sheet_helper/widgets/rows/overview_row.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
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
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final player = state.player;
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                AdjustablePadding(
                  paddingKind: PaddingKind.medium,
                  child: const VariableSizeTextField(
                      "Income and balance overview",
                      TextSizeConstants.TEXT_FIELD_HEADING,
                      TextAlign.center),
                ),
                OverviewRow("Income",
                    "${player.activeIncome} + ${state.passiveIncome}"),
                OverviewRow("Expenses", "${state.totalExpenses}"),
                OverviewRow("Cashflow", "${state.cashflow}"),
                OverviewRow("Account balance", "${state.balance}"),
                AdjustablePadding(
                  paddingKind: PaddingKind.medium,
                  child: const VariableSizeTextField("Actions",
                      TextSizeConstants.TEXT_FIELD_HEADING, TextAlign.center),
                ),
                AdjustablePadding(
                  paddingKind: PaddingKind.medium,
                  child: ElevatedButton(
                    onPressed: () => _processCashflowDay(state),
                    child: AdjustablePadding(
                      paddingKind: PaddingKind.large,
                      child: const VariableSizeTextField("Cashflow Day!",
                          TextSizeConstants.BUTTON_LARGE, TextAlign.center),
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
                ButtonRow(
                    "Business Boom",
                    "Manually Modify Balance",
                    _processBusinessBoom,
                    _processManualAccountBalanceModification),
              ],
            ),
          ),
        );
      },
    );
  }

  void _processBusinessBoom() async {
    final BusinessBoomOccurred? businessBoomOccurred =
        await DialogHelper<BusinessBoomOccurred?>()
            .displayDialog(context, ConfigureBusinessBoomDialog());
    if (businessBoomOccurred != null) {
      _playerBloc.add(businessBoomOccurred);
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        const Text("Business boom occurred."),
        Text(
            "All business with cashflow of less than ${businessBoomOccurred.affectsBusinessesBelowThreshold} "
            "increased their cashflow by ${businessBoomOccurred.cashflowIncrease}."),
      ]));
    }
  }

  void _processManualAccountBalanceModification() async {
    final balanceManuallyModified =
        await DialogHelper<BalanceManuallyModified?>()
            .displayDialog(context, PerformBalanceModificationDialog());
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
    final loanPaidBack = await DialogHelper<LoanPaidBack?>().displayDialog(
        context,
        BlocProvider<PlayerBloc>.value(
          value: _playerBloc,
          child: PayBackLoanDialog(),
        ));
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
    final loanTaken = await DialogHelper<LoanTaken?>()
        .displayDialog(context, TakeUpLoanDialog());
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
    final dialogResult = await DialogHelper<bool?>().displayDialog(
        context,
        YesNoAlertDialog(
          "Unemployment",
          Text("Enter unemployed state for two rounds? This will deduct "
              "your total expenses (${state.totalExpenses}) from your account once."),
        ));
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
    final dialogResult = await DialogHelper<bool?>().displayDialog(
        context,
        YesNoAlertDialog(
            "Get Baby",
            Text(
                "Get a baby? This will increase your monthly child expenses from $currentChildExpenses to $newChildExpenses.")));
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
    final dialogResult = await DialogHelper<bool?>().displayDialog(
        context,
        YesNoAlertDialog(
            "Give Money To Charity",
            Text(
                "Give 10 % of your total income ($charityAmount) to charity?")));
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
    final doodadBought = await DialogHelper<DoodadBought?>()
        .displayDialog(context, BuyDoodadDialog(amountController));
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
