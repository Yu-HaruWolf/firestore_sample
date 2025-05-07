# firestore_sample

A sample project for getting and updating on FireStore.

When you run this project, you have to configure the firebase project.

I recommend to use the following command.
```
flutterfire configure
```

## Generating user.g.dart

`user.dart` requires `user.g.dart`.
You can generate `user.g.dart` with the following command.
```
dart run build_runner build --delete-conflicting-outputs
```