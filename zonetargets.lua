function unitscan_zone_targets()
	local zone = GetZoneText()
	if not zone then return end

    unitscan_zonetargets = {} -- reset zonetargets
    local t = unitscan_zonetargets
    
	if zone == "Alterac Mountains" then
		t["Araga"] = true
        t["Cranky Benj"] = true
        t["Gravis Slipknot"] = true
        t["Jimmy the Bleeder"] = true
        t["Lo'Grosh"] = true
        t["Skhowl"] = true
        t["Stone Fury"] = true
        t["Narillasanz"] = true

    elseif zone == "Arathi Highlands" then
        t["Foulbelly"] = true
        t["Geomancer Flintdagger"] = true
        t["Kovork"] = true
        t["Molok the Crusher"] = true
        t["Montrose"] = true
        t["Nimar the Slayer"] = true
        t["Prince Nazjak"] = true
        t["Ruul Onestone"] = true
        t["Singer"] = true
        t["Zalas Witherbark"] = true

    elseif zone == "Ashenvale" then
        t["Akkrilus"] = true
        t["Apothecary Falthis"] = true
        t["Branch Snapper"] = true
        t["Eck'alom"] = true
        t["Lady Vespia"] = true
        t["Mist Howler"] = true
        t["Mugglefin"] = true
        t["Oakpaw"] = true
        t["Prince Raze"] = true
        t["Rorgish Jowl"] = true
        t["Terrowulf Packlord"] = true
        t["Ursol'lok"] = true
        t["Wandering Protector"] = true

    elseif zone == "Azshara" then
        t["Antilos"] = true
        t["Bone Witch"] = true
        t["Gatekeeper Rageroar"] = true
        t["General Fangferror"] = true
        t["Lady Sesspira"] = true
        t["Magister Hawkhelm"] = true
        t["Master Feardred"] = true
        t["Monnos the Elder"] = true
        t["Scalebeard"] = true
        t["Spirit of the Damned"] = true
        t["The Evalcharr"] = true
        t["Varo'then's Ghost"] = true

    elseif zone == "Badlands" then
        t["7:XT"] = true
        t["Anathemus"] = true
        t["Broken Tooth"] = true
        t["Rumbler"] = true
        t["Shadowforge Commander"] = true
        t["Siege Golem"] = true
        t["War Golem"] = true
        t["Zaricotl"] = true

    elseif zone == "Blackrock Depths" then
        t["Panzor the Invincible"] = true
        t["Pyromancer Loregrain"] = true

    elseif zone == "Blackrock Spire" then
        t["Bannok Grimaxe"] = true
        t["Burning Felguard"] = true
        t["Crystal Fang"] = true
        t["Ghok Bashguud"] = true
        t["Jed Runewatcher"] = true
        t["Quartermaster Zigris"] = true
        t["Spirestone Battle Lord"] = true
        t["Spirestone Butcher"] = true
        t["Spirestone Lord Magus"] = true
        t["Urok Doomhowl"] = true

    elseif zone == "Blasted Lands" then
        t["Akubar the Seer"] = true
        t["Clack the Reaver"] = true
        t["Deatheye"] = true
        t["Dreadscorn"] = true
        t["Grunter"] = true
        t["Magronos the Unyielding"] = true
        t["Mojo the Twisted"] = true
        t["Ravage"] = true
        t["Spiteflayer"] = true
        t["Bone Witch"] = true
        t["Spirit of the Damned"] = true

    elseif zone == "Burning Steppes" then
        t["Bone Witch"] = true
        t["Deathmaw"] = true
        t["Gorgon'och"] = true
        t["Gruklash"] = true
        t["Hahk'Zor"] = true
        t["Hematos"] = true
        t["Malfunctioning Reaver"] = true
        t["Spirit of the Damned"] = true
        t["Terrorspark"] = true
        t["Thauris Balgarr"] = true
        t["Volchan"] = true

    elseif zone == "Darkshore" then
        t["Carnivous the Breaker"] = true
        t["Firecaller Radison"] = true
        t["Flagglemurk the Cruel"] = true
        t["Lady Moongazer"] = true
        t["Lady Vespira"] = true
        t["Licillin"] = true
        t["Lord Sinslayer"] = true
        t["Shadowclaw"] = true
        t["Strider Clutchmother"] = true

    elseif zone == "Desolace" then
        t["Accursed Slitherblade"] = true
        t["Cursed Centaur"] = true
        t["Giggler"] = true
        t["Hissperak"] = true
        t["Kaskk"] = true
        t["Prince Kellen"] = true

    elseif zone == "Dun Morogh" then
        t["Ben"] = true
        t["Bjarn"] = true
        t["Edan the Howler"] = true
        t["Gibblewilt"] = true
        t["Great Father Arctikus"] = true
        t["Hammerspine"] = true
        t["Timber"] = true

    elseif zone == "Durotar" then
        t["Captain Flat Tusk"] = true
        t["Death Flayer"] = true
        t["Felweaver Scornn"] = true
        t["Geolord Mottle"] = true
        t["Warlord Kolkanis"] = true
        t["Watch Commander Zalaphil"] = true

    elseif zone == "Duskwood" then
        t["Lord Malathrom"] = true
        t["Lupos"] = true
        t["Lurking Shadow"] = true
        t["Mor'Ladim"] = true
        t["Naraxis"] = true
        t["Nefaru"] = true
        t["Stitches"] = true

    elseif zone == "Dustwallow Marsh" then
        t["Brimgore"] = true
        t["Burgle Eye"] = true
        t["Coral Shark"] = true
        t["Darkmist Widow"] = true
        t["Dart"] = true
        t["Drogoth the Roamer"] = true
        t["Hayoc"] = true
        t["Lord Angler"] = true
        t["Oozeworm"] = true
        t["Ripscale"] = true
        t["The Rot"] = true
        
    elseif zone == "Eastern Plaguelands" then
        t["Bone Witch"] = true
        t["Deathspeaker Selendre"] = true
        t["Duggan Wildhammer"] = true
        t["Fallen Hero"] = true
        t["Gish the Unmoving"] = true
        t["Hed'mush the Rotting"] = true
        t["High General Abbendis"] = true
        t["Lord Darkscythe"] = true
        t["Ranger Lord Hawkspear"] = true
        t["Spirit of the Damned"] = true
        t["Warlord Thresh'jin"] = true
        t["Zul'Brin Warpbranch"] = true

    elseif zone == "Elwynn Forest" then
        t["Fedfennel"] = true
        t["Gruff Swiftbite"] = true
        t["Morgaine the Sly"] = true
        t["Mother Fang"] = true
        t["Narg the Taskmaster"] = true
        t["Thuros Lightfingers"] = true

    elseif zone == "Felwood" then
        t["Alshirr Banebreath"] = true
        t["Death Howl"] = true
        t["Dessecus"] = true
        t["Immolatus"] = true
        t["Mongress"] = true
        t["Olm the Wise"] = true
        t["Ragepaw"] = true
        t["The Ongar"] = true
        
    elseif zone == "Feralas" then
        t["Antilus the Soarer"] = true
        t["Arash-ethis"] = true
        t["Bloodroar the Stalker"] = true
        t["Diamond Head"] = true
        t["Gnarl Leafbrother"] = true
        t["Grug'thok the Seer"] = true
        t["Lady Szallah"] = true
        t["Mushgog"] = true
        t["Old Grizzlegut"] = true
        t["Qirot"] = true
        t["Skarr the Unbreakable"] = true
        t["Snarler"] = true
        t["The Razza"] = true

    elseif zone == "Gnomeregan" then
        t["Dark Iron Ambassador"] = true

    elseif zone == "Hillsbrad Foothills" then
        t["Big Samras"] = true
        t["Creepthess"] = true
        t["Lady Zephris"] = true
        t["Narillasanz"] = true
        t["Ro'Bark"] = true
        t["Scargil"] = true
        t["Tamra Stormpike"] = true

    elseif zone == "Ironforge" then
        t["Spectral Stalker"] = true

    elseif zone == "Loch Modan" then
        t["Boss Galgosh"] = true
        t["Digmaster Shovelphlange"] = true
        t["Emogg the Crusher"] = true
        t["Gradok"] = true
        t["Grizlak"] = true
        t["Haren Swifthoof"] = true
        t["Large Loch Crocolisk"] = true
        t["Lord Condar"] = true
        t["Magosh"] = true
        t["Ol' Sooty"] = true
        t["Shanda the Spinner"] = true
        t["Thragomm"] = true

    elseif zone == "Maraudon" then
        t["Meshlok the Harvester"] = true

    elseif zone == "Mulgore" then
        t["Enforcer Emilgund"] = true
        t["Ghost Howl"] = true
        t["Mazzranache"] = true
        t["Sister Hatelash"] = true
        t["Snagglespear"] = true
        t["The Rake"] = true

    elseif zone == "Orgrimmar" then
        t["Spectral Stalker"] = true        

    elseif zone == "Razorfen Kraul" then
        t["Blind Hunter"] = true
        t["Earthcaller Halmgar"] = true
        t["Razorfen Spearhide"] = true

    elseif zone == "Redridge Mountains" then
        t["Boulderheart"] = true
        t["Chatter"] = true
        t["Kazon"] = true
        t["Lurking Shadow"] = true
        t["Ribchaser"] = true
        t["Rohh the Silent"] = true
        t["Seeker Aqualon"] = true
        t["Snarlflare"] = true
        t["Squiddic"] = true
        t["Volchan"] = true

    elseif zone == "Scarlet Monastery" then
        t["Azshir the Sleepless"] = true
        t["Fallen Champion"] = true
        t["Ironspine"] = true

    elseif zone == "Searing Gorge" then
        t["Faulty War Golem"] = true
        t["Highlord Mastrogonde"] = true
        t["Rekk'tilac"] = true
        t["Scald"] = true
        t["Shleipnarr"] = true
        t["Slave Master Blackheart"] = true
        t["Smoldar"] = true
        t["The Behemoth"] = true

    elseif zone == "Shadowfang Keep" then        
        t["Deathsworn Captain"] = true

    elseif zone == "Silithus" then
        t["Gretheer"] = true
        t["Grubthor"] = true
        t["Huricanian"] = true
        t["Krellack"] = true
        t["Lapress"] = true
        t["Rex Ashil"] = true
        t["Setis"] = true
        t["Twilight Lord Everun"] = true
	t["Twilight Prophet"] = true
        t["Zora"] = true

    elseif zone == "Silverpine Forest" then
        t["Dalaran Spellscribe"] = true
        t["Gorefang"] = true
        t["Krethis Shadowspinner"] = true
        t["Old Vicejaw"] = true
        t["Ravenclaw Regent"] = true
        t["Rot Hide Bruiser"] = true
        t["Snarlmane"] = true
        t["Son of Arugal"] = true

    elseif zone == "Stonetalon Mountains" then
        t["Brother Ravenoak"] = true
        t["Foreman Rigger"] = true
        t["Nal'taszar"] = true
        t["Pridewing Patriarch"] = true
        t["Sentinel Amarassan"] = true
        t["Sister Riven"] = true
        t["Sorrow Wing"] = true
        t["Taskmaster Whipfang"] = true
        t["Vengeful Ancient"] = true

    elseif zone == "Stormwind City" then
        -- t["Sewer Beast"] = true        
        t["Onyxia's Elite Guard"] = true

    elseif zone == "Stranglethorn Vale" then
        t["Gluggle"] = true
        t["Kurmokk"] = true
        t["Lord Sakrasis"] = true
        t["Mosh'Ogg Butcher"] = true
        t["Rippa"] = true
        t["Roloch"] = true
        t["Scale Belly"] = true
        t["Scarshield Quartermaster"] = true
        t["Verifonix"] = true

    elseif zone == "Stratholme" then
        t["Hearthsinger Forresten"] = true
        t["Skul"] = true
        t["Stonespine"] = true
        t["Timmy the Cruel"] = true

    elseif zone == "Swamp of Sorrows" then
        t["Fingat"] = true
        t["Gilmorian"] = true
        t["Jade"] = true
        t["Lord Captain Wyrmak"] = true
        t["Lost One Chieftain"] = true
        t["Lost One Cook"] = true
        t["Molt Thorn"] = true
        t["Zekkis"] = true

    elseif zone == "Tanaris" then
        t["Bone Witch"] = true
        t["Cyclok the Mad"] = true
        t["Greater Firebird"] = true
        t["Haarka the Ravenous"] = true
        t["Jin'Zallah the Sandbringer"] = true
        t["Kregg Keelhaul"] = true
        t["Murderous Blisterpaw"] = true
        t["Omgorn the Lost"] = true
        t["Soriid the Devourer"] = true
        t["Spirit of the Damned"] = true
        t["Warleader Krazzilak"] = true

    elseif zone == "Teldrassil" then
        t["Blackmoss the Fetid"] = true
        t["Duskstalker"] = true
        t["Fury Shelda"] = true
        t["Grimmaw"] = true
        t["Threggil"] = true
        t["Uruson"] = true

    elseif zone == "Temple of Atal'Hakkar" then
        t["Veyzhak the Cannibal"] = true

    elseif zone == "The Barrens" then
        t["Aean Swiftriver"] = true
        t["Ambassador Bloodrage"] = true
        t["Azzere the Skyblade"] = true
        t["Boahn"] = true
        t["Brokespear"] = true
        t["Brontus"] = true
        t["Captain Gerogg Hammertoe"] = true
        t["Digger Flameforge"] = true
        t["Dishu"] = true
        t["Elder Mystic Razorsnout"] = true
        t["Engineer Whirleygig"] = true
        t["Foreman Grills"] = true
        t["Geopriest Gukk'rok"] = true
        t["Gesharahan"] = true
        t["Hagg Taurenbane"] = true
        t["Hannah Bladeleaf"] = true
        t["Heggin Stonewhisker"] = true
        t["Humar the Pridelord"] = true
        t["Malgin Barleybrew"] = true
        t["Marcus Bel"] = true
        t["Rathorian"] = true
        t["Rocklance"] = true
        t["Silithid Harvester"] = true
        t["Sister Rathtalon"] = true
        t["Sludge Beast"] = true
        t["Snort the Heckler"] = true
        t["Stonearm"] = true
        t["Swiftmane"] = true
        t["Swinegart Spearhide"] = true
        t["Takk the Leaper"] = true
        t["Thora Feathermoon"] = true
        t["Thunderstomp"] = true
        t["Zebrian the Mad"] = true

    elseif zone == "The Deadmines" then
        t["Miner Johnson"] = true

    elseif zone == "The Hinterlands" then
        t["Grimungous"] = true
        t["Ironback"] = true
        t["Jalinde Summerdrake"] = true
        t["Mith'rethis the Enchanter"] = true
        t["Old Cliff Jumper"] = true
        t["Razortalon"] = true
        t["Retherokk the Berserker"] = true
        t["The Reak"] = true
        t["Witherheart the Stalker"] = true
        t["Zul'arek Hatefowler"] = true

    elseif zone == "The Stockade" then
        t["Bruegal Ironknuckle"] = true

    elseif zone == "Thousand Needles" then
        t["Achellios the Banished"] = true
        t["Gibblesnik"] = true
        t["Harb Foulmountain"] = true
        t["Heartrazor"] = true
        t["Ironeye the Invincible"] = true
        t["Silithid Ravager"] = true
        t["Steelsnap"] = true
        t["Rok'Alim the Pounder"] = true
        t["Vile Sting"] = true

    elseif zone == "Thunder Bluff" then
        t["Ghost Howl"] = true

    elseif zone == "Tirisfal Glades" then
        t["Bayne"] = true
        t["Deeb"] = true
        t["Fallen Hero"] = true
        t["Farmer Solliden"] = true
        t["Fellicent's Shade"] = true
        t["Lost Soul"] = true
        t["Muad"] = true
        t["Ressan the Needler"] = true
        t["Sri'skulk"] = true
        t["Tormented Spirit"] = true

    elseif zone == "Un'Goro Crater" then
        t["Baron Charr"] = true
        t["Clutchmother Zavas"] = true
        t["Gruff"] = true
        t["King Mosh"] = true
        t["Ravasaur Matriarch"] = true
        t["Uhk'loc"] = true

    elseif zone == "Wailing Caverns" then
        t["Deviate Faerie Dragon"] = true
        t["Trigore the Lasher"] = true

    elseif zone == "Western Plaguelands" then
        t["Fallen Hero"] = true
        t["Foreman Jerris"] = true
        t["Foreman Marcrid"] = true
        t["Foulmane"] = true
        t["Lord Maldazzar"] = true
        t["Putridius"] = true
        t["Scarlet Executioner"] = true
        t["Scarlet High Clerist"] = true
        t["Scarlet Interrogator"] = true
        t["Scarlet Judge"] = true
        t["Scarlet Smith"] = true
        t["The Husk"] = true

    elseif zone == "Westfall" then
        t["Brack"] = true
        t["Brainwashed Noble"] = true
        t["Carver Molsen"] = true
        t["Foe Reaper 4000"] = true
        t["Leprithus"] = true
        t["Marisa du'Paige"] = true
        t["Master Digger"] = true
        t["Sergeant Brashclaw"] = true
        t["Slark"] = true
        t["Vultros"] = true

    elseif zone == "Wetlands" then
        t["Dragonmaw Battlemaster"] = true
        t["Garneg Charskull"] = true
        t["Gnawbone"] = true
        t["Leech Widow"] = true
        t["Ma'ruk Wyrmscale"] = true
        t["Mirelow"] = true
        t["Razormaw Matriarch"] = true
        t["Sludginn"] = true

    elseif zone == "Winterspring" then
        t["Azurous"] = true
        t["Barkskin Fisher"] = true        
        t["Bone Witch"] = true
        t["General Colbatann"] = true
        t["Grizzle Snowpaw"] = true
        t["Kashoch the Reaver"] = true
        t["Lady Hederine"] = true
        t["Mezzir the Howler"] = true
        t["Rak'shiri"] = true
        t["Spirit of the Damned"] = true

    elseif zone == "Winter Veil Vale" then
        t["Snowball"] = true        

    elseif zone == "Zul'Farrak" then
        t["Dustwraith"] = true
        t["Sandarr Dunereaver"] = true
        t["Zerillis"] = true

    end
end

function unitscan_zone_targets_hc()
	local zone = GetZoneText()
	if not zone then return end

    unitscan_zonetargets = {} -- reset zonetargets
    local t = unitscan_zonetargets
    
	if zone == "Alterac Mountains" then
		t["Araga"] = true
		t["Cranky Benj"] = true
		t["Crushridge Enforcer"] = true
		t["Crushridge Mage"] = true
		t["Crushridge Mauler"] = true
		t["Crushridge Plunderer"] = true
		t["Crushridge Warmonger"] = true
		t["Cyclonian"] = true
		t["Glommus"] = true
		t["Grandpa Vishas"] = true
		t["Gravis Slipknot"] = true
		t["Grel'borg the Miser"] = true
		t["Jimmy the Bleeder"] = true
		t["Lo'Grosh"] = true
		t["Muckrake"] = true
		t["Mug'thol"] = true
		t["Nancy Vishas"] = true
		t["Narillasanz"] = true
		t["Skhowl"] = true
		t["Stone Fury"] = true
		t["Targ"] = true
		t["The Abominable Greench"] = true

    elseif zone == "Arathi Highlands" then
        t["Boulderfist Lord"] = true
        t["Boulderfist Mauler"] = true
        t["Boulderfist Shaman"] = true
        t["Darbel Montrose"] = true
        t["Dark Iron Saboteur"] = true
        t["Dark Rider"] = true
        t["Forsaken Courier"] = true
        t["Foulbelly"] = true
        t["Fozruk"] = true
        t["Geomancer Flintdagger"] = true
        t["Heketh"] = true
        t["Kovork"] = true
        t["Lieutenant Valorcall"] = true
        t["Lord Falconcrest"] = true
        t["Marez Cowl"] = true
        t["Molok the Crusher"] = true
        t["Montrose"] = true
        t["Myzrael"] = true
        t["Nimar the Slayer"] = true
        t["Or'Kalar"] = true
        t["Otto"] = true
        t["Prince Nazjak"] = true
        t["Ruul Onestone"] = true
        t["Singer"] = true
        t["Stromgarde Cavalryman"] = true
        t["Syndicate Conjuror"] = true
        t["Syndicate Magus"] = true
        t["Syndicate Prowler"] = true
        t["Thenan"] = true
        t["Witch Doctor Tan'zo"] = true
        t["Witherbark Berserker"] = true
        t["Zalas Witherbark"] = true

    elseif zone == "Ashenvale" then
        t["Akkrilus"] = true
        t["Apothecary Falthis"] = true
        t["Branch Snapper"] = true
        t["Dreamstalker"] = true
        t["Eck'alom"] = true
        t["Emeraldon Boughguard"] = true
        t["Emeraldon Oracle"] = true
        t["Emeraldon Tree Warder"] = true
        t["Grommash Hellscream"] = true
        t["Lady Vespia"] = true
        t["Mist Howler"] = true
        t["Mugglefin"] = true
        t["Oakpaw"] = true
        t["Phantim"] = true
        t["Prince Raze"] = true
        t["Rorgish Jowl"] = true
        t["Terrowulf Packlord"] = true
        t["Shadumbra"] = true
        t["Sharptalon"] = true
        t["Ursol'lok"] = true
        t["Wandering Protector"] = true

    elseif zone == "Azshara" then
        t["Antilos"] = true
        t["Avalanchion"] = true
        t["Azuregos"] = true
        t["Blue Dragonspawn"] = true
        t["Blue Scalebane"] = true
        t["Bone Witch"] = true
        t["Cliff Breaker"] = true
        t["Cliff Thunderer"] = true
        t["Cliff Walker"] = true
        t["Draconic Magelord"] = true
        t["Draconic Mageweaver"] = true
        t["Gatekeeper Rageroar"] = true
        t["General Fangferror"] = true
        t["Hetaera"] = true
        t["Lady Sesspira"] = true
        t["Magister Hawkhelm"] = true
        t["Mammoth Shark"] = true
        t["Master Feardred"] = true
        t["Monnos the Elder"] = true
        t["Scalebeard"] = true
        t["Servant of Arkkoroc"] = true
        t["Shadow of Doom"] = true
        t["Son of Arkkoroc"] = true
        t["Spirit of the Damned"] = true
        t["The Evalcharr"] = true
        t["Thundering Invader"] = true
        t["Varo'then's Ghost"] = true

    elseif zone == "Badlands" then
        t["7:XT"] = true
        t["Ambassador Infernus"] = true
        t["Anathemus"] = true
        t["Blacklash"] = true
        t["Boss Tho'grun"] = true
        t["Broken Tooth"] = true
        t["Dark Rider"] = true
        t["Hematus"] = true
        t["Obsidian Golem"] = true
        t["Rumbler"] = true
        t["Scorched Guardian"] = true
        t["Shadowforge Commander"] = true
        t["Shadowforge Digger"] = true
        t["Shadowforge Ruffian"] = true
        t["Shadowforge Surveyor"] = true
        t["Siege Golem"] = true
        t["Stonevault Basher"] = true
        t["Stonevault Seer"] = true
        t["War Golem"] = true
        t["Zaricotl"] = true

    elseif zone == "Blackrock Depths" then
        t["Panzor the Invincible"] = true
        t["Pyromancer Loregrain"] = true

    elseif zone == "Blackrock Spire" then
        t["Bannok Grimaxe"] = true
        t["Burning Felguard"] = true
        t["Crystal Fang"] = true
        t["Ghok Bashguud"] = true
        t["Jed Runewatcher"] = true
        t["Quartermaster Zigris"] = true
        t["Spirestone Battle Lord"] = true
        t["Spirestone Butcher"] = true
        t["Spirestone Lord Magus"] = true
        t["Urok Doomhowl"] = true

    elseif zone == "Blasted Lands" then
        t["Akubar the Seer"] = true
        t["Archmage Allistarj"] = true
        t["Bone Witch"] = true
        t["Clack the Reaver"] = true
        t["Deatheye"] = true
        t["Doomguard Commander"] = true
        t["Dreadlord"] = true
        t["Dreadscorn"] = true
        t["Felcular"] = true
        t["Felguard Elite"] = true
        t["Grol the Destroyer"] = true
        t["Grunter"] = true
        t["Ilifar"] = true
        t["Kirith the Damned"] = true
        t["Lady Sevine"] = true
        t["Magronos the Unyielding"] = true
        t["Manahound"] = true
        t["Mojo the Twisted"] = true
        t["Ravage"] = true
        t["Razelikh the Defiler"] = true
        t["Spirit of the Damned"] = true
        t["Spiteflayer"] = true
        t["Teremus the Devourer"] = true

    elseif zone == "Burning Steppes" then
        t["Black Dragonspawn"] = true
        t["Black Drake"] = true
        t["Black Wyrmkin"] = true
        t["Blackrock Ambusher"] = true
        t["Bone Witch"] = true
        t["Deathmaw"] = true
        t["Flamescale Dragonspawn"] = true
        t["Flamescale Wyrmkin"] = true
        t["Frenzied Black Drake"] = true
        t["Gorgon'och"] = true
        t["Gruklash"] = true
        t["Hahk'Zor"] = true
        t["Hematos"] = true
        t["Malfunctioning Reaver"] = true
        t["Rogue Black Drake"] = true
        t["Scalding Drake"] = true
        t["Scarshield Grunt"] = true
        t["Searscale Drake"] = true
        t["Spirit of the Damned"] = true
        t["Terrorspark"] = true
        t["Thauris Balgarr"] = true
        t["Volchan"] = true

    elseif zone == "Darkshore" then
        t["Carnivous the Breaker"] = true
        t["Firecaller Radison"] = true
        t["Flagglemurk the Cruel"] = true
        t["Lady Moongazer"] = true
        t["Lady Vespira"] = true
        t["Licillin"] = true
        t["Lord Sinslayer"] = true
        t["Reef Shark"] = true
        t["Shadowclaw"] = true
        t["Strider Clutchmother"] = true

    elseif zone == "Desolace" then
        t["Accursed Slitherblade"] = true
        t["Ambereye Basilisk"] = true
        t["Ambereye Reaver"] = true
        t["Ambershard Crusher"] = true
        t["Ambershard Destroyer"] = true
        t["Bonepaw Hyena"] = true
        t["Cursed Centaur"] = true
        t["Dark Rider"] = true
        t["Deepstrider Giant"] = true
        t["Deepstrider Searcher"] = true
        t["Giggler"] = true
        t["Hissperak"] = true
        t["Kaskk"] = true
        t["Khan Hratha"] = true
        t["Lord Azrethoc"] = true
        t["Magram Bonepaw"] = true
        t["Prince Kellen"] = true
        t["Rabid Bonepaw"] = true
        t["Rock Borer"] = true
        t["Rock Worm"] = true
        t["Shadowshard Rumbler"] = true
        t["Shadowshard Smasher"] = true
        t["Starving Bonepaw"] = true
        t["The Nameless Prophet"] = true

    elseif zone == "Dun Morogh" then
        t["Ben"] = true
        t["Bjarn"] = true
        t["Edan the Howler"] = true
        t["Gibblewilt"] = true
        t["Great Father Arctikus"] = true
        t["Hammerspine"] = true
        t["Old Icebeard"] = true
        t["Timber"] = true
        t["Vagash"] = true

    elseif zone == "Durotar" then
        t["Captain Flat Tusk"] = true
        t["Death Flayer"] = true
        t["Felweaver Scornn"] = true
        t["Geolord Mottle"] = true
        t["Mammoth Shark"] = true
        t["Sand Shark"] = true
        t["Warlord Kolkanis"] = true
        t["Watch Commander Zalaphil"] = true
        -- t["Elder Mottled Boar"] = true

    elseif zone == "Duskwood" then
        t["Dark Rider"] = true
        t["Eliza"] = true
        t["Lord Malathrom"] = true
        t["Lupos"] = true
        t["Lurking Shadow"] = true
        t["Mor'Ladim"] = true
        t["Morbent Fel"] = true
        t["Naraxis"] = true
        t["Nefaru"] = true
        t["Stitches"] = true

    elseif zone == "Dustwallow Marsh" then
        t["Brimgore"] = true
        t["Burgle Eye"] = true
        t["Coral Shark"] = true
        t["Dagun the Ravenous"] = true
        t["Darkmist Widow"] = true
        t["Dart"] = true
        t["Demon of the Orb"] = true
        t["Doctor Weavil"] = true
        t["Drogoth the Roamer"] = true
        t["Emberstrife"] = true
        t["Hayoc"] = true
        t["Lord Angler"] = true
        t["Minion of Weavil"] = true
        t["Oozeworm"] = true
        t["Ripscale"] = true
        t["Sellick Voss"] = true
        t["Strashaz Hydra"] = true
        t["Strashaz Myrmidon"] = true
        t["Strashaz Serpent Guard"] = true
        t["Strashaz Siren"] = true
        t["Strashaz Sorceress"] = true
        t["Strashaz Warrior"] = true
        t["The Rot"] = true
        t["Tidelord Rrurgaz"] = true
        
    elseif zone == "Eastern Plaguelands" then
        t["Bloodletter"] = true
        t["Bone Witch"] = true
        t["Borelgore"] = true
        t["Crimson Bodyguard"] = true
        t["Crimson Courier"] = true
        t["Deathspeaker Selendre"] = true
        t["Demetria"] = true
        t["Duggan Wildhammer"] = true
        t["Duskwing"] = true
        t["Fallen Hero"] = true
        t["Gish the Unmoving"] = true
        t["Hed'mush the Rotting"] = true
        t["High General Abbendis"] = true
        t["Horgus the Ravager"] = true
        t["Lord Darkscythe"] = true
        t["Marduk the Black"] = true
        t["Nerubian Overseer"] = true
        t["Ranger Lord Hawkspear"] = true
        t["Redpath the Corrupted"] = true
        t["Scarlet Archmage"] = true
        t["Scarlet Cleric"] = true
        t["Scarlet Curate"] = true
        t["Scarlet Enchanter"] = true
        t["Scarlet Inquisitor"] = true
        t["Scarlet Praetorian"] = true
        t["Scarlet Warder"] = true
        t["Servant of Horgus"] = true
        t["Slaughterhouse Protector"] = true
        t["Spirit of the Damned"] = true
        t["The Cleaner"] = true
        t["Warlord Thresh'jin"] = true
        t["Ziggurat Protector"] = true
        t["Zul'Brin Warpbranch"] = true

    elseif zone == "Elwynn Forest" then
        t["Fedfennel"] = true
        t["Gruff Swiftbite"] = true
        t["Hogger"] = true
        t["Morgaine the Sly"] = true
        t["Mother Fang"] = true
        t["Narg the Taskmaster"] = true
        t["Thuros Lightfingers"] = true

    elseif zone == "Felwood" then
        t["Alshirr Banebreath"] = true
        t["Death Howl"] = true
        t["Dessecus"] = true
        t["Immolatus"] = true
        t["Infernal Bodyguard"] = true
        t["Infernal Sentry"] = true
        t["Lord Banehollow"] = true
        t["Mongress"] = true
        t["Olm the Wise"] = true
        t["Ragepaw"] = true
        t["Spirit of Trey Lightforge"] = true
        t["The Ongar"] = true
        
    elseif zone == "Feralas" then
        t["Antilus the Soarer"] = true
        t["Arash-ethis"] = true
        t["Arcane Chimaerok"] = true
        t["Bloodroar the Stalker"] = true
        t["Chimaerok Devourer"] = true
        t["Chimaerok"] = true
        t["Cliff Giant"] = true
        t["Deep Strider"] = true
        t["Diamond Head"] = true
        t["Dreamroarer"] = true
        t["Edana Hatetalon"] = true
        t["Gnarl Leafbrother"] = true
        t["Gordok Enforcer"] = true
        t["Gordok Ogre-Mage"] = true
        t["Great Shark"] = true
        t["Greater Silithid Flayer"] = true
        t["Grug'thok the Seer"] = true
        t["Jademir Boughguard"] = true
        t["Jademir Oracle"] = true
        t["Jademir Tree Warder"] = true
        t["Lady Szallah"] = true
        t["Land Walker"] = true
        t["Lethlas"] = true
        t["Lord Lakmaeran"] = true
        t["Mushgog"] = true
        t["Old Grizzlegut"] = true
        t["Qirot"] = true
        t["Shore Strider"] = true
        t["Skarr the Unbreakable"] = true
        t["Snarler"] = true
        t["The Razza"] = true
        t["Wave Strider"] = true

    elseif zone == "Gnomeregan" then
        t["Dark Iron Ambassador"] = true

    elseif zone == "Hillsbrad Foothills" then
        t["Big Samras"] = true
        t["Captain Ironhill"] = true
        t["Condemned Acolyte"] = true
        t["Condemned Cleric"] = true
        t["Condemned Monk"] = true
        t["Creepthess"] = true
        t["Cursed Justicar"] = true
        t["Cursed Paladin"] = true
        t["Cyclonian"] = true
        t["Hammerhead Shark"] = true
        t["Lady Zephris"] = true
        t["Milton Beats"] = true
        t["Narillasanz"] = true
        t["Ro'Bark"] = true
        t["Scargil"] = true
        t["Tamra Stormpike"] = true
        t["Writhing Mage"] = true

    elseif zone == "Ironforge" then
        t["Spectral Stalker"] = true

    elseif zone == "Loch Modan" then
        t["Boss Galgosh"] = true
        t["Chok'sul"] = true
        t["Digmaster Shovelphlange"] = true
        t["Emogg the Crusher"] = true
        t["Gradok"] = true
        t["Grizlak"] = true
        t["Haren Swifthoof"] = true
        t["Large Loch Crocolisk"] = true
        t["Lord Condar"] = true
        t["Magosh"] = true
        t["Mo'grosh Brute"] = true
        t["Mo'grosh Enforcer"] = true
        t["Mo'grosh Mystic"] = true
        t["Mo'grosh Ogre"] = true
        t["Mo'grosh Shaman"] = true
        t["Ol' Sooty"] = true
        t["Shanda the Spinner"] = true
        t["Thragomm"] = true

    elseif zone == "Maraudon" then
        t["Meshlok the Harvester"] = true

    elseif zone == "Mulgore" then
        t["Enforcer Emilgund"] = true
        t["Ghost Howl"] = true
        t["Mazzranache"] = true
        t["Sister Hatelash"] = true
        t["Snagglespear"] = true
        t["The Rake"] = true

    elseif zone == "Orgrimmar" then
        t["Spectral Stalker"] = true        

    elseif zone == "Razorfen Kraul" then
        t["Blind Hunter"] = true
        t["Earthcaller Halmgar"] = true
        t["Razorfen Spearhide"] = true

    elseif zone == "Redridge Mountains" then
        t["Blackrock Gladiator"] = true
        t["Blackrock Hunter"] = true
        t["Blackrock Scout"] = true
        t["Blackrock Sentry"] = true
        t["Blackrock Shadowcaster"] = true
        t["Boulderheart"] = true
        t["Chatter"] = true
        t["Gath'Ilzogg"] = true
        t["Kazon"] = true
        t["Lake Thresher"] = true
        t["Lurking Shadow"] = true
        t["Morganth"] = true
        t["Ribchaser"] = true
        t["Rohh the Silent"] = true
        t["Seeker Aqualon"] = true
        t["Singe"] = true
        t["Snarlflare"] = true
        t["Squiddic"] = true
        t["Tharil'zun"] = true
        t["Volchan"] = true

    elseif zone == "Scarlet Monastery" then
        t["Azshir the Sleepless"] = true
        t["Fallen Champion"] = true
        t["Ironspine"] = true

    elseif zone == "Searing Gorge" then
        t["Clunk"] = true
        t["Dark Iron Sentry"] = true
        t["Faulty War Golem"] = true
        t["Highlord Mastrogonde"] = true
        t["Lathoric the Black"] = true
        t["Margol the Rager"] = true
        t["Obsidion"] = true
        t["Overseer Maltorius"] = true
        t["Rekk'tilac"] = true
        t["Scald"] = true
        t["Scarshield Grunt"] = true
        t["Shleipnarr"] = true
        t["Slave Master Blackheart"] = true
        t["Smoldar"] = true
        t["The Behemoth"] = true
        t["Twilight Dark Shaman"] = true
        t["Twilight Fire Guard"] = true
        t["Twilight Geomancer"] = true
        t["Twilight Idolater"] = true


    elseif zone == "Shadowfang Keep" then        
        t["Deathsworn Captain"] = true

    elseif zone == "Silithus" then
        t["Aluntir"] = true
        t["Anubisath Conqueror"] = true
        t["Arakis"] = true
        t["Arcanist Nozzlespring"] = true
        t["Azure Templar"] = true
        t["Captain Blackanvil"] = true
        t["Cloud Skydancer"] = true
        t["Colossal Anubisath Warbringer"] = true
        t["Crimson Templar"] = true
        t["Darkspear Shaman"] = true
        t["Deathclasp"] = true
        t["Earthen Templar"] = true
        t["Greater Anubisath Warbringer"] = true
        t["Greater Silithid Flayer"] = true
        t["Gretheer"] = true
        t["Grubthor"] = true
        t["Hive'Ashi Defender"] = true
        t["Hive'Ashi Sandstalker"] = true
        t["Hive'Ashi Stinger"] = true
        t["Hive'Ashi Swarmer"] = true
        t["Hive'Ashi Worker"] = true
        t["Hive'Regal Ambusher"] = true
        t["Hive'Regal Burrower"] = true
        t["Hive'Regal Hive Lord"] = true
        t["Hive'Regal Hunter-Killer"] = true
        t["Hive'Regal Slavemaker"] = true
        t["Hive'Regal Spitfire"] = true
        t["Hive'Zora Abomination"] = true
        t["Hive'Zora Hive Sister"] = true
        t["Hive'Zora Reaver"] = true
        t["Hive'Zora Tunneler"] = true
        t["Hive'Zora Waywatcher"] = true
        t["Hoary Templar"] = true
        t["Huricanian"] = true
        t["Krellack"] = true
        t["Lapress"] = true
        t["Mistress Natalia Mar'alith"] = true
        t["Rex Ashil"] = true
        t["Setis"] = true
        t["Supreme Silithid Flayer"] = true
        t["The Duke of Cynders"] = true
        t["The Duke of Fathoms"] = true
        t["The Duke of Shards"] = true
        t["The Duke of Zephyrs"] = true
        t["The Windreaver"] = true
        t["Twilight Lord Everun"] = true
        t["Twilight Marauder Morna"] = true
        t["Twilight Prophet"] = true
        t["Xil'xix"] = true
        t["Zora"] = true

    elseif zone == "Silverpine Forest" then
        t["Apothecary Berard"] = true
        t["Councilman Brunswick"] = true
        t["Councilman Cooper"] = true
        t["Councilman Hartin"] = true
        t["Councilman Hendricks"] = true
        t["Councilman Higarth"] = true
        t["Councilman Smithers"] = true
        t["Councilman Thatcher"] = true
        t["Councilman Wilhelm"] = true
        t["Dalaran Spellscribe"] = true
        t["Gorefang"] = true
        t["Krethis Shadowspinner"] = true
        t["Lord Mayor Morrison"] = true
        t["Moonrage Elder"] = true
        t["Moonrage Leatherworker"] = true
        t["Moonrage Sentry"] = true
        t["Moonrage Tailor"] = true
        t["Moonrage Watcher"] = true
        t["Old Vicejaw"] = true
        t["Ravenclaw Regent"] = true
        t["Reef Shark"] = true
        t["Rot Hide Bruiser"] = true
        t["Snarlmane"] = true
        t["Son of Arugal"] = true
        t["Thule Ravenclaw"] = true

    elseif zone == "Stonetalon Mountains" then
        t["Besseleth"] = true
        t["Bloodfury Ripper"] = true
        t["Brother Ravenoak"] = true
        t["Foreman Rigger"] = true
        t["Goggeroc"] = true
        t["Nal'taszar"] = true
        t["Pridewing Patriarch"] = true
        t["Sentinel Amarassan"] = true
        t["Sister Riven"] = true
        t["Sorrow Wing"] = true
        t["Taskmaster Whipfang"] = true
        t["Vengeful Ancient"] = true

    elseif zone == "Stormwind City" then
        -- t["Sewer Beast"] = true        
        t["Onyxia's Elite Guard"] = true

    elseif zone == "Stranglethorn Vale" then
        t["Bhag'thera"] = true
        t["Colonel Kurzen"] = true
        t["Elder Saltwater Crocolisk"] = true
        t["Gluggle"] = true
        t["Gorlash"] = true
        t["Gurubashi Warrior"] = true
        t["Hakkari Oracle"] = true
        t["High Priestess Hai'watna"] = true
        t["King Bangalash"] = true
        t["King Mukla"] = true
        t["Kurmokk"] = true
        t["Lord Sakrasis"] = true
        t["Mai'Zoth"] = true
        t["Mogh the Undying"] = true
        t["Mok'rash"] = true
        t["Mosh'Ogg Butcher"] = true
        t["Mosh'Ogg Lord"] = true
        t["Mosh'Ogg Mauler"] = true
        t["Mosh'Ogg Shaman"] = true
        t["Mosh'Ogg Spellcrafter"] = true
        t["Mosh'Ogg Warmonger"] = true
        t["Negolash"] = true
        t["Rippa"] = true
        t["Roloch"] = true
        t["Saltscale Forager"] = true
        t["Saltscale Hunter"] = true
        t["Saltscale Oracle"] = true
        t["Saltscale Tide Lord"] = true
        t["Saltscale Warrior"] = true
        t["Scale Belly"] = true
        t["Scarshield Quartermaster"] = true
        t["Tethis"] = true
        t["Verifonix"] = true

    elseif zone == "Stratholme" then
        t["Hearthsinger Forresten"] = true
        t["Skul"] = true
        t["Stonespine"] = true
        t["Timmy the Cruel"] = true

    elseif zone == "Swamp of Sorrows" then
        t["Dark Rider"] = true
        t["Enthralled Atal'ai"] = true
        t["Fingat"] = true
        t["Gilmorian"] = true
        t["Green Scalebane"] = true
        t["Green Wyrmkin"] = true
        t["Jade"] = true
        t["Lord Captain Wyrmak"] = true
        t["Lost One Chieftain"] = true
        t["Lost One Cook"] = true
        t["Molt Thorn"] = true
        t["Murk Slitherer"] = true
        t["Sanv Tas'dal"] = true
        t["Scalebane Captain"] = true
        t["Somnus"] = true
        t["Sorrowclaw"] = true
        t["Zekkis"] = true

    elseif zone == "Tanaris" then
        t["Bone Witch"] = true
        t["Chronalis"] = true
        t["Coast Strider"] = true
        t["Cyclok the Mad"] = true
        t["Deep Dweller"] = true
        t["Dune Smasher"] = true
        t["Great Shark"] = true
        t["Greater Firebird"] = true
        t["Greater Silithid Flayer"] = true
        t["Haarka the Ravenous"] = true
        t["Jin'Zallah the Sandbringer"] = true
        t["Kregg Keelhaul"] = true
        t["Murderous Blisterpaw"] = true
        t["Occulus"] = true
        t["Omgorn the Lost"] = true
        t["Raging Dune Smasher"] = true
        t["Sandfury Axe Thrower"] = true
        t["Sandfury Firecaller"] = true
        t["Sandfury Hideskinner"] = true
        t["Shadow of Doom"] = true
        t["Soriid the Devourer"] = true
        t["Spirit of the Damned"] = true
        t["Supreme Silithid Flayer"] = true
        t["Tick"] = true
        t["Warleader Krazzilak"] = true

    elseif zone == "Teldrassil" then
        t["Blackmoss the Fetid"] = true
        t["Duskstalker"] = true
        t["Fury Shelda"] = true
        t["Grimmaw"] = true
		t["Oakenscowl"] = true
        t["Threggil"] = true
        t["Uruson"] = true

    elseif zone == "Temple of Atal'Hakkar" then
        t["Veyzhak the Cannibal"] = true

    elseif zone == "The Barrens" then
        t["Aean Swiftriver"] = true
        t["Ambassador Bloodrage"] = true
        t["Ambassador Malcin"] = true
        t["Azzere the Skyblade"] = true
        t["Boahn"] = true
        t["Brokespear"] = true
        t["Brontus"] = true
        t["Captain Gerogg Hammertoe"] = true
        t["Cloned Ectoplasm"] = true
        t["Dark Rider"] = true
        t["Death's Head Cultist"] = true
        t["Deviate Coiler"] = true
        t["Deviate Creeper"] = true
        t["Deviate Stalker"] = true
        t["Devouring Ectoplasm"] = true
        t["Digger Flameforge"] = true
        t["Dishu"] = true
        t["Elder Mystic Razorsnout"] = true
        t["Engineer Whirleygig"] = true
        t["Faltering Silithid Flayer"] = true
        t["Foreman Grills"] = true
        t["Geopriest Gukk'rok"] = true
        t["Gesharahan"] = true
        t["Grand Foreman Puzik Gallywix"] = true
        t["Hagg Taurenbane"] = true
        t["Hannah Bladeleaf"] = true
        t["Heggin Stonewhisker"] = true
        t["Humar the Pridelord"] = true
        t["Kuz"] = true
        t["Lakota'mani"] = true
        t["Lok"] = true
        t["Mad Magglish"] = true
        t["Malgin Barleybrew"] = true
        t["Marcus Bel"] = true
        t["Minor Silithid Flayer"] = true
        t["Nak"] = true
        t["Owatanka"] = true
        t["Rathorian"] = true
        t["Razorfen Battleguard"] = true
        t["Razorfen Servitor"] = true
        t["Razorfen Thornweaver"] = true
        t["Rocklance"] = true
        t["Sand Shark"] = true
        t["Silithid Harvester"] = true
        t["Sister Rathtalon"] = true
        t["Sludge Beast"] = true
        t["Snort the Heckler"] = true
        t["Stonearm"] = true
        t["Swiftmane"] = true
        t["Swinegart Spearhide"] = true
        t["Takk the Leaper"] = true
        t["Taskmaster Fizzule"] = true
        t["Thora Feathermoon"] = true
        t["Thunderstomp"] = true
        t["Warlord Krom'zar"] = true
        t["Washte Pawne"] = true
        t["Zebrian the Mad"] = true

    elseif zone == "The Deadmines" then
        t["Miner Johnson"] = true

    elseif zone == "The Hinterlands" then
        t["Dreamtracker"] = true
        t["Emerald Ooze"] = true
        t["Gammerita"] = true
        t["Great Shark"] = true
        t["Grimungous"] = true
        t["Hitah'ya the Keeper"] = true
        t["Ironback"] = true
        t["Jade Sludge"] = true
        t["Jalinde Summerdrake"] = true
        t["Marauding Owlbeast"] = true
        t["Mith'rethis the Enchanter"] = true
        t["Morta'gya the Keeper"] = true
        t["Old Cliff Jumper"] = true
        t["Qiaga the Keeper"] = true
        t["Razortalon"] = true
        t["Retherokk the Berserker"] = true
        t["Rothos"] = true
        t["Shadra"] = true
        t["The Reak"] = true
        t["Verdantine Boughguard"] = true
        t["Verdantine Oracle"] = true
        t["Verdantine Tree Warder"] = true
        t["Vile Priestess Hexx"] = true
        t["Vilebranch Aman'zasi Guard"] = true
        t["Vilebranch Berserker"] = true
        t["Vilebranch Blood Drinker"] = true
        t["Vilebranch Headhunter"] = true
        t["Vilebranch Hideskinner"] = true
        t["Vilebranch Raiding Wolf"] = true
        t["Vilebranch Shadow Hunter"] = true
        t["Vilebranch Shadowcaster"] = true
        t["Vilebranch Soul Eater"] = true
        t["Vilebranch Warrior"] = true
        t["Witherheart the Stalker"] = true
        t["Zul'arek Hatefowler"] = true

    elseif zone == "The Stockade" then
        t["Bruegal Ironknuckle"] = true

    elseif zone == "Thousand Needles" then
        t["Achellios the Banished"] = true
        t["Arikara"] = true
        t["Death's Head Cultist"] = true
        t["Enraged Panther"] = true
        t["Gibblesnik"] = true
        t["Harb Foulmountain"] = true
        t["Heartrazor"] = true
        t["Ironeye the Invincible"] = true
        t["Lesser Silithid Flayer"] = true
        t["Razorfen Thornweaver"] = true
        t["Rok'Alim the Pounder"] = true
        t["Silithid Flayer"] = true
        t["Silithid Ravager"] = true
        t["Steelsnap"] = true
        t["Vile Sting"] = true
        t["Young Arikara"] = true

    elseif zone == "Thunder Bluff" then
        t["Ghost Howl"] = true

    elseif zone == "Tirisfal Glades" then
        t["Bayne"] = true
        t["Deeb"] = true
        t["Fallen Hero"] = true
        t["Farmer Solliden"] = true
        t["Fellicent's Shade"] = true
        t["Lost Soul"] = true
        t["Muad"] = true
        t["Ressan the Needler"] = true
        t["Scarlet Augur"] = true
        t["Scarlet Disciple"] = true
        t["Scarlet Magician"] = true
        t["Scarlet Preserver"] = true
        t["Scarlet Scout"] = true
        t["Sri'skulk"] = true
        t["Tormented Spirit"] = true

    elseif zone == "Un'Goro Crater" then
        t["Baron Charr"] = true
        t["Blazerunner"] = true
        t["Clutchmother Zavas"] = true
        t["Devilsaur"] = true
        t["Gruff"] = true
        t["Ironhide Devilsaur"] = true
        t["King Mosh"] = true
        t["Plated Stegodon"] = true
        t["Ravasaur Matriarch"] = true
        t["Spiked Stegodon"] = true
        t["Stegodon"] = true
        t["Thunderstomp Stegodon"] = true
        t["Tyrant Devilsaur"] = true
        t["Uhk'loc"] = true

    elseif zone == "Wailing Caverns" then
        t["Deviate Faerie Dragon"] = true
        t["Trigore the Lasher"] = true

    elseif zone == "Western Plaguelands" then
        t["Araj the Summoner"] = true
        t["Crimson Elite"] = true
        t["Fallen Hero"] = true
        t["Flesh Golem"] = true
        t["Foreman Jerris"] = true
        t["Foreman Marcrid"] = true
        t["Foulmane"] = true
        t["High Protector Lorik"] = true
        t["Lord Maldazzar"] = true
        t["Putridius"] = true
        t["Scarlet Executioner"] = true
        t["Scarlet High Clerist"] = true
        t["Scarlet Interrogator"] = true
        t["Scarlet Judge"] = true
        t["Scarlet Magus"] = true
        t["Scarlet Paladin"] = true
        t["Scarlet Priest"] = true
        t["Scarlet Sentinel"] = true
        t["Scarlet Smith"] = true
        t["Skeletal Warlord"] = true
        t["The Husk"] = true

    elseif zone == "Westfall" then
        t["Benny Blaanco"] = true
        t["Brack"] = true
        t["Brainwashed Noble"] = true
        t["Carver Molsen"] = true
        t["Defias Conjurer"] = true
        t["Defias Henchman"] = true
        t["Foe Reaper 4000"] = true
        t["Klaven Mortwake"] = true
        t["Leprithus"] = true
        t["Marisa du'Paige"] = true
        t["Master Digger"] = true
        t["Reef Shark"] = true
        t["Sergeant Brashclaw"] = true
        t["Slark"] = true
        t["Vultros"] = true

    elseif zone == "Wetlands" then
        t["Axtroz"] = true
        t["Balgaras the Foul"] = true
        t["Chieftain Nek'rosh"] = true
        t["Dark Iron Demolitionist"] = true
        t["Dark Iron Dwarf"] = true
        t["Dark Iron Rifleman"] = true
        t["Dark Iron Saboteur"] = true
        t["Dark Iron Tunneler"] = true
        t["Dragonmaw Battlemaster"] = true
        t["Garneg Charskull"] = true
        t["Gnawbone"] = true
        t["Hammerhead Shark"] = true
        t["Leech Widow"] = true
        t["Ma'ruk Wyrmscale"] = true
        t["Mirelow"] = true
        t["Razormaw Matriarch"] = true
        t["Red Dragonspawn"] = true
        t["Red Dragonspawn"] = true
        t["Red Scalebane"] = true
        t["Red Wyrmkin"] = true
        t["Scalebane Lieutenant"] = true
        t["Scalebane Royal Guard"] = true
        t["Sludginn"] = true
        t["Wyrmkin Firebrand"] = true

    elseif zone == "Winterspring" then
        t["Azurous"] = true
        t["Bone Witch"] = true
        t["Brumeran"] = true
        t["Cobalt Mageweaver"] = true
        t["Cobalt Scalebane"] = true
        t["Cobalt Wyrmkin"] = true
        t["Doctor Weavil"] = true
        t["Enthelar Valebranch"] = true
        t["Frostmaul Giant"] = true
        t["Frostmaul Preserver"] = true
        t["General Colbatann"] = true
        t["Grizzle Snowpaw"] = true
        t["Hederine Initiate"] = true
        t["Hederine Manastalker"] = true
        t["Hederine Slayer"] = true
        t["High Chief Winterfall"] = true
        t["Kashoch the Reaver"] = true
        t["Lady Hederine"] = true
        t["Manaclaw"] = true
        t["Mezzir the Howler"] = true
        t["Number Two"] = true
        t["Princess Tempestria"] = true
        t["Rak'shiri"] = true
        t["Scryer"] = true
        t["Shadow of Doom"] = true
        t["Shy-Rotam"] = true
        t["Sian-Rotam"] = true
        t["Spellmaw"] = true
        t["Spirit of the Damned"] = true
        t["Ursius"] = true
        t["Watery Invader"] = true
        t["Winterfall Runner"] = true
        t["Xandivious"] = true

    elseif zone == "Zul'Farrak" then
        t["Dustwraith"] = true
        t["Sandarr Dunereaver"] = true
        t["Zerillis"] = true
				
	  elseif zone == "Gilneas" then
        t["Baron Perenolde"] = true
        t["Bonecruncher"] = true
        t["Custodian Mathias"] = true
        t["Dawnhowl"] = true
        t["Duskskitterer"] = true
        t["Firstborn of Arugal"] = true
        t["Maltimor's Prototype"] = true
        t["Sergeant Gately"] = true
        t["Snarlclaw"] = true
        t["Widow of the Woods"] = true

	  elseif zone == "Tel'Abim" then
        t["Grimeclaw"] = true
        t["King Morogo Thunderfoot"] = true

    end
end