
ImageSpeed = 0.5*oBattleManager.SpeedMultiplier;
ImageIndex = 0;

IndexCorrectMin = 17;
IndexCorrectMax = 34;

CanAttempt = true;

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