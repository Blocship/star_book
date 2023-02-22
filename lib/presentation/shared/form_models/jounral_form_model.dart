class JournalFormModel {
  static const String titleKey = 'TITLE';
  static const String memoKey = 'MEMO';

  final String title;
  final String memo;

  const JournalFormModel({
    required this.title,
    required this.memo,
  });

  static final Map<String, dynamic> initialValue =
      const JournalFormModel(title: '', memo: '').toMap();

  Map<String, dynamic> toMap() => {
        titleKey: title,
        memoKey: memo,
      };

  factory JournalFormModel.fromJson(Map<String, dynamic> value) {
    return JournalFormModel(title: value[titleKey], memo: value[memoKey]);
  }
}
