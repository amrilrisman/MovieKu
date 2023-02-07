import 'package:flutter/material.dart';

/// WIdget Custom untuk visibility widget FlexibleSpaceBarSettings
class SABT extends StatefulWidget {
  final Widget child;

  const SABT({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _SABTState createState() {
    return new _SABTState();
  }
}

class _SABTState extends State<SABT> {
  ScrollPosition? _position;
  bool? _visible;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)!.position;
    _position!.addListener(_positionListener);
    _positionListener();
  }

  void _positionListener() {
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>(
            aspect: FlexibleSpaceBarSettings);

    bool visible =
        settings == null || settings.currentExtent >= 100;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible!,
      child: widget.child,
    );
  }
}
