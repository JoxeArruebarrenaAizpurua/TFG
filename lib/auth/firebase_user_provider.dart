import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TFGJoxeFirebaseUser {
  TFGJoxeFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

TFGJoxeFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TFGJoxeFirebaseUser> tFGJoxeFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TFGJoxeFirebaseUser>(
        (user) => currentUser = TFGJoxeFirebaseUser(user));
