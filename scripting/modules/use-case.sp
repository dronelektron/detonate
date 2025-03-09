bool UseCase_IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}

bool UseCase_IsEnemy(int client, int target) {
    int clientTeam = GetClientTeam(client);
    int targetTeam = GetClientTeam(target);

    return clientTeam != targetTeam;
}
