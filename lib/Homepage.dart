import 'package:flutter/material.dart';
import 'package:search/api.dart';
import 'package:search/dbhandler.dart';
import 'delegate.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  //var list;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<SearchModel>? model;
  //get list => getdata();
  var de;
  List<String>? result = [];
  void getdata() async {
    model = await APIService.getdetails();
    setState(() {
      de = model!.length;

      for (int i = 0; i < model!.length; i++) {
        result!.add(model![i].category.toString());
        result!.add(model![i].sub_category.toString());
        result!.add(model![i].sname1.toString());
        result!.add(model![i].balance_number.toString());
        result!.add(model![i].elemination_number.toString());
      }
      result!.removeWhere((item) => item.isEmpty);
      result = result!.toSet().toList();
    });
    //print(result);

    // return list;
  }

  get list => getdata;

  @override
  void initState() {
    //delegate.getdata();

    getdata();
    //delegate(ls: de);

    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(list);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: delegate(ls: result));
              },
              icon: Icon(Icons.search))
        ],
      ),
    );

    //return Container();
  }
}
