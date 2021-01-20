/// @description Insert description here
// You can write your code in this editor

/** Clamp rotation to 0-360 */
if (phy_rotation < 0)
	phy_rotation = 360;
if (phy_rotation > 360)
	phy_rotation = 0;

/** spew out water when facing down */
if(bGrabbed && phy_rotation > 110 && phy_rotation < 250)
{
	// none
}

if (bGrabbed)
{
	if (input_check(EVerb.Interact))
	{
		phy_rotation += TurnRate;
	}
	if (input_check(EVerb.Sprint))
	{
		phy_rotation -= TurnRate;
	}
}