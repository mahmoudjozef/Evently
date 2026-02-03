import 'package:flutter/foundation.dart';

class HomeProv extends ChangeNotifier
{
  int BotoomNavegation=0;
  ChangeBotoomNavegationIndex(int index){
    BotoomNavegation=index;
    notifyListeners();
  }
}