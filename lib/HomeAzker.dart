import 'dart:convert';
import 'package:flutter/material.dart';
import 'Modules/modelAzker.dart';
import 'SectionDetailScreen.dart';

class HomeAzker extends StatefulWidget {
  const HomeAzker({super.key});

  @override
  State<HomeAzker> createState() => _HomeAzkerState();
}

class _HomeAzkerState extends State<HomeAzker> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff07596b),
        title: Center(
          child: Text(
            "أذكار المسلم",
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'images/im8.jpg',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            left: 10.0,
            right: 70.0,
          ),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildSectionItem(model: sections[index]),
            itemCount: sections.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 12.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionItem({required SectionModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionDetailScreen(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff07596b),
        ),
        child: Center(
            child: Text(
          "${model.name}",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/dataazkar.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
