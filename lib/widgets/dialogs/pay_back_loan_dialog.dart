import 'package:cashflow_sheet_helper/state/player/events/loan_paid_back.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/select_amount_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayBackLoanDialog extends StatefulWidget {
  @override
  _PayBackLoanDialogState createState() => _PayBackLoanDialogState();
}

class _PayBackLoanDialogState extends State<PayBackLoanDialog> {
  final TextEditingController _amountController = TextEditingController();
  late final PlayerBloc _playerBloc;

  late double _step;

  @override
  void initState() {
    super.initState();
    _playerBloc = context.read<PlayerBloc>();
    _step = 1;
    _amountController.text = "${_step * 1000}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return SelectAmountDialog(
          title: "Choose amount to be paid back",
          infoBoxText: "Monthly expenses -${_step * 100}",
          amountController: _amountController,
          callbackAmountIncreased: () => _processAmountIncreased(state),
          callbackAmountDecreased: _processAmountDecreased,
          callbackDialogConfirmed: _processConfirm,
          callbackDialogAborted: _processAbort,
        );
      },
    );
  }

  void _processAmountIncreased(PlayerState state) {
    if (_step * 1000 < state.bankLoan) {
      _step++;
      setState(() {
        _amountController.text = "${_step * 1000}";
      });
    }
  }

  void _processAmountDecreased() {
    if (_step > 1) {
      _step--;
      setState(() {
        _amountController.text = "${_step * 1000}";
      });
    }
  }
  
  void _processConfirm() {
    Navigator.pop(context, LoanPaidBack(double.parse(_amountController.text)));
  }
  
  void _processAbort() {
    Navigator.pop(context);
  }
}
