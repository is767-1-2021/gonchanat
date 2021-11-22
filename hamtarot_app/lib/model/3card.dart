import 'package:cloud_firestore/cloud_firestore.dart';

class ThreeCard {
  final int id;
  final String past;
  final String pastcontent;
  final String present;
  final String presentcontent;
  final String future;
  final String futurecontent;
  final String outcome;

  ThreeCard(this.id, this.past, this.pastcontent, this.present,
      this.presentcontent, this.future, this.futurecontent, this.outcome);

  factory ThreeCard.fromJson(
    Map<String, dynamic> json,
  ) {
    return ThreeCard(
        json['id'] as int,
        json['past'] as String,
        json['pastcontent'] as String,
        json['present'] as String,
        json['presentcontent'] as String,
        json['future'] as String,
        json['futurecontent'] as String,
        json['outcome'] as String);
  }
}

class AllThreeCard {
  final List<ThreeCard> threecard;
  AllThreeCard(this.threecard);

  factory AllThreeCard.fromJson(List<dynamic> json) {
    List<ThreeCard> threecard;

    threecard = json.map((index) => ThreeCard.fromJson(index)).toList();
    return AllThreeCard(threecard);
  }

  factory AllThreeCard.fromSnapshot(QuerySnapshot s) {
    List<ThreeCard> threecard = s.docs.map((DocumentSnapshot ds) {
      return ThreeCard.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllThreeCard(threecard);
  }
}
