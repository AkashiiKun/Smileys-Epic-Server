import crafttweaker.api.bracket.BracketHandlers;
import crafttweaker.api.item.IItemStack;

// PROJECT RED
// Red alloy wire
craftingTable.remove(<item:projectred_transmission:red_alloy_wire>);
craftingTable.addShaped("changed_red_alloy_wire", <item:projectred_transmission:red_alloy_wire> * 9, [
    [<tag:item:c:dusts/redstone>, <tag:item:c:dusts/redstone>, <tag:item:c:dusts/redstone>],
    [<tag:item:c:ingots/copper>, <tag:item:c:ingots/copper>, <tag:item:c:ingots/copper>],
    [<tag:item:c:dusts/redstone>, <tag:item:c:dusts/redstone>, <tag:item:c:dusts/redstone>]
]);

// Insulated wires
for color in colors() {
    val wire = BracketHandlers.getItem("projectred_transmission:" + color + "_insulated_wire");
    val wool = BracketHandlers.getItem("minecraft:" + color + "_wool");
    craftingTable.remove(wire);
    craftingTable.addShapeless("changed_insulated_wire_" + color, wire * 3, [<item:projectred_transmission:red_alloy_wire>, <item:projectred_transmission:red_alloy_wire>, <item:projectred_transmission:red_alloy_wire>, wool]);
}

// Circuit plate
furnace.remove(<item:projectred_core:plate>);
craftingTable.addShaped("changed_circuit_plate_form_block", <item:projectred_core:plate> * 4, [[<item:minecraft:smooth_stone>, <item:minecraft:smooth_stone>]]);
craftingTable.addShaped("changed_circuit_plate_form_slab", <item:projectred_core:plate> * 2, [[<item:minecraft:smooth_stone_slab>, <item:minecraft:smooth_stone_slab>]]);

// Multimeter
craftingTable.remove(<item:projectred_core:multimeter>);
craftingTable.addShaped("changed_multimeter", <item:projectred_core:multimeter>, [
    [<tag:item:c:ingots/iron>, <item:minecraft:air>, <tag:item:c:ingots/iron>],
    [<tag:item:c:dyes/black>, <tag:item:c:dyes/green>, <tag:item:c:dyes/red>],
    [<tag:item:c:dyes/black>, <tag:item:c:dusts/glowstone>, <tag:item:c:dyes/red>]
]);

// Silicon chips
craftingTable.remove(<item:projectred_core:silicon_chip>);
craftingTable.addShaped("changed_silicon_chip", <item:projectred_core:silicon_chip>, [
    [<item:minecraft:air>, <tag:item:c:storage_blocks/redstone>],
    [<item:projectred_core:plate>, <item:projectred_core:plate>, <item:projectred_core:plate>]
]);
craftingTable.remove(<item:projectred_core:energized_silicon_chip>);
craftingTable.addShaped("changed_energized_silicon_chip", <item:projectred_core:energized_silicon_chip>, [
    [<item:minecraft:air>, <item:minecraft:glowstone>],
    [<item:projectred_core:plate>, <item:projectred_core:plate>, <item:projectred_core:plate>]
]);

// Bus input panel
craftingTable.remove(<item:projectred_integration:bus_input_panel_gate>);
craftingTable.addShaped("changed_bus_input_panel", <item:projectred_integration:bus_input_panel_gate>, [
    [<item:projectred_core:bundled_plate>, <item:projectred_core:conductive_plate>, <item:projectred_core:bundled_plate>],
    [<item:projectred_core:bundled_plate>, <tag:item:c:dusts/glowstone>, <item:projectred_core:bundled_plate>],
    [<item:projectred_core:bundled_plate>, <item:projectred_core:bundled_plate>, <item:projectred_core:bundled_plate>],
]);

// WAYSTONES

// Warp stone & dust
craftingTable.remove(<item:waystones:warp_stone>);
craftingTable.addShaped("changed_warp_stone", <item:waystones:warp_stone>, [
    [<item:waystones:warp_dust>, <item:waystones:warp_dust>, <item:waystones:warp_dust>],
    [<item:waystones:warp_dust>, <item:minecraft:ghast_tear>, <item:waystones:warp_dust>],
    [<item:waystones:warp_dust>, <item:waystones:warp_dust>, <item:waystones:warp_dust>]
]);
craftingTable.remove(<item:waystones:warp_dust>);
craftingTable.addShapeless("changed_warp_dust", <item:waystones:warp_dust> * 2, [<tag:item:c:ender_pearls>, <tag:item:c:gems/amethyst>]);

// Waystone variants
function replaceWaystone(output as IItemStack, blockName as string, blockPluralized as bool) as void {
    val slab = BracketHandlers.getItem("minecraft:" + blockName + "_slab");
    if blockPluralized {
        blockName = blockName + "s";
    }
    val block = BracketHandlers.getItem("minecraft:" + blockName);
    craftingTable.remove(output);
    craftingTable.addShaped("changed_" + output.registryName.path, output, [
        [<item:minecraft:air>, slab],
        [<item:minecraft:air>, <item:waystones:warp_stone>],
        [slab, block, slab]
    ]);
}
replaceWaystone(<item:waystones:waystone>, "stone_brick", true);
replaceWaystone(<item:waystones:mossy_waystone>, "mossy_stone_brick", true);
replaceWaystone(<item:waystones:sandy_waystone>, "sandstone", false);
replaceWaystone(<item:waystones:deepslate_waystone>, "polished_deepslate", false);
replaceWaystone(<item:waystones:blackstone_waystone>, "blackstone", false);
replaceWaystone(<item:waystones:end_stone_waystone>, "end_stone_brick", true);

// Sharestone conversion
craftingTable.addShapeless("changed_white_sharestone_from_waystone", <item:waystones:waystone>, [<tag:item:waystones:waystones>, <tag:item:c:dyes/white>]);
craftingTable.addShapeless("changed_white_sharestone_from_sharestone", <item:waystones:waystone>, [<tag:item:waystones:sharestones>, <tag:item:c:dyes/white>]);
for color in colors() {
    if color != "white" {
        val sharestone = BracketHandlers.getItem("waystones:" + color + "_sharestone");
        val dye = <tagmanager:item>.tag("c:dyes/" + color);
        craftingTable.remove(sharestone);
        craftingTable.addShapeless("changed_" + color + "_sharestone_from_waystone", sharestone, [<tag:item:waystones:waystones>, dye]);
        craftingTable.addShapeless("changed_" + color + "_sharestone_from_sharestone", sharestone, [<tag:item:waystones:sharestones>, dye]);
    }
}

// Portstones
for color in colors() {
    <tag:item:waystones:portstones>.addId(BracketHandlers.getItem("waystones:" + color + "_portstone").registryName);
}
for color in colors() {
    val portstone = BracketHandlers.getItem("waystones:" + color + "_portstone");
    val dye = <tagmanager:item>.tag("c:dyes/" + color);
    craftingTable.remove(portstone);
    craftingTable.addShaped("changed_" + color + "_portstone", portstone, [
        [<item:minecraft:air>, dye],
        [<item:waystones:warp_dust>, <item:minecraft:stone_brick_slab>, <item:waystones:warp_dust>],
        [<item:minecraft:stone_brick_slab>, <item:minecraft:stone_bricks>, <item:minecraft:stone_brick_slab>]
    ]);
    craftingTable.addShapeless("change_" + color + "_portstone_from_recoloring", portstone, [<tag:item:waystones:portstones>, dye]);
}

// Warp plate
craftingTable.remove(<item:waystones:warp_plate>);
craftingTable.addShaped("changed_warp_plate", <item:waystones:warp_plate>, [
    [<item:waystones:warp_stone>],
    [<item:minecraft:stone_pressure_plate>]
]);

// CREATE: NUMISMATICS
// Vendor
craftingTable.remove(<item:numismatics:vendor>);
craftingTable.addShaped("changed_vendor", <item:numismatics:vendor>, [
    [<item:minecraft:air>, <item:minecraft:glass>],
    [<item:minecraft:air>, <tag:item:c:ingots/gold>],
    [<tag:item:c:dusts/redstone>, <tag:item:minecraft:wooden_slabs>, <tag:item:c:dusts/redstone>],
]);

for color in colors() {
    // Cards
    val card = BracketHandlers.getItem("numismatics:" + color + "_card");
    val dye = <tagmanager:item>.tag("c:dyes/" + color);
    tooltip(card, "Sneak + Right Click with this to connect it to your bank");
    craftingTable.remove(card);
    craftingTable.addShapeless("changed_" + color + "_card", card, [<tag:item:numismatics:cards>, dye]);

    // ID cards
    val idCard = BracketHandlers.getItem("numismatics:" + color + "_id_card");
    craftingTable.remove(idCard);
    craftingTable.addShaped("changed_" + color + "_id_card", idCard, [
        [<item:minecraft:air>, dye],
        [<tag:item:c:ingots/iron>, <item:minecraft:paper>, <tag:item:c:nuggets/gold>]
    ]);
    craftingTable.addShapeless("changed_" + color + "_id_card_recoloring", idCard, [<tag:item:numismatics:id_cards>, dye]);
}

// Bank terminal
craftingTable.remove(<item:numismatics:bank_terminal>);
craftingTable.addShapedMirrored("changed_bank_terminal", <constant:minecraft:mirroraxis:horizontal>, <item:numismatics:bank_terminal>, [
    [<item:minecraft:air>, <item:minecraft:air>, <tag:item:c:ingots/iron>],
    [<item:minecraft:air>, <tag:item:c:storage_blocks/redstone>, <tag:item:c:ingots/iron>],
    [<tag:item:c:ingots/iron>, <tag:item:c:ingots/iron>, <tag:item:c:ingots/iron>]
]);

// Upgrade template
craftingTable.remove(<item:smithing_tweaks:upgradetemplate>);
craftingTable.addShaped("changed_upgrade_template", <item:smithing_tweaks:upgradetemplate>, [
    [<item:minecraft:cobblestone>, <item:minecraft:netherite_scrap>, <item:minecraft:cobblestone>],
    [<tag:item:c:ingots/iron>, <tag:item:c:storage_blocks/diamond>, <tag:item:c:ingots/iron>],
    [<item:minecraft:cobblestone>, <tag:item:c:storage_blocks/gold>, <item:minecraft:cobblestone>]
]);
craftingTable.addShaped("changed_upgrade_template_copy", <item:smithing_tweaks:upgradetemplate> * 2, [
    [<item:minecraft:cobblestone>, <tag:item:c:ingots/gold>, <item:minecraft:cobblestone>],
    [<tag:item:c:ingots/iron>, <item:smithing_tweaks:upgradetemplate>, <tag:item:c:ingots/iron>],
    [<item:minecraft:cobblestone>, <tag:item:c:ingots/iron>, <item:minecraft:cobblestone>]
]);