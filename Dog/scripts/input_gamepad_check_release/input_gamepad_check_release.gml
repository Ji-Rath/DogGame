/// @param gamepadIndex
/// @param GMconstant

function input_gamepad_check_release(_index, _gm)
{
    var _gamepad = global.__input_gamepads[_index];
    if (!is_struct(_gamepad)) return false;
    return _gamepad.get_released(_gm);
}