import 'package:circle_gadget/circle_gadget.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _gadgetValueTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _gadgetValueTween = Tween<double>(
      begin: 0,
      end: 180,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _startAnimationBtn(context),
            _circleGadget,
          ],
        ),
      ),
    );
  }

  Widget get _circleGadget => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _animatedBuilder(context),
          ],
        ),
      );

  AnimatedBuilder _animatedBuilder(context) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          const double width = 200;
          const double height = 200;

          return SizedBox.fromSize(
            size: const Size(width, height),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${_gadgetValueTween.value.toInt()} km/h",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                    ),
                  ),
                ),
                CircularGadgetWidget(
                  strokeColor: Theme.of(context).primaryColor.withAlpha(40),
                  strokeValueColor: Theme.of(context).primaryColor,
                  centerColor: Colors.grey.withAlpha(10),
                  strokeWidth: 8,
                  min: 0.0,
                  max: 180.0,
                  value: _gadgetValueTween.value,
                  width: width,
                  height: height,
                ),
              ],
            ),
          );
        },
      );

  Widget _startAnimationBtn(context) => ElevatedButton(
        onPressed: () {
          if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Start Animation",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      );
}
