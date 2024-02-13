part of '../view.dart';

class _Body extends StatelessWidget {
  const _Body({
    required this.params,
  });

  final _VSControllerParams params;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MediaQuery.of(context).padding.top.toVerticalSizedBox,
              10.toAutoScaledHeight.toVerticalSizedBox,
              _HandRanksList(params: params),
              256.toAutoScaledHeight.toVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
