--[[
Addon : UnitScan Turtle WoW 1.12
But : Détection de mobs rares et marquage automatique avec son + message visuel
Auteur : Optimisé pour Turtle WoW, version intégrée
]]--

-- === Initialisation === --
local unitscan = CreateFrame("Frame")
unitscan:SetScript('OnUpdate', function() unitscan.UPDATE() end)
unitscan:SetScript("OnEvent", function()
    if event == "VARIABLES_LOADED" then
		unitscanDB = unitscanDB or {}
        unitscanDB.unitscan = unitscanDB.unitscan or {}
        unitscan.scan = unitscanDB.unitscan.scan ~= false
        unitscan.bigMessageEnabled = unitscanDB.bigMessageEnabled ~= false

		unitscan.LOAD()
    elseif event == "PLAYER_REGEN_DISABLED" then
        unitscan.incombat = true
        unitscan.scan = nil
    elseif event == "PLAYER_REGEN_ENABLED" then
        unitscan.incombat = nil
        unitscanDB.unitscan = unitscanDB.unitscan or {}
    elseif (event == "PLAYER_ENTER_COMBAT" or event == "START_AUTOREPEAT_SPELL") then
        if not unitscan.incombat then unitscan.scan = nil end
    elseif (event == "STOP_AUTOREPEAT_SPELL" or event == "PLAYER_LEAVE_COMBAT") then
        if not unitscan.incombat then unitscanDB.unitscan = unitscanDB.unitscan or {} end
	else
		unitscan.load_zonetargets()
    end
end)

-- === Enregistrement des événements === --
unitscan:RegisterEvent'VARIABLES_LOADED'
unitscan:RegisterEvent'MINIMAP_ZONE_CHANGED'
unitscan:RegisterEvent'PLAYER_ENTERING_WORLD'
unitscan:RegisterEvent'PLAYER_REGEN_DISABLED' -- in combat
unitscan:RegisterEvent'PLAYER_REGEN_ENABLED' -- out of combat
unitscan:RegisterEvent'PLAYER_ENTER_COMBAT' -- melee autoattack enabled
unitscan:RegisterEvent'PLAYER_LEAVE_COMBAT' -- melee autoattack disabled
unitscan:RegisterEvent'START_AUTOREPEAT_SPELL' -- ranged autoattack enabled
unitscan:RegisterEvent'STOP_AUTOREPEAT_SPELL' -- ranged autoattack disabled



local msglog = CreateFrame("Frame")
msglog:RegisterEvent("PLAYER_ENTERING_WORLD")
msglog:SetScript("OnEvent", function()
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00< |r|cFFFFA500UnitScan |r|cFF00FF96Turtle WoW|r|cffffff00 >|r |cFF00FF00Loaded !|r")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00   More information with :|r |cff00FFFF/unitscan help|r")
    UIErrorsFrame:AddMessage("|cffffff00Happy hunting on |r|cFF00FF96Turtle WoW|r|cffffff00 !|r", 0, 1, 0.6, 0, 5)
    msglog:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)


unitscanDB = unitscanDB or {}
unitscanDB.unitscan = unitscanDB.unitscan or {}

unitscan.last_alert_time_targets = {}
unitscan.last_alert_time_zonetargets = {}

unitscan.ALERT_COOLDOWN_TARGETS = 90
unitscan.ALERT_COOLDOWN_ZONETARGETS = 90

unitscan.detected_mobs = unitscan.detected_mobs or {}
unitscan_targets = {}
unitscan_targets_off = {}
unitscan_zonetargets = {}

unitscanDB.zoneTargetMode = unitscanDB.zoneTargetMode or "normal"  -- "normal" ou "hardcore"
unitscan.bigMessageEnabled = unitscanDB.bigMessageEnabled ~= false
unitscan.selected_sound = unitscanDB.selected_sound or "scourge_horn.ogg"
unitscan.selected_sound_name = unitscanDB.selected_sound_name or "Scourge Horn"


local BROWN = {.7, .15, .05}
local YELLOW = {1, 1, .15}
unitscan.CHECK_INTERVAL = unitscan.CHECK_INTERVAL or 1


-- Sauvegarde la fonction native SetRaidTarget
local Blizzard_SetRaidTarget = SetRaidTarget

-- Vérifie si SuperWoW est chargé
local function IsSuperWoWLoaded()
    return SetAutoloot ~= nil
end

-- Vérifie si le joueur est en groupe ou raid
local function IsPlayerInPartyOrRaid()
    return GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0
end

-- Override SetRaidTarget pour supporter SuperWoW hors groupe
SetRaidTarget = function(unit, index)
    local cur_index = GetRaidTargetIndex(unit)
    local new_index = index
    if cur_index and cur_index == index then
        new_index = 0 -- toggle off si déjà posé
    end

    local target_locally = IsSuperWoWLoaded() and not IsPlayerInPartyOrRaid()
    Blizzard_SetRaidTarget(unit, new_index, target_locally)
end

-- Activation/désactivation d'un mob
function unitscan.toggle_target_off(name)
	local key = name
    local keyUpper = strupper(name)
    if unitscan_targets_off[keyUpper] then
        unitscan_targets_off[keyUpper] = nil
        unitscan.print("Scan |cff00ff00enabled|r for "..key)
    else
        unitscan_targets_off[keyUpper] = true
        unitscan.print("Scan |cffff0000disabled|r for "..key)
    end
    updateZoneMonsterList()
end

do
	local last_played
	
	unitscan.selected_sound = unitscanDB.selected_sound or "scourge_horn.ogg"  -- son par défaut
	unitscan.selected_sound_name = unitscanDB.selected_sound_name or "Scourge Horn"

	function unitscan.play_sound()
		if not unitscan.selected_sound or unitscan.selected_sound == "" then
        -- Son muet, ne rien faire
			return
		end
		if not last_played or GetTime() - last_played > 10 then
			SetCVar('MasterSoundEffects', 0)
			SetCVar('MasterSoundEffects', 1)
			local sound_path = "Interface\\AddOns\\unitscan-turtle\\Sound\\" .. unitscan.selected_sound
			PlaySoundFile(sound_path)
			last_played = GetTime()
		end
	end
end


-- =========================
-- ZONE TARGET LOAD
-- =========================
function unitscan.load_zonetargets()
    if unitscanDB.zoneTargetMode == "normal" then
        unitscan_zone_targets()
		updateZoneMonsterList()
    else
        unitscan_zone_targets_hc()
		updateZoneMonsterList()
    end
end


-- =========================
-- BIG MESSAGE UI
-- =========================
local BigMessageFrame
local hideAt = 0

local function MakeFrameDraggable(frame)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self)
        this:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        this:StopMovingOrSizing()
        local point, _, _, x, y = this:GetPoint()
        unitscan.bigMessagePosX = x
        unitscan.bigMessagePosY = y
        unitscanDB.bigMessagePosX = x
        unitscanDB.bigMessagePosY = y
    end)
end

function ShowBigMessage(text, r, g, b, duration)
    if not unitscanDB.bigMessageEnabled then return end

    duration = duration or 5

    if not BigMessageFrame then
        BigMessageFrame = CreateFrame("Frame", nil, UIParent)
        BigMessageFrame:SetHeight(50)
        BigMessageFrame:SetWidth(600)
        BigMessageFrame:SetPoint("TOP", UIParent, "TOP", 0, -50)

        BigMessageFrame.msg = BigMessageFrame:CreateFontString(nil, "OVERLAY")
        BigMessageFrame.msg:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE")
        BigMessageFrame.msg:SetPoint("CENTER", BigMessageFrame, "CENTER")

        MakeFrameDraggable(BigMessageFrame)

        BigMessageFrame:SetScript("OnUpdate", function(self, elapsed)
            if GetTime() >= hideAt then
                this:Hide()
                this:SetScript("OnUpdate", nil)
            end
        end)
    end

    BigMessageFrame.msg:SetTextColor(r, g, b)
    BigMessageFrame.msg:SetText(text)
    BigMessageFrame:Show()
    hideAt = GetTime() + duration
    BigMessageFrame:SetScript("OnUpdate", BigMessageFrame:GetScript("OnUpdate"))
end


-- =========================
-- SCAN DES CIBLES
-- =========================
do
    local prevTarget
    local foundTarget
    local _PlaySound = PlaySound
    local _UIErrorsFrame_OnEvent = UIErrorsFrame_OnEvent
    local available_marks = {8, 7, 6, 5, 4, 3, 2, 1}
    local mark_index = 1
    local pass = function() end

    local last_detect_time = 0

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
        local now = GetTime()
        local cooldown = 30
        if now - last_detect_time < cooldown then 
			return 
		end


        mark_index = 1

        local function mark_target()
            if not UnitIsDead("target")
            and UnitCanAttack("target", "player")
            and foundTarget
            and foundTarget ~= '' then
                local currentMark = GetRaidTargetIndex("target") or 0
                local mark = available_marks[mark_index]
                if mark and currentMark ~= mark then
                    SetRaidTarget("target", mark)
                    mark_index = mark_index + 1
                end
            elseif UnitIsDead("target") then
                SetRaidTarget("target", 0)
            end
        end

        for name, _ in pairs(unitscan_targets) do
            if available_marks[mark_index] == nil then break end

            local detectedName = unitscan.target(name)
            if detectedName and detectedName == strupper(name) and not unitscan_targets_off[detectedName] then
                unitscan.foundTarget = name
                unitscan.toggle_target(name)
				unitscan.play_sound()
				unitscan.flash.animation:Play()
				unitscan.button:set_target()
                ShowBigMessage("|cffffff00"..name.."|r |cffff0000Found !|r", 0, 1, 0.6, 5)

                mark_target()
                last_detect_time = now
            end
            unitscan.restoreTarget()
        end

        for name, _ in pairs(unitscan_zonetargets) do
            if available_marks[mark_index] == nil then break end

            local detectedName = unitscan.target(name)
            if detectedName and detectedName == strupper(name) and not unitscan_targets_off[detectedName] then
                unitscan.foundTarget = name
                unitscan.toggle_zonetarget(name)
				unitscan.play_sound()
				unitscan.flash.animation:Play()
				unitscan.button:set_target()

                ShowBigMessage("|cffffff00"..name.."|r |cffff0000Found !|r", 0, 1, 0.6, 5)

                mark_target()
                last_detect_time = now
            end
            unitscan.restoreTarget()
        end
    end

    function unitscan.target(name)
        prevTarget = UnitName("target")
        UIErrorsFrame_OnEvent = pass
        PlaySound = pass
        TargetByName(name)
        UIErrorsFrame_OnEvent = _UIErrorsFrame_OnEvent
        PlaySound = _PlaySound

        foundTarget = UnitName("target")

		if not foundTarget then
			return nil
		end

        if UnitIsPlayer("target") then
            return foundTarget and strupper(foundTarget)
        elseif (not UnitIsDead("target")) and UnitCanAttack("target", "player") then
            return foundTarget and strupper(foundTarget)
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
            if GetTime() - unitscan.last_check >= unitscan.CHECK_INTERVAL then
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
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00BFFF- |r" .. msg)
    end
end

local function alert_target(key, cooldown_table, cooldown, msg, play_alert)
    local now = GetTime()
    local last_alert = cooldown_table[key] or 0

    if not unitscan.detected_mobs[key] or (now - last_alert) >= cooldown then
        unitscan.detected_mobs[key] = now
        cooldown_table[key] = now
        unitscan.print(msg)

        if play_alert then
            unitscan.play_sound()
            unitscan.flash.animation:Play()
        end

        if unitscan.button and unitscan.button.set_target then
            unitscan.button:set_target()
        end

        unitscan.reloadtimer = now + cooldown
        return true
    else
        if unitscan.button and unitscan.button.set_target then
            unitscan.button:set_target()
        end
        return false
    end
end

function unitscan.toggle_target(name)
    local key = string.upper(name)
    if unitscan_targets_off[key] then return end

    if unitscan_targets[key] then
        alert_target(key, unitscan.last_alert_time_targets, unitscan.ALERT_COOLDOWN_TARGETS, "+ " .. key, true)
    else
        unitscan_targets[key] = true
        unitscan.print("+ " .. key)
    end
end

function unitscan.toggle_zonetarget(name, play_alert)
    local key = string.upper(name)
    if unitscan_targets_off[key] then return end

    if unitscan_zonetargets[key] then
        alert_target(key, unitscan.last_alert_time, unitscan.ALERT_COOLDOWN, key .. " a été détecté !", play_alert)
    end
end

function unitscan.cleanup_detected_mobs(expiration_time)
    local now = GetTime()
    expiration_time = expiration_time or 300
    for key, detected_time in pairs(unitscan.detected_mobs) do
        if now - detected_time > expiration_time then
            unitscan.detected_mobs[key] = nil
            unitscan.last_alert_time[key] = nil
            unitscan.last_alert_time_targets[key] = nil
            unitscan.last_alert_time_zonetargets[key] = nil
        end
    end
end

function unitscan.sorted_targets()
    local sorted = {}
    for key in pairs(unitscan_targets) do
        table.insert(sorted, key)
    end
    table.sort(sorted)
    return sorted
end

function unitscan.sorted_zonetargets()
    local sorted = {}
    for key in pairs(unitscan_zonetargets) do
        table.insert(sorted, key)
    end
    table.sort(sorted)
    return sorted
end

function unitscan.UPDATE()
    local now = GetTime()
    if not unitscan.scan then return end

    if now - unitscan.last_check >= unitscan.CHECK_INTERVAL then
        unitscan.last_check = now

        if unitscan.reloadtimer and now >= unitscan.reloadtimer then
            unitscan.reloadtimer = nil
            if unitscan.load_zonetargets then unitscan.load_zonetargets() end
            if unitscan.resetDetectedMobs then unitscan.resetDetectedMobs() end
        end

        if unitscan.check_for_targets then unitscan.check_for_targets() end
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
close:SetScript("OnClick", function()
    frame:Hide()
    if BigMessageFrame and BigMessageFrame:IsShown() then
		BigMessageFrame:Hide()
	end
end)

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
local isUpdating = false

function updateZoneMonsterList()
    if isUpdating then return end
    isUpdating = true

    local zone = GetZoneText()
    frame.title:SetText("UnitScan - Zone : " .. (zone or "Unknown"))

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
		local key = mobName
		local keyUpper = strupper(mobName)
		if unitscan_targets_off[keyUpper] then  -- filtre pour être dans la zone
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
        local key = mobName
		local keyUpper = strupper(mobName)
        if not unitscan_targets_off[keyUpper] then
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

-- Initial update
updateZoneMonsterList()

-- Gestion des événements
frame:RegisterEvent("MINIMAP_ZONE_CHANGED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event)
    if "MINIMAP_ZONE_CHANGED" or "PLAYER_ENTERING_WORLD" then
        updateZoneMonsterList()
		 if BigMessageFrame and BigMessageFrame:IsShown() then
            BigMessageFrame:Hide()
        end
    end
end)

-- /unitscan command
local function colorText(text, color)
    -- color = hex couleur sur 8 caractères, ex: "FF00FF00" (alpha + RGB)
    return "|c" .. color .. text .. "|r"
end

function unitscan.printCommands()
    DEFAULT_CHAT_FRAME:AddMessage("Available commands:", 1, 1, 0) -- Jaune (RGB 255,255,0)

    unitscan.print(
        colorText("/unitscan", "FF00BFFF") .. " - " .. -- bleu clair
        colorText("Show this list of mobs in the zone", "FFFFFFFF") -- blanc
    )
    unitscan.print(
        colorText("/unitscan on / off", "FF00BFFF") .. " - " ..
        colorText("Enable / Disable the addon", "FFFFFFFF")
    )
    unitscan.print(
        colorText("/unitsound 1, 2, 3 or 4", "FF00BFFF") .. " - " ..
        colorText("Select the alert sound or show current sound", "FFFFFFFF")
    )
	unitscan.print(
        colorText("/unitalert on | off", "FF00BFFF") .. " - " ..
        colorText("Enable or disable Unit Alerts", "FFFFFFFF")
    )
	unitscan.print(
		colorText("/unitmode nm | hc", "FF00BFFF") .. " - " ..
		colorText("Switch between normal and hardcore modes", "FFFFFFFF")
	)
end

SLASH_UNITSCAN1 = '/unitscan'
function SlashCmdList.UNITSCAN(parameter)
    local _, _, name = string.find(parameter, '^%s*(.-)%s*$')  -- trim spaces

    -- Assurer que la DB est bien initialisée
    unitscanDB.unitscan = unitscanDB.unitscan or {}

    if name == 'on' then
        unitscan.scan = true
        unitscanDB.unitscan.scan = true
        unitscan.print(colorText("Addon enabled.", "FF00FF00")) -- vert

    elseif name == 'off' then
        if BigMessageFrame and BigMessageFrame:IsShown() then
            BigMessageFrame:Hide()
        end
        unitscan.scan = false
        unitscanDB.unitscan.scan = false
        unitscan.print(colorText("Addon disabled.", "FFFF0000")) -- rouge

    elseif name == 'help' then
        unitscan.printCommands()

    elseif name == '' or name == nil then
        if  frame:IsShown() then
			frame:Hide()
        else
            updateZoneMonsterList()
			frame:Show()
        end
    else
        unitscan.toggle_target(name)
    end
end


SLASH_UNITSCANTARGET1 = '/unitscantarget'
function SlashCmdList.UNITSCANTARGET()
    if unitscan.foundTarget then
        TargetByName(unitscan.foundTarget, true)
    else
        unitscan.print(colorText("No target found yet.", "FFFF4500")) -- orange rouge
    end
end

function unitscan.OnLoad()
    if not unitscanDB then
        unitscanDB = {}
    end

    unitscan.selected_sound = unitscanDB.selected_sound or "scourge_horn.ogg"
    unitscan.selected_sound_name = unitscanDB.selected_sound_name or "Scourge Horn"
end

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
        ["3"] = "gruntling_horn_bb.ogg",
		["4"] = ""
    }

    local soundNames = {
        ["1"] = "Scourge Horn",
        ["2"] = "Event Wardrum Ogre",
        ["3"] = "Gruntling Horn",
		["4"] = "Mute"
    }

    if choice and sounds[choice] then
        unitscan.selected_sound = sounds[choice]
        unitscan.selected_sound_name = soundNames[choice]

        unitscanDB.selected_sound = unitscan.selected_sound
        unitscanDB.selected_sound_name = unitscan.selected_sound_name

        unitscan.print(colorText("Sound changed to option " .. choice .. ": " .. unitscan.selected_sound_name, "FF00FF00")) -- vert

		if unitscan.selected_sound then
			unitscan.play_sound()
		end
    else
        unitscan.print(colorText("Current sound: " .. (unitscan.selected_sound_name or "Unknown"), "FFFFFF00")) -- jaune doré
        unitscan.print(colorText("Choose a sound with /unitsound 1, 2, 3 or 4:", "FFFFFFFF")) -- blanc
        unitscan.print(colorText("1 = Scourge Horn", "FF00BFFF")) -- bleu clair
        unitscan.print(colorText("2 = Event Wardrum Ogre", "FF00BFFF"))
        unitscan.print(colorText("3 = Gruntling Horn", "FF00BFFF"))
		unitscan.print(colorText("4 = Mute", "FF00BFFF"))
    end
end

SLASH_UNISCANBIGMSG1 = "/unitalert"
SlashCmdList["UNISCANBIGMSG"] = function(msg)
    msg = string.lower(msg or "")
    if msg == "on" then
        unitscan.bigMessageEnabled = true
		unitscanDB.bigMessageEnabled = true
        print("|cff00ff00Unit Alert enabled|r")
    elseif msg == "off" then
        unitscan.bigMessageEnabled = false
		unitscanDB.bigMessageEnabled = false
        print("|cffff0000Unit Alert disabled|r")
    else
        print("Usage: /unitalert on | off")
    end
end

SLASH_UNITSCANMODE1 = "/unitmode"
SlashCmdList["UNITSCANMODE"] = function(msg)
    msg = strlower(msg)
    if msg == "hc" or msg == "hardcore" then
        unitscanDB.zoneTargetMode = "hardcore"
        updateZoneMonsterList()
        unitscan.print("Mode changed to: |cffff0000Hardcore|r")
    elseif msg == "normal" or msg == "nm" then
        unitscanDB.zoneTargetMode = "normal"
        updateZoneMonsterList()
        unitscan.print("Mode changed to: |cff00ff00Normal|r")
    else
        unitscan.print("Usage: /unitmode normal | hc")
        return
    end
    unitscan.load_zonetargets()
end

-- OnLoad call
if unitscan.OnLoad then
    unitscan.OnLoad()
end