//#define WIN32_LEAN_AND_MEAN
//#include <windows.h>
//#include <Shlwapi.h>
//#pragma comment(lib, "shlwapi.lib")

#include "game/game.h"
#include "dllscript.h"

using namespace GAME;

//static const char* getDllDirectory()
//{
//    char path[MAX_PATH] = "";
//    GetModuleFileNameA(NULL, path, MAX_PATH);
//    PathRemoveFileSpecA(path);
//    PathAddBackslashA(path);
//
//    return path;
//}

void ScriptMain()
{
    while (true)
    {
        if (!DLC::GET_IS_LOADING_SCREEN_ACTIVE())
        {
            if (isControlJustReleased(eInputType::PlayerControl,
                                      eControlType::EnterCheatCode))
            {
                setTimeScale(0);
            }

            if (isControlJustReleased(eInputType::FrontendControl,
                                      eControlType::FrontendAccept)
                ||
                isControlJustReleased(eInputType::FrontendControl,
                                      eControlType::FrontendPauseAlternate))
            {
                setTimeScale(1);
            }
        }
        else
        {
        }

        WAIT(0);
    }
}
