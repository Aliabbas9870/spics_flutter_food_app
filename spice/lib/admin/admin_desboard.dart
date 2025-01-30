import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/auth/Login_Account.dart';
import 'package:spice/views/widget/constant.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor().primaryColor
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              
              decoration: BoxDecoration(color: Colors.black),
              child: Center(
                child: const Text(
                  'SpiceAdmin',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text('Manage Items'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManageItemsScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async{
                   try {
                            // Sign out the user from Firebase
                            await FirebaseAuth.instance.signOut();
                            print('User successfully signed out');
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor().primaryColor,
          
          content: const Text(
            "User successfully signed out",
            style: TextStyle(
                  fontSize: 16,
              color: Colors.black
            ),
          )));

                            Get.off( LoginAccount());
                          } catch (e) {
                            print('Error signing out: $e');
                
                          }
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Admin Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManageItemsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor:Colors.yellow),
              child: const Text('Manage Food Items'),
            ),
          ],
        ),
      ),
    );
  }
}




class ManageItemsScreen extends StatelessWidget {
  const ManageItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme:IconThemeData(color: AppColor().bgColor),
          title: const Text('Manage Items',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          backgroundColor: AppColor().primaryColor,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Desi Food',),
              Tab(text: 'Drinks & other'),
              Tab(text: 'Pizza'),
              Tab(text: 'Fries'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ItemsList(collection: 'desifood_cart'),
            ItemsList(collection: 'drink_other_cart'),
            ItemsList(collection: 'pizza_cart'),
            ItemsList(collection: 'fries_cart'),
          ],
        ),
      ),
    );
  }
}
class ItemsList extends StatelessWidget {
  final String collection;

  const ItemsList({required this.collection, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collection).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No items found.'));
        }

        final items = snapshot.data!.docs;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            
            // Determine specific fields for Desi Food and Pizza
            final isDesiFood = collection == 'desifood_cart';
            final isPizza = collection == 'pizza_cart';

            // Build details dynamically based on item type
            final additionalDetails = <Widget>[];

            if (isDesiFood) {
              if (item['halfPlate'] == true) {
                additionalDetails.add(const Text('Option: Half Plate'));
              }
              if (item['fullPlate'] == true) {
                additionalDetails.add(const Text('Option: Full Plate'));
              }
            } else if (isPizza) {
              if (item['size'] == "Small") {
                additionalDetails.add(const Text('Size: Small'));
              }
              if (item['size'] == "Medium") {
                additionalDetails.add(const Text('Size: Medium'));
              }
              if (item['size'] == "Large") {
                additionalDetails.add(const Text('Size: Large'));
              }
            }

            return Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 4,
              child: ListTile(
                title: Text(item['title']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description: ${item['description']}'),
                    Text('Price: ${item['price']}'),
                    Text('User: ${item['userName']}'),
                    Text('Status: ${item['status']}'),
                    ...additionalDetails, 
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.black),
                      onPressed: () => _editItem(context, item.id, collection, item),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => FirebaseFirestore.instance
                          .collection(collection)
                          .doc(item.id)
                          .delete(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _editItem(BuildContext context, String id, String collection, dynamic item) {
    final titleController = TextEditingController(text: item['title']);
    final descriptionController = TextEditingController(text: item['description']);
    final priceController = TextEditingController(text: item['price'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection(collection).doc(id).update({
                  'title': titleController.text,
                  'description': descriptionController.text,
                  'price': double.tryParse(priceController.text) ?? item['price'],
                });
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
