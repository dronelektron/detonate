void SdkHook_TakeDamagePost(int client) {
    SDKHook(client, SDKHook_OnTakeDamagePost, OnTakeDamagePost);
}

static void OnTakeDamagePost(int victim, int attacker, int inflictor, float damage, int damageType) {
    if (UseCase_IsGrenade(inflictor) && UseCase_IsEnemy(attacker, victim)) {
        Frame_Detonate(inflictor);
    }
}

void SdkHook_SpawnPost(int entity) {
    SDKHook(entity, SDKHook_SpawnPost, OnSpawnPost);
}

static void OnSpawnPost(int entity) {
    Entity_MarkAsTrigger(entity);
    SDKHook(entity, SDKHook_TouchPost, OnTouchPost);
}

static void OnTouchPost(int entity, int other) {
    int owner = Entity_GetOwner(entity);

    if (UseCase_IsEnemy(owner, other)) {
        SdkCall_Detonate(entity);
    }
}
