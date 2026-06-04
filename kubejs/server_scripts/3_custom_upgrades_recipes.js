ServerEvents.recipes(event => {
    // 1. Define our tool and armor types to scan for (including spears)
    const toolTypes = ['sword', 'pickaxe', 'axe', 'shovel', 'hoe', 'spear'];
    const armorTypes = ['helmet', 'chestplate', 'leggings', 'boots'];
    const allTypes = toolTypes.concat(armorTypes);

    // 2. Define our tier progression rules
    const tiers = [
        { name: 'copper',   template: 'kubejs:stone_to_copper_upgrade_template' },
        { name: 'iron',     template: 'kubejs:copper_to_iron_upgrade_template' },
        { name: 'gold',     template: 'kubejs:iron_to_gold_upgrade_template' },
        { name: 'golden',   template: 'kubejs:iron_to_gold_upgrade_template' }, 
        { name: 'diamond',  template: 'kubejs:gold_to_diamond_upgrade_template' }
    ];

    // 3. Scan the entire item registry
    Item.list.forEach(item => {
        if (!item || item.id === 'minecraft:air') return;

        let itemId = item.id.toString(); 

        // --- EXCLUSION FILTERS ---
        if (itemId.startsWith('swem:') || itemId.startsWith('iceandfire:')) return;
        
        let idParts = itemId.split(':');
        if (idParts.length < 2) return;
        let path = idParts[1]; 

        tiers.forEach(tier => {
            let hasTierKeyword = path.startsWith(tier.name + '_') || path.endsWith('_' + tier.name) || path.includes('_' + tier.name + '_');
            let hasTypeKeyword = allTypes.some(type => path.endsWith('_' + type) || path.startsWith(type + '_'));

            if (hasTierKeyword && hasTypeKeyword) {
                let detectedType = allTypes.find(type => path.endsWith('_' + type) || path.startsWith(type + '_'));
                let baseItem = null;

                // --- CALCULATION PATHS (Base Inputs) ---
                if (tier.name === 'copper') {
                    if (toolTypes.includes(detectedType)) {
                        baseItem = `minecraft:stone_${detectedType}`;
                    } else if (armorTypes.includes(detectedType)) {
                        baseItem = `minecraft:leather_${detectedType}`;
                    }
                } 
                else if (tier.name === 'iron') {
                    baseItem = `minecraft:copper_${detectedType}`;
                } 
                else if (tier.name === 'gold' || tier.name === 'golden') {
                    baseItem = `minecraft:iron_${detectedType}`;
                } 
                else if (tier.name === 'diamond') {
                    baseItem = Item.exists(`minecraft:golden_${detectedType}`) ? `minecraft:golden_${detectedType}` : `minecraft:iron_${detectedType}`;
                }

                if (baseItem && (baseItem.startsWith('swem:') || baseItem.startsWith('iceandfire:'))) baseItem = null;

                // --- SMITHING TABLE LOGIC ---
                // Example: Upgrading a stone_hoe (baseItem) using a copper_hoe (itemId) as the ingredient
                let requiredToolIngredient = itemId;

                if (baseItem && Item.exists(baseItem) && itemId !== baseItem) {
                    event.smithing(
                        itemId,                  // Output (e.g., minecraft:copper_hoe)
                        tier.template,           // Template (e.g., kubejs:stone_to_copper_upgrade_template)
                        baseItem,                // Base Item to be upgraded (e.g., minecraft:stone_hoe)
                        requiredToolIngredient   // Smithing Ingredient (e.g., minecraft:copper_hoe)
                    ).id(`kubejs:dynamic_upgrade_${itemId.replace(':', '_')}`);
                }
            }
        });
    });

    // ==========================================
    // SECTION 2: TEMPLATE DUPLICATION RECIPES
    // ==========================================
    // Back to using raw material ingots/gems for the crafting table duplication recipe
    const templateDuplicates = [
        ['kubejs:stone_to_copper_upgrade_template', 'minecraft:copper_ingot'], 
        ['kubejs:copper_to_iron_upgrade_template', 'minecraft:iron_ingot'],
        ['kubejs:iron_to_gold_upgrade_template', 'minecraft:gold_ingot'],
        ['kubejs:gold_to_diamond_upgrade_template', 'minecraft:diamond']
    ];

    templateDuplicates.forEach(([templateId, materialIngot]) => {
        event.shaped(
            Item.of(templateId, 2), 
            [
                'SBS',
                'SDS',
                'SSS'
            ], 
            {
                S: '#c:stones',       // Outer ring universally accepts any common stone tag alternative
                B: materialIngot,     // Middle top: Uses the raw ingot/gem material
                D: templateId         // Exact center slot: Template to copy
            }
        ).id(`kubejs:duplicate_${templateId.replace(':', '_')}`);
    });
});
