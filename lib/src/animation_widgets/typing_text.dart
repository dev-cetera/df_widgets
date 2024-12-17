//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TypingText extends StatefulWidget {
  final String text;
  final List<String> lines;
  final Duration typingPeriod;

  final Duration minDeletePeriod;
  final Duration maxDeletePeriod;
  final Duration delay;
  final Duration deletePausePeriod;
  final Duration linePausePeriod;
  final Duration? blinkingPeriod;
  final TextStyle? style;
  final Color? backgroundTextColor;
  final String cursor;
  final String? initialText;

  const TypingText(
    this.text, {
    this.lines = const [],
    super.key,
    this.typingPeriod = const Duration(milliseconds: 75),
    this.minDeletePeriod = const Duration(milliseconds: 10),
    this.maxDeletePeriod = const Duration(milliseconds: 50),
    this.delay = Duration.zero,
    this.deletePausePeriod = const Duration(milliseconds: 4 * 530),
    this.linePausePeriod = const Duration(milliseconds: 2 * 530),
    this.blinkingPeriod = const Duration(milliseconds: 530),
    this.backgroundTextColor = const Color(0x00000000),
    this.style,
    this.cursor = '_',
    this.initialText = '',
  });

  @override
  _TypingTextState createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _text = '';
  int _textIndex = 0;
  bool _showCursor = true;
  Timer? _blinkingTimer;
  Timer? _typingTimer;

  late final _texts = [widget.text, ...widget.lines].where((e) => e.isNotEmpty).toList();
  late final _textStyle = widget.style ?? const TextStyle();

  String _currentText() => _texts[_textIndex];

  @override
  void initState() {
    super.initState();
    _startCursorBlinking();
    Future.delayed(widget.delay, _startTyping);
  }

  void _startTyping() {
    _stopCursorBlinking();
    _typingTimer = Timer.periodic(widget.typingPeriod, _typeCharacter);
  }

  void _stopTyping() {
    _startCursorBlinking();
    _typingTimer?.cancel();
    _typingTimer = null;
    if (_texts.length > 1) {
      Future.delayed(widget.deletePausePeriod, _startDeletingAll);
    }
  }

  void _startCursorBlinking() {
    _refresh(() {
      _showCursor = false;
    });
    if (widget.blinkingPeriod != null) {
      _blinkingTimer = Timer.periodic(widget.blinkingPeriod!, _toggleCursor);
    }
  }

  void _toggleCursor(_) {
    _refresh(() {
      _showCursor = !_showCursor;
    });
  }

  void _stopCursorBlinking() {
    _refresh(() {
      _showCursor = true;
    });
    _blinkingTimer?.cancel();
    _blinkingTimer = null;
  }

  void _typeCharacter(Timer timer) {
    _stopCursorBlinking();
    final currentText = _currentText();
    if (_text.length < currentText.length) {
      _refresh(() {
        _text += currentText[_text.length];
      });
    } else {
      _stopTyping();
    }
  }

  void _startDeletingAll() {
    _stopCursorBlinking();
    if (_text.isNotEmpty) {
      _refresh(() {
        _text = _text.substring(0, _text.length - 1);
        _characersDeleted++;
      });
      final min = widget.minDeletePeriod;
      final max = widget.maxDeletePeriod;
      final delta = max - min;
      final progress = (_characersDeleted / 15).clamp(0.0, 1.0);
      final duration = max - (delta * progress);
      Future.delayed(duration, _startDeletingAll);
    } else {
      _startCursorBlinking();
      _startNextText();
    }
  }

  var _characersDeleted = 0;

  void _startNextText() {
    _refresh(() {
      _textIndex++;
      if (_textIndex >= _texts.length) {
        _textIndex = 0;
      }
    });
    Future.delayed(widget.linePausePeriod, _startTyping);
  }

  void _refresh(VoidCallback callback) {
    if (mounted) {
      setState(callback);
    } else {
      callback();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        RichText(
          text: TextSpan(
            text: '${widget.initialText}${_getLargestText()}',
            style: _textStyle.copyWith(color: const Color(0x00000000)),
          ),
        ),
        if (widget.backgroundTextColor != null)
          RichText(
            text: TextSpan(
              text: '${widget.initialText}${_currentText()}',
              style: _textStyle.copyWith(color: widget.backgroundTextColor),
            ),
          ),
        RichText(
          text: TextSpan(
            text: '${widget.initialText}$_text',
            style: _textStyle,
            children: [
              TextSpan(
                text: widget.cursor,
                style: _textStyle.copyWith(
                  color: _showCursor ? null : const Color(0x00000000),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getLargestText() {
    return _texts.reduce((a, b) {
      final lineCountA = a.split('\n').length;
      final lineCountB = b.split('\n').length;

      if (lineCountA > lineCountB) {
        return a;
      } else if (lineCountA < lineCountB) {
        return b;
      } else {
        return a.length > b.length ? a : b;
      }
    });
  }
}
