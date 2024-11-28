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

import 'package:df_di/df_di.dart';
import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';
import 'package:flutter/widgets.dart';

part '_text_edit_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TextEdit extends StatelessWidget {
  final TextEditProperties? properties;

  static TextEditProperties get _default => TextEditProperties(
        controller: TextEditingController(),
        focusNode: FocusNode(),
        style: const TextStyle(color: Color.fromARGB(255, 192, 192, 192)),
        cursorColor: const Color.fromARGB(255, 128, 128, 128),
        backgroundCursorColor: const Color.fromARGB(255, 128, 128, 128),
      );

  static TextEditProperties get theme =>
      DI.theme.getSyncOrNull<TextEditProperties>()?.copyWith() ?? _default;

  const TextEdit({
    super.key,
    this.properties,
  });

  @override
  Widget build(BuildContext context) {
    final properties = theme;
    return EditableText(
      controller: properties.controller$,
      focusNode: properties.focusNode$,
      style: properties.style$,
      cursorColor: properties.cursorColor$,
      backgroundCursorColor: properties.backgroundCursorColor$,
      selectionColor: properties.cursorColor$,
      showSelectionHandles: true,
      onSubmitted: properties.onSubmitted,
      onTapOutside: properties.onTapOutside,
      onChanged: properties.onChanged,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['controller'],
      fieldType: TextEditingController,
      nullable: false,
    ),
    Field(
      fieldPath: ['focusNode'],
      fieldType: FocusNode,
      nullable: false,
    ),
    Field(
      fieldPath: ['style'],
      fieldType: TextStyle,
      nullable: false,
    ),
    Field(
      fieldPath: ['cursorColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['backgroundCursorColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(
      fieldPath: ['onSubmitted'],
      fieldType: 'OnChanged',
      nullable: true,
    ),
    Field(
      fieldPath: ['onChanged'],
      fieldType: 'OnChanged',
      nullable: true,
    ),
    Field(
      fieldPath: ['onTapOutside'],
      fieldType: 'OnTapOutside',
      nullable: true,
    ),
  },
  shouldInherit: true,
)
class _TextEditProperties {
  const _TextEditProperties();
}

typedef OnChanged = void Function(String text);
typedef OnTapOutside = void Function(PointerDownEvent event);
