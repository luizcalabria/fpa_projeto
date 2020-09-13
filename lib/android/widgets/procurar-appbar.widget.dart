import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpa_projeto/controllers/home.controller.dart';

class ProcurarAppBar extends StatelessWidget {
  final HomeController controller;

  ProcurarAppBar({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Observer(
        builder: (_) => controller.showSearch
            ? TextField(
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: InputDecoration(
            labelText: "Pesquisar...",
          ),
          onSubmitted: (val) {},
        )
            : Row(
          children: [
            SizedBox(
              height: 28,
              width: 28,
              child: Image.asset("assets/images/defesa_civil.jpg"),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Meus Chamados"
            )
          ],
        ),
      ),
      centerTitle: true,
      leading: FlatButton(
        onPressed: () {
          if (controller.showSearch) controller.search(0);
          controller.toggleSearch();
        },
        child: Observer(
          builder: (_) => Icon(
            controller.showSearch ? Icons.close : Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
