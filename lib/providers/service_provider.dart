import 'package:flutter/material.dart';
import 'package:mechanic_koi/models/book_service_model.dart';
import 'package:mechanic_koi/models/employee_model.dart';
import 'package:mechanic_koi/models/user_model.dart';

import '../db/db_helper.dart';
import '../models/category_model.dart';
import '../models/offer_model.dart';
import '../models/subcategory_model.dart';

class ServiceProvider extends ChangeNotifier {
  CategoryModel? categoryModel;
  List<CategoryModel> categoryList = [];
  List<SubcategoryModel> subcategoryList = [];
  List<BookServiceModel> bookServiceList = [];
  List<EmployeeModel> employeeModelList = [];
  List<OfferModel> offerModelList = [];


  Future<void> addCategory(
          CategoryModel categoryModel, SubcategoryModel subcategoryModel) =>
      DbHelper.addCategory(categoryModel, subcategoryModel);

//wrong way
  getAllCategories() {
    DbHelper.getAllCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length,
          (index) => CategoryModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  getAllSubCategories() {
    DbHelper.getAllSubCategories().listen((snapshots) {
      subcategoryList = List.generate(snapshots.docs.length,
          (index) => SubcategoryModel.fromMap(snapshots.docs[index].data()));
      notifyListeners();
    });
  }
  getAllOrders() {
    DbHelper.getAllOrders().listen((snapshots) {
      bookServiceList = List.generate(snapshots.docs.length,
              (index) => BookServiceModel.fromMap(snapshots.docs[index].data()));
      notifyListeners();
    });
  }

  getAllEmployees() {
    DbHelper.getAllEmployees().listen((snapshot) {
      employeeModelList = List.generate(snapshot.docs.length,
              (index) => EmployeeModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  getAllOffers() {
    DbHelper.getAllOffers().listen((snapshot) {
      offerModelList = List.generate(snapshot.docs.length,
              (index) => OfferModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }
  OfferModel getOfferById(String id) {
    return offerModelList.firstWhere((element) => element.offerId == id);
  }
  Future<void> updateProductField(
      String productId, String field, dynamic value) {
    return DbHelper.updateProductField(productId, {field: value});
  }

  Future<void> addNewService(BookServiceModel bookServiceModel,UserModel userModel) {
    return DbHelper.addNewService(bookServiceModel,userModel);
  }

  num get totalExpenses {
    num total = 0;
    for (final serviceModel in bookServiceList) {
     if(serviceModel.paymentStatus == true){
       total += serviceModel.subcategoryModel.servicePrice;
     }
    }
    return total;
  }


}
