
//Save the state of the room when the player transitions to another room - such as to the BattleScene
if(room != rmTitle && room != rmLoad && room != rmGameOver)
    SaveGame("TempSave");
    