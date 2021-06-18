import 'package:firebase_auth/firebase_auth.dart';
import 'signin_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Firestore"),
        actions: [
          //! Builder eklemezsek Scaffold.of() hata verecektir!
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.login),
              onPressed: () async {
                await _auth.signOut();// TODO: Çıkış yap

                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Başarıyla çıkış yapıldı"),
                ));

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('burclar').snapshots(),
        builder: (context , snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            }
        else if(snapshot.hasError)
          {
            return Center(
              child: Icon(Icons.error, size: 80,),
            );
          }
        final QuerySnapshot querySnapshot=snapshot.data;

        return ListView.builder (
          itemCount: querySnapshot.size,
        itemBuilder: (context,index) {
          final map = querySnapshot.docs[index].data();
          querySnapshot.docs.map((doc) => ListTile(
            title: Text(doc['balık']),
          ));
          return Container (
          );
        }
        );
        },
      ),
    );
  }
}
