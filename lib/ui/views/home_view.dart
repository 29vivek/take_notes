import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/core/viewmodels/home_model.dart';
import 'package:take_notes/locator.dart';
import 'package:take_notes/ui/widgets/home_body.dart';
import 'package:take_notes/ui/widgets/home_drawer.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeModel model = locator<HomeModel>();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<HomeModel>.value(
      value: model,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Take Notes'),
          ),
          drawer: HomeDrawer(),
          body: HomeBody(),
          bottomNavigationBar: BottomAppBar(
            child: Container(height: 56.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Type a note...', 
                            style: Theme.of(context).textTheme.subtitle.copyWith(color: Theme.of(context).textTheme.caption.color),
                          ),
                        ),
                      ),
                      onTap: () { 
                        Navigator.of(context).pushNamed('/note');
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon:Icon(Icons.photo_camera),
                    onPressed: () {},
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}