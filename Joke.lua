local animationsCount = 5
local animations = {}
local frame, animationGroup, alpha1, scale1, rotation2

for i = 1, animationsCount do

    UIParent = UIParent

    animationGroup = UIParent:CreateAnimationGroup()

    alpha1 = animationGroup:CreateAnimation("Alpha")
    alpha1:SetChange(1)
    alpha1:SetDuration(0)
    alpha1:SetOrder(1)

    --[[scale1 = animationGroup:CreateAnimation("Scale") -- убиваем фпс
    scale1:SetScale(1.5, 1.5)
    scale1:SetDuration(0)
    scale1:SetOrder(1)]]

    rotation2 = animationGroup:CreateAnimation("Rotation")
    rotation2:SetDegrees(120000)
    rotation2:SetDuration(300)
    rotation2:SetOrder(2)

    animations[i] = {frame = frame, animationGroup = animationGroup}
end

local animationsCount2 = 5
local animations2 = {}
local frame2, animationGroup2, alpha2, rotation3

for i = 1, animationsCount2 do

    MainMenuBarArtFrame = MainMenuBarArtFrame

    animationGroup2 = MainMenuBarArtFrame:CreateAnimationGroup()

    alpha2 = animationGroup2:CreateAnimation("Alpha")
    alpha2:SetChange(1)
    alpha2:SetDuration(0)
    alpha2:SetOrder(1)

    rotation3 = animationGroup2:CreateAnimation("Rotation")
    rotation3:SetDegrees(120000)
    rotation3:SetDuration(300)
    rotation3:SetOrder(2)

    animations2[i] = {frame2 = frame2, animationGroup2 = animationGroup2}
end

local SLIDETIME = 300
local GONE_YPOS = -361
local Joke_XPOS = 0
local Joke_YPOS = 0

local function GetAnimPos(self, fraction)
    return "BOTTOMRIGHT", Joke_XPOS, (math.sin (fraction * 300 + 300) - 1) * GONE_YPOS + Joke_YPOS
end

local AnimDataTable = {
    totalTime = SLIDETIME,
    updateFunc = "SetPoint",
    getPosFunc = GetAnimPos,
}

local frame3 = CreateFrame("Frame", nil, UIParent)
frame3:SetPoint("CENTER")
frame3:SetFrameStrata("TOOLTIP")
frame3:SetSize(3840, 2160)
frame3.texture = frame3:CreateTexture()
frame3.texture:SetAllPoints()
frame3.texture:SetTexture(0.67, 0.83, 0.45, 0.0)
frame3.texture:Hide()

local function RUNDOGSHIT(self, event, msg)
    if event == "CHAT_MSG_BG_SYSTEM_NEUTRAL" or event == "CHAT_MSG_RAID_BOSS_EMOTE" then

        if msg == "Битва на арене началась!" or msg == "The Arena battle has begun!" or msg == "The battle in the arena has begun!" then

            animationGroup:Play()
            animationGroup2:Play()
            SetUpAnimation(UIParent, AnimDataTable, nil, true)

            self.texture:Show()

            SetCVar("Sound_EnableAllSound", 1) -- включаем звук
            SetCVar("Sound_EnableSoundWhenGameIsInBG", 1) -- включаем звук в фоновом режиме
            SetCVar("Sound_MasterVolume", 1) -- увеличиваем громкость на максимум
            PlaySoundFile("Interface\\AddOns\\Joke\\Media\\ой так нравится....mp3", "Master") -- проигрываем аудиофайл
            frame3:OnUpdate() -- ставим аудиофайл на бесконечный репит через 39.5сек

            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
            print("|cffFF0000ой так нравится...|r")
        end

    elseif event == "ADDON_ACTION_FORBIDDEN" then

        StaticPopup1:Hide() -- скрываем надоедливый эррор фрейм
    end
end
frame3:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
frame3:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
frame3:RegisterEvent("ADDON_ACTION_FORBIDDEN")
frame3:SetScript("OnEvent", RUNDOGSHIT)

-- сам репит
function frame3.OnUpdate(Frame)

    local Update = 39.5

    Frame:SetScript("OnUpdate", function(self, elapsed)

        Update = Update - elapsed

        if Update <= 0 then
            PlaySoundFile("Interface\\AddOns\\Joke\\Media\\ой так нравится....mp3", "Master")
            self:SetScript("OnUpdate", nil)
            frame3:OnUpdate()
        end
    end)
end
