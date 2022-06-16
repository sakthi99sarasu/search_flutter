//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:search/Homepage.dart';
import 'package:search/dbhandler.dart';
import 'api.dart';

class delegate extends SearchDelegate {
  List<String>? ls;
  delegate({required this.ls});
  // //delegate createState() => delegate();

  //delegate.getdata();

  // var searchResults = ls;

  // List<String> searchResults = ['','india','USA'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: APIService.getresult(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<SearchModel> data = snapshot.data;
            return ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('${data[index].category}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(155, 10, 10, 10))),
                          Text('${data[index].sub_category}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(155, 10, 10, 10))),
                          Text('${data[index].sname1}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(155, 10, 10, 10))),
                          Text('${data[index].elemination_number}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(155, 10, 10, 10))),
                          Text('${data[index].balance_number}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(155, 10, 10, 10))),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Text("Details not found");
          }
        });
  }

  // late final List<String> _tasks;
  @override
  Widget buildSuggestions(BuildContext context) {
    //final ls = APIService.getdetails();
    // List list = [];
    // list.add(ls);
    // print(list[0]);
    //print(ls[0]);
    // print(ls);
    // var list = getdata;
    //print(list);
    // getdata() async {
    //var list = _HomePag
    //print(list);
    // return list;
    // }
    // get getdata async {
    //   final ls = await APIService.getdetails();
    //   print(ls);
    //   //print(list);
    //   return ls;
    // }

    //getdata();
    //print(ls);

    //var searchResults = Homepage;
    if (query != "") {
      var suggestions = ls!.where((searchResult) {
        final result = searchResult.toLowerCase();
        final input = query.toLowerCase();

        return result.contains(input);
      }).toList();

      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        },
      );
    } else {
      return Text('');
    }
  }
}
