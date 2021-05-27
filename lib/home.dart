import 'package:flutter/material.dart';
// import 'package:register/home_barang.dart';
// import 'package:register/home_stok.dart';
// import 'package:admintoko/pages/data_barang.dart';
// import 'package:admintoko/pages/data_stok.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS Mobile',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text("BeRice"),
        ),
        body: Container(
          margin: EdgeInsets.all(17),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(13, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(120, 10, 0, 0),
                          height: 50, //ukuran gambar
                          width: 50, //ukuran gambar
                          decoration: BoxDecoration(
                            //box untuk gambar
                            borderRadius: BorderRadius.circular(
                                30.0), //bentuk gambar akan melengkung
                            image: DecorationImage(
                              //gambar
                              image: NetworkImage(//alamat gambar
                                  "https://cdn.imgbin.com/6/25/24/imgbin-user-profile-computer-icons-user-interface-mystique-aBhn3R8cmqmP4ECky4DA3V88y.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(78, 17, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Halo Admin",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Selamat Datang !",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                width: 350,
                height: 200,
                color: Colors.blue[900],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Container(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (context) =>
                                //             new BarangPage()));
                              },
                              color: Colors.white,
                              textColor: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        height: 85, //ukuran gambar
                                        width: 85, //ukuran gambar
                                        decoration: BoxDecoration(
                                            //box untuk gambar
                                            //bentuk gambar akan melengkung
                                            image: DecorationImage(
                                                //gambar
                                                image: NetworkImage(
                                                    //alamat gambar
                                                    "https://st4.depositphotos.com/12839612/20172/v/600/depositphotos_201721956-stock-illustration-flat-vectoe-set-of-burlap.jpg "),
                                                fit: BoxFit.fill)),
                                      ),
                                    ],
                                  )),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Barang",
                                            style: TextStyle(
                                              color: Color(0xFFF05A22),
                                              fontFamily: 'Montserrat',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          width: 120,
                          height: 150,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 85),
                          child: Container(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (context) => new StokPage()));
                              },
                              color: Colors.white,
                              textColor: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        height: 85, //ukuran gambar
                                        width: 85, //ukuran gambar
                                        decoration: BoxDecoration(
                                            //box untuk gambar
                                            //bentuk gambar akan melengkung
                                            image: DecorationImage(
                                                //gambar
                                                image: NetworkImage(
                                                    //alamat gambar
                                                    "https://image.freepik.com/free-vector/different-sacks-white-rice-food-storage-vector-illustrations_80590-531.jpg"),
                                                fit: BoxFit.fill)),
                                      ),
                                    ],
                                  )),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 0,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Barang Masuk",
                                            style: TextStyle(
                                              color: Color(0xFFF05A22),
                                              fontFamily: 'Montserrat',
                                              fontSize: 11.7,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          width: 205,
                          height: 150,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //colom bawah
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Container(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              onPressed: () {},
                              color: Colors.white,
                              textColor: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        height: 85, //ukuran gambar
                                        width: 85, //ukuran gambar
                                        decoration: BoxDecoration(
                                            //box untuk gambar
                                            //bentuk gambar akan melengkung
                                            image: DecorationImage(
                                                //gambar
                                                image: NetworkImage(
                                                    //alamat gambar
                                                    "https://image.freepik.com/vector-gratis/conjunto-vectores-sacos-arroz-dibujados-mano-arroz-bosquejo-aislado-sobre-fondo-blanco_53562-11098.jpg"),
                                                fit: BoxFit.fill)),
                                      ),
                                    ],
                                  )),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 0,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Barang Rusak",
                                            style: TextStyle(
                                              color: Color(0xFFF05A22),
                                              fontFamily: 'Montserrat',
                                              fontSize: 12.2,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          width: 120,
                          height: 150,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 85),
                          child: Container(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              onPressed: () {},
                              color: Colors.white,
                              textColor: Colors.black,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        height: 85, //ukuran gambar
                                        width: 85, //ukuran gambar
                                        decoration: BoxDecoration(
                                            //box untuk gambar
                                            //bentuk gambar akan melengkung
                                            image: DecorationImage(
                                                //gambar
                                                image: NetworkImage(
                                                    //alamat gambar
                                                    "https://icon-library.com/images/blue-exit-icon/blue-exit-icon-8.jpg"),
                                                fit: BoxFit.fill)),
                                      ),
                                    ],
                                  )),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Logout",
                                            style: TextStyle(
                                              color: Color(0xFFF05A22),
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          width: 205,
                          height: 150,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
