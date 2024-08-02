import 'package:flutter/material.dart';
import 'dart:convert';
import 'Modules/ModelAzkerDetelis.dart';

class SectionDetailScreen extends StatefulWidget {
  final int id;
  final String title;
  const SectionDetailScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _SectionDetailScreenState createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  double size = 25.0;
  List<SectionDetailModel> sectionDetails = [];

  @override
  void initState() {
    super.initState();
    loadSectionDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff07596b),
        title: Center(
          child: Text(
            "${widget.title}",
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.add_circle,
                  size: 30,
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    size++;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  size: 30,
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    size--;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'images/image88.jpg',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    color: Colors.white70,
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${sectionDetails[index].reference}",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "${sectionDetails[index].content}",
                          style: TextStyle(
                            fontSize: size,
                          ),
                          textAlign: TextAlign.end,
                          textDirection: TextDirection.ltr,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          "${sectionDetails[index].description}",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${sectionDetails[index].count}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
              itemCount: sectionDetails.length),
        ),
      ),
    );
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/dataazkerdetails.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel _sectionDetail =
            SectionDetailModel.fromJson(section);
        if (_sectionDetail.sectionId == widget.id) {
          sectionDetails.add(_sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
