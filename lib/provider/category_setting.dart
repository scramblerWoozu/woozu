import 'package:flutter/material.dart';

class CategoryState {
  String category; // 현재 나의상태

  CategoryState(this.category); // 생성자
}

/// Bucket 담당
class CategoryStateService extends ChangeNotifier {
  CategoryState setCategory = CategoryState('business');

  /// bucket 추가
  void setCategoryState(state) {
    setCategory.category = state;

    notifyListeners(); // 갱신 = Codnsumer<BucketService>의 builder 부분만 새로고침
  }
}
