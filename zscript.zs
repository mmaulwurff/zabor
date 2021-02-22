/* Copyright Alexander Kromm (mmaulwurff@gmail.com) 2021
 *
 * This file is part of ZafetyNet.
 *
 * ZafetyNet is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * ZafetyNet is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * ZafetyNet.  If not, see <https://www.gnu.org/licenses/>.
 */

version 4.5

class zn_VmAbortHandler : EventHandler
{
  override
  void onDestroy()
  {
    if (gameState != GS_FullConsole || !amIFirst()) return;

    printZabor();
    printGameInfo();
    printEventHandlers();
    printAttention();
    printScreenshotInstructions();
  }

  override
  void worldTick()
  {
    int zero = 0;
    1 / zero;
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private
  void printAttention()
  {
    string message = string.format( "* %s, please report this VM abort to mod author. *"
                                  , players[consolePlayer].getUserName()
                                  );
    int length = message.length();
    string stars;
    for (int i = 0; i < length; ++i)
    {
      stars = stars .. "*";
    }
    console.printf("\cg%s\n%s\n%s", stars, message, stars);
  }

  private static
  void printZabor()
  {
    Console.printf("\ci"
      " __  __  __  __  __\n"
      "/  \\/  \\/  \\/  \\/  \\\n"
      "|  ||  ||  ||  ||  |\n"
      "|..||..||..||..||..|\n"
      "|..||..||..||..||..|\n"
      "| Z|| a|| b|| o|| r|\n"
      "|__||__||__||__||__|\n"
    );
  }

  private
  bool amIFirst()
  {
    uint nClasses = AllClasses.size();
    for (uint i = 0; i < nClasses; ++i)
    {
      class aClass = AllClasses[i];
      string className = aClass.getClassName();
      bool isVmAbortHandler = (className.indexOf("VmAbortHandler") != -1);
      if (!isVmAbortHandler) continue;

      return aClass.getClassName() == getClassName();
    }
    return false;
  }

  private static
  void printScreenshotInstructions()
  {
    Console.printf("Type \"screenshot\" below to take a screenshot. Type \"screenshot_dir\" to know where screenshots are saved.");
  }

  private static
  void printGameInfo()
  {
    Console.printf( "Game: level: %s, time: %d, multiplayer: %d, player class number: %d"
                  , level.mapName
                  , level.totalTime
                  , multiplayer
                  , players[consolePlayer].getPlayerClassNum()
                  );
  }

  private static
  void printEventHandlers()
  {
    Array<string> eventHandlers;

    uint nClasses = AllClasses.size();
    for (uint i = 0; i < nClasses; ++i)
    {
      class aClass = AllClasses[i];

      if (  aClass is "StaticEventHandler"
         && aClass != "StaticEventHandler"
         && aClass != "EventHandler"
         )
      {
        eventHandlers.push(aClass.getClassName());
      }
    }

    Console.printf("Event handlers: %s", join(eventHandlers, ", "));
  }

  private static
  string join(Array<string> strings, string delimiter)
  {
    string result;

    uint nStrings = strings.size();
    for (uint i = 0; i < nStrings; ++i)
    {
      if (result.length() == 0)
      {
        result = strings[i];
      }
      else
      {
        result.appendFormat("%s%s", delimiter, strings[i]);
      }
    }

    return result;
  }

}
