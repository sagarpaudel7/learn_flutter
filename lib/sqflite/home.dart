import "package:flutter/material.dart";
import "package:learn_flutter/constants.dart/appbar.dart";
import "package:learn_flutter/sqflite/db_handler.dart";
import "package:learn_flutter/sqflite/notes.dart";

class SqfLiteDemo extends StatefulWidget {
  const SqfLiteDemo({super.key});

  @override
  State<SqfLiteDemo> createState() => _SqfLiteDemoState();
}

class _SqfLiteDemoState extends State<SqfLiteDemo> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("SQFLite Demo"),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: notesList,
              builder: (BuildContext context, AsyncSnapshot<List<NotesModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          dbHelper!.update(NotesModel(
                              id: snapshot.data![index].id!,
                              title: "Updated Title",
                              age: 22,
                              desc: "Now the desc. changed.",
                              email: "Example@gmail.com"));
                          setState(() {
                            notesList = dbHelper!.getNotesList();
                          });
                        },
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete_forever),
                          ),
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              dbHelper!.delete(snapshot.data![index].id!);
                              notesList = dbHelper!.getNotesList();
                              snapshot.data!.remove(snapshot.data![index]);
                            });
                          },
                          key: ValueKey<int>(snapshot.data![index].id!),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                snapshot.data![index].title.toString(),
                              ),
                              subtitle: Text(
                                snapshot.data![index].desc.toString(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!
              .insert(NotesModel(
            title: "Next Task",
            age: 22,
            desc: "SQFLite Insert Query Created",
            email: "sagar@gmail.com",
          ))
              .then((value) {
            print("Value added");
            setState(() {
              notesList = dbHelper!.getNotesList();
            });
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
