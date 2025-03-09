static StringMap g_grenades;

void EntityFilter_Create() {
    g_grenades = new StringMap();
    g_grenades.SetValue("grenade_frag_us", NO_VALUE);
    g_grenades.SetValue("grenade_frag_ger", NO_VALUE);
    g_grenades.SetValue("grenade_riflegren_us", NO_VALUE);
    g_grenades.SetValue("grenade_riflegren_ger", NO_VALUE);
}

bool EntityFilter_IsGrenade(const char[] className) {
    return g_grenades.ContainsKey(className);
}
