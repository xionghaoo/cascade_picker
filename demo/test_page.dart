import 'package:cascade_picker/cascade_picker.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _cascadeController = CascadeController();

  late List<Item> items;

  @override
  void initState() {
    super.initState();

    items = [];
    for (int i = 0; i < 5; i++) {
      Item item0 = Item();
      item0.name = "name_$i";
      item0.code = "code_$i";
      List<Item> children1 = [];
      for (int j = 0; j < 3; j++) {
        Item item1 = Item();
        item1.name = "name_${i}_$j";
        item1.code = "code_${i}_$j";
        List<Item> children2 = [];
        for (int k = 0; k < 7; k++) {
          Item item2 = Item();
          item2.name = "name_${i}_${j}_$k";
          item2.code = "code_${i}_${j}_$k";
          // 第3页没有子数据列表
          item2.children = [];
          children2.add(item2);
        }
        // 第2页的子数据列表
        item1.children = children2;
        children1.add(item1);
      }
      // 第1页的子数据列表
      item0.children = children1;
      items.add(item0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextButton(
                onPressed: () {
                  if (_cascadeController.isCompleted()) {
                    // 已选中的titles
                    List<String> selectedTitles = _cascadeController.selectedTitles;
                    print("已选中的titles: $selectedTitles");
                    // 已选中的序号
                    List<int> selectedIndexes = _cascadeController.selectedIndexes;
                    print("已选中的序号：$selectedIndexes");

                    Item item = items[selectedIndexes[0]].children![selectedIndexes[1]].children![selectedIndexes[2]];
                    print("已选择item( ${item.name} )");
                  }
                },
                child: Text("选定")
            ),
            SizedBox(height: 10,),
            Container(
              height: 400,
              child: CascadePicker(
                initialPageData: items.map((e) => e.name!).toList(),
                nextPageData: (pageCallback, currentPage, selectIndex) async {
                  print("当前选择: 第$currentPage页, 第$selectIndex项");
                  if (currentPage == 1) {
                    // 在第一页选中，返回第二页列表数据
                    List<String>? nextPageData = items[selectIndex]
                        .children?.map((e) => e.name!).toList();
                    if (nextPageData != null) pageCallback(nextPageData);
                  } else if (currentPage == 2) {
                    // 在第二页选中，返回第二页列表数据
                    // 先获取已选中的序号
                    List<int> selectedIndexes = _cascadeController.selectedIndexes;
                    // 根据已选中的序号在items中获取下一级页面的列表数据
                    List<String>? nextPageData = items[selectedIndexes[0]]
                        .children?[selectIndex]
                        .children?.map((e) => e.name!).toList();
                    if (nextPageData != null) pageCallback(nextPageData);
                  }
                },
                controller: _cascadeController,
                maxPageNum: 3,
                // selectedIcon: Image.asset("images/ic_select_mark.png", width: 10, height: 10, color: Colors.redAccent,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  String? name;
  String? code;
  String? fatherCode;
  String? remark;
  List<Item>? children;
}
