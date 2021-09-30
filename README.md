# Full screen date picker

#### Flutter package that allows you to pick a date using a beautiful full screen UI using one line.

- 🎨 Beautiful full screen UI.
- 👇 Infinity scrolling.
- 🔒 Null safe.
- 🤖 Android, 🍎 iOS, 🌐 Web, 🍏 MacOS, 🚪 Windows and 🐧 Linux.
- 💪 Fully tested.

### Screenshots:

| Picker screen | 17th of june is highlighted |
| --- | --- |
|![](https://github.com/omzer/full_screen_date_picker/blob/main/imgs/not_highlighted.png?raw=true)|![](https://github.com/omzer/full_screen_date_picker/blob/main/imgs/highlighted.png?raw=true)| 

## How to use:

##### 1- Add the package to your pubspac.yaml: ``full_screen_date_picker: any``

##### 2- Import it: ``import 'package:full_screen_date_picker/full_screen_date_picker.dart';``

##### 3- Open the page and await its result (be aware that the result might be null):

```
DateTime selectedDate = await Navigator.push(context, MaterialPageRoute(builder: (_) => FullScreenDatePicker()));
```

##### Or if you are using **GetX**, you can use:

```
DateTime selectedDate = await Get.to(FullScreenDatePicker());
```

##### 4- The returned value (which is an instance of DateTime) can be used however you like, here's an example:

```
DateTime selectedDate = await Get.to(FullScreenDatePicker());
print(DateFormat('d/M/y').format(selectedDate)); // output: 13/06/2021
```

Please note that you'll have to import the package [intl](https://pub.dev/packages/intl)
to be able to use the format method presented in the example.

## Customization:

##### 1- Add Custom title (default is "Select departure date")