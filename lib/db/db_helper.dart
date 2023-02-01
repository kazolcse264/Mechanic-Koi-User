import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechanic_koi/models/book_service_model.dart';
import '../models/category_model.dart';
import '../models/employee_model.dart';
import '../models/subcategory_model.dart';
import '../models/user_model.dart';

class DbHelper {
  static const String collectAdmin = 'Admins';
  static final _db = FirebaseFirestore.instance;



  static Future<bool> doesUserExist(String uid) async {
    final snapshot = await _db.collection(collectionUsers).doc(uid).get();
    return snapshot.exists;
  }

  static Future<void> addUser(UserModel userModel) {
    final doc = _db.collection(collectionUsers).doc(userModel.userId);
    return doc.set(userModel.toMap());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(
          String uid) =>
      _db.collection(collectionUsers).doc(uid).snapshots();



  static Future<void> addCategory(CategoryModel categoryModel, SubcategoryModel subcategoryModel) async{
    final wb = _db.batch(); //write batch
    final catDoc = _db.collection(collectionCategory).doc('mEkAnIc${categoryModel.categoryName}kOi');
    final subCatDoc = _db.collection(collectionSubCategory).doc();
    final docSnapshot =  await catDoc.get();
    if(docSnapshot.exists){
      subcategoryModel.categoryId = catDoc.id;
      subcategoryModel.serviceId = subCatDoc.id;
      wb.set(subCatDoc, subcategoryModel.toMap());
      return wb.commit();
    }else{
      categoryModel.categoryId = catDoc.id;
      subcategoryModel.categoryId = catDoc.id;
      subcategoryModel.serviceId = subCatDoc.id;
      wb.set(catDoc, categoryModel.toMap());
      wb.set(subCatDoc, subcategoryModel.toMap());
      return wb.commit();
    }

  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories() {
    final collectionRef =  _db.collection(collectionCategory);
    return collectionRef.snapshots();
  }

  static Future<void> updateProductField(String productId, Map<String, dynamic> map) {
    return _db.collection(collectionCategory).doc(productId).update(map);
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllSubCategories() {
    final collectionRef =  _db.collection(collectionSubCategory);
    return collectionRef.snapshots();
  }

  static Future<void> addNewService(BookServiceModel bookServiceModel,UserModel userModel) {
    final serviceDoc = _db.collection(collectionBookServices).doc(DateTime.now().millisecondsSinceEpoch.toString());
    bookServiceModel.bookServiceId = serviceDoc.id;
    return serviceDoc.set(bookServiceModel.toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllOrders() {
    final collectionRef =  _db.collection(collectionBookServices);
    return collectionRef.snapshots();
  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllEmployees() {
    final collectionRef =  _db.collection(collectionEmployees);
    return collectionRef.snapshots();
  }
}
