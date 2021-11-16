import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MySliver extends StatefulWidget {
  MySliver({Key? key}) : super(key: key);

  @override
  _MySliverState createState() => _MySliverState();
}

class _MySliverState extends State<MySliver>
    with SingleTickerProviderStateMixin {
  final keys = [];
  ScrollController _controller = ScrollController();
  late TabController _tabController;
  late double _height0 = 0.0;
  late double _height1 = 0.0;
  late double _height2 = 0.0;
  late double _height3 = 0.0;
  var childCount = 6;
  double _opacity = 0.0;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
    keys.add(GlobalKey());
    keys.add(GlobalKey());
    keys.add(GlobalKey());
    keys.add(GlobalKey());
    _controller.addListener(() {
      print(_controller.offset ~/ 1);
      int _scrollHeight = _controller.offset ~/ 1;
      if (_scrollHeight > 0) {
        if (_scrollHeight > 100) {
          this.setState(() {
            _opacity = _scrollHeight > 300 ? 1 : _scrollHeight / 300;
          });
        } else {
          this.setState(() {
            _opacity = 0;
          });
        }
      }
      if (_height0 == 0.0) {
        _height0 = _getHeiget(0);
      }
      if (_height1 == 0.0) {
        _height1 = _height0 + _getHeiget(1);
      }
      if (_height2 == 0.0) {
        _height2 = _height1 + _getHeiget(2);
      }
      if (_height3 == 0.0) {
        _height3 = _height2 + _getHeiget(3);
      }
      if (_controller.offset < _height0) {
        _tabController.animateTo(0);
      } else if (_controller.offset >= _height0 &&
          _controller.offset < _height1) {
        _tabController.animateTo(1);
      } else if (_controller.offset >= _height1 &&
          _controller.offset < _height2) {
        _tabController.animateTo(2);
      } else if (_controller.offset >= _height2 &&
          _controller.offset < _height3) {
        _tabController.animateTo(3);
      }
    });
  }

  double _getHeiget(int i) {
    double height = 0;
    RenderObject? renderObject = keys[i].currentContext.findRenderObject();
    if (renderObject is RenderSliverToBoxAdapter) {
      height = renderObject.child?.size.height ?? 0.0;
    } else if (renderObject is RenderSliverFixedExtentList) {
      height = childCount * renderObject.itemExtent;
    }
    return height;
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(10, 80, 250, _opacity),
        title: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: Color.fromRGBO(0, 0, 0, _opacity),
          unselectedLabelColor: Color.fromRGBO(200, 200, 200, _opacity),
          indicatorColor: Color.fromRGBO(0, 0, 0, _opacity),
          tabs: [
            Container(
              height: 48,
              alignment: Alignment.center,
              child: Text('宝贝'),
            ),
            Text('评价'),
            Text('详情'),
            Text('推荐')
          ],
          onTap: (index) {
            //通关循环计算offset
            double height = 0;
            for (int i = 0; i < index; i++) {
              height += _getHeiget(i);
            }
            _controller.animateTo(height.toDouble() - 48 - (MediaQuery.of(context).padding.top ?? 0) ,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          },
        ),
      ),
      body: CustomScrollView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          //宝贝详情
          SliverToBoxAdapter(
            key: keys[0],
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: Image.network(
                  'https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1713f41581ce4815a9a146b48072f266~tplv-k3u1fbpfcp-watermark.image',
                  fit: BoxFit.cover),
            ),
          ),
          //买家评价
          SliverToBoxAdapter(
            key: keys[1],
            child: Container(
              // height: 200,
              color: Colors.green,
              alignment: Alignment.center,
              child: Image.network(
                  'https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/ade16ab8b4714751987cc205eb91041b~tplv-k3u1fbpfcp-watermark.image'),
            ),
          ),
          //产品详情
          SliverFixedExtentList(
            key: keys[2],
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: Colors.lightBlue[index % 8 * 100 + 100],
                child: Center(
                  child: Text("我是宝贝详情：$index"),
                ),
              );
            }, childCount: childCount),
            itemExtent: 300,
          ),
          //相关推荐
          SliverToBoxAdapter(
            key: keys[3],
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.network(
                      'https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/52783f7c06c347e8b938d637f96ceda4~tplv-k3u1fbpfcp-watermark.image'),
                  Image.network(
                      'https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/52783f7c06c347e8b938d637f96ceda4~tplv-k3u1fbpfcp-watermark.image'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
