import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mechanic_koi/models/book_service_model.dart';
import 'package:mechanic_koi/models/employee_model.dart';
import 'package:mechanic_koi/models/subcategory_model.dart';
import 'package:mechanic_koi/models/user_model.dart';
import 'package:mechanic_koi/pages/order_list_page.dart';
import 'package:mechanic_koi/providers/service_provider.dart';

import 'package:provider/provider.dart';

import '../models/category_model.dart';

import '../models/date_model.dart';
import '../models/notification_model.dart';
import '../utils/constants.dart';
import '../utils/helper_functions.dart';

class BookServicePage extends StatefulWidget {
  static const String routeName = '/book_service';

  const BookServicePage({Key? key}) : super(key: key);

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  late ServiceProvider serviceProvider;
  final _problemController = TextEditingController();
  final _dropAddressController = TextEditingController();
  final _picUpAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime? serviceDate;
  CategoryModel? catModel;
  SubcategoryModel? subcategoryModel;
  EmployeeModel? employeeModel;

  @override
  void didChangeDependencies() {
    serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Service'),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: _selectDate,
                            icon: const Icon(Icons.calendar_month),
                            label: const Text('Select Service Date'),
                          ),
                          Text(serviceDate == null
                              ? 'No date chosen'
                              : getFormattedDate(
                                  serviceDate!,
                                ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<ServiceProvider>(
                    builder: (context, provider, child) =>
                        DropdownButtonFormField<CategoryModel>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.category),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1))),
                            hint: const Text('Select Category'),
                            items: provider.categoryList
                                .map((catModel) => DropdownMenuItem(
                                      value: catModel,
                                      child: Text(catModel.categoryName),
                                    ))
                                .toList(),
                            value: catModel,
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a category';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                catModel = value;
                              });
                            }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<ServiceProvider>(
                    builder: (context, provider, child) =>
                        DropdownButtonFormField<SubcategoryModel>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.category),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1))),
                            hint: const Text('Select Sub Category'),
                            items: catModel == null
                                ? [
                                    const DropdownMenuItem<SubcategoryModel>(
                                        value: null,
                                        child: Text('Please select a Sub category'))
                                  ]
                                : provider.subcategoryList
                                    .where((subcategory) =>
                                        catModel != null &&
                                        subcategory.categoryId ==
                                            catModel!.categoryId)
                                    .map((subCatModel) => DropdownMenuItem(
                                          value: subCatModel,
                                          child: Text(subCatModel.serviceName),
                                        ))
                                    .toList(),
                            value: subcategoryModel,
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a sub category';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                subcategoryModel = value;
                              });
                            }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<ServiceProvider>(
                    builder: (context, provider, child) =>
                        DropdownButtonFormField<EmployeeModel>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.category),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1))),
                            hint: const Text('Select Employee'),
                            items: provider.employeeModelList
                                .map((employeeModel) => DropdownMenuItem(
                              value: employeeModel,
                              child: ListTile(
                                title: Text(employeeModel.displayName ?? 'Not Set Yet'),
                                trailing: Text(employeeModel.designation ?? 'Not Set Yet'),
                              ),
                            ))
                                .toList(),
                            value: employeeModel,
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a Employee';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                employeeModel = value;
                              });
                            }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 3,
                    controller: _problemController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.description),
                        hintText: 'Any Other Problem(Optional)',
                        labelText: 'Any Other Problem(Optional)',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1))),
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _picUpAddressController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_on),
                        hintText: 'Pick Up Address',
                        labelText: 'Pick Up Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _dropAddressController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_on),
                        hintText: 'Drop Address',
                        labelText: 'Drop Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _save(userModel);
                    },
                    child: const Text('SUBMIT')),
              ],
            )),
      ),
    );
  }

  void _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (selectedDate != null) {
      setState(() {
        serviceDate = selectedDate;
      });
    }
  }

  void _save(UserModel userModel) async {
    if (serviceDate == null) {
      showMsg(context, 'Please Select a service date');
      return;
    }
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait');
      try {
        if (catModel != null) {
          final bookServiceModel = BookServiceModel(
            bookEmployeeId: employeeModel!.employeeId!,
            categoryModel: catModel!,
            subcategoryModel: subcategoryModel!,
            userModel: userModel,
            dateModel: DateModel(
              timestamp: Timestamp.fromDate(serviceDate!),
              day: serviceDate!.day,
              month: serviceDate!.month,
              year: serviceDate!.year,
            ),
            otherProblem: _problemController.text,
            pickUpAddress: _picUpAddressController.text,
            dropAddress: _dropAddressController.text,

          );
          await serviceProvider.addNewService(bookServiceModel, userModel);
        }
        EasyLoading.dismiss();
        if (mounted) showMsg(context, 'Saved Successfully');
        resetFields();
        if (mounted) Navigator.pushNamed(context, OrderListPage.routeName);
      } catch (error) {
        EasyLoading.dismiss();
        showMsg(context, 'Could not save, Please check your connection');
        throw error;
      }
    }
  }

  void resetFields() {
    setState(() {
      _problemController.clear();
      _dropAddressController.clear();
      _picUpAddressController.clear();
      catModel = null;
      subcategoryModel = null;
      employeeModel = null;
      serviceDate = null;
    });
  }

  @override
  void dispose() {
    _problemController.dispose();
    _picUpAddressController.dispose();
    _dropAddressController.dispose();
    super.dispose();
  }
}
