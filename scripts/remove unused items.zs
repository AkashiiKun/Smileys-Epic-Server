import crafttweaker.api.bracket.BracketHandlers;

// PROJECT RED
// Red alloy
stripTagsAndConvert(<item:projectred_core:red_ingot>, <item:minecraft:iron_ingot>);
stripTagsAndConvert(<item:projectred_core:red_iron_comp>, <item:minecraft:iron_ingot>);

// Silicons
stripTagsAndConvert(<item:projectred_core:infused_silicon>, <item:minecraft:redstone_block>);
stripTagsAndConvert(<item:projectred_core:red_silicon_comp>, <item:minecraft:redstone_block>);
stripTagsAndConvert(<item:projectred_core:energized_silicon>, <item:minecraft:glowstone>);
stripTagsAndConvert(<item:projectred_core:glow_silicon_comp>, <item:minecraft:glowstone>);
stripTagsAndConvert(<item:projectred_core:electrotine_silicon>, <item:minecraft:redstone_block>);
stripTagsAndConvert(<item:projectred_core:electrotine_silicon_comp>, <item:minecraft:redstone_block>);
stripTagsAndConvert(<item:projectred_core:silicon>, <item:minecraft:coal_block>);
stripTagsAndConvert(<item:projectred_core:boule>, <item:minecraft:coal_block>);
stripTagsAndConvert(<item:projectred_core:sand_coal_comp>, <item:minecraft:coal_block>);

// Electrotine / Low power stuff
stripTagsAndConvert(<item:projectred_transmission:low_load_framed_power_wire>, <item:projectred_transmission:framed_red_alloy_wire>);
stripTagsAndConvert(<item:projectred_transmission:low_load_power_wire>, <item:projectred_transmission:red_alloy_wire>);
stripTagsAndConvert(<item:projectred_core:electrotine_generator>, <item:minecraft:blast_furnace>);
stripTagsAndConvert(<item:projectred_core:electrotine_ingot>, <item:minecraft:iron_ingot>);
stripTagsAndConvert(<item:projectred_core:electrotine_iron_comp>, <item:minecraft:iron_ingot>);
stripTagsAndConvert(<item:projectred_core:electrotine_dust>, <item:minecraft:redstone>);

// Illumars
for color in colors() {
    stripTagsAndConvert(BracketHandlers.getItem("projectred_core:" + color + "_illumar"), <item:minecraft:glowstone_dust> * 2);
}

// Gems
stripTagsAndConvert(<item:projectred_core:ruby>, <item:minecraft:diamond>);
stripTagsAndConvert(<item:projectred_core:sapphire>, <item:minecraft:diamond>);
stripTagsAndConvert(<item:projectred_core:peridot>, <item:minecraft:diamond>);

// Coils & Motor
stripTagsAndConvert(<item:projectred_core:motor>, <item:minecraft:redstone> * 4);
stripTagsAndConvert(<item:projectred_core:draw_plate>, <item:minecraft:diamond> * 2);
stripTagsAndConvert(<item:projectred_core:copper_coil>, <item:minecraft:copper_ingot>);
stripTagsAndConvert(<item:projectred_core:iron_coil>, <item:minecraft:iron_ingot>);
stripTagsAndConvert(<item:projectred_core:gold_coil>, <item:minecraft:gold_ingot>);

// Sail
stripTagsAndConvert(<item:projectred_core:sail>, <item:minecraft:string> * 48);
stripTagsAndConvert(<item:projectred_core:woven_cloth>, <item:minecraft:string> * 8);