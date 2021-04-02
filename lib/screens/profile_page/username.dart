part of 'profile_page.dart';

/// Username widget displays the name of user
/// ontap it goes into editable mode. See [UsernameEdit]
class Username extends StatelessWidget {
  final Function onTap;
  final User user = GlobalSettingController.getuser();

  Username({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onTap(false),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(user.name, style: Style.title(context)),
      ),
    );
  }
}

/// UsernameEdit widget displays TextField to update the username.
/// See [Username]
class UsernameEdit extends StatefulWidget {
  final Function onTap;

  UsernameEdit({this.onTap});

  @override
  _UsernameEditState createState() => _UsernameEditState();
}

class _UsernameEditState extends State<UsernameEdit> {
  final int maxLength = 20;
  int remainingCharacters;
  TextEditingController textController;
  User user;

  @override
  void initState() {
    super.initState();
    textController = new TextEditingController();
    user = GlobalSettingController.getuser();
    textController.text = user.name;
    textController.addListener(onTextChanged);
    remainingCharacters = maxLength - textController.text.length;
  }

  void onTextChanged() {
    setState(() {
      remainingCharacters = maxLength - textController.text.length;
      user.name = textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 11,
          child: c.CupertinoTextField(
            maxLength: maxLength,
            controller: textController,
            keyboardType: TextInputType.text,
            padding: EdgeInsets.all(16),
            style: Style.bodySecondary(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: c.CupertinoDynamicColor.resolve(
                  c.CupertinoColors.quaternarySystemFill, context),
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 44,
          height: 44,
          child: c.CupertinoButton(
            padding: EdgeInsets.all(10),
            color: c.CupertinoDynamicColor.resolve(
                c.CupertinoColors.systemOrange, context),
            child: Icon(c.CupertinoIcons.checkmark_alt,
                color: c.CupertinoColors.white),
            onPressed: () {
              if (isNullOrEmpty(textController.text)) {
                AlertDialog dialog = AlertDialog(
                    title: "Username can't be empty",
                    content: "Please enter your username");
                c.showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => dialog);
              } else {
                GlobalSettingController.setUser(user);
                this.widget.onTap(true);
              }
            },
          ),
        ),
      ],
    );
  }
}
