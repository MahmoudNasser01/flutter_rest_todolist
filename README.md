# rest_todolist


## folder structure explanation
- `rest_todolist` is the root folder of the project
    - `lib` where the core of the project stands
        - `main.dart` is the entry point of the project
        - `config` contains the configuration of the project
            - `constants.dart` contains the constants like (BASE_URLS, API_VERSION, etc.)
        - `remote_data_source` contains the remote data source (fetching data from server)
        - `screens` contains the pages of the project
            - `home_screen.dart` is the home page where we display the whole todos
            - `todo_form_screen.dart` is the page where we add a new todo and also edit an existing todo
        - `utils` contains general functions that can be used in the whole project
            - `navigations.dart` contains the navigation functions
        - `widget` contains the widgets that can be used in the whole project
            - `no_todo.dart` contains a place holder widget when there is no todo
            - `todo_actions.dart` the todo actions list
            - `todo_card.dart` todo card container
           



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
