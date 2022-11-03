import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:snap_chat_copy/model/user_model.dart';
import 'package:snap_chat_copy/repositiry/api_repo.dart';
import 'package:snap_chat_copy/signup/bloc/signup_screen.dart';
import 'package:snap_chat_copy/start_page/bloc/start_bloc.dart';
import 'package:snap_chat_copy/widgets/home.dart';

import '../first_page/first_page.dart';
import '../login/bloc/login_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _bloc = StartBloc();
  ApiRepo apiRepo = ApiRepo();

  @override
  void initState() {
    _bloc.add(IsRegEvent());
    super.initState();
  }

  bool? _isRegistreted;
  void _isRegistr() {
    if (apiRepo.getUserPage() == null) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _bloc,
        child: BlocListener<StartBloc, StartState>(
          listener: _listener,
          child: BlocBuilder<StartBloc, StartState>(
            builder: _render,
          ),
        ));
  }

  Widget _render(BuildContext context, StartState state) {
    // MyLocalizations? localization = MyLocalizations.of(context);
    return const Scaffold();
  }
}

extension _BlocListener on _StartPageState {
  void _listener(context, state) {
    if (state is IsRegState) {
      _isRegistreted = state.isReg;
      final user = state.user;
      if (_isRegistreted == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FirstPage(
                      user: user!,
                    )));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
  }
}
