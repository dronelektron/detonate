void Frame_Detonate(int entity) {
    int reference = EntIndexToEntRef(entity);

    RequestFrame(OnDetonate, reference);
}

static void OnDetonate(int reference) {
    int entity = EntRefToEntIndex(reference);

    if (entity > INVALID_INDEX) {
        SdkCall_Detonate(entity);
    }
}
