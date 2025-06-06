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
