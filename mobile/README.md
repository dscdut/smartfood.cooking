# Smartfood.cooking

Smartfood - Application Suggesting recipes from available ingredients

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://flutter.dev/)

## Features

- Choose available ingredients to find right recipes for you by your interests, region, diet, allergic food.
- Take pictures to detect available ingredients to find recipes for you. (in processing)
- Suggest recipes from leftovers to limit waste. (in processing)
- Personalized recipes suggestions. (in processing)
- Calculate the required calories according to your data. (in processing)
- Create own recipes. (in processing)
- Personal data management, favorite foods, diets.

## Technology used

- Flutter & Dart
- TensorFlow Lite
- Firebase
- State management using <a href="https://pub.dev/packages/provider">Provider/ChangeNotifier</a>, Dependency Injection using <a href="https://pub.dev/packages/get_it">get_it</a>
- <a href="https://pub.dev/packages/hive">Hive</a> for local storage

## Directory structure

```
project
│   README.md
│
│
└───lib
│   |
|   |
|   └───src
|   |    │  
│   |    └───core <--[app configs, constant, helpers, theme, utils]
|   |    |
│   |    └───data
│   |    |    |
│   │    |    └───datasource <-[Provider data from remote,  local storage and firebase]
│   |    |    |
│   │    |    └───models
│   |    |    |
│   │    |    └───repositories
│   |    |
|   |    |
│   |    └───di <-[Dependency Injection]
|   |    |
|   |    |
│   |    └───modules <-[App features, screens, business logic, local widgets]
│   |    |    
│   │    |   
│   |    └───widgets <-[Common widgets]   
│   │    |
│   |    └───app.dart
│   |
│   └───main.dart
│
│
└───assets
        └───icons
        |
        └───images
        |
        └───fonts
        |
        └───.env <-[.env for environment]
```

## Setup and run

<details>
    <summary>Click to expand</summary>
    <br>

- Download APK
  - [APK - arm64](https://drive.google.com/file/d/1r5BxLCoTn2JqQuEjAtoUxmZeSHIByEKa/view?usp=sharing)
- Setup and run
  - Flutter
    - Install [Flutter](https://flutter.dev/docs/get-started/install).
    - Using **`stable`** channel:
      ```bash
      ❯ flutter channel stable
      ❯ flutter upgrade
      ```
    - Flutter doctor:
      ```bash
      ❯ flutter doctor
      ```
    - Install all the packages by:
      ```bash
      ❯ flutter pub get
      ```
    - Create .env file `assets/.env` has following structure:
      ```bash
      BASE_URL=https://api.smartfood.cooking/api
      ```
    - Run app on real devices or emulator by:
      ```bash
      ❯ flutter run
      ```
      or debug mode in VSCode or some IDEs

</details>

## Screenshots


### Splash, Intro, SignIn, SignUp

<details>
    <summary>View Screenshots</summary>
    <br>

|                                                               |                             |                             |
| :-----------------------------------------------------------: | :-------------------------: | :-------------------------: |
|                         Splash Screen                         |           Intro1            |           Intro2            |
| <img src="screenshots/splash.gif" width="420" height="560" /> | ![](screenshots/intro1.png) | ![](screenshots/intro2.png) |
|                            Intro3                             |           Intro4            |                             |
|                  ![](screenshots/intro3.png)                  | ![](screenshots/intro4.png) |            ![]()            |
|                            Sign In                            |           Sign Up           |                             |
|                  ![](screenshots/signin.png)                  | ![](screenshots/signup.png) |            ![]()            |

</details>

### Main Screen

<details>
    <summary>View Screenshots</summary>
    <br>

|                                                         |                                        |                                               |
| :-----------------------------------------------------: | :------------------------------------: | :-------------------------------------------: |
|                       Home Screen                       |        Choose if you feel good         |   Choose if you feel bad to finding doctor    |
|             ![](screenshots/home_user.png)              |  ![](screenshots/if_choose_good.png)   |    ![](screenshots/if_choose_not_good.png)    |
|                      More Symptoms                      |      Result for choosing symptoms      |                 Choose Doctor                 |
|            ![](screenshots/more_symptom.png)            |      ![](screenshots/result.png)       | ![](screenshots/choose_doctor_by_symptom.png) |
|                         Search                          |              Chat Screen               |                   Chat Room                   |
|               ![](screenshots/search.png)               | ![](screenshots/chat_user_history.png) |        ![](screenshots/chat_room.png)         |
|              Chat With Typing Event Socket              |      Image Preview Before Sending      |               All Prescriptions               |
| ![](screenshots/chat_with_typing_event_socket_user.png) |    ![](screenshots/image_user.png)     |   ![](screenshots/prescription_member.png)    |
|                   Detail Prescription                   |     Detail Information Member role     |               Edit Information                |
|        ![](screenshots/detail_prescription.png)         |    ![](screenshots/detail_user.png)    |     ![](screenshots/edit_user_detial.png)     |
|                Detail Information Doctor                |         Change password dialog         |             Dialog choose avatar              |
|           ![](screenshots/detail_doctor.png)            |    ![](screenshots/change_pass.png)    | ![](screenshots/dialog_image_choose_edit.png) |
|                        More news                        |                WebView                 |                                               |
|             ![](screenshots/more_news.png)              |      ![](screenshots/webview.png)      |                     ![]()                     |

</details>




## Todo

- Implement features that are in processing.

## Mobile App Contributors✨

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><img src="https://avatars.githubusercontent.com/u/63831488?v=4" width="100px;" alt=""/><br /><sub><b>Nguyen Minh Dung</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=dungngminh" title="Code">💻</a> <a href="https://github.com/dscdut/smartfood.cooking/commits?author=dungngminh" >
    <td align="center"><img src="https://avatars.githubusercontent.com/u/69248042?v=4" width="100px;" alt=""/><br /><sub><b>Nguyen Minh Duc</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=beobiebom" title="Code">💻</a> <a href="https://github.com/dscdut/smartfood.cooking/commits?author=beobiebom" >
    <td align="center"><img src="https://avatars.githubusercontent.com/u/68652319?v=4" width="100px;" alt=""/><br /><sub><b>Do Tran Binh</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=dtrbinh" title="Code">💻</a> <a href="https://github.com/dscdut/smartfood.cooking/commits?author=dtrbinh" >
  </tr>
  
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
