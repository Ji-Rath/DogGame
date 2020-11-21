
enum EVerb
{
	MoveLeft,
	MoveRight,
	MoveUp,
	MoveDown,
	Interact,
	Sprint
}

input_default_key(vk_left, EVerb.MoveLeft);
input_default_key(vk_right, EVerb.MoveRight);
input_default_key(vk_up, EVerb.MoveUp);
input_default_key(vk_down, EVerb.MoveDown);
input_default_key(ord("X"), EVerb.Interact);
input_default_key(ord("Z"), EVerb.Sprint);

input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);