# SmartFood - Application suggesting recipes from available ingredients

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://flutter.dev/) ![NodeJs](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)

<a href ="https://drive.google.com/file/d/1r5BxLCoTn2JqQuEjAtoUxmZeSHIByEKa/view?usp=sharing">![SmartFood Landing](mobile/screenshots/SmartFood.jpg)</a>

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
- NodeJs

## Environment

<details>
    <summary>Click to expand</summary>
    <br>

- Install nodejs
- Install npm or yarn
- Make sure you are in root directory

- Initiate commitlint with yarn

```bash
yarn
```

- Or with npm

```bash
npm i
```

</details>

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

|                                                |                                                |                                           |
| :--------------------------------------------: | :--------------------------------------------: | :---------------------------------------: |
|                 Splash Screen                  |                    Sign In                     |                Home Screen                |
|       ![](mobile/screenshots/splash.jpg)       |      ![](mobile/screenshots/sign_in.jpg)       |     ![](mobile/screenshots/home.jpg)      |
|            Choose your Ingredients             |           Choose Ingrdients by Type            |               Choose recipe               |
| ![](mobile/screenshots/choose_ingredients.jpg) | ![](mobile/screenshots/choose_ingredient2.jpg) | ![](mobile/screenshots/choose_recipe.jpg) |
|                 Cooking repice                 |                  Cooking step                  |               Done cooking                |
|      ![](mobile/screenshots/cooking.jpg)       |    ![](mobile/screenshots/cooking_step.jpg)    | ![](mobile/screenshots/done_cooking.jpg)  |

## Todo

- Implement features that are in processing.

## Contributors✨

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><img src="https://avatars.githubusercontent.com/u/63831488?v=4" width="100px;" alt=""/><br /><sub><b>Nguyen Minh Dung</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=dungngminh" title="Code">💻</a> <a title="Mobile">📱</a> <a href="https://github.com/dscdut/smartfood.cooking/commits?author=dungngminh" >
    <td align="center"><img src="https://avatars.githubusercontent.com/u/69248042?v=4" width="100px;" alt=""/><br /><sub><b>Nguyen Minh Duc</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=beobiebom" title="Code">💻</a> <a title="Mobile">📱</a> <a href="https://github.com/dscdut/smartfood.cooking/commits?author=beobiebom" >
    <td align="center"><img src="https://avatars.githubusercontent.com/u/79563371?v=4" width="100px;" alt=""/><br /><sub><b>Hoang Quang Hung</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=H2Q318" title="Code">💻</a><a title="Backend">🔗</a> <a href="https://github.com/dscdut/smartfood.cooking/commits?author=H2Q318" >
    <td align="center"><img src="https://avatars.githubusercontent.com/u/68652319?v=4" width="100px;" alt=""/><br /><sub><b>Do Tran Binh</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=dtrbinh" title="Code">💻</a><a title="Mobile">📱</a> <a href="https://github.com/dscdut/smartfood.cooking/commits?author=dtrbinh" >
    <td align="center"><img src="https://avatars.githubusercontent.com/u/55626329?v=4" width="100px;" alt=""/><br /><sub><b>Nguyen Ich Hoa</b></sub></a><br /><a href="https://github.com/dscdut/smartfood.cooking/commits?author=ichhoa129" title="Code">💻</a><a title="Supporter">🤝</a><a title="Backend">🔗</a>  <a href="https://github.com/dscdut/smartfood.cooking/commits?author=ichhoa129" >
  </tr>
  
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
