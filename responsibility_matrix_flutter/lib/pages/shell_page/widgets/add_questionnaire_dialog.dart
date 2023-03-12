part of '../shell_page.dart';

class AddQuestionnaireDialog extends ConsumerStatefulWidget {
  const AddQuestionnaireDialog({super.key});

  @override
  ConsumerState<AddQuestionnaireDialog> createState() =>
      _AddQuestionnaireDialogState();
}

class _AddQuestionnaireDialogState
    extends ConsumerState<AddQuestionnaireDialog> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

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
              Text('add_project',
                  style: Theme.of(context).textTheme.titleLarge).tr(),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              TextFormField(
                controller: _titleController,
                decoration:  InputDecoration(
                  labelText: 'title'.tr(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'title_required'.tr();
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                minLines: 3,
                decoration:  InputDecoration(
                  labelText: 'description'.tr(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'description_required'.tr();
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
                    child: const Text('cancel').tr(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final data = <String, String>{
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        };
                        Navigator.of(context).pop(data);
                      }
                    },
                    child: const Text('add').tr(),
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
