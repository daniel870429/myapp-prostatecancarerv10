import 'package:flutter/material.dart';

/// A custom slider track shape that paints a gradient.
class GradientSliderTrackShape extends RoundedRectSliderTrackShape {
  /// The gradient to use for painting the track.
  final LinearGradient gradient;

  /// Creates a [GradientSliderTrackShape] with a given gradient.
  const GradientSliderTrackShape({
    this.gradient = const LinearGradient(
      colors: [Colors.green, Colors.yellow, Colors.red],
    ),
  });

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset, // Add this missing parameter
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    // If the slider track height is 0, don't paint anything.
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    // Create a shader from the gradient and the track's bounding box.
    final Paint paint = Paint()..shader = gradient.createShader(trackRect);

    // Define the track's rounded rectangle shape.
    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final RRect rrect = RRect.fromRectAndRadius(trackRect, trackRadius);

    // Paint the gradient track.
    context.canvas.drawRRect(rrect, paint);
  }
}
