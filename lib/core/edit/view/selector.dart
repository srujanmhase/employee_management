import 'package:employee_management/constants/colors.dart';
import 'package:flutter/material.dart';

class SelectorWidget extends StatefulWidget {
  const SelectorWidget({
    super.key,
    this.width,
    required this.onTap,
    required this.leading,
    required this.content,
    this.trailing,
  });

  final double? width;
  final void Function()? onTap;
  final Widget leading;
  final Widget content;
  final Widget? trailing;

  @override
  State<SelectorWidget> createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 40,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  widget.leading,
                  const SizedBox(width: 12),
                  widget.content,
                ],
              ),
              widget.trailing ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
