import 'package:cashflow_sheet_helper/state/navigation/events/navigation_event.dart';

class PageSwitched extends NavigationEvent {

  final String targetPageRoute;

  const PageSwitched(this.targetPageRoute);

}