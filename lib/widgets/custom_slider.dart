import 'package:fbitcolor/constants/colors.dart';
import 'package:flutter/material.dart';
import 'custom_thumb.dart';

class SliderWidget extends StatefulWidget {
  final ValueChanged<double> onValueChanged;
  final Color activeTrackColor;
  final double initialValue;
  final double trackWidth;
  final String title;
  SliderWidget(
      {this.onValueChanged,
      this.activeTrackColor,
      this.initialValue = 0,
      this.trackWidth = 30,
      this.title});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value;
  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: widget.activeTrackColor,
                inactiveTrackColor: AppColors.sliderBackgroundColor,

                trackHeight: 30.0,
                // trackShape: CustomTrackShape(),

                thumbShape: CustomSliderThumbRect(
                  thumbRadius: 10,
                  thumbHeight: 35,
                ),

                overlayColor: Colors.white.withOpacity(0),

                //valueIndicatorColor: Colors.white,
                activeTickMarkColor: Colors.white,
                inactiveTickMarkColor: Colors.red.withOpacity(.7),
              ),
              child: Slider(
                  value: _value,
                  min: 0,
                  max: 255,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                      widget.onValueChanged(value);
                    });
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
