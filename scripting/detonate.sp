#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#include "detonate/entity-filter"
#include "detonate/entity"
#include "detonate/sdk-call"
#include "detonate/use-case"

#include "modules/entity-filter.sp"
#include "modules/entity.sp"
#include "modules/frame.sp"
#include "modules/sdk-call.sp"
#include "modules/sdk-hook.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Detonate",
    author = "Dron-elektron",
    description = "Detonates a grenade when it collides with an enemy",
    version = "0.1.3",
    url = "https://github.com/dronelektron/detonate"
};

public void OnPluginStart() {
    EntityFilter_Create();
    SdkCall_Create();
}

public void OnClientPutInServer(int client) {
    SdkHook_TakeDamagePost(client);
}

public void OnEntityCreated(int entity, const char[] className) {
    if (EntityFilter_IsGrenade(className)) {
        SdkHook_SpawnPost(entity);
    }
}
