import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool sumOperation;
  final VoidCallback onAddButtonPressed;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.children,
    required this.sumOperation,
    required this.onAddButtonPressed,
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
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: onAddButtonPressed,
                          ),
                        ],
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
              color: colorMoney,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
