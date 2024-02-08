import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/app/core_widgets/cta_clickable.dart';

@RoutePage(name: 'CardPhotoRoute')
class CardPhotoView extends ConsumerStatefulWidget {
  const CardPhotoView({
    super.key,
    this.onInit,
    required this.card,
  });

  final Future<dynamic> Function()? onInit;
  final String card;

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
    final theme = ref.watch(MyAppX.theme.current);
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
                widget.card.replaceFirst('images', 'svgs').replaceFirst('png', 'svg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          32.toAutoScaledHeight.toVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CtaClickable(
                onPressed: () => MyAppX.router.pop(true),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colors.primary,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check,
                        color: theme.colors.onPrimary,
                        size: 18,
                      ),
                      6.toAutoScaledWidth.toHorizontalSizedBox,
                      Text(
                        'Select',
                        style: theme.themeText.button?.copyWith(color: theme.colors.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
              8.toAutoScaledWidth.toHorizontalSizedBox,
              CtaClickable(
                onPressed: () => MyAppX.router.pop(false),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colors.error,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.close,
                        color: theme.colors.onError,
                        size: 18,
                      ),
                      6.toAutoScaledWidth.toHorizontalSizedBox,
                      Text(
                        'Cancel',
                        style: theme.themeText.button?.copyWith(color: theme.colors.onError),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
