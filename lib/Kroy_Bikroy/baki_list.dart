import 'package:flutter/material.dart';
import 'package:jomakhoroch/Model/sales.dart';

class BakiList extends StatefulWidget {
  final List<Saless> list;
  const BakiList(this.list);

  @override
  _BakiListState createState() => _BakiListState();
}


class _BakiListState extends State<BakiList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) =>
                (widget.list[index].type == 'Debt')
                    ? ListTile(
                        leading: Column(
                          children: [
                            Text('#${widget.list.length - index}'),
                            (widget.list[index].account == 'null')
                                ? Text('Unknown')
                                : Text(widget.list[index].account),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text('বাকি ৳${widget.list[index].amount}',
                                style: TextStyle(color: Colors.red[800])),
                            Text(widget.list[index].date),
                          ],
                        ),
                      )
                    : Container(),
          ),
        ),
      ),
    );
  }
}
