import 'package:ser_manos/data/models/gender.dart';

export 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

String genderNameFromEnum(context, gender) {
  if (Gender.male == gender) {
    return AppLocalizations.of(context)!.male;
  } else if (Gender.female == gender) {
    return AppLocalizations.of(context)!.female;
  } else if (Gender.nonBinary == gender) {
    return AppLocalizations.of(context)!.nonBinary;
  }
  return "";
}

Gender? genderNameToGender(context, String gender) {
  if (gender == AppLocalizations.of(context)!.male) {
    return Gender.male;
  } else if (gender == AppLocalizations.of(context)!.female) {
    return Gender.female;
  } else if (gender == AppLocalizations.of(context)!.nonBinary) {
    return Gender.nonBinary;
  }
  return null;
}
