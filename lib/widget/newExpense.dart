import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/Expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addNewExpensewidget});
  final void Function(Expense expenses) addNewExpensewidget;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedcategory = Category.leisure;

  void _submitExpensedata() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsValid ||
        _selecteddate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter valid data'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.addNewExpensewidget(
      Expense(
        name: _titleController.text,
        amount: enteredAmount,
        date: _selecteddate!,
        category: _selectedcategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  DateTime? _selecteddate;
  void _presentDatePicker() async {
    final pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now(),
    );
    setState(() {
      _selecteddate = pickdate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboardspace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = (constraints.maxWidth);

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                10,
                50,
                10,
                keyboardspace,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            maxLength: 30,
                            controller: _titleController,
                            decoration: const InputDecoration(
                              label: Text('Name'),
                              hintText: 'Enter Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            maxLength: 10,
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              label: Text('Amount'),
                              hintText: 'Enter amount',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      maxLength: 30,
                      controller: _titleController,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                        hintText: 'Enter Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  if (width >= 600)
                    Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButton(
                            value: _selectedcategory,
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name.toUpperCase()),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedcategory = value;
                              });
                            }),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selecteddate == null
                                    ? 'No Selected Date'
                                    : formatter.format(_selecteddate!),
                              ),
                              IconButton(
                                onPressed: () {
                                  _presentDatePicker();
                                },
                                icon: const Icon(Icons.calendar_today),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            maxLength: 10,
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              label: Text('Amount'),
                              hintText: 'Enter amount',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selecteddate == null
                                    ? 'No Selected Date'
                                    : formatter.format(_selecteddate!),
                              ),
                              IconButton(
                                onPressed: () {
                                  _presentDatePicker();
                                },
                                icon: const Icon(Icons.calendar_today),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (width >= 600)
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            _submitExpensedata();
                          },
                          child: const Text('save Expense'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('cancel'),
                        )
                      ],
                    )
                  else
                    Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButton(
                            value: _selectedcategory,
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Text(category.name.toUpperCase()),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedcategory = value;
                              });
                            }),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            _submitExpensedata();
                          },
                          child: const Text('save Expense'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('cancel'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
