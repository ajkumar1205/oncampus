# OnCampus

## Must Do
- `git pull origin main` Make sure to run this command before start development to stay updated on the repository.
- Push the updated changes as you close.

## Coding Format
- constants (Folder) contains all the constants of the application. Write all the files with `relative_name.const.dart`.
- utils (Folder) contains all the functions that we may need in the application. Global utilities should be directly put there i.e., `extensions.dart` otherwise put all the functions in the specific folder e.g. `functions/firebase/auth.func.dart` i.e., functions (Folder).


## May Help
- `SizedBox()`, with height or width, can be written by `10.vertical()` for height or `20.2.horizontal()` for width. You can even pass a child widgte in the function.
- `Text("Something")` can be easily written by `"Somthing".text()`, TextStyle can be passed into the text function for ease.
- Height or width should always be given using format `10.h`, `3.2.w` etc. The `.h` or `.w` represents corresponding percentage of height and width of the screen.