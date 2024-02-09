import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokerface/data/models/card.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/squircle_button.dart';

@RoutePage(name: 'CardPhotoRoute')
class CardPhotoView extends ConsumerStatefulWidget {
  const CardPhotoView({
    super.key,
    this.onInit,
    required this.card,
  });

  final Future<dynamic> Function()? onInit;
  final Card card;

  @override
  ConsumerState<CardPhotoView> createState() => _CardPhotoViewState();
}

class _CardPhotoViewState extends ConsumerState<CardPhotoView> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        widget.onInit?.call().then(
              (value) => MyAppX.router.pop(value),
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: widget.card,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6 * (333 / 234),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 4,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                widget.card.image.svg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          32.toAutoScaledHeight.toVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                child: SquareButton(
                  type: ButtonType.primary,
                  text: 'Select',
                  onPressed: () => MyAppX.router.pop(true),
                ),
              ),
              8.toAutoScaledWidth.toHorizontalSizedBox,
              Expanded(
                child: SquareButton(
                  type: ButtonType.error,
                  text: 'Cancel',
                  onPressed: () => MyAppX.router.pop(false),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
