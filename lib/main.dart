import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

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
    //markdown data
    const String markdownData = """
  # This is a Heading 1
  ## This is a Heading 2
  This is a paragraph with some *italic* and **bold** text.
  - This is a bullet point
  - Another bullet point
  1. This is a numbered list
  2. Another numbered item
  ```c++
  int main(){

  }
  ```
  """;

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
                child: SizedBox(
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
                        SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //chat rendering
              // card 1
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: 500,
                        height: 400,
                        child: Card(
                          elevation: 10.0,
                          child: Markdown(
                            listItemCrossAxisAlignment:
                                MarkdownListItemCrossAxisAlignment.start,
                            key: Key("defaultmarkdownformatter"),
                            softLineBreak: true,
                            data: markdownData,
                            selectable: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.all(10),
                          ),
                        )),
                  ),

                  //right card
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                        width: 500,
                        height: 400,
                        child: Card(
                          elevation: 10.0,
                          child: Markdown(
                            listItemCrossAxisAlignment:
                                MarkdownListItemCrossAxisAlignment.start,
                            key: Key("defaultmarkdownformatter"),
                            softLineBreak: true,
                            data: markdownData,
                            selectable: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.all(10),
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
