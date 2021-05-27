import 'package:cashflow_sheet_helper/data/holding_kind.dart';

class HoldingKindHelper {

  HoldingKindHelper._();

  static String toHumanReadableName(HoldingKind holdingKind) {
    switch (holdingKind) {
      case HoldingKind.singleFamilyHouse:
        return "Single-Family House (SFH)";
      case HoldingKind.multiFamilyHouse:
        return "Multi-Family House (MFH)";
      case HoldingKind.apartmentHouse:
        return "Apartment House (AH)";
      case HoldingKind.condominium:
        return "Condominium (CM)";
    }
  }

  static HoldingKind fromHumanReadableName(String value) {
    if (value == toHumanReadableName(HoldingKind.singleFamilyHouse)) {
      return HoldingKind.singleFamilyHouse;
    }
    if (value == toHumanReadableName(HoldingKind.multiFamilyHouse)) {
      return HoldingKind.multiFamilyHouse;
    }
    if (value == toHumanReadableName(HoldingKind.apartmentHouse)) {
      return HoldingKind.apartmentHouse;
    }
    return HoldingKind.condominium;
  }

}