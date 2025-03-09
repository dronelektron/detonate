void Entity_MarkAsTrigger(int entity) {
    int solidFlags = GetSolidFlags(entity);

    AddFlag(solidFlags, SOLID_FLAG_TRIGGER);
    SetSolidFlags(entity, solidFlags);
}

static int GetSolidFlags(int entity) {
    return GetEntProp(entity, Prop_Send, ENTITY_PROPERTY_SOLID_FLAGS);
}

static void SetSolidFlags(int entity, int flags) {
    SetEntProp(entity, Prop_Send, ENTITY_PROPERTY_SOLID_FLAGS, flags);
}

static void AddFlag(int& flags, int flag) {
    flags |= flag;
}

int Entity_GetOwner(int entity) {
    return GetEntPropEnt(entity, Prop_Send, ENTITY_PROPERTY_OWNER_ENTITY);
}
