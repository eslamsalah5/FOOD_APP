import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double startValue = 0;

  double endValue = 50;
  @override
  Widget build(BuildContext context) {
    return SfRangeSlider(
        values: SfRangeValues(startValue, endValue),
        min: 0,
        max: 50,
        stepSize: 10,
        interval: 10,
        activeColor: Color(0xffFFB01D),
        showLabels: true,
        showTicks: true,
        onChanged: (value) {
          setState(() {
            startValue = value.start.roundToDouble();
            endValue = value.end.roundToDouble();
          });
        });
  }
}
