//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// JobXcel
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MTextFormField extends WFormFieldStatefulWidget<String> {
  //
  //
  //

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final bool? autoFocus;
  final TextInputAction? textInputAction;
  final bool? autoComplete;
  final void Function(String text)? onFieldSubmitted;
  final void Function(TextEditingController controller, String? errorText)?
      onUpdated;
  final Iterable<Widget>? Function(
    BuildContext context,
    Pod<dynamic> autoSubmitResult,
  )? autoSubmitMenuBuilder;

  //
  //
  //

  const MTextFormField({
    // Super.
    super.key,
    super.defaultValue,
    super.readOnly,
    super.enabled,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onAutoSubmit,
    super.autoSubmitDelay,
    // This.
    this.controller,
    this.decoration,
    this.focusNode,
    this.keyboardType,
    this.autofillHints,
    this.minLines,
    this.maxLines = 1,
    this.obscureText,
    this.autoFocus,
    this.textInputAction,
    this.autoComplete,
    this.onFieldSubmitted,
    this.onUpdated,
    this.autoSubmitMenuBuilder,
  });

  //
  //
  //

  MTextFormField copyWith({
    // Super.
    Key? key,
    String? defaultValue,
    bool? readOnly,
    bool? enabled,
    String? Function(String?)? validator,
    AutovalidateMode? autovalidateMode,
    Future<List<String>> Function(String)? onAutoSubmit,
    Duration? autoSubmitDelay,
    // This.
    TextEditingController? controller,
    InputDecoration? decoration,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    Iterable<String>? autofillHints,
    int? minLines,
    int? maxLines,
    bool? obscureText,
    bool? autoFocus,
    TextInputAction? textInputAction,
    bool? autocomplete,
    void Function(String text)? onFieldSubmitted,
    void Function(TextEditingController controller, String? errorText)?
        onUpdated,
    final Iterable<Widget>? Function(
      BuildContext context,
      Pod<dynamic> autoSubmitResult,
    )? autoSubmitMenuBuilder,
  }) {
    return MTextFormField(
      // Super.
      key: key ?? this.key,
      defaultValue: defaultValue ?? this.defaultValue,
      readOnly: readOnly ?? this.readOnly,
      enabled: enabled ?? this.enabled,
      validator: validator ?? this.validator,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      onAutoSubmit: onAutoSubmit ?? this.onAutoSubmit,
      autoSubmitDelay: autoSubmitDelay ?? this.autoSubmitDelay,
      // This.
      controller: controller ?? this.controller,
      decoration: decoration ?? this.decoration,
      focusNode: focusNode ?? this.focusNode,
      keyboardType: keyboardType ?? this.keyboardType,
      autofillHints: autofillHints ?? this.autofillHints,
      minLines: minLines ?? this.minLines,
      maxLines: maxLines ?? this.maxLines,
      obscureText: obscureText ?? this.obscureText,
      autoFocus: autoFocus ?? this.autoFocus,
      textInputAction: textInputAction ?? this.textInputAction,
      autoComplete: autocomplete ?? autoComplete,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onUpdated: onUpdated ?? this.onUpdated,
      autoSubmitMenuBuilder:
          autoSubmitMenuBuilder ?? this.autoSubmitMenuBuilder,
    );
  }

  //
  //
  //

  @override
  WTextFormFieldState createState() => WTextFormFieldState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WTextFormFieldState
    extends WFormFieldStatefulWidgetState<String, MTextFormField> {
  //
  //
  //

  final formFieldStateKey = GlobalKey<FormFieldState>();
  late final _didProvideController = widget.controller != null;
  late final controllerOrDefault = widget.controller ?? TextEditingController();
  late final _didProvideFocusNode = widget.focusNode != null;
  late final focusNodeOrDefault = widget.focusNode ?? FocusNode();

  late final pInputDecoration =
      Pod<InputDecoration>(widget.decoration ?? const InputDecoration());
  late final pObscureText = Pod<bool?>(widget.obscureText);
  late final pReadOnly = Pod<bool>(widget.readOnly ?? false);

  //
  //
  //

  @override
  void initState() {
    if (widget.defaultValue != null && controllerOrDefault.text.isEmpty) {
      controllerOrDefault.text = widget.defaultValue!;
    }
    _didUpdate();

    super.initState();
  }

  //
  //
  //

  void _didUpdate() {
    final text = controllerOrDefault.text;
    final errorText = widget.validator?.call(text);
    widget.onUpdated?.call(controllerOrDefault, errorText);
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return PodListBuilder<dynamic>(
      podList: [
        pInputDecoration,
        pObscureText,
        pReadOnly,
      ],
      builder: (context, snapshot) {
        return DividedColumn(
          divider: SizedBox(height: 8.sc),
          children: [
            TextFormField(
              // Super.
              key: formFieldStateKey,
              readOnly: pReadOnly.value,
              enabled: widget.enabled ?? true,
              validator: validatorOrDefault,
              autovalidateMode: widget.autovalidateMode,
              onSaved: (e) => autoSubmitDebouncer(),
              // This.
              controller: controllerOrDefault,
              decoration: pInputDecoration.value.copyWith(
                filled: true,
                fillColor: pInputDecoration.value.fillColor ??
                    (pReadOnly.value
                        ? Theme.of(context).colorScheme.surfaceContainerLowest
                        : Theme.of(context).colorScheme.surface),
                suffixIcon: pInputDecoration.value.suffixIcon ??
                    () {
                      return widget.obscureText != null
                          ? IconButton(
                              icon: Icon(
                                pObscureText.value == true
                                    ? FluentIcons.eye_24_filled
                                    : FluentIcons.eye_off_24_filled,
                                size: 24.sc,
                              ),
                              onPressed: () {
                                pObscureText.update((e) => !(e ?? false));
                              },
                            )
                          : null;
                    }(),
              ),
              focusNode: focusNodeOrDefault,
              keyboardType: widget.keyboardType,
              autofillHints: widget.autofillHints,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              obscureText: pObscureText.value ?? false,
              textInputAction: widget.textInputAction,
              onFieldSubmitted: widget.onFieldSubmitted,
              // Other.
              autofocus: widget.autoFocus ?? false,
              onChanged: (text) {
                autoSubmitDebouncer();
                _didUpdate();
              },
              cursorWidth: 2.sc,
              scrollPadding: EdgeInsets.all(20.sc),
            ),
            if (widget.autoSubmitMenuBuilder != null)
              PodBuilder(
                pod: pAutoSubmitResult,
                builder: (context, snapshot) {
                  final children = widget.autoSubmitMenuBuilder!(
                    context,
                    pAutoSubmitResult,
                  );
                  return Visibility(
                    visible: children != null && children.isNotEmpty,
                    child: BlurryOverlay(
                      key: UniqueKey(),
                      child: Container(
                        //borderRadius: BorderRadius.circular(8.sc),
                        padding: EdgeInsets.all(24.sc),
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerLowest,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 300.sc),
                          child: SingleChildScrollView(
                            child: DividedColumn(
                              divider: SizedBox(height: 24.sc),
                              children: [...?children],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }

  //
  //
  //

  @override
  String getSnapshot() => controllerOrDefault.text;

  //
  //
  //

  @override
  bool? validate() => formFieldStateKey.currentState?.validate();

  //
  //
  //

  @override
  void dispose() {
    super.dispose();
    if (!_didProvideController) {
      controllerOrDefault.dispose();
    }
    if (!_didProvideFocusNode) {
      focusNodeOrDefault.dispose();
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension WTextFormFieldVariationsExtension on MTextFormField {
  //
  //
  //

  MTextFormField withNameProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      validator: (e) {
        return e != null
            ? e.trim().isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withEmailProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.username,
      ],
      validator: (e) {
        return e != null
            ? RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$')
                    .hasMatch(e.trim())
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withNewEmailProps({String errorText = '***'}) {
    return withEmailProps(errorText: errorText).copyWith(
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.newUsername,
      ],
    );
  }

  MTextFormField withPasswordProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      validator: (e) {
        return e != null
            ? e.length >= 8
                ? null
                : errorText
            : null;
      },
      obscureText: obscureText ?? true,
    );
  }

  MTextFormField withNewPasswordProps({String errorText = '***'}) {
    return withPasswordProps(errorText: errorText).copyWith(
      autofillHints: const [AutofillHints.newPassword],
    );
  }

  MTextFormField withObscurityToggle() {
    return copyWith(obscureText: true);
  }

  MTextFormField withMultilineProps({
    int? minLines = 3,
    int? maxLines = 5,
    String errorText = '***',
  }) {
    return copyWith(
      keyboardType: TextInputType.multiline,
      minLines: minLines,
      maxLines: maxLines,
      validator: validator ??
          (e) {
            return e != null
                ? e.trim().isNotEmpty
                    ? null
                    : errorText
                : null;
          },
    );
  }

  MTextFormField withPhoneNumberProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.phone,
      autofillHints: const [AutofillHints.telephoneNumber],
      validator: (e) {
        return e != null
            ? RegExp(r'^[0-9]{10}$').hasMatch(e.trim())
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withNumberProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.number,
      validator: (e) {
        return e != null
            ? RegExp(r'^[0-9]*$').hasMatch(e.trim())
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withBirthdayProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.datetime,
      autofillHints: const [AutofillHints.birthday],
      validator: (e) {
        return e != null
            ? e.trim().isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withAddressLine1Props({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.streetAddress,
      autofillHints: const [AutofillHints.streetAddressLine1],
      validator: (e) {
        return e != null
            ? e.trim().isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withAddressLine2Props({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.streetAddress,
      autofillHints: const [AutofillHints.streetAddressLine2],
      validator: (e) {
        return e != null
            ? e.trim().isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withAddressCityProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.text,
      autofillHints: const [AutofillHints.addressCity],
      validator: (e) {
        return e != null
            ? e.trim().isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withAddressStateProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.text,
      autofillHints: const [AutofillHints.addressState],
      validator: (e) {
        return e != null
            ? e.trim().isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  MTextFormField withAddressPostalCodeProps({String errorText = '***'}) {
    return copyWith(
      keyboardType: TextInputType.number,
      autofillHints: const [AutofillHints.postalCode],
      validator: (e) {
        return e != null
            ? RegExp(r'^[0-9]{6}$').hasMatch(e.trim())
                ? null
                : errorText
            : null;
      },
    );
  }
}

class FocusHider extends StatefulWidget {
  final Widget child;
  final FocusNode focusNode;

  const FocusHider({
    super.key,
    required this.child,
    required this.focusNode,
  });

  @override
  _FocusHiderState createState() => _FocusHiderState();
}

class _FocusHiderState extends State<FocusHider> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode;
    focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return focusNode.hasFocus ? widget.child : const SizedBox.shrink();
  }
}
