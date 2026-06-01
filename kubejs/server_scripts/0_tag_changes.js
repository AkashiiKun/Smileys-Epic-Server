ServerEvents.tags("item", event => {
    for (const color of global.colors) {
        event.add("waystones:portstones", `waystones:${color}_portstone`);
    }

    event.add("c:hidden_from_recipe_viewers", ["cb_microblock:microblock", "chiselsandbits:block_bit"]);
});
