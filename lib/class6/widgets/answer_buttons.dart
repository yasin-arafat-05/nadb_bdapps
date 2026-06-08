import 'package:bdapps/class6/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum AnswerState { neutral, correct, wrong, revealed }

class AnswerButtons extends StatefulWidget {
  /*
  - Because Flutter encourages immutable objects.
  - It means these values can be assigned once (usually in the constructor) and 
  cannot be changed afterward.
  - Most Flutter widgets are designed to never change after creation.
  - When the UI changes, Flutter creates a new widget instead of modifying the old one.
  */
  final String label;
  final String optionLetter;
  // this is enum
  final AnswerState state;
  final VoidCallback? ontap;
  const AnswerButtons({
    super.key,
    required this.label,
    required this.optionLetter,
    this.state = AnswerState.neutral,
    this.ontap,
  });

  @override
  State<AnswerButtons> createState() => _AnswerButtonsState();
}

/*
Ticker is use for animation in flutter. 
SingleTickerProviderStateMixin use when there is one animations.
*/
class _AnswerButtonsState extends State<AnswerButtons>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnim;

  // initilize animation controller and the animations:(when start animation)
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  // when finished animation:
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  // define different types of colors:
  Color get _bgColor {
    switch (widget.state) {
      case AnswerState.correct:
        return AppTheme.correctBg;
      case AnswerState.wrong:
        return AppTheme.wrongBg;
      case AnswerState.revealed:
        return AppTheme.correctBg;
      case AnswerState.neutral:
        return AppTheme.neutralBg;
    }
  }

  Color get _borderColor {
    switch (widget.state) {
      case AnswerState.correct:
        return AppTheme.correctBorder;
      case AnswerState.wrong:
        return AppTheme.wrongBorder;
      case AnswerState.revealed:
        return AppTheme.correctBorder;
      case AnswerState.neutral:
        return AppTheme.neutralBorder;
    }
  }

  Color get _letterBg {
    switch (widget.state) {
      case AnswerState.correct:
        return AppTheme.correctBorder;
      case AnswerState.wrong:
        return AppTheme.wrongBorder;
      case AnswerState.revealed:
        return AppTheme.correctBorder;
      case AnswerState.neutral:
        return AppTheme.primaryBlue.withAlpha(11);
    }
  }

  Color get _letterColor {
    switch (widget.state) {
      case AnswerState.correct:
      case AnswerState.wrong:
      case AnswerState.revealed:
        return Colors.white;
      case AnswerState.neutral:
        return AppTheme.primaryBlue;
    }
  }

  IconData? get _trailingIcon {
    switch (widget.state) {
      case AnswerState.correct:
        return Icons.check_circle_rounded;
      case AnswerState.wrong:
        return Icons.cancel_rounded;
      case AnswerState.revealed:
        return Icons.check_circle_rounded;
      case AnswerState.neutral:
        return null;
    }
  }

  Color get _trailingColor {
    switch (widget.state) {
      case AnswerState.correct:
      case AnswerState.revealed:
        return AppTheme.correctBorder;
      case AnswerState.wrong:
        return AppTheme.wrongBorder;
      case AnswerState.neutral:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.state == AnswerState.neutral;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => _animationController.forward() : null,
      onTapUp: isEnabled ? (_) => _animationController.reverse() : null,
      onTapCancel: isEnabled ? () => _animationController.reverse() : null,
      onTap: isEnabled ? widget.ontap : null,
      child: ScaleTransition(
        scale: _scaleAnim,
        // Animated Container is for Background color, border color, padding, size changes
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _borderColor, width: 1.5),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: _letterBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.optionLetter,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _letterColor,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // text expanded animation:
              Expanded(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: widget.state == AnswerState.neutral
                        ? const Color(0xFF1A2340)
                        : widget.state == AnswerState.wrong
                        ? AppTheme.errorRed
                        : AppTheme.successGreen,
                    fontFamily: 'Nunito',
                    height: 1.3,
                  ),
                ),
              ),
              // tailing icons:
              // Trailing icon
              if (_trailingIcon != null) ...[
                const SizedBox(width: 8),
                Icon(_trailingIcon, color: _trailingColor, size: 22),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
