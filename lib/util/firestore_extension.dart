import 'package:cloud_firestore/cloud_firestore.dart';

/// Extension on [DocumentReference] to fetch the document if necessary.
///
/// This extension provides a method `fetchIfNecessary()` which fetches the document from the cache if it exists,
/// otherwise it fetches the document from the server.
///
/// Example usage:
/// ```dart
/// DocumentReference documentRef = FirebaseFirestore.instance.collection('users').doc('user1');
/// DocumentSnapshot snapshot = await documentRef.fetchIfNecessary();
/// ```
extension FirestoreDocumentExtension on DocumentReference {
  Future<DocumentSnapshot> fetchIfNecessary() async {
    try {
      DocumentSnapshot ds = await get(const GetOptions(source: Source.cache));
      if (!ds.exists || ds.data() == null) {
        return get(const GetOptions(source: Source.server));
      }
      return ds;
    } catch (_) {
      return get(const GetOptions(source: Source.server));
    }
  }

  Future<DocumentSnapshot?> cacheGet() async {
    try {
      return await get(const GetOptions(source: Source.cache));
    } catch (e) {
      return null;
    }
  }

  Future<DocumentSnapshot?> serverGet() async {
    try {
      return await get(const GetOptions(source: Source.server));
    } catch (e) {
      return null;
    }
  }
}

/// Extension on [Query] to fetch the query results if necessary.
///
/// This extension provides a method `fetchIfNecessary()` which fetches the query results from the cache if available,
/// otherwise it fetches the query results from the server.
///
/// Example usage:
/// ```dart
/// Query query = FirebaseFirestore.instance.collection('users').where('age', isGreaterThan: 18);
/// QuerySnapshot snapshot = await query.fetchIfNecessary();
/// ```
extension FirestoreQueryExtension on Query {
  Future<QuerySnapshot> fetchIfNecessary() async {
    try {
      QuerySnapshot qs = await get(const GetOptions(source: Source.cache));
      if (qs.docs.isEmpty) return get(const GetOptions(source: Source.server));
      return qs;
    } catch (_) {
      return get(const GetOptions(source: Source.server));
    }
  }

  Future<QuerySnapshot?> cacheFirstGet() async {
    QuerySnapshot? ds = await cacheGet();
    if (ds == null) return serverGet();
    return ds;
  }

  Future<QuerySnapshot?> cacheGet() async {
    try {
      return await get(const GetOptions(source: Source.cache));
    } catch (e) {
      return null;
    }
  }

  Future<QuerySnapshot?> serverGet() async {
    try {
      return await get(const GetOptions(source: Source.server));
    } catch (e) {
      return null;
    }
  }
}
