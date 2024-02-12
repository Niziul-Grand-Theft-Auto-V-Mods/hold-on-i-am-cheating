#include <natives.h>

#include "game/enums/input_type.h"
#include "game/enums/control_type.h"

using namespace PAD;
using namespace MISC;

namespace GAME
{
    void setTimeScale(float);

    bool isControlPressed(eInputType inputType,
                          eControlType controlType);

    bool isControlJustPressed(eInputType inputType,
                              eControlType controlType);

    bool isControlJustReleased(eInputType inputType,
                               eControlType controlType);
};