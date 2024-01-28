import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool sumOperation;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.children,
    required this.sumOperation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  final Color colorIcon;
  final Color colorMoney;

  const ListItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.value,
    required this.colorIcon,
    required this.colorMoney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              icon,
              // color: Colors.deepOrange,
              color: colorIcon,
              size: 24,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Text(
            'R\$ $value',
            style: TextStyle(
              // color: Color.fromARGB(255, 207, 102, 102),
              color: colorMoney,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
