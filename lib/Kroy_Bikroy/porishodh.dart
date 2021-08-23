import 'package:flutter/material.dart';
import 'package:jomakhoroch/Model/sales.dart';

class Porishod extends StatefulWidget {
  final List<Saless> list;
  const Porishod(this.list);

  @override
  _PorishodState createState() => _PorishodState();
}

class _PorishodState extends State<Porishod> {
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
                (widget.list[index].type == 'Cash')
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
                            Text('৳${widget.list[index].amount}'),
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
