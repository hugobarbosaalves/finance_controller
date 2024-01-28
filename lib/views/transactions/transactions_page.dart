import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/custom_container_data.dart';
import '../../models/transaction.dart';
import '../../widgets/custom_container.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  DateTime currentMonth = DateTime.now();
  List<CustomContainerData> containersData = [];

  List<CustomContainerData> getContainersDataForMonth(DateTime month) {
    List<CustomContainerData> containersData = [
      CustomContainerData(title: 'Rendas Fixas', transactions: []),
      CustomContainerData(title: 'Rendas Variáveis', transactions: []),
      CustomContainerData(title: 'Despesas Fixas', transactions: []),
      CustomContainerData(title: 'Despesas Variáveis', transactions: []),
    ];

    if (month.month == 2 && month.year == DateTime.now().year) {
      return [
        CustomContainerData(
          title: 'Rendas Fixas',
          transactions: [
            Transaction(
              value: 100.0,
              sumOperation: true,
              text: 'Salário',
              icon: Icons.attach_money,
              colorIcon: Colors.green,
              colorMoney: Colors.green,
            ),
            Transaction(
              value: 200.0,
              sumOperation: true,
              text: 'Bônus',
              icon: Icons.card_giftcard,
              colorIcon: Colors.green,
              colorMoney: Colors.green,
            ),
            Transaction(
              value: 150.0,
              sumOperation: true,
              text: 'Freelance',
              icon: Icons.work,
              colorIcon: Colors.green,
              colorMoney: Colors.green,
            ),
            // Adicione mais transações aqui
          ],
        ),
        CustomContainerData(
          title: 'Rendas Variáveis',
          transactions: [
            Transaction(
              value: 200.0,
              sumOperation: true,
              text: 'Investimentos',
              icon: Icons.trending_up,
              colorIcon: Colors.green,
              colorMoney: Colors.green,
            ),
            Transaction(
              value: 300.0,
              sumOperation: true,
              text: 'Venda de ações',
              icon: Icons.show_chart,
              colorIcon: Colors.green,
              colorMoney: Colors.green,
            ),
            Transaction(
              value: 500.0,
              sumOperation: true,
              text: 'Venda de bolos',
              icon: Icons.cake,
              colorIcon: Colors.green,
              colorMoney: Colors.green,
            ),
            // Adicione mais transações aqui
          ],
        ),
        CustomContainerData(
          title: 'Despesas Fixas',
          transactions: [
            Transaction(
              value: 50.0,
              sumOperation: false,
              text: 'Aluguel',
              icon: Icons.home,
              colorIcon: Colors.red,
              colorMoney: Colors.red,
            ),
            Transaction(
              value: 100.0,
              sumOperation: false,
              text: 'Internet',
              icon: Icons.wifi,
              colorIcon: Colors.red,
              colorMoney: Colors.red,
            ),
            Transaction(
              value: 70.0,
              sumOperation: false,
              text: 'Eletricidade',
              icon: Icons.flash_on,
              colorIcon: Colors.red,
              colorMoney: Colors.red,
            ),
            Transaction(
              value: 400.0,
              sumOperation: false,
              text: 'Saude',
              icon: Icons.health_and_safety_outlined,
              colorIcon: Colors.red,
              colorMoney: Colors.red,
            ),
            // Adicione mais transações aqui
          ],
        ),
        CustomContainerData(
          title: 'Despesas Variáveis',
          transactions: [
            Transaction(
              value: 30.0,
              sumOperation: false,
              text: 'Compras',
              icon: Icons.shopping_cart,
              colorIcon: Colors.red,
              colorMoney: Colors.red,
            ),
            Transaction(
              value: 40.0,
              sumOperation: false,
              text: 'Restaurante',
              icon: Icons.restaurant,
              colorIcon: Colors.red,
              colorMoney: Colors.red,
            ),
            Transaction(
              value: 50.0,
              sumOperation: false,
              text: 'Transporte',
              icon: Icons.directions_car,
              colorIcon: Colors.red,
              colorMoney: Colors.red,
            ),
            // Adicione mais transações aqui
          ],
        ),
      ];
    }

    return containersData;
  }

  void updateMonth(int increment) {
    setState(() {
      currentMonth =
          DateTime(currentMonth.year, currentMonth.month + increment);
      containersData = getContainersDataForMonth(currentMonth);
    });
  }

  @override
  void initState() {
    super.initState();
    containersData = getContainersDataForMonth(currentMonth);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<double> balances = containersData.map((containerData) {
      return containerData.transactions.fold(
        0.0,
        (previousValue, transaction) => transaction.sumOperation
            ? previousValue + transaction.value
            : previousValue - transaction.value,
      );
    }).toList();

    double totalBalance = balances.isNotEmpty
        ? balances.reduce((value, element) => value + element)
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => updateMonth(-1),
            ),
            Text(
              DateFormat.yMMM('pt_BR').format(currentMonth),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () => updateMonth(1),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        ListView(
          padding: EdgeInsets.only(
            bottom: screenHeight * 0.13,
          ),
          children: <Widget>[
            Column(
              children: containersData
                  .expand(
                    (containerData) => [
                      CustomContainer(
                        title: containerData.title,
                        sumOperation: containerData.transactions
                            .any((transaction) => transaction.sumOperation),
                        children: containerData.transactions.map((transaction) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    transaction.icon,
                                    color: transaction.colorIcon,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    transaction.text,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' R\$ ${transaction.sumOperation ? '+' : '-'} ${transaction.value.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: transaction.colorMoney,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  )
                  .toList(),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: screenWidth,
            height: screenHeight * 0.1,
            color: Color.fromARGB(255, 200, 200, 200),
            child: Center(
              child: Text(
                'Saldo:  R\$ ${totalBalance.toStringAsFixed(2)}',
                style: TextStyle(
                  color: totalBalance >= 0 ? Colors.green : Colors.red,
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
