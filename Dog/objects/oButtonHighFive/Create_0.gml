
event_inherited();

scrAnimInit(-1, -1);
AnimAlpha = 0;
CanPlayAnim = false;
image_speed = 0;
IsHovering = false;

if (oBattleManager.DrawGUI)
	scrAnimReinit(Animations.SmoothFlip, Animations.IntroScale);