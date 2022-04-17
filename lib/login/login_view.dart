import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _userNode = FocusNode();
  final _mailNode = FocusNode();
  final _passwordNode = FocusNode();

  final _userCont = TextEditingController();
  final _mailCont = TextEditingController();
  final _passwordCont = TextEditingController();

  final yellow = const Color(0xfffdd000);
  final white = const Color(0xfff2efe2);
  final darkGrey = const Color(0xff5d6d7c);
  CrossFadeState _state = CrossFadeState.showFirst;

  bool _isSelected = false;
  _changeSelect() {
    setState(() {
      _isSelected = !_isSelected;
      if (_isSelected) {
        _state = CrossFadeState.showSecond;
      } else {
        _mailCont.clear();
        _passwordCont.clear();
        _userCont.clear();
        _state = CrossFadeState.showFirst;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _userNode.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedCrossFade(
                          firstChild: Text("Giriş",
                              style: Theme.of(context).textTheme.headline2),
                          secondChild: Text("Kaydol",
                              style: Theme.of(context).textTheme.headline2),
                          crossFadeState: _state,
                          firstCurve: Curves.linear,
                          duration: Duration(milliseconds: 500)),
                      const SizedBox(height: 10),
                      usernameOrMailTextField(context),
                      const SizedBox(height: 10),
                      AnimatedCrossFade(
                          firstChild: SizedBox(),
                          secondChild: mailTextField(context),
                          crossFadeState: _state,
                          duration: Duration(milliseconds: 500)),
                      passwordTextField(context),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Spacer(),
                          Expanded(
                              flex: 10,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content:
                                            Text("Wellcome ${_userCont.text}"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  );
                                },
                                child: Text("Log In",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  backgroundColor:
                                      MaterialStateProperty.all(darkGrey),
                                ),
                              )),
                          const Spacer(),
                          Expanded(
                              flex: 10,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(20)),
                                      backgroundColor:
                                          MaterialStateProperty.all(darkGrey)),
                                  onPressed: _changeSelect,
                                  child: Text("Sign Up",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5))),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField usernameOrMailTextField(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: _isSelected ? _userCont : _mailCont,
      focusNode: _userNode,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: _isSelected ? "Kullanıcı adı" : "Mail",
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.white, letterSpacing: 5),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: yellow)),
        fillColor: Colors.white,
      ),
    );
  }

  TextFormField passwordTextField(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: _passwordCont,
      focusNode: _passwordNode,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: "Şifre",
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.white, letterSpacing: 5),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: yellow)),
        fillColor: Colors.white,
      ),
    );
  }

  TextFormField mailTextField(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: _mailCont,
      focusNode: _mailNode,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: "Mail",
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.white, letterSpacing: 5),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: yellow)),
        fillColor: Colors.white,
      ),
    );
  }
}
