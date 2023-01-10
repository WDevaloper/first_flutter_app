import 'package:flutter/material.dart';

void main() => runApp(const CustomWidgetApp());

class CustomWidgetApp extends StatelessWidget {
  const CustomWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "自定义",
      home: Scaffold(
        body: CustomWidget(),
        appBar: AppBar(title: const Text('自定Widgets')),
      ),
    );
  }
}

//不会包含子组件 LeafRenderObjectWidget
//包含子组件 则可以根据子组件的数量来选择继承SingleChildRenderObjectWidget 或 MultiChildRenderObjectWidget
class CustomWidget extends LeafRenderObjectWidget {
  const CustomWidget({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    // 创建 RenderObject
    return RenderCustomObject();
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCustomObject renderObject) {
    // 更新 RenderObject
    super.updateRenderObject(context, renderObject);
  }
}

class RenderCustomObject extends RenderBox {
  @override
  void performLayout() {
    // 实现布局逻辑
    print('performLayout');
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // 实现绘制
    print('paint');
  }
}
