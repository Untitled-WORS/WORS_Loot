-- WORS_Loot_Slayer.lua
WORS_Loot_Skill_Data = {
	subcategoryOneText = "Select Skill",
	subcategoryTwo = true,
	subcategoryTwoText = "Select Subcat",
	subTwoCat = {"Smithing", "Crafting", "Fletching", "Herblore", "Runecrafting", "Woodcutting"},  -- Add masters here
		
	--Agility={},
	--Construction={},
	--Cooking={},
	Crafting ={
--['d'Hide Gear'] = {"Green Dragon Leather", "Green d'hide Vambraces", "Green d'hide Chaps", "Green d'hide Body", "Blue Dragon Leather", "Blue d'hide Vambraces", "Blue d'hide Chaps", "Blue d'hide Body", "Red Dragon Leather", "Red d'hide Vambraces", "Red d'hide Chaps", "Red d'hide Body", "Black Dragon Leather", "Black d'hide Vambraces", "Black d'hide Chaps", "Black d'hide Body"},
  ["d'Hide Gear"] = {"90449", "90451", "90447", "90446", "90417", "90418", "90415", "90414", "90482", "90485", "90480", "90479", "90548", "90413", "90409", "90408"},
--['Jewelry'] = {"Gold Ring", "Sapphire Ring", "Emerald Ring", "Ruby Ring", "Diamond Ring", "Dragonstone Ring", "Onyx Ring", "Zenyte Ring", "Gold Necklace", "Sapphire Necklace", "Emerald Necklace", "Ruby Necklace", "Diamond Necklace", "Dragonstone Necklace", "Onyx Necklace", "Zenyte Necklace", "Gold Amulet", "Sapphire Amulet", "Emerald Amulet", "Ruby Amulet", "Diamond Amulet", "Dragonstone Amulet", "Onyx Amulet", "Zenyte Amulet", "Gold Bracelet", "Sapphire Bracelet", "Emerald Bracelet", "Ruby Bracelet", "Diamond Bracelet", "Dragonstone Bracelet", "Onyx Bracelet", "Zenyte Bracelet"},
  ['Jewelry'] = {"90445", "90495", "90437", "90490", "90427", "90432", "90473", "90541", "90444", "90494", "90551", "90489", "90426", "90472", "90540", "90442", "90492", "90436", "90487", "90424", "90429", "90470", "90538", "90443", "90493", "90552", "90488", "90425", "90430", "90471", "90539"},
--['Snakeskin Gear'] = {"Snakeskin", "Snakeskin Vambraces", "Snakeskin Chaps", "Snakeskin Body", "Snakeskin Coif"},
  ['Snakeskin Gear'] = {"90498", "90504", "90502", "90500"},
--['Leather Gear'] = {"Leather", "Leather Vambraces", "Leather Chaps", "Leather Body", "Coif", "Leather Cowl", "Hard Leather", "Hard Leather Vambraces", "Hard Leather Chaps", "Hard Leather Body", "Hard Leather Coif", "Studded Leather Vambraces", "Studded Leather Chaps", "Studded Leather Body", "Studded Leather Coif"},
  ['Leather Gear'] = {"90459", "90464", "90461", "90460", "90421", "90462", "90452", "90453"},
--['Pottery'] = {"Pot", "Unfired Pot", "Pie Dish", "Unfired Pie Dish", "Bowl", "Unfired Bowl", "Plant Pot", "Unfired Plant Pot", "Pot Lid", "Unfired Pot Lid", "Oil Lamp", "Unfired Oil Lamp", "Empty Candle Lantern", "Unfired Empty Candle Lantern", "Empty Oil Lamp", "Unfired Empty Oil Lamp", "Empty Oil Lantern", "Unfired Empty Oil Lantern", "Empty Bullseye Lantern", "Unfired Empty Bullseye Lantern"},
  ['Pottery'] = {"90093", "91113", "91103", "91107", "90040", "91112", "91109", "91108", "91111", "91110"},	},
	--Farming={},
	--Firemaking={},
	--Fishing={},
	Fletching={
	--['Bows'] = {"Magic Shortbow", "Magic Shortbow Unstrung", "Magic Longbow", "Magic Longbow Unstrung", "Yew Shortbow", "Yew Shortbow Unstrung", "Yew Longbow", "Yew Longbow Unstrung", "Maple Shortbow", "Maple Shortbow Unstrung", "Maple Longbow", "Maple Longbow Unstrung", "Willow Shortbow", "Willow Shortbow Unstrung", "Willow Longbow", "Willow Longbow Unstrung", "Oak Shortbow", "Oak Shortbow Unstrung", "Oak Longbow", "Oak Longbow Unstrung", "Shortbow", "Shortbow Unstrung", "Longbow", "Longbow Unstrung"},
	  ['Bows'] = {"90658", "90646", "90659", "90647", "90656", "90644", "90657", "90645", "90654", "90642", "90655", "90643", "90652", "90640", "90653", "90641", "90650", "90638", "90651", "90639", "90648", "90636", "90649", "90637"},
	--['Arrows'] = {"Arrow Shaft", "Headless Arrow", "Rune Arrows", "Adamant Arrows", "Mithril Arrows", "Steel Arrows", "Iron Arrows", "Blurite Arrows", "Bronze Arrows"},
	  ['Arrows'] = {"90393", "90392", "90390", "90359", "90328", "90296", "90257", "90633"},
	},
	Herblore={
--['--Herblore'] = {},
	--['Potions'] = {"Attack Potion", "Cavern Potion", "Relicym's Balm", "Strength Potion", "Serum 207", "Potion", "Compost Potion", "Restore Potion", "Energy Potion", "Defence Potion", "Agility Potion", "Combat Potion", "Prayer Potion", "Crafting Potion", "Super Attack Potion", "Fishing Potion", "Superantipoison Potion", "Super Energy Potion", "Hunter Potion", "Strength Mix Potion", "Magic Essence Potion", "Super Strength Potion", "Super Restore Potion", "Super Defence Potion", "Antidote+", "Antifire Potion", "Ranging Potion", "Magic Potion", "Stamina Potion", "Extended Antifire Potion", "Antidote++", "Zamorak Brew", "Saradomin Brew", "Bastion Potion", "Battlemage Potion", "Extended Super Antifire Potion"},
	['Potions'] = {"90567", "90588", "90589", "90630", "90573", "90560", "90572", "2455", "90592", "90583", "90595", "90594", "90562", "90564", "90587", "90584", "90575", "90563", "90601", "90150", "90569", "90570", "90576"},	},
	--Hunter={},
	--Magic={},={},
	--Mining={},
	--Prayer={},
	Runecrafting={
	--['Runes'] = {"Air Rune", "Mind Rune", "Water Rune", "Earth Rune", "Fire Rune", "Body Rune", "Cosmic Rune", "Chaos Rune", "Astral Rune", "Nature Rune", "Law Rune", "Death Rune", "Wrath Rune"},
	['Runes'] = {"90120", "90090", "90107", "90067", "90070", "90038", "90130", "90052", "90123", "90091", "90139", "90133", "90109"},	},
	Smithing = {
	--['Rune'] = {"Runite Bar", "Rune Platebody", "Rune Plateskirt", "Rune Platelegs", "Rune 2h Sword", "Rune Kiteshield", "Rune Chainbody", "Rune Battle Axe", "Rune Warhammer", "Rune Square Shield", "Rune Full Helm", "Rune Longsword", "Rune Arrowtips", "Rune Scimitar", "Rune Nails", "Rune Sword", "Rune Med Helm", "Rune Mace", "Rune Axe", "Rune Dagger"},
	  ['Rune'] = {"90158", "90378", "90376", "90377", "90380", "90374", "90373", "90372", "90369", "90368", "90379", "90366", "90546", "90365", "90363", "90362", "90016", "90361"},	--['Adamant'] = {"Adamantite Bar", "Adamant Platebody", "Adamant Plateskirt", "Adamant Platelegs", "Adamant 2h Sword", "Adamant Kiteshield", "Adamant Chainbody", "Adamant Battle Axe", "Adamant Warhammer", "Adamant Square Shield", "Adamant Full Helm", "Adamant Longsword", "Adamant Arrowtips", "Adamant Scimitar", "Adamant Nails", "Adamant Sword", "Adamant Med Helm", "Adamant Mace", "Adamant Axe", "Adamant Dagger"},
	--['Adamant'] = {"Adamantite Bar", "Adamant Platebody", "Adamant Plateskirt", "Adamant Platelegs", "Adamant 2h Sword", "Adamant Kiteshield", "Adamant Chainbody", "Adamant Battle Axe", "Adamant Warhammer", "Adamant Square Shield", "Adamant Full Helm", "Adamant Longsword", "Adamant Arrowtips", "Adamant Scimitar", "Adamant Nails", "Adamant Sword", "Adamant Med Helm", "Adamant Mace", "Adamant Axe", "Adamant Dagger"},
	  ['Adamant'] = {"90157", "90347", "90345", "90346", "90349", "90343", "90342", "90341", "90338", "90337", "90348", "90335", "90334", "90332", "90331", "90015", "90330"},
	--['Mithril'] = {"Mithril Bar", "Mithril Platebody", "Mithril Plateskirt", "Mithril Platelegs", "Mithril 2h Sword", "Mithril Kiteshield", "Mithril Chainbody", "Mithril Battle Axe", "Mithril Warhammer", "Mithril Square Shield", "Mithril Full Helm", "Mithril Longsword", "Mithril Arrowtips", "Mithril Scimitar", "Mithril Nails", "Mithril Sword", "Mithril Med Helm", "Mithril Mace", "Mithril Axe", "Mithril Dagger"},
	  ['Mithril'] = {"90156", "90316", "90314", "90315", "90318", "90312", "90311", "90310", "90307", "90306", "90317", "90304", "90544", "90303", "90301", "90300", "90014", "90299"},
	--['Steel'] = {"Steel Bar", "Steel Platebody", "Steel Plateskirt", "Steel Platelegs", "Steel 2h Sword", "Steel Kiteshield", "Steel Chainbody", "Steel Battle Axe", "Steel Warhammer", "Steel Square Shield", "Steel Full Helm", "Steel Longsword", "Steel Arrowtips", "Steel Scimitar", "Steel Nails", "Steel Sword", "Steel Med Helm", "Steel Mace", "Steel Axe", "Steel Dagger"},
	  ['Steel'] = {"90154", "90284", "90282", "90283", "90286", "90280", "90279", "90278", "90275", "90274", "90285", "90272", "90543", "90271", "90269", "90268", "90012", "90267"},
	--['Iron'] = {"Iron Bar", "Iron Platebody", "Iron Plateskirt", "Iron Platelegs", "Iron 2h Sword", "Iron Kiteshield", "Iron Chainbody", "Iron Battle Axe", "Iron Warhammer", "Iron Square Shield", "Iron Full Helm", "Iron Longsword", "Iron Arrowtips", "Iron Scimitar", "Iron Nails", "Iron Sword", "Iron Med Helm", "Iron Mace", "Iron Axe", "Iron Dagger"},
	  ['Iron'] = {"90155", "90198", "90196", "90197", "90200", "90194", "90193", "90192", "90189", "90188", "90199", "90186", "90185", "90184", "90182", "90181", "90011", "90086"},
	--['Blurite'] = {"Blurite Bar", "Blurite Platebody", "Blurite Plateskirt", "Blurite Platelegs", "Blurite 2h Sword", "Blurite Kiteshield", "Blurite Chainbody", "Blurite Battle Axe", "Blurite Warhammer", "Blurite Square Shield", "Blurite Full Helm", "Blurite Longsword", "Blurite Arrowtips", "Blurite Scimitar", "Blurite Nails", "Blurite Sword", "Blurite Med Helm", "Blurite Mace", "Blurite Axe", "Blurite Dagger"},
	  ['Blurite'] = {"90712"},
	--['Bronze'] = {"Bronze Bar", "Bronze Platebody", "Bronze Plateskirt", "Bronze Platelegs", "Bronze 2h Sword", "Bronze Kiteshield", "Bronze Chainbody", "Bronze Battle Axe", "Bronze Warhammer", "Bronze Square Shield", "Bronze Full Helm", "Bronze Longsword", "Bronze Arrowtips", "Bronze Scimitar", "Bronze Nails", "Bronze Sword", "Bronze Med Helm", "Bronze Mace", "Bronze Axe", "Bronze Dagger"},
	  ['Bronze'] = {"90153", "90178", "90177", "90176", "90175", "90173", "90172", "90170", "90168", "90236", "90179", "90033", "90167", "90165", "90043", "90163", "90009", "90162"},
	},
	--Thieving={},
	Woodcutting ={
	--['Trees'] = {"Logs", "Oak Logs", "Willow Logs", "Teak Logs", "Maple Logs", "Mahogany Logs", "Yew Logs", "Magic Logs", "Redwood Logs"},
	  ['Trees'] = {"90000", "90001", "90002", "90008", "90003", "90007", "90004", "90005", "90006"},
	--['Axes'] = {"Dragon Axe", "Rune Axe", "Adamant Axe", "Mithril Axe", "Steel Axe", "Iron Axe", "Bronze Axe"},
	  ['Axes'] = {"90017", "90016", "90015", "90014", "90012", "90011", "90009"},
	}   
}

	