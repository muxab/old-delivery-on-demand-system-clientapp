import 'package:flutter/material.dart';

class FlutterDropdownSearch extends StatefulWidget {
  final TextEditingController? textController;
  final String? hintText;
  final List<dynamic>? items;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? dropdownTextStyle;
  final IconData? suffixIcon;
  final double? dropdownHeight;
  final Color? dropdownBgColor;
  final InputBorder? textFieldBorder;
  final EdgeInsetsGeometry? contentPadding;
  final String? s;

  FlutterDropdownSearch({
    required this.textController,
    this.hintText,
    required this.items,
    this.hintStyle,
    this.style,
    this.dropdownTextStyle,
    this.suffixIcon,
    this.dropdownHeight,
    this.dropdownBgColor,
    this.textFieldBorder,
    this.contentPadding,
    required this.s,
  });

  @override
  _FlutterDropdownSearchState createState() => _FlutterDropdownSearchState();
}

class _FlutterDropdownSearchState extends State<FlutterDropdownSearch> {
  bool _isTapped = false;
  List<dynamic> _filteredList = [];
  List<dynamic> _subFilteredList = [];

  initState() {
    super.initState();
    _filteredList = widget.items!;
    _subFilteredList = _filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Text Field
        TextFormField(
          controller: widget.textController,
          onChanged: (val) {
            setState(() {
              _filteredList = _subFilteredList
                  .where(
                    (element) => element.city!.toLowerCase().contains(
                          widget.textController!.text.toLowerCase(),
                        ),
                  )
                  .toList();
            });
          },
          validator: (val) => val!.isEmpty ? 'Field can\'t empty' : null,
          style: widget.style ??
              TextStyle(color: Colors.grey.shade800, fontSize: 16.0),
          onTap: () => setState(() => _isTapped = true),
          decoration: InputDecoration(
              border: widget.textFieldBorder ?? UnderlineInputBorder(),
              hintText: widget.hintText ?? "Write here...",
              hintStyle: widget.hintStyle ??
                  TextStyle(fontSize: 16.0, color: Colors.black),
              suffixIcon:
                  Icon(widget.suffixIcon ?? Icons.arrow_drop_down, size: 25),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              isDense: true,
              suffix: InkWell(
                  onTap: () {
                    widget.textController!.clear();
                    setState(() => _filteredList = widget.items!);
                    setState(() {
                      _isTapped = false;
                    });
                  },
                  child: Icon(Icons.clear, color: Colors.blue))),
        ),

        ///Dropdown Items
        _isTapped && _filteredList.isNotEmpty
            ? Container(
                height: widget.dropdownHeight ?? 150.0,
                color: widget.dropdownBgColor ?? Colors.grey.shade200,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() => _isTapped = !_isTapped);
                        widget.textController!.text =
                            _filteredList[index].city!;
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          _filteredList[index].city!,
                          softWrap: true,
                          style: widget.dropdownTextStyle ??
                              TextStyle(
                                  color: Colors.grey.shade800, fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
