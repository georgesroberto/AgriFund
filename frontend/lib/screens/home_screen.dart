import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance, size: 24), // Small logo
                SizedBox(width: 8),
                Text('AgriFund',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.notifications, size: 24),
                SizedBox(width: 20),
                Icon(Icons.account_circle, size: 24),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Card
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.account_balance_wallet, size: 24),
                        SizedBox(width: 8),
                        Text('Wallet Balance',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Ksh 7,500',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text('Add Money'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                          label: const Text('Send Money'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Loan and Savings Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Loan Amount',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 10),
                          const Text('Ksh 0',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Apply Now'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Savings Amount',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 10),
                          const Text('Ksh 10,000',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Apply Savings'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Recent Transactions Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Transactions',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                GestureDetector(
                  onTap: () {},
                  child: const Text('View All',
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Transaction List
            Column(
              children: [
                ListTile(
                  leading:
                      const Icon(Icons.arrow_downward, color: Colors.green),
                  title: const Text('Transfer from Dan Gichu',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Today . 5:21 AM'),
                  trailing: const Text('Ksh 200',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {},
                ),
                const Divider(),
                // Add more ListTile items for more transactions
              ],
            ),
          ],
        ),
      ),
    );
  }
}
