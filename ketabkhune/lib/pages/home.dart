import 'package:flutter/material.dart';
import '../scoped-models/user.dart';
import './view_pdf.dart';

class HomePage extends StatefulWidget {
  final UserModel model;
  HomePage(this.model);
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  void initState() {
    widget.model.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 30.0, left: 20.0),
                child: Text(
                  widget.model.loggetInUserData[0],
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('about'),
              onTap: () {
                Navigator.pushNamed(context, '/info');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                widget.model.logOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            )
          ],
        ),
      ),
      body: widget.model.isLoadin
          ? Center(
              child: FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () {
                  setState(() {});
                },
              ),
            )
          : ListView.builder(
              itemCount: widget.model.pdfDataList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(widget.model.pdfDataList[index]['bookname']),
                  leading: Icon(
                    Icons.picture_as_pdf,
                    size: 50.0,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ViewPdf(
                                    widget.model.pdfDataList[index]['bookname'],
                                    index,
                                    widget.model.pdfDataList[index]
                                        ['bookurl'])));
                      },
                      icon: Icon(Icons.open_in_new)),
                );
              },
            ),
    );
  }
}
