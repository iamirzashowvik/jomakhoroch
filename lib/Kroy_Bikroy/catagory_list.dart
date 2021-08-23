import 'package:flutter/material.dart';
import 'package:jomakhoroch/Tally_Khata/catagory.dart';

class CatagoryList extends StatefulWidget {
  final List<Catagory> cList;
  CatagoryList(this.cList);
  @override
  _CatagoryListState createState() => _CatagoryListState();
}

class _CatagoryListState extends State<CatagoryList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text('মোট ${widget.cList.length}',
                    style: TextStyle(color: Colors.grey))
            ),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.cList.length,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Divider(),
                  ListTile(
                    title: Text(widget.cList[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('মোট পণ্য ${widget.cList[index].count}'),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
