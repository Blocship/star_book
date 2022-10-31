

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:star_book/models/mood/mood.dart';
import 'package:star_book/service/logger.dart';

@deprecated
class DatabaseService {
  final CollectionReference _emotionCollection = FirebaseFirestore.instance.collection('emotionsAttributes25set');
  final CollectionReference _singleEmotionCollection = FirebaseFirestore.instance.collection('emotions');

  static final _singleton = DatabaseService._internal();
  factory DatabaseService() => _singleton;
  DatabaseService._internal();

  List<Mood> emotionListFromSnapshot(QuerySnapshot snapshot) {
    try {
      SbLog().v('Getting snapshot from firebase');
      final docs = snapshot.docs;
      final List<Mood> moods = [];

      for (var doc in docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data.forEach((key, value) {
          final emotion = Mood.fromJson(value);
          moods.add(emotion);
        });
      }
      SbLog().v('${emotions.length} Emotions fetched');
      return moods;
    } catch (error, stackTrace) {
      SbLog().e('emotionListFromSnapshot', error, stackTrace);
      rethrow;
    }
  }

  Future<Mood> singleEmotion(String emotionName) async {
    try {
      final QuerySnapshot snapshot = await _singleEmotionCollection.where('emotion', isEqualTo: emotionName).get();
      if (snapshot.size > 0) {
        final doc = snapshot.docs[0];
        SbLog().v('Document of emotion  $emotionName received : ${doc.data()}');
        return Mood.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        SbLog().v('Document does not exist on $_singleEmotionCollection collection');
        throw Error();
      }
    } catch (error, stacktrace) {
      SbLog().e('singleEmotion', error, stacktrace);
      rethrow;
    }
  }

  Stream<List<Mood>> get emotions {
    try {
      return _emotionCollection.snapshots().map<List<Mood>>(emotionListFromSnapshot);
    } catch (error, stacktrace) {
      SbLog().e('get emotion', error, stacktrace);
      rethrow;
    }
  }
}