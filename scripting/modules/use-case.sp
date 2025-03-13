bool UseCase_IsCrushDamage(int damageType) {
    return (damageType & DMG_CRUSH) == DMG_CRUSH;
}

bool UseCase_IsEnemy(int client, int target) {
    if (IsClient(client) && IsClient(target)) {
        int clientTeam = GetClientTeam(client);
        int targetTeam = GetClientTeam(target);

        return clientTeam != targetTeam;
    }

    return false;
}

static bool IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}
