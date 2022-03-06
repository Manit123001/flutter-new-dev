import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_architecture/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Title Hello"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<HomeViewModel>(builder: (context, viewModel, child) {
              return Text((viewModel.getUser.hasUser)
                  ? "name: ${viewModel.getUser.name}, age: ${viewModel.getUser.age}"
                  : "Hello World");
            }),
            ElevatedButton(
              onPressed: () {
                viewModel.fetchData();
              },
              child: Text("fetch"),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.fetchUseCaseData();
              },
              child: Text("fetch usecase"),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.goTo();
              },
              child: Text("go to about"),
            )
          ],
        ),
      ),
    );
  }
}
