bool UseCase_IsGrenade(int entity) {
    char className[CLASS_NAME_SIZE];

    GetEntityClassname(entity, className, sizeof(className));

    return EntityFilter_IsGrenade(className);
}

bool UseCase_IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}

bool UseCase_IsEnemy(int client, int target) {
    int clientTeam = GetClientTeam(client);
    int targetTeam = GetClientTeam(target);

    return clientTeam != targetTeam;
}
