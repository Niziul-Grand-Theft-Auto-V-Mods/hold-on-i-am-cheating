#include "game.h"

void GAME::setTimeScale(float timeScale)
{
    SET_TIME_SCALE(timeScale);
}

bool GAME::isControlPressed(eInputType inputType,
                            eControlType controlType)
{
    return IS_DISABLED_CONTROL_PRESSED((int)inputType,
                                       (int)controlType);
}

bool GAME::isControlJustPressed(eInputType inputType,
                                eControlType controlType)
{
    return IS_DISABLED_CONTROL_JUST_PRESSED((int)inputType,
                                            (int)controlType);
}

bool GAME::isControlJustReleased(eInputType inputType,
                                 eControlType controlType)
{
    return IS_DISABLED_CONTROL_JUST_RELEASED((int)inputType,
                                             (int)controlType);
}