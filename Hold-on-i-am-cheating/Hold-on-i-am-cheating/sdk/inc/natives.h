#pragma once

#include "nativeCaller.h"

namespace DLC
{
    // https://nativedb.dotindustries.dev/natives/0x10D0A8F259E93EC9
    static BOOL GET_IS_LOADING_SCREEN_ACTIVE()
    {
        return invoke<BOOL>(0x10D0A8F259E93EC9);
    } // 0x10D0A8F259E93EC9 0x517B601B b323
}

namespace MISC
{
    // https://nativedb.dotindustries.dev/natives/0x1D408577D440E81E
    static void SET_TIME_SCALE(float timeScale)
    {
        invoke<int>(0x1D408577D440E81E, timeScale);
    } // 0x1D408577D440E81E 0xA7F84694 b323
};

namespace PAD
{
    // https://nativedb.dotindustries.dev/natives/0xE2587F8CBBD87B1D
    static BOOL IS_DISABLED_CONTROL_PRESSED(int inputType, int controlType)
    {
        return invoke<BOOL>(0xE2587F8CBBD87B1D, inputType, controlType);
    } // 0xE2587F8CBBD87B1D 0x32A93544 b323

    // https://nativedb.dotindustries.dev/natives/0x91AEF906BCA88877
    static BOOL IS_DISABLED_CONTROL_JUST_PRESSED(int inputType, int controlType)
    {
        return invoke<BOOL>(0x91AEF906BCA88877, inputType, controlType);
    } // 0x91AEF906BCA88877 0xEE6ABD32 b323

    // https://nativedb.dotindustries.dev/natives/0x305C8DCD79DA8B0F
    static BOOL IS_DISABLED_CONTROL_JUST_RELEASED(int inputType, int controlType)
    {
        return invoke<BOOL>(0x305C8DCD79DA8B0F, inputType, controlType);
    } // 0x305C8DCD79DA8B0F 0xD6A679E1 b323
};