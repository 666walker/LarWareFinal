local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = UILib.CreateLib("LarWare", "Serpent")

-- Tab Creation
local Tab_Welcome = Window:NewTab("Welcome!")

local Tab_Player = Window:NewTab("Player")
local Tab_Combat = Window:NewTab("Combat")
local Tab_Environment = Window:NewTab("Environment")
local Tab_Fun = Window:NewTab("Fun")

--Player Section
local Player_Speed = Tab_Player:NewSection("Speed")
local Player_JumpPower = Tab_Player:NewSection("Jump Power")
local Player_SemiGod = Tab_Player:NewSection("Semi-God")

--Combat Section
local Combat_Aimbot = Tab_Combat:NewSection("Aimbot")
local Combat_AntiAim = Tab_Combat:NewSection("Anti-Aim")

--Environment Section
local Environment_Weather = Tab_Environment:NewSection("Weather")

--Fun Section

--Welcome Label
local Tab_Welcome = Tab_Player:NewSection("WAWHDAWD")

--Player Label

--Combat Label

--Environment Label

--Fun Label

local Player_SpeedValue = false
local Player_SemiGodValue = false
local Player_JumpPowerValue = false

--Toggles
Player_Speed:NewToggle("On/Off", "ToggleInfo", function(state)
    Player_SpeedValue = state
end)

Player_JumpPower:NewToggle("On/Off", "Jump Power", function(state)
    Player_JumpPowerValue = state
end)

Player_SemiGod:NewToggle("On/Off", "Semi-God", function(state)
    Player_SemiGodValue = state
end)

--Sliders
Player_Speed:NewSlider("Speed", "Speed", 100, 0, function(Value)
    if Player_SpeedValue then

    end
end)

Player_JumpPower:NewSlider("Jump Power", "Jump", 300, 50, function(Value)
    if Player_JumpPowerValue then

    end
end)
