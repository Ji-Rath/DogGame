// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @func HexToDec(hex)
/// @arg {string} hex
/// @return {real} decimal
function HexToDec(hex)
{
	/// hex_to_dec(hex)
	//
	//  Returns an integer converted from an hexadeciaml string.
	//
	//      hex         hexadecimal digits, string
	//
	/// GMLscripts.com/license
    var dec = 0;
 
    var dig = "0123456789ABCDEF";
    var len = string_length(hex);
    for (var pos=1; pos<=len; pos+=1) {
        dec = dec << 4 | (string_pos(string_char_at(hex, pos), dig) - 1);
    }
 
    return dec;
}