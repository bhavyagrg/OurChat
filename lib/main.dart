import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(const OurChat());
}

class OurChat extends StatelessWidget {
  const OurChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WorkArea(),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(1, 32, 164, 212),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}

class WorkArea extends StatelessWidget {
  const WorkArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_rounded),
              label: Text("Home"),
            ),
            NavigationRailDestination(
                icon: Icon(Icons.settings_rounded), label: Text("Settings")),
          ],
          selectedIndex: 0,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const SearchBar(
                elevation: MaterialStatePropertyAll(1.0),
                leading: Icon(Icons.search_rounded),
                hintText: "Type here...",
              ),
              Expanded(
                flex: 1,
                child: Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemBuilder: (context, idx) {
                      return const ListTile(
                        leading: CircleAvatar(
                          child: Text("S"),
                        ),
                        title: Text("Sammmy"),
                        subtitle: Text("Hi, Sammy"),
                        trailing: Icon(Icons.done_all_rounded, size: 15),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        //Individual chat
        const Expanded(
          flex: 8,
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              //Top bar
              Row(
                children: [
                  CircleAvatar(
                    child: Text(
                      "S",
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Sammy"),
                  // row for calls
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.call,
                          size: 24,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.video_call_rounded,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //chat rendering
              Card(
                elevation: 2.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.favorite_outline_outlined),
                      title: Markdown(
                        key: Key("defaultmarkdownformatter"),
                        selectable: true,
                        padding: EdgeInsets.all(10),
                        data: "Hii, Beeeee",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    )
        // body: Column(
        //   children: [
        //     SizedBox(
        //       height: 50,
        //       child: Row(
        //         children: [Expanded(child: Placeholder())],
        //       ),
        //     ),
        //     Expanded(
        //       child: Row(
        //         children: [
        //           NavigationRail(
        //             destinations: const [
        //               NavigationRailDestination(
        //                 icon: Icon(Icons.home_rounded),
        //                 label: Text("Home"),
        //               ),
        //               NavigationRailDestination(
        //                 icon: Icon(Icons.settings),
        //                 label: Text("Settings"),
        //               ),
        //             ],
        //             selectedIndex: 0,
        //           ),
        //           Expanded(
        //             flex: 2,
        //             child: ListView.builder(
        //               itemBuilder: (context, idx) {
        //                 return ListTile(
        //                   leading: CircleAvatar(
        //                     child: Text("B"),
        //                   ),
        //                   title: Text("Beeeeee"),
        //                   subtitle: Text("hi simmmmmmyyyyy"),
        //                   trailing: Icon(
        //                     Icons.done_all_rounded,
        //                     size: 14,
        //                   ),
        //                 );
        //               },
        //               itemCount: 2,
        //             ),
        //           ),
        //           Expanded(flex: 8, child: Placeholder())
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
