// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_nord_theme/flutter_nord_theme.dart';

// Project imports:
import 'package:safenotes/data/preference_and_config.dart';
import 'package:safenotes/dialogs/unsaved_note_alert.dart';
import 'package:safenotes/models/editor_state.dart';
import 'package:safenotes/models/safenote.dart';
import 'package:safenotes/widgets/note_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final SafeNote? note;

  const AddEditNotePage({Key? key, this.note}) : super(key: key);

  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    this.title = widget.note?.title ?? '';
    this.description = widget.note?.description ?? '';
    this.title = this.title == ' ' ? '' : this.title;
    this.description = this.description == ' ' ? '' : this.description;
    NoteEditorState.setSaveAttempted(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(actions: [buildButton()]),
          body: Form(
            key: _formKey,
            child: NoteFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() {
                this.title = title;
                NoteEditorState.setState(
                    widget.note, this.title, this.description);
              }),
              onChangedDescription: (description) => setState(() {
                this.description = description;

                NoteEditorState.setState(
                  widget.note,
                  this.title,
                  this.description,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if (isNoteNewOrContentChanged()) return await _warnDiscardChangeDialog();
    return true;
  }

  Future<bool> _warnDiscardChangeDialog() async {
    return await showDialog(
          context: context,
          builder: (context) {
            return UnsavedAlert();
          },
        ) ??
        false; // return false if tapped anywhere else on screen.
  }

  Widget buildButton() {
    final isFormValid = title.isNotEmpty || description.isNotEmpty;
    final double buttonFontSize = 17.0;
    final String buttonText = 'Save';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFormValid
              ? (PreferencesStorage.getIsThemeDark()
                  ? null
                  : NordColors.polarNight.darkest)
              : Colors.grey.shade700,
        ),
        onPressed: onSaveCallback,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: buttonFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> onSaveCallback() async {
    await NoteEditorState()
        .addOrUpdateNote(); // this will also set NoteEditorState.setSaveAttempted = true
    Navigator.of(context).pop();
  }

  bool isNoteNewOrContentChanged() {
    if (widget.note == null) {
      //New Note and content is not empty
      if (this.title.isNotEmpty || this.description.isNotEmpty) return true;
    } else {
      // Old Note but content is changed
      if (widget.note?.title != this.title && this.title != '' ||
          widget.note?.description != this.description &&
              this.description != '') return true;
    }
    return false;
  }
}
