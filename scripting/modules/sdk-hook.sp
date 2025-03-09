void SdkHook_SpawnPost(int entity) {
    SDKHook(entity, SDKHook_SpawnPost, OnSpawnPost);
}

static void OnSpawnPost(int entity) {
    Entity_MarkAsTrigger(entity);
    SDKHook(entity, SDKHook_TouchPost, OnTouchPost);
}

static void OnTouchPost(int entity, int other) {
    int owner = Entity_GetOwner(entity);

    if (owner == other) {
        return;
    }

    if (UseCase_IsClient(other) && UseCase_IsEnemy(owner, other)) {
        SdkCall_Detonate(entity);
    }
}
