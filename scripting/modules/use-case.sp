bool UseCase_IsCrushDamage(int damageType) {
    return (damageType & DMG_CRUSH) == DMG_CRUSH;
}

bool UseCase_IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}

bool UseCase_IsEnemy(int client, int target) {
    if (UseCase_IsClient(client) && UseCase_IsClient(target)) {
        int clientTeam = GetClientTeam(client);
        int targetTeam = GetClientTeam(target);

        return clientTeam != targetTeam;
    }

    return false;
}
