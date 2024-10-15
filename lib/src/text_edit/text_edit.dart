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
  },
  shouldInherit: true,
)
class _TextEditProperties {
  const _TextEditProperties();
}
