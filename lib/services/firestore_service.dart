import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/expense.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addExpense(Expense expense) async {
    await _db.collection('expenses').doc(expense.id).set(expense.toMap());
  }

  Stream<List<Expense>> getExpenses(String userId) {
    return _db
        .collection('expenses')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      final expenses =
          snapshot.docs.map((doc) => Expense.fromMap(doc.data())).toList();
      expenses.sort((a, b) => b.date.compareTo(a.date));
      return expenses;
    });
  }

  Future<void> deleteExpense(String expenseId) async {
    await _db.collection('expenses').doc(expenseId).delete();
  }
}
