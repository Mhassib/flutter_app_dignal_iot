import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class CustomPrettyGauge extends StatelessWidget {
  const CustomPrettyGauge({
    super.key,
    required this.title,
    required this.value,
    required this.segments,
    this.maxValue,
    this.unitValue
  });

  final String title;
  final double value;
  final List<GaugeSegment> segments;
  final double? maxValue;
  final String? unitValue;

  @override
  Widget build(BuildContext context) {
    return PrettyGauge(
      gaugeSize: 200,
      maxValue: maxValue ?? 100,
      needleColor: Colors.white,
      currentValue: value,
      valueWidget: Text('$value ${unitValue ?? ''}', style: TextStyle(fontSize: 20)),
      displayWidget: Text(
        title,
        style: TextStyle(fontSize: 15)
      ),
      segments: segments,
    );
  }
}