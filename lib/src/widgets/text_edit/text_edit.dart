//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
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

  static TextEditProperties themeOf(BuildContext? context) {
    return DefaultThemes.of(context)?.themeOrNull<TextEditProperties>() ??
        TextEditProperties(
          controller: TextEditingController(),
          focusNode: FocusNode(),
          style: const TextStyle(color: Color.fromARGB(255, 192, 192, 192)),
          cursorColor: const Color.fromARGB(255, 128, 128, 128),
          backgroundCursorColor: const Color.fromARGB(255, 128, 128, 128),
        );
  }

  const TextEdit({super.key, this.properties});

  @override
  Widget build(BuildContext context) {
    final p = properties ?? themeOf(context);
    return EditableText(
      controller: p.controller$,
      focusNode: p.focusNode$,
      style: p.style$,
      cursorColor: p.cursorColor$,
      backgroundCursorColor: p.backgroundCursorColor$,
      selectionColor: p.cursorColor$,
      showSelectionHandles: true,
      onSubmitted: p.onSubmitted,
      onTapOutside: p.onTapOutside,
      onChanged: p.onChanged,
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
    Field(fieldPath: ['focusNode'], fieldType: FocusNode, nullable: false),
    Field(fieldPath: ['style'], fieldType: TextStyle, nullable: false),
    Field(fieldPath: ['cursorColor'], fieldType: Color, nullable: false),
    Field(
      fieldPath: ['backgroundCursorColor'],
      fieldType: Color,
      nullable: false,
    ),
    Field(fieldPath: ['onSubmitted'], fieldType: 'OnChanged', nullable: true),
    Field(fieldPath: ['onChanged'], fieldType: 'OnChanged', nullable: true),
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
