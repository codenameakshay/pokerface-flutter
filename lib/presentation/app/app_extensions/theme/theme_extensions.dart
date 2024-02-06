part of '../app_extension.dart';

abstract class DimensionalPolicies {
  DimensionalPolicies._();
  static const designMobileWidth = 360.0;
  static const designMobileHeight = 720.0;

  static const designTabletWidth = 768.0;
  static const designTabletHeight = 1024.0;

  static final designWidth = () {
    late double width;

    final context = MyAppX.currentContext;

    if (context != null) {
      if (MediaQuery.of(context).size.width >= designTabletWidth) {
        width = designTabletWidth;
      } else {
        width = designMobileWidth;
      }
    } else {
      width = designMobileWidth;
    }

    return width;
  }();

  static final designHeight = () {
    late double height;

    final context = MyAppX.currentContext;

    if (context != null) {
      if (MediaQuery.of(context).size.height >= designTabletHeight) {
        height = designTabletHeight;
      } else {
        height = designMobileHeight;
      }
    } else {
      height = designMobileHeight;
    }

    return height;
  }();

  static double get policyRatioForWidth {
    final deviceWidth = () {
      late double width;

      final context = MyAppX.currentContext;

      if (context != null) {
        width = MediaQuery.of(context).size.width;
      } else {
        width = designWidth;
      }

      return width;
    }();

    final widthScaleRatio = deviceWidth / designWidth;

    return widthScaleRatio;
  }

  static double get policyRatioForHeight {
    final deviceHeight = () {
      late double height;

      final context = MyAppX.currentContext;

      if (context != null) {
        height = MediaQuery.of(context).size.height;
      } else {
        height = designHeight;
      }

      return height;
    }();

    final heightScaleRatio = deviceHeight / designHeight;

    return heightScaleRatio;
  }
}

extension AutoScaledDimensionX on double {
  double get toAutoScaledWidth {
    final autoScaledDimension = this * DimensionalPolicies.policyRatioForWidth;

    return autoScaledDimension;
  }

  double get toAutoScaledHeight {
    final autoScaledDimension = this * DimensionalPolicies.policyRatioForWidth;

    return autoScaledDimension;
  }
}

extension AutoScaledDimensionIntX on int {
  double get toAutoScaledWidth {
    final autoScaledDimension = this * DimensionalPolicies.policyRatioForWidth;

    return autoScaledDimension;
  }

  double get toAutoScaledHeight {
    final autoScaledDimension = this * DimensionalPolicies.policyRatioForHeight;

    return autoScaledDimension;
  }
}

extension AutoScaledFontX on double {
  double get toAutoScaledFont {
    final autoScaledFont = this * DimensionalPolicies.policyRatioForWidth;

    return autoScaledFont;
  }
}

extension AutoScaledFontIntX on int {
  double get toAutoScaledFont {
    final autoScaledFont = this * DimensionalPolicies.policyRatioForWidth;

    return autoScaledFont;
  }
}

extension PaddingX on double {
  EdgeInsets get toHorizontalPadding => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get toVerticalPadding => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get toLeftOnlyPadding => EdgeInsets.only(left: this);

  EdgeInsets get toRightOnlyPadding => EdgeInsets.only(right: this);

  EdgeInsets get toTopOnlyPadding => EdgeInsets.only(top: this);

  EdgeInsets get toBottomOnlyPadding => EdgeInsets.only(bottom: this);
}

extension PaddingIntX on int {
  EdgeInsets get toHorizontalPadding => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get toVerticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get toLeftOnlyPadding => EdgeInsets.only(left: toDouble());

  EdgeInsets get toRightOnlyPadding => EdgeInsets.only(right: toDouble());

  EdgeInsets get toTopOnlyPadding => EdgeInsets.only(top: toDouble());

  EdgeInsets get toBottomOnlyPadding => EdgeInsets.only(bottom: toDouble());
}

extension MarginX on double {
  EdgeInsets get toHorizontalMargin => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get toVerticalMargin => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get toLeftOnlyMargin => EdgeInsets.only(left: this);

  EdgeInsets get toRightOnlyMargin => EdgeInsets.only(right: this);

  EdgeInsets get toTopOnlyMargin => EdgeInsets.only(top: this);

  EdgeInsets get toBottomOnlyMargin => EdgeInsets.only(bottom: this);
}

extension MarginIntX on int {
  EdgeInsets get toHorizontalMargin => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get toVerticalMargin => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get toLeftOnlyMargin => EdgeInsets.only(left: toDouble());

  EdgeInsets get toRightOnlyMargin => EdgeInsets.only(right: toDouble());

  EdgeInsets get toTopOnlyMargin => EdgeInsets.only(top: toDouble());

  EdgeInsets get toBottomOnlyMargin => EdgeInsets.only(bottom: toDouble());
}

extension SizedBoxX on double {
  SizedBox get toHorizontalSizedBox => SizedBox(
        width: this,
      );

  SizedBox get toVerticalSizedBox => SizedBox(
        height: this,
      );
}

extension SizedBoxIntX on int {
  SizedBox get toHorizontalSizedBox => SizedBox(
        width: toDouble(),
      );

  SizedBox get toVerticalSizedBox => SizedBox(
        height: toDouble(),
      );
}

extension TextStyleX on double {
  TextStyle get toTextStyle => TextStyle(
        fontSize: this,
      );
}

extension TextStyleIntX on int {
  TextStyle get toTextStyle => TextStyle(
        fontSize: toDouble(),
      );
}
