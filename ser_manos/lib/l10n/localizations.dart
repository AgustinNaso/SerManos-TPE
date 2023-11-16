import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';
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

void setupLocalization() {

  // TODO: this is a quick solution, the es_AR doesn't work and exists
  var argentina = const NumberSymbols(
      NAME: "es",
      DECIMAL_SEP: ',',
      GROUP_SEP: '.',
      PERCENT: '%',
      ZERO_DIGIT: '0',
      PLUS_SIGN: '+',
      MINUS_SIGN: '-',
      EXP_SYMBOL: 'E',
      PERMILL: '\u2030',
      INFINITY: '\u221E',
      NAN: 'NaN',
      DECIMAL_PATTERN: '#,##0.###',
      SCIENTIFIC_PATTERN: '#E0',
      PERCENT_PATTERN: '#,##0\u00A0%',
      CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
      DEF_CURRENCY_CODE: r'$');

  numberFormatSymbols['es'] = argentina;
}