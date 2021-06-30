# cascade_picker

级联选择器

## Usage

#### 1\. Depend

Add this to you package's `pubspec.yaml` file:

```yaml
dependencies:
  cascade_picker: ^0.0.6
```

or

```yaml
cascade_picker:
    git:
      url: git://github.com/xionghaoo/cascade_picker.git
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
/// CascadePicker的page是ListView，没有约束的情况下它的高度是无限的，
/// 因此需要约束高度。
///
/// final _cascadeController = CascadeController();
///
/// initialPageData: 第一页的数据
/// nextPageData: 下一页的数据，点击当前页的选择项后调用该方法加载下一页
///   - pageCallback: 用于传递下一页的数据给CascadePicker
///   - currentPage: 当前是第几页
///   - selectIndex: 当前选中第几项
/// controller: 控制器，用于获取已选择的数据
/// maxPageNum: 最大页数
///
/// Expand(
///   child: CascadePicker(
///     initialPageData: ['a', 'b', 'c', 'd'],
///     nextPageData: (pageCallback, currentPage, selectIndex) async {
///       pageCallback(['one', 'two', 'three'])
///     },
///     controller: _cascadeController,
///     maxPageNum: 4,
/// )
///
/// InkBox(
///   child: Container(...)
///   onTap: () {
///     /// 判断是否完成选择
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