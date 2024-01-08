# Flutter Code Generator

This Flutter code generator script automates the creation of a structured project folder for a Flutter application, following a clean architecture pattern. The generated folder structure includes data, domain, and presentation layers with appropriate subfolders and template files.

## Prerequisites

Before using this script, make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [dcli package](https://pub.dev/packages/dcli)

## Usage

1 - Clone or download the repository.

2 - Open a terminal and navigate to the project directory.

3 - Run the following command to execute the code generator script:

```bash
flutter pub run generator:generate <featureName>
```

**Replace <featureName> with the desired name for your feature/module.**

4 - The script will generate the necessary folder structure and template files for the data, domain, and presentation layers.

## Folder Structure

The generated folder structure follows a clean architecture pattern:

- **data**: Contains data-related files, including data source and repository.
  - **data_source**: Houses the remote data source file.
  - **repository**: Includes the repository implementation file.

- **domain**: Contains domain-related files, including model, repository interface, and use cases.
  - **model**: Holds the model file.
  - **repository**: Includes the repository interface file.
  - **use_cases**: Contains the use case file.

- **presentation**: Contains presentation-related files, including logic (Cubit and states) and the screen file.
  - **logic**: Houses the Cubit and states files.
  - **screen**: Includes the screen file.

## Customization

You can customize the generated code by modifying the templates located in the `generator/lib/module` directory. Each layer has its own set of templates that are used for code generation.

## Example

To illustrate, let's generate a feature named "ExampleFeature":

```bash
flutter pub run generator:generate ExampleFeature
```
This command will create the necessary folders and files within the `lib/features/ExampleFeature_feature` directory.

After running the command, your project structure will look like this:

```plaintext
lib
└── features
    └── ExampleFeature_feature
        ├── data
        │   ├── data_source
        │   │   └── ExampleFeature_remote_data_source.dart
        │   └── repository
        │       └── ExampleFeature_repository_impl.dart
        ├── domain
        │   ├── model
        │   │   └── ExampleFeature_model.dart
        │   ├── repository
        │   │   └── ExampleFeature_repository_interface.dart
        │   └── use_cases
        │       └── ExampleFeature_use_case.dart
        └── presentation
            ├── logic
            │   ├── ExampleFeature_cubit.dart
            │   └── ExampleFeature_states.dart
            └── ExampleFeature_screen.dart
```

## issues to solve
This document serves as a checklist for various issues and tasks that need attention in the flutter generator.

## Checkpoints

- [x] **Issue 1: Name of feature**
  - Description: when i want to solve name of files and class that generate from generator like (auth_feature, auth feature, auth user feature )

- [ ] **Issue 2: refactor stubs of generator/lib/module **
  - Description: stubs have bad naming in strings

- [ ] **Issue 3  generate in specific path **
  - Description: generate feature in specific path

- [ ] **Issue 4: remove _feature from generation method **
  - Description: with every folder of folder generated you must add _feature in end of folder of feature you generate
- [ ] **Issue 5: refactor methods of generate **

- [ ] **Issue 6: split methods of generator**
  - Description: split methods make us able to use it as single generator of specific layer

## Additional Notes

Feel free to add any additional notes or comments related to the issues listed above.


