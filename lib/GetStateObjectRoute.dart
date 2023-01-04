import 'package:flutter/material.dart';

void main() => runApp(const GetStateObjectRouteApp());

class GetStateObjectRouteApp extends StatelessWidget {
  const GetStateObjectRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetStateObjectRoute(),
    );
  }
}

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({super.key});

  @override
  State<StatefulWidget> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  //定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  static final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: const Text("子树中获取State对象"),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  // 查找父级最近的Scaffold对应的ScaffoldState对象
                  ScaffoldState _state =
                      context.findAncestorStateOfType<ScaffoldState>()!;
                  // 打开抽屉菜单
                  _state.openDrawer();
                },
                child: const Text('打开抽屉菜单1'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldState _state = Scaffold.of(context);
                  // 打开抽屉菜单
                  _state.openDrawer();
                },
                child: const Text('打开抽屉菜单2'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("我是SnackBar")),
                  );
                },
                child: const Text('显示SnackBar'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  // 开销较大
                  _globalKey.currentState!.openDrawer();
                },
                child: const Text('GlobalKey获取State'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                          content: const Text('MaterialBanner content'),
                          actions: [
                        TextButton(
                            onPressed: () => print("action1"),
                            child: const Text('action1')),
                        TextButton(
                            onPressed: () => print("action2"),
                            child: const Text('action2'))
                      ]));
                },
                child: const Text('显示MaterialBanner'),
              );
            }),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
