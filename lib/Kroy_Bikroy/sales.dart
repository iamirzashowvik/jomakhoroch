import 'package:flutter/material.dart';
import 'package:jomakhoroch/Model/sales.dart';

class Sales extends StatefulWidget {
  final List<Saless> list;
  const Sales(this.list);

  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
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
              itemBuilder: (BuildContext context, int index) => ListTile(
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
                        (widget.list[index].type == 'Cash')
                            ? Text('৳${widget.list[index].amount}')
                            : Text('বাকি ৳${widget.list[index].amount}',
                                style: TextStyle(color: Colors.red[800],fontWeight: FontWeight.bold)),
                        Text(widget.list[index].date),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}

//  ৳