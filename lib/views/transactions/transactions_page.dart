import 'package:flutter/material.dart';

import '../../widgets/custom_container.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fevereiro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        ListView(
          padding: EdgeInsets.only(
            bottom: screenHeight * 0.13,
          ),
          children: <Widget>[
            CustomContainer(
              title: 'Rendas Fixas',
              children: [
                ListItem(
                  icon: Icons.add_circle_outline_rounded,
                  text: 'Salário',
                  value: '3.000,00',
                  colorIcon: Colors.green,
                  colorMoney: Color.fromARGB(255, 109, 203, 88),
                ),
                ListItem(
                  icon: Icons.add_circle_outline_rounded,
                  text: 'Tesouro Direto',
                  value: '300,00',
                  colorIcon: Colors.green,
                  colorMoney: Color.fromARGB(255, 109, 203, 88),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            CustomContainer(
              title: 'Rendas Variaveis',
              children: [
                ListItem(
                  icon: Icons.add_circle_outline_rounded,
                  text: 'Investimentos em ações',
                  value: '150,00',
                  colorIcon: Colors.green,
                  colorMoney: Color.fromARGB(255, 109, 203, 88),
                ),
                ListItem(
                  icon: Icons.add_circle_outline_rounded,
                  text: 'Investimentos em criptomoedas',
                  value: '80,00',
                  colorIcon: Colors.green,
                  colorMoney: Color.fromARGB(255, 109, 203, 88),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.02,
              ),
              child: const Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
            ),
            CustomContainer(
              title: 'Despesas Fixas',
              children: [
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Aluguel da casa',
                  value: '1.600,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Internet e TV a cabo',
                  value: '140,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Dentista',
                  value: '250,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Conta de luz',
                  value: '350,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Escola da filha',
                  value: '2.000,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            CustomContainer(
              title: 'Despesas Variaveis',
              children: [
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Conta de luz',
                  value: '350,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Conta de água',
                  value: '80,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Combustível',
                  value: '450,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Lazer',
                  value: '500,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
                ListItem(
                  icon: Icons.remove_circle_outline_rounded,
                  text: 'Alimentação',
                  value: '1.200,00',
                  colorIcon: Colors.deepOrange,
                  colorMoney: Color.fromARGB(255, 207, 102, 102),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: screenWidth,
            height: screenHeight * 0.1,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Saldo:  R\$ 230.00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
