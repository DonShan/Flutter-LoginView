import 'package:flutter/material.dart';
import 'package:loginnew/models/movies_model.dart';
import 'package:loginnew/view_model/home_view_model.dart';
import 'package:loginnew/view_model/user_view_model.dart';
import 'package:loginnew/views/login.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    homeViewViewModel.fetchMoviewListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                userPrefernece.remove(true).then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                });
              },
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.moviewsList.status) {
            case Status.LOADING:
              return const CircularProgressIndicator();
            case Status.ERROR:
              return Text(value.moviewsList.message.toString());
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviewsList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(value
                            .moviewsList.data!.movies![index].posterurl
                            .toString()),
                        title: Text(value.moviewsList.data!.movies![index].title
                            .toString()),
                        subtitle: Text(value
                            .moviewsList.data!.movies![index].title
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    );
                  });
          }
          return Container();
        }),
      ),
    );
  }
}
