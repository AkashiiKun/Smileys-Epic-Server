# Smiley's Epic Server
This is the modpack used for Smiley's Epic Server. While the modpack isn't here yet, below is a list of everything that will be in the modpack

# Modpack details
- Minecraft version: 1.21.1
- Modloader: Neoforge 21.1.230
# Mod list
Mods that are *italicized* are client-side, and therefore optional<br/>
Mods that are **bold** are significant content mods you probably care about
## Content
- Chipped (Tons of variants of many blocks for building)
- **Create**
  - **Create: Aeronautics** (Aerial transport & physics in minecraft, very epic)
  - Create: Connected (QoL mechanical blocks for create)
  - Create: Copycats+ (Make stairs, slabs, doors, fences, etc. out of any block texture)
  - **Create: Steam 'n' Rails** (Epic trains) [Note: This is using an unofficial port to 1.21.1, since the official mod is still only in 1.20.1]
- **Farmer's Delight** (Adds a bunch of foods)
- **Occultism** (Magic wizard slavery)
- Project Red Core
  - Project Red Integration (Adds redstone logic gates that work with redstone wires)
  - Project Red Transmission (Adds redstone wires that go up to 100+ blocks, can be color-coded, and also works with CB Multipart)
- Rechiseled (Adds a chisel to easily convert blocks into other variants, handy for building)
- **Silent Gear** (Replacement for Tinker's Construct, as Tinker's Construct isn't available for 1.21.1)
- Sophisticated Backpacks
- Sophisticated Storage (Adds bigger chests)
- **Waystones**
## World Generation
- Incendium (More nether biomes)
- Nullscape (Better end generation)
- Tectonic (Better terrain generation)
- **William Wyther's Expanded Ecosphere** (Adds 200+ new biomes and makes biome generation more realistic)
## Compatibility
- Create Aeronautics: Rechiseled Compatibility (Compatibility between Create: Aeronautics & Rechiseled)
- Create: Slice & DIce (Compatibility between Create & Farmer's Delight)
- *EMI Addon: Extra Mod Integrations (Compatibility between EMI and any other mods with "special" means of crafting things)*
- Iris & Oculus Flywheel Compat (Compatibility between Iris & Create)
- *JourneyMap Integration (Compatibility between JourneyMap & FTBChunks)*
- Rechiseled: Chipped (Compatibility between Rechiseled & Chipped)
- Rechiseled: Create (Compatibility between Rechiseled & Create)
- Waystones: Sable (Compatibility between Waystones & Create: Aeronautics)
## QoL
- *AppleSkin (Shows food saturation & other food info)*
- CB Multipart (Allows sawing blocks into smaller parts. Also a dependency for all Project Red mods)
- Construction Wand (Very useful for building big things)
- **Creeper no Break Blocks** (Creepers don't destroy blocks, while stilll keeping `mobGriefing` on for other mobs)
- *EMI (In-game item & recipe browser)*
  - *EMI Enchanting*
  - *EMI Loot*
  - *EMI Ores*
  - *EMI Professions*
  - *EMI++*
- FTBChunks (Allows claiming area as "yours" on a map, up to 10 claimed chunks can be chunkloaded)
- **Gravestone mod** (When you die, creates a gravestone that holds your items, but you still lose xp. Solves the whole `keepInventory` debate)
- *Inventory Tweaks: ReFoxed (Inventory sorting, auto-replenish item stacks & a bunch of useful shortcuts)*
- *Jade (Tells you what you're looking at, if you can mine it, and other information)*
- *JourneyMap (World map & minimap mod)*
- *Mouse Tweaks (Adds handy mouse shortcuts for menuing)*
## Performance
- *Lithium (Optimizes game logic)*
- *Entity Culling (Only render entities actually visible to you. Prevents off-screen mob farms & such from lagging your game)*
- *FerriteCore (Optimizes memory usage)*
- *ModernFix (General bugfixes & performance optimizations)*
- *Sodium (Optimizes graphics)*
  - *Iris (For shader support)*
## Dependencies
- *Architectuary API (Dependency for FTBChunks)*
- Athena (Dependency for Chipped)
- Balm (Dependency for Waystones)
- CodeChicken Lib (Dependency for all Project Red mods)
- Curious API (Dependency for Occultism)
- CraftTweaker (Dependeny for modifying recipes)
- Cristel Lib (Dependency for William Wyther's Expaned Ecosphere)
- Fusion - Connected Textures (Dependency for Rechiseled)
- *FTB Library (Dependency for FTBChunks)*
- *FTB Teams (Dependency for FTBChunks)*
- *Fzzy Config (Dependency for EMI Loot)*
- GeckoLib (Dependency for Occultism)
- Kotlin For Forge (Dependency for Farmer's Delight)
- Lithostitched (Dependency for Tectonic)
- Modonomicon (Dependency for Occultism)
- Resourceful Lib (Dependency for Chipped)
- Sable (Dependency for Create: Aeronautics)
- Silent Lib (Dependency for Silent Gear)
- SmartBrainLib (Dependency for Occultism)
- Sophisticated Core (Dependency for Sophisticated Backpacks & Sophisticated Storage)
- SuperMartijn642's Config Lib (Dependency for Rechiseled)
- SuperMartijn642's Core Lib (Dependency for Rechiseled)
# Changed configs
- CB Multipart
  - Every non-slab & non-stairs block from Rechiseled has been added as valid sliceable blocks
- FTBChunks
  - Claims do not prevent other players from destroying blocks. The server runs on mutual trust, and they're for marking where your base is
  - If multiple players are in a party, the claim & force-load limit is multiplied by the number of players
  - Number of force-loaded chunks per player reduced to 10
  - Force loaded chunks now always chunkload, even when offline
- Gravestone
  - The obituary given upon death is removed from your inventory when you re-claim your gravestone
- Project Red Core
  - Everything in the mod not needed for Project Red Integration or Project Red Transmission has been disabled
  - Red Alloy Wires & Insulated Wires have been made easier to craft
- Project Red Integration
  - Circuit plates have been made slightly less annoying to craft
- Project Red Transmission
  - Red Alloy Wires (a.k.a. redstone wires) have been made slightly easier to craft
- Waystones:
  - Waystones no longer generate naturally, and have to be crafted
  - Waystones are not free, but cost **less** experience the further apart they are (50 levels at no distance, free at 5000+ blocks). This is to incentivize actual transportation over shorter distances (we have Create: Steam 'n' Rails for trains), while still having a convenient option for really long distances
  - Waystones are made easier to craft