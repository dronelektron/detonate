static Handle g_detonate;

void SdkCall_Create() {
    GameData gameData = new GameData(GAME_DATA);

    if (gameData == null) {
        SetFailState("Unable to load the '%s' game data", GAME_DATA);
    }

    Detonate_Create(gameData);
    CloseHandle(gameData);
}

static void Detonate_Create(GameData gameData) {
    StartPrepSDKCall(SDKCall_Entity);
    PrepSDKCall_SetFromConf(gameData, SDKConf_Virtual, OFFSET_DETONATE);

    g_detonate = EndPrepSDKCall();

    if (g_detonate == null) {
        SetFailState("Unable to prepare the '%s' SDK call", OFFSET_DETONATE);
    }
}

void SdkCall_Detonate(int entity) {
    SDKCall(g_detonate, entity);
}
