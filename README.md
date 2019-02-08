# 2048

![2048 Game](https://raw.githubusercontent.com/victorkifer/game2048/master/resources/screenshot.png)

## Features Overview

- supports different grid sizes (standard - 4x4 grid)
- game engine is separated from UI
- high score support (stored in SharedPreferences / NSUserDefaults)
- supports one step back
- win/lose check

### Missing features (All contributions are welcome)

- move animations
- the gesture engine seems to respond a little bit slow
- limited test coverage
- history of steps (multi-step back)

## Developer Notes

### Icon update

In order to update the app icon, put the new icon for android and ios into assets folder and then run

```bash
flutter pub pub run flutter_launcher_icons:main
```
