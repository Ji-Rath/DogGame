

IndexCorrectMin = 17;
IndexCorrectMax = 34;

//////////////////////////////////////////////////////////////////////////////
ImageSpeed = 0.5*oBattleManager.SpeedMultiplier;
ImageIndex = 0;
CanAttempt = true;

CircleRadius = 200;
TweenFire("$1", "~InSine", "CircleRadius>", 0);

function CompletedHighfive(bSuccess)
{
	scrFinishMiniGame(bSuccess);
	CanAttempt = false;
	ImageSpeed = 0;
	with (oBattleAllyBase)
	{
		if (bMiniGameWait)
		{
			if (bSuccess)
			{
				Neglect = 0;
				instance_destroy(NeglectButton);
			}
			bMiniGameWait = false;
		}
	}	
}