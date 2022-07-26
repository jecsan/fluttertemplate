# flutter template

A Flutter template/resources

## TODO
- Write a script for renaming the project, replacing applicationId/bundleId, label, appname, etc and removing the git history

## Usage
- [ ] **(For client projects)** Clone the repository, remove the .git folder, and reinitialize, since there is currently no way to remove the "generated from" header
- [ ] For internal projects, click "new" then choose this template.
- [ ] Replace current package name from **com.codecodecoffee.flutter** to client's package name/bundle ID
- [ ] (Optional)Update the [splash screen](https://flutter.dev/docs/development/ui/advanced/splash-screen)
- [ ] Delete/Replace all texts from README.md

## Naming Conventions
1. For new Activity/UIViewController counterpart, append screen/Screen. eg. login_screen.dart/LoginScreen
2. For API response and pojo, append Request/Response and Json to avoid confusion with data/domain models. eg LoginRequest/UserJson


## Porting an existing Android/iOS App to Flutter
1. Audit dependencies - List your gradle/podfile dependencies and check for existing pub.dev counterpart.
2. Resetup 3rd party service providers for both platforms - Login via google, apikeys, etc..

## Data Flow From UI to Remote/DB for transactions
* Access data via StateNotifiers
* StateNotifier calls repository
* Repository calls service(remote)
* Response is parsed and necessary persistence layers updated
* Repository returns updated model


## Data Flow From UI to Remote/DB for lists/iterables
* Load data via StateNotifiers
* StateNotifiers calls repository
* Repository returns local data from db, then calls service(remote)
* Response is parsed and saved via DAO(data access objects)
* Repository requeries DB and returns updated data


## Preferred packages/libraries:

https://github.com/jecsan/fluttertemplate/blob/main/pubspec.yaml


## Project Structure

- .config/flavor/
- packages
    - api
    - data
- lib
    - core 
       - data
        - account
        - model
        - repository
        - service
    - view
        - screen


