

import 'package:flutter/material.dart';
import 'package:rider/Utilites/brand_colors.dart';
import 'package:rider/Utilites/mydivider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              height: 160,
                child: DrawerHeader(
                   decoration: const BoxDecoration(
                     color: BrandColors.button,
                   ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/user.png",
                      height: 60,width: 60,),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Annesha",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text("View Profile",)

                        ],
                      )

                    ],

                  ),
                )
            ),
            const MyDivider(),
            const SizedBox(height: 10,),
            const ListTile(
              leading:  Icon(Icons.credit_card),
              title: Text("Payment history",style: TextStyle(fontSize: 16),),
            ),
            const ListTile(
              leading: Icon(Icons.contact_support),
              title: Text("Support",style: TextStyle(fontSize: 16),),
            ) ,
            const ListTile(
              leading:  Icon(Icons.info_outline),
              title: Text("About",style: TextStyle(fontSize: 16),),
            ),
            const ListTile(
              leading:  Icon(Icons.logout),
              title: Text("Log Out",style: TextStyle(fontSize: 16),),
            )
          ],
        )
    );
  }
}
