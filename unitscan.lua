local unitscan = CreateFrame'Frame'
unitscan:SetScript('OnUpdate', function() unitscan.UPDATE() end)
unitscan:SetScript('OnEvent', function() 
	if event == "VARIABLES_LOADED" then
		unitscan.LOAD()
		unitscan.scan = true
	elseif event == "PLAYER_REGEN_DISABLED" then
		-- in combat
		-- disable scanning
		unitscan.incombat = true
		unitscan.scan = nil
	elseif event == "PLAYER_REGEN_ENABLED" then
		-- out of combat
		-- enable scanning
		unitscan.incombat = nil
		unitscan.scan = true
	elseif (event == "PLAYER_ENTER_COMBAT" or event == "START_AUTOREPEAT_SPELL") then
		-- melee autoattack / ranged autoattack enabled
		-- disable scanning if not in combat
		if not unitscan.incombat then
			unitscan.scan = nil
		end
	elseif (event == "STOP_AUTOREPEAT_SPELL" or event == "PLAYER_LEAVE_COMBAT") then
		-- melee / ranged autoattack disabled
		-- enable scanning if not in combat
		if not unitscan.incombat then
			unitscan.scan = true
		end
	else
		unitscan.load_zonetargets()
	end
end)

unitscan:RegisterEvent'VARIABLES_LOADED'
unitscan:RegisterEvent'MINIMAP_ZONE_CHANGED'
unitscan:RegisterEvent'PLAYER_ENTERING_WORLD'
unitscan:RegisterEvent'PLAYER_REGEN_DISABLED' -- in combat
unitscan:RegisterEvent'PLAYER_REGEN_ENABLED' -- out of combat
unitscan:RegisterEvent'PLAYER_ENTER_COMBAT' -- melee autoattack enabled
unitscan:RegisterEvent'PLAYER_LEAVE_COMBAT' -- melee autoattack disabled
unitscan:RegisterEvent'START_AUTOREPEAT_SPELL' -- ranged autoattack enabled
unitscan:RegisterEvent'STOP_AUTOREPEAT_SPELL' -- ranged autoattack disabled

local BROWN = {.7, .15, .05}
local YELLOW = {1, 1, .15}
local CHECK_INTERVAL = 1

unitscan_zonetargets = {}
unitscan_targets = {}
unitscan_targets_off = {}
unitscanDB = unitscanDB or {}
unitscan.detected_mobs = unitscan.detected_mobs or {}



-- Activation/désactivation d'un mob
function unitscan.toggle_target_off(name)
    local key = strupper(name)
    if unitscan_targets_off[key] then
        unitscan_targets_off[key] = nil
        unitscan.print("Scan enabled for "..key)
    else
        unitscan_targets_off[key] = true
        unitscan.print("Scan disabled for "..key)
    end
    updateZoneMonsterList()
end

do
	local last_played
	
	unitscan.selected_sound = unitscanDB.selected_sound or "scourge_horn.ogg"  -- son par défaut
	unitscan.selected_sound_name = unitscanDB.selected_sound_name or "Scourge Horn"

	function unitscan.play_sound()
		if not last_played or GetTime() - last_played > 10 then
			SetCVar('MasterSoundEffects', 0)
			SetCVar('MasterSoundEffects', 1)
			local sound_path = "Interface\\AddOns\\unitscan-turtle\\Sound\\" .. unitscan.selected_sound
			PlaySoundFile(sound_path)
			last_played = GetTime()
		end
	end
end

function unitscan.load_zonetargets()
	unitscan_zone_targets()
end

function unitscan.resetDetectedMobs()
	unitscan.detected_mobs = {}
end

do 
	local prevTarget
	local foundTarget
	local _PlaySound = PlaySound
	local _UIErrorsFrame_OnEvent = UIErrorsFrame_OnEvent
	local pass = function() end

	function unitscan.reset()
		prevTarget = nil
		foundTarget = nil
	end

	function unitscan.restoreTarget()
		if foundTarget and (not (prevTarget == foundTarget)) then
			PlaySound = pass
			TargetLastTarget()
			PlaySound = _PlaySound
		end
		unitscan.reset()
	end

	function unitscan.check_for_targets()
		local currentDetected = {}
		local targetResults = {}
		local now = GetTime()

    	unitscan.last_alert_time = unitscan.last_alert_time or {}

		-- Premier passage : récupérer une fois pour chaque name
		for name, _ in pairs(unitscan_zonetargets) do
			targetResults[name] = unitscan.target(name)
		end

		-- 1ère boucle : détection + alerte uniquement si la cible vient d'être trouvée ou si délai écoulé
		for name, foundName in pairs(targetResults) do
			local key = foundName and string.upper(foundName) or nil
			if key then
				currentDetected[key] = true

				if key == string.upper(name) then
					local lastAlert = unitscan.last_alert_time[key] or 0
					if not unitscan.detected_mobs[key] or (now - lastAlert > 30) then
						unitscan.detected_mobs[key] = true
						unitscan.foundTarget = name
						unitscan.play_sound()
						unitscan.flash.animation:Play()
						unitscan.button:set_target()
						unitscan.last_alert_time[key] = now
					end
				end
			end
			unitscan.restoreTarget()
		end

		-- 2ème boucle : actions supplémentaires (toggle, re-alertes sans son ni animation)
		for name, foundName in pairs(targetResults) do
			if foundName and string.upper(name) == string.upper(foundName) then
				unitscan.foundTarget = name
				unitscan.toggle_zonetarget(name, false)  -- NE PAS jouer son et animation ici
			end
		end

		-- Nettoyage des mobs plus détectés
		for key in pairs(unitscan.detected_mobs) do
			if not currentDetected[key] then
				unitscan.detected_mobs[key] = nil
				unitscan.last_alert_time[key] = nil
			end
			unitscan.restoreTarget()
		end
	end


	function unitscan.target(name)
		local upperName = string.upper(name)
		if not unitscan_targets_off[upperName] then
			prevTarget = UnitName("target")		
			UIErrorsFrame_OnEvent = pass	
			PlaySound = pass
			TargetByName(name, true)
			UIErrorsFrame_OnEvent = _UIErrorsFrame_OnEvent
			PlaySound = _PlaySound

			foundTarget = UnitName("target")		
			if UnitIsPlayer("target") then
				return foundTarget and strupper(foundTarget)
			elseif (not UnitIsDead("target")) and UnitCanAttack("target", "player") then
				return foundTarget and strupper(foundTarget)
			end
		end
	end
end

function unitscan.LOAD()
	do
		if not unitscanDB then unitscanDB = {} end
		unitscan.selected_sound = unitscanDB.selected_sound or "scourge_horn.ogg"
		unitscan.selected_sound_name = unitscanDB.selected_sound_name or "Scourge Horn"
		
		local flash = CreateFrame'Frame'
		unitscan.flash = flash
		flash:Show()
		flash:SetAllPoints()
		flash:SetAlpha(0)
		flash:SetFrameStrata'FULLSCREEN_DIALOG'
		
		local texture = flash:CreateTexture()
		texture:SetBlendMode'ADD'
		texture:SetAllPoints()
		texture:SetTexture[[Interface\FullScreenTextures\LowHealth]]

		flash.animation = CreateFrame'Frame'
		flash.animation:Hide()
		flash.animation:SetScript('OnUpdate', function()
			local t = GetTime() - this.t0
			if t <= .5 then
				flash:SetAlpha(t * 2)
			elseif t <= 1 then
				flash:SetAlpha(1)
			elseif t <= 1.5 then
				flash:SetAlpha(1 - (t - 1) * 2)
			else
				flash:SetAlpha(0)
				this.loops = this.loops - 1
				if this.loops == 0 then
					this.t0 = nil
					this:Hide()
				else
					this.t0 = GetTime()
				end
			end
		end)
		function flash.animation:Play()
			if self.t0 then
				self.loops = 4
			else
				self.t0 = GetTime()
				self.loops = 3
			end
			self:Show()
		end
	end
	
	local button = CreateFrame("Button", "unitscan_button", UIParent)
	button:Hide()
	unitscan.button = button
	button:SetPoint('BOTTOM', UIParent, 0, 148)
	button:SetWidth(200)
	button:SetHeight(42)
	button:SetScale(1)
	button:SetMovable(true)
	button:SetUserPlaced(true)
	button:SetClampedToScreen(true)
	button:SetScript('OnMouseDown', function()
		if IsControlKeyDown() then
			this:RegisterForClicks()
			this:StartMoving()
		end
	end)
	button:SetScript('OnMouseUp', function()
		this:StopMovingOrSizing()
		this:RegisterForClicks'LeftButtonDown'
	end)
	button:SetFrameStrata'FULLSCREEN_DIALOG'
	
	button:SetBackdrop{
		tile = true,
		edgeSize = 16,
		edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
	}
	button:SetBackdropBorderColor(unpack(BROWN))
	button:SetScript('OnEnter', function()
		this:SetBackdropBorderColor(unpack(YELLOW))
	end)
	button:SetScript('OnLeave', function()
		this:SetBackdropBorderColor(unpack(BROWN))
	end)
	button:SetScript('OnClick', function()
		TargetByName(this:GetText(), true)
	end)
	function button:set_target()
		self:SetText(UnitName'target')

		self.model:reset()
		self.model:SetUnit'target'

		self:Show()
		self.glow.animation:Play()
		self.shine.animation:Play()
	end

	do
		local background = button:CreateTexture(nil, 'BACKGROUND')
		background:SetTexture[[Interface\AddOns\unitscan-turtle\UI\UI-Achievement-Parchment-Horizontal]]
		background:SetPoint('BOTTOMLEFT', 3, 3)
		background:SetPoint('TOPRIGHT', -3, -3)
		background:SetTexCoord(0, 1, 0, .25)
	end
	
	do
		local title_background = button:CreateTexture(nil, 'BORDER')
		title_background:SetTexture[[Interface\AddOns\unitscan-turtle\UI\UI-Achievement-Title]]
		title_background:SetPoint('TOPRIGHT', -5, -5)
		title_background:SetPoint('LEFT', 5, 0)
		title_background:SetHeight(18)
		title_background:SetTexCoord(0, .9765625, 0, .3125)
		title_background:SetAlpha(.8)

		local title = button:CreateFontString(nil, 'OVERLAY')
		title:SetFont([[Fonts\FRIZQT__.TTF]], 14)
		title:SetShadowOffset(1, -1)
		title:SetPoint('TOPLEFT', title_background, 0, 0)
		title:SetPoint('RIGHT', title_background)
		button:SetFontString(title)

		local subtitle = button:CreateFontString(nil, 'OVERLAY')
		subtitle:SetFont([[Fonts\FRIZQT__.TTF]], 12)
		subtitle:SetTextColor(0, 0, 0)
		subtitle:SetPoint('TOPLEFT', title, 'BOTTOMLEFT', 0, -4)
		subtitle:SetPoint('RIGHT', title )
		subtitle:SetText'Unit Found!'
	end
	
	do
		local model = CreateFrame('PlayerModel', nil, button)
		button.model = model
		model:SetPoint('BOTTOMLEFT', button, 'TOPLEFT', 0, -4)
		model:SetPoint('RIGHT', 0, 0)
		model:SetHeight(button:GetWidth() * .6)
		
		do
			local last_update, delay
			function model:on_update()
				this:SetFacing(this:GetFacing() + (GetTime() - last_update) * math.pi / 4)
				last_update = GetTime()
			end
			
			function model:on_update_model()
				if delay > 0 then
					delay = delay - 1
					return
				end
				
				this:SetScript('OnUpdateModel', nil)
				this:SetScript('OnUpdate', this.on_update)
				this:SetModelScale(.75)
				this:SetAlpha(1)	
				last_update = GetTime()
			end
			
			function model:reset()
				self:SetAlpha(0)
				self:SetFacing(0)
				self:SetModelScale(1)
				self:ClearModel()
				self:SetScript('OnUpdate', nil)
				self:SetScript("OnUpdateModel", self.on_update_model)
				delay = 10 -- to prevent scaling bugs
			end
		end
	end
	
	do
		local close = CreateFrame('Button', nil, button, 'UIPanelCloseButton')
		close:SetPoint('TOPRIGHT', 0, 0)
		close:SetWidth(32)
		close:SetHeight(32)
		close:SetScale(.8)
		close:SetHitRectInsets(8, 8, 8, 8)
	end
	
	do
		local glow = button.model:CreateTexture(nil, 'OVERLAY')
		button.glow = glow
		glow:SetPoint('CENTER', button, 'CENTER')
		glow:SetWidth(400 / 300 * button:GetWidth())
		glow:SetHeight(171 / 70 * button:GetHeight())
		glow:SetTexture[[Interface\AddOns\unitscan-turtle\UI\UI-Achievement-Alert-Glow]]
		glow:SetBlendMode'ADD'
		glow:SetTexCoord(0, .78125, 0, .66796875)
		glow:SetAlpha(0)

		glow.animation = CreateFrame'Frame'
		glow.animation:Hide()
		glow.animation:SetScript('OnUpdate', function()
			local t = GetTime() - this.t0
			if t <= .2 then
				glow:SetAlpha(t * 5)
			elseif t <= .7 then
				glow:SetAlpha(1 - (t - .2) * 2)
			else
				glow:SetAlpha(0)
				this:Hide()
			end
		end)
		function glow.animation:Play()
			self.t0 = GetTime()
			self:Show()
		end
	end

	do
		local shine = button:CreateTexture(nil, 'ARTWORK')
		button.shine = shine
		shine:SetPoint('TOPLEFT', button, 0, 8)
		shine:SetWidth(67 / 300 * button:GetWidth())
		shine:SetHeight(1.28 * button:GetHeight())
		shine:SetTexture[[Interface\AddOns\unitscan-turtle\UI\UI-Achievement-Alert-Glow]]
		shine:SetBlendMode'ADD'
		shine:SetTexCoord(.78125, .912109375, 0, .28125)
		shine:SetAlpha(0)
		
		shine.animation = CreateFrame'Frame'
		shine.animation:Hide()
		shine.animation:SetScript('OnUpdate', function()
			local t = GetTime() - this.t0
			if t <= .3 then
				shine:SetPoint('TOPLEFT', button, 0, 8)
			elseif t <= .7 then
				shine:SetPoint('TOPLEFT', button, (t - .3) * 2.5 * this.distance, 8)
			end
			if t <= .3 then
				shine:SetAlpha(0)
			elseif t <= .5 then
				shine:SetAlpha(1)
			elseif t <= .7 then
				shine:SetAlpha(1 - (t - .5) * 5)
			else
				shine:SetAlpha(0)
				this:Hide()
			end
		end)
		function shine.animation:Play()
			self.t0 = GetTime()
			self.distance = button:GetWidth() - shine:GetWidth() + 8
			self:Show()
		end
	end

end

do
	unitscan.last_check = GetTime()
	function unitscan.UPDATE()
		if unitscan.scan then
			if GetTime() - unitscan.last_check >= CHECK_INTERVAL then
				unitscan.last_check = GetTime()
				if (unitscan.reloadtimer and (unitscan.last_check >= unitscan.reloadtimer)) then
					unitscan.reloadtimer = nil
					unitscan.load_zonetargets()	
					unitscan.resetDetectedMobs()		
					-- unitscan.print('reloaded zone targets')
				end				
				unitscan.check_for_targets()
			end
		end
	end
end

function unitscan.print(msg)
	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage(LIGHTYELLOW_FONT_COLOR_CODE .. '<unitscan> ' .. msg)
	end
end

function unitscan.sorted_targets()
	local sorted_targets = {}
	for key in pairs(unitscan_targets) do
		tinsert(sorted_targets, key)
	end
	sort(sorted_targets, function(key1, key2) return key1 < key2 end)
	return sorted_targets
end

function unitscan.sorted_zonetargets()
	local sorted_targets = {}
	for key in pairs(unitscan_zonetargets) do
		tinsert(sorted_targets, key)
	end
	sort(sorted_targets, function(key1, key2) return key1 < key2 end)
	return sorted_targets
end

function unitscan.toggle_target(name)
	local key = strupper(name)
	if unitscan_targets[key] then
		unitscan_targets[key] = nil
		unitscan.print('- ' .. key)
	elseif key ~= '' then
		unitscan_targets[key] = true
		unitscan.print('+ ' .. key)
	end
end

function unitscan.toggle_zonetarget(name, play_alert)
    local key = string.upper(name)
    if not unitscan_targets_off[key] and unitscan_zonetargets[key] then
        if not unitscan.detected_mobs[key] then
            unitscan.detected_mobs[key] = true
            unitscan.print(key .. " was found!")
            if play_alert then
                unitscan.play_sound()
                unitscan.flash.animation:Play()
            end
            unitscan.button:set_target()
            unitscan.reloadtimer = GetTime() + 90
        else
            -- Même si déjà détecté, on peut éventuellement mettre à jour le bouton
            unitscan.button:set_target()
        end
    end
end

-- Création de la fenêtre principale
local frame = CreateFrame("Frame", "unitscanZoneMonsterFrame", UIParent)
frame:SetWidth(300)
frame:SetHeight(400)
frame:SetPoint("CENTER", UIParent, "CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", function(self) this:StartMoving() end)
frame:SetScript("OnDragStop", function(self) this:StopMovingOrSizing() end)
frame:Hide()

-- Fond (background)
local bg = frame:CreateTexture(nil, "BACKGROUND")
bg:SetAllPoints(frame)
bg:SetTexture(0, 0, 0, 0.8) -- noir transparent

-- Bordure (simple)
local border = frame:CreateTexture(nil, "BORDER")
border:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
border:SetTexCoord(0, 1, 0, 1)
border:SetWidth(frame:GetWidth() + 8)
border:SetHeight(frame:GetHeight() + 8)

-- Titre
frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.title:SetPoint("TOP", frame, "TOP", 0, -10)

-- Bouton Fermer
local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)
close:SetScript("OnClick", function() frame:Hide() end)

-- ScrollFrame simple (WoW 1.12 a le template UIPanelScrollFrameTemplate)
local scrollFrame = CreateFrame("ScrollFrame", "ScrollFrame_Mobs", frame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -40)
scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 10)

-- Zone de contenu dans le ScrollFrame
local content = CreateFrame("Frame", nil, scrollFrame)
content:SetWidth(260)
content:SetHeight(380) -- adapter selon besoin
scrollFrame:SetScrollChild(content)

-- Texte dans content
content.text = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
content.text:SetPoint("TOPLEFT", content, "TOPLEFT", 0, 60)
content.text:SetJustifyH("LEFT")
content.text:SetWidth(260)
content.text:SetHeight(380)
content.text:SetNonSpaceWrap(true)

local buttons = {}

local function createOrReuseButton(i)
    local btn = buttons[i]
    if not btn then
        btn = CreateFrame("Button", nil, content)
        btn:SetWidth(260)
        btn:SetHeight(20)
        
        btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        btn.text:SetPoint("LEFT", btn, "LEFT", 5, 0)
        btn.text:SetJustifyH("LEFT")
        btn.text:SetWidth(250)
        
        btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
        
        btn:SetScript("OnClick", function(self)
            local name = this.mobName
            if name then
                unitscan.toggle_target_off(name)
                updateZoneMonsterList() -- rafraîchir la liste après toggle
            end
        end)

        buttons[i] = btn
    end
    return btn
end

-- Fonction pour mettre à jour le contenu
local maxButtonsUsed = 0  -- variable globale pour garder le max d'index utilisés

local isUpdating = false

function updateZoneMonsterList()
    if isUpdating then return end
    isUpdating = true

    local zone = GetZoneText()
    frame.title:SetText("UnitScan - Zone : " .. zone)

    -- Cacher tous les boutons
    for _, btn in ipairs(buttons) do
        btn:Hide()
    end

    local i = 0

    -- Titre désactivés
    i = i + 1
    local offTitleBtn = createOrReuseButton(i)
    offTitleBtn.text:SetText("=== Targets disabled (scan OFF) ===")
    offTitleBtn.text:SetTextColor(1, 1, 1)
    offTitleBtn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20 * (i - 1))
    offTitleBtn:EnableMouse(false)
    offTitleBtn:Show()

    -- Liste désactivés
    for mobName, _ in unitscan_zonetargets do
		local key = strupper(mobName)
		if unitscan_targets_off[key] then  -- filtre pour être dans la zone
			i = i + 1
			local btn = createOrReuseButton(i)
			btn.mobName = key
			btn.text:SetText(key)
			btn.text:SetTextColor(1, 0, 0) -- rouge
			btn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20 * (i - 1))
			btn:EnableMouse(true)
			btn:Show()
		end
	end

    -- Titre activés
    i = i + 1
    local onTitleBtn = createOrReuseButton(i)
    onTitleBtn.text:SetText("=== Targets enabled (scan ON) ===")
    onTitleBtn.text:SetTextColor(1, 1, 1)
    onTitleBtn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20 * (i - 1))
    onTitleBtn:EnableMouse(false)
    onTitleBtn:Show()

    -- Liste activés (dans la zone)
    for mobName, _ in unitscan_zonetargets do
        local key = strupper(mobName)
        if not unitscan_targets_off[key] then
            i = i + 1
            local btn = createOrReuseButton(i)
            btn.mobName = key
            btn.text:SetText(key)
            btn.text:SetTextColor(0, 1, 0) -- vert
            btn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20 * (i - 1))
            btn:EnableMouse(true)
            btn:Show()
        end
    end

    content:SetHeight(math.max(380, i * 20))

    isUpdating = false
end

updateZoneMonsterList()

frame:RegisterEvent("MINIMAP_ZONE_CHANGED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
    if "MINIMAP_ZONE_CHANGED" or "PLAYER_ENTERING_WORLD" then
        updateZoneMonsterList()
    end
end)

-- /unitscan command
SLASH_UNITSCAN1 = '/unitscan'
function SlashCmdList.UNITSCAN(parameter)
    local _, _, name = string.find(parameter, '^%s*(.-)%s*$')  -- trim spaces

    if name == 'on' then
        unitscan.scan = true
        unitscan.print("Addon enabled.")
        frame:Show()
    elseif name == 'off' then
        unitscan.scan = false
        unitscan.print("Addon disabled.")
        frame:Hide()
    elseif name == 'help' then
        unitscan.print("Available commands:")
		unitscan.print("/unitscan - Show this list of mobs in the zone")
        unitscan.print("/unitscan on - Enable the addon")
        unitscan.print("/unitscan off - Disable the addon")
        unitscan.print("/unitsound 1, 2 or 3 - Select the alert sound or show current sound")
    elseif name == '' or name == nil then
        if frame:IsShown() then
            frame:Hide()
        else
            updateZoneMonsterList()
            frame:Show()
        end
    else
        unitscan.toggle_target(name)
    end
end

-- /unitscantarget command
SLASH_UNITSCANTARGET1 = '/unitscantarget'
function SlashCmdList.UNITSCANTARGET()
    if unitscan.foundTarget then
        TargetByName(unitscan.foundTarget, true)
    else
        unitscan.print("No target found yet.")
    end
end

-- Initialise au démarrage, en dehors de la fonction slash
function unitscan.OnLoad()
    if not unitscanDB then
        unitscanDB = {}
    end

    unitscan.selected_sound = unitscanDB.selected_sound or "scourge_horn.ogg"
    unitscan.selected_sound_name = unitscanDB.selected_sound_name or "Scourge Horn"
end

-- /unitsound command
SLASH_UNITSOUND1 = '/unitsound'
function SlashCmdList.UNITSOUND(msg)
    msg = msg or ""

    local choice = nil
    local startPos, endPos = string.find(msg, "%d")
    if startPos then
        choice = string.sub(msg, startPos, endPos)
    end

    local sounds = {
        ["1"] = "scourge_horn.ogg",
        ["2"] = "event_wardrum_ogre.ogg",
        ["3"] = "gruntling_horn_bb.ogg"
    }

    local soundNames = {
        ["1"] = "Scourge Horn",
        ["2"] = "Event Wardrum Ogre",
        ["3"] = "Gruntling Horn"
    }

    if choice and sounds[choice] then
        unitscan.selected_sound = sounds[choice]
        unitscan.selected_sound_name = soundNames[choice]

        unitscanDB.selected_sound = unitscan.selected_sound
        unitscanDB.selected_sound_name = unitscan.selected_sound_name

        unitscan.print("Sound changed to option " .. choice .. ": " .. unitscan.selected_sound_name)
        unitscan.play_sound()
    else
        unitscan.print("Current sound: " .. (unitscan.selected_sound_name or "Unknown"))
        unitscan.print("Choose a sound with /unitsound 1, 2 or 3:")
        unitscan.print("1 = Scourge Horn")
        unitscan.print("2 = Event Wardrum Ogre")
        unitscan.print("3 = Gruntling Horn")
    end
end


