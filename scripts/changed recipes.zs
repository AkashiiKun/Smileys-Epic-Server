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
    [<item:waystones:warp_dust>, <tag:item:c:gems/emerald>, <item:waystones:warp_dust>],
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
        [<item:minecraft:air>, <item:waystones:warp_dust>],
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
    val portstone = BracketHandlers.getItem("waystones:" + color + "_portstone");
    val dye = <tagmanager:item>.tag("c:dyes/" + color);
    craftingTable.remove(portstone);
    craftingTable.addShaped("changed_" + color + "_portstone", portstone, [
        [<item:minecraft:air>, <item:minecraft:stone_brick_slab>],
        [<item:minecraft:air>, dye],
        [<item:minecraft:stone_brick_slab>, <item:minecraft:stone_bricks>, <item:minecraft:stone_brick_slab>]
    ]);
}

