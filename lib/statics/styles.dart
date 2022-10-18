import 'package:client/statics/colors.dart';

import 'package:flutter/material.dart';

TextStyle smallLight() =>
    const TextStyle(color: CustomTheme.white, fontSize: 15);
TextStyle mediumLight() =>
    const TextStyle(color: CustomTheme.white, fontSize: 21);
TextStyle bigLight() => const TextStyle(color: CustomTheme.white, fontSize: 27);

TextStyle smallGrey() => const TextStyle(color: CustomTheme.grey, fontSize: 15);
TextStyle mediumGrey() =>
    const TextStyle(color: CustomTheme.grey, fontSize: 21);
TextStyle bigGrey() => const TextStyle(color: CustomTheme.grey, fontSize: 27);

TextStyle smallDark() =>
    const TextStyle(color: CustomTheme.black, fontSize: 15);
TextStyle mediumDark() => const TextStyle(
    color: CustomTheme.black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle bigDark() => const TextStyle(color: CustomTheme.black, fontSize: 27);

TextStyle bigAlert() => const TextStyle(color: CustomTheme.red, fontSize: 27);
TextStyle mediumAlert() =>
    const TextStyle(color: CustomTheme.red, fontSize: 21);
TextStyle smallAlert() => const TextStyle(color: CustomTheme.red, fontSize: 15);

TextStyle bigSuccess() =>
    const TextStyle(color: CustomTheme.green, fontSize: 27);
TextStyle mediumSuccess() =>
    const TextStyle(color: CustomTheme.green, fontSize: 27);
TextStyle smallSuccess() =>
    const TextStyle(color: CustomTheme.green, fontSize: 27);
