import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Income extends StatelessWidget {
  static const String ROUTE_ID = "/income";

  const Income();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: const TwoTextFieldRow(
              "Kind",
              "Cashflow",
              32
            ),
          ),
          TwoTextFieldRow("Salary:", "4200", 19),
          TwoTextFieldRow("Interests & dividends:", "400", 19),
          Padding(
            padding: const EdgeInsets.only(top: 19),
            child: VariableSizeTextField(
              "Real estate & company holdings:",
              25,
              TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.holdings.length,
              itemBuilder: (context, i) {
                final holding = state.holdings[i];
                return ListTile(
                  title: TwoTextFieldRow(
                    "${holding.name}",
                    "${holding.cashflow}",
                    18,
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
