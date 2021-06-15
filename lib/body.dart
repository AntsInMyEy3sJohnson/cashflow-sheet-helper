import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dimensions_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, Widget>(
      builder: (context, pageBlocState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: DimensionsHelper.largeVerticalPadding(context),
              horizontal: DimensionsHelper.largeHorizontalPadding(context)),
          child: pageBlocState,
        );
      },
    );
  }
}
