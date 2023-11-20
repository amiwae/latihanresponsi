import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.white]
            )
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),),
                SizedBox(height: 20,),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network('https://media.licdn.com/dms/image/D5603AQFrYsASEVE3dA/profile-displayphoto-shrink_400_400/0/1697987871757?e=1705536000&v=beta&t=NBYvHkIAJS5RMwd34XS6gqBV6gtOo0bbfboZZb_bNMw'), // Ganti path sesuai dengan nama gambar lokal Anda
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(label: Text("Nama")),
                      DataColumn(label: Text(": Muhammad Amirul")),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("NIM")),
                          DataCell(Text(": 124210002")),
                        ],),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("Tempat Lahir")),
                          DataCell(Text(": Bantul")),
                        ],),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("Hobi")),
                          DataCell(Text(": Mobile Legends")),
                        ],),
                    ],),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
