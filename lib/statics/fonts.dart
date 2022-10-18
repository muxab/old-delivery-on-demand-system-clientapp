import 'package:client/statics/styles.dart';
import 'package:flutter/material.dart';

/// [Light] text
Text lightSmallText(String? content) => Text(
      content!.toString(),
      style: smallLight(),
    );
Text lightMediumText(String? content) => Text(
      content!.toString(),
      style: mediumLight(),
    );
Text lightBigText(String? content) => Text(
      content!.toString(),
      style: bigLight(),
    );

/// [Grey] text
Text greySmallText(String? content) => Text(
      content!.toString(),
      style: smallGrey(),
    );
Text greyMediumText(String? content) => Text(
      content!.toString(),
      style: mediumGrey(),
    );
Text greyBigText(String? content) => Text(
      content!.toString(),
      style: bigGrey(),
    );

/// [Dark] text
Text darkSmallText(String? content) => Text(
      content!.toString(),
      style: smallDark(),
    );
Text darkMediumText(String? content) => Text(
      content!.toString(),
      style: mediumDark(),
    );
Text darkBigText(String? content) => Text(
      content!.toString(),
      style: bigDark(),
    );

/// [Alert] text

Text alertSmallText(String? content) => Text(
      content!.toString(),
      style: smallAlert(),
    );
Text alertMediumText(String? content) => Text(
      content!.toString(),
      style: mediumAlert(),
    );
Text alertBigText(String? content) => Text(
      content!.toString(),
      style: bigAlert(),
    );
