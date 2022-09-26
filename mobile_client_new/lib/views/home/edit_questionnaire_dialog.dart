import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_client_new/views/home/home_page.dart';

class EditQuestionnaireDialog extends ConsumerStatefulWidget {
  const EditQuestionnaireDialog(
      {super.key,
      required this.description,
      required this.title,
      required this.id});
  final String id;
  final String title;
  final String description;
  @override
  ConsumerState<EditQuestionnaireDialog> createState() =>
      _EditQuestionnaireDialogState();
}

class _EditQuestionnaireDialogState
    extends ConsumerState<EditQuestionnaireDialog> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add Questionnarie",
                  style: Theme.of(context).textTheme.headline6),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                minLines: 3,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ref
                            .read(questionnaireController.originProvider)
                            .updateQuestionnaire(
                                widget.id,
                                _titleController.text,
                                _descriptionController.text);
                        if (!mounted) return;
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Edit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
