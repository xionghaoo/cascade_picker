# cascade_picker

级联选择器

## Usage

#### 1\. Depend

Add this to you package's `pubspec.yaml` file:

```yaml
dependencies:
  cascade_picker: ^0.0.2
```

#### 2\. Install

Run command:

```bash
$ flutter packages get
```

#### 3\. Import

Import in Dart code:

```dart
import 'package:cascade_picker/cascade_picker.dart';
```

#### 4\. Show
```dart
/// initialPageData: 第一页的数据
/// nextPageData: 下一页的数据，点击当前页的选择项后加载下一页
/// controller: 控制器，用于获取已选择的数据
/// maxPageNum: 最大页数
/// 
/// final _cascadeController = CascadeController();
/// 
/// CascadePicker(
///   initialPageData: ['a', 'b', 'c', 'd'],
///   nextPageData: (callback, currentPage, selectIndex) async {
///     return ['one', 'two', 'three']
///   },
///   controller: _cascadeController,
///   maxPageNum: 4,
/// )
/// 
/// InkBox(
///   child: Container(...)
///   onTap: () {
///     if (_cascadeController.isCompleted()) {
///       List<String> selectedTitles = _cascadeController.selectedTitles;
///       List<int> selectedIndexes = _cascadeController.selectedIndexes;
///     }
///   }
/// )
```

## 效果

![Demo 1][1]

![demo 2][2]

[1]:https://github.com/xionghaoo/assets/blob/master/cascade_picker_1.png?raw=true
[2]:https://github.com/xionghaoo/assets/blob/master/cascade_picker_2.gif?raw=true