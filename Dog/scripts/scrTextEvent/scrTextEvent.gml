
/// @func CreateTextEvent(filename, node)
/// @desc Create textbox for the main scene
/// @arg {string} filename
/// @arg {string} node
function CreateTextEvent(filename, node)
{
	if(!layer_exists(layer_get_id("TextBox"))) {show_debug_message("No TextBox layer found in room!"); return;}

	if(!instance_exists(oTextBox))
	{
		var TextInst = instance_create_layer(-2000, -2000, "TextBox", oTextBox);
		with (TextInst)
		{
			// Initialize chatterbox file, nodes, and custom functions
			chatterbox_add_function("SetInit", SetInit);
			if (!chatterbox_is_loaded(filename))
				chatterbox_load(filename);

			chatterbox = chatterbox_create(filename);
			chatterbox_goto(chatterbox, node);
		}
		return TextInst;
    }
	return undefined;
}

/// @func CreateBattleTextEvent(filename, node, EndsTurn = false)
/// @desc Create textbox for the battle scene
/// @arg {string} filename
/// @arg {string} node
/// @arg {bool} EndsTurn=false
function CreateBattleTextEvent(filename, node)
{
	var EndsTurn = argument_count > 2 ? argument[2] : false;

	var TextInst = CreateTextEvent(filename, node);
	if (TextInst != undefined)
	{
		with (TextInst)
		{
			EndTurn = EndsTurn;
			Sequence = seqBattleTextIntro;
		}
	}
}
