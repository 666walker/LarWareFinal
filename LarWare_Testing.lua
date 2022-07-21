local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local GameId = game.GameId

local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZepsyyCodesLUA/Ellik/main/source.lua', true))()

local function RayCast(Point1, Point2, WL)
    local Cast = Ray.new(Point1, (Point2 - Point1).Unit * 10000)
    return workspace:FindPartOnRayWithIgnoreList(Cast, WL, false, true)
end

local SupportedGames = {
    [5872075530] = function(Window) -- anarchy
        local TriggerBot = false
        local TriggerBotWallCheck = false

        local AimAssist = false

        local CombatTab = Window:NewTab({
            Title = "Combat"
        })

        CombatTab:Toggle({
            Text = "Trigger Bot",
            Callback = function(boolean)
                TriggerBot = boolean

                local MouseConn
                if Triggerbot then
                    MouseConn = RunService.RenderStepped:Connect(function()
                        if Mouse.Target and Player.Character:FindFirstChildOfClass("Tool") then
                            if TriggerBotWallCheck then
                                local Hit, Position = RayCast(Player.HumanoidRootPart.Position, Mouse.Hit.Position, Player.Character)

                                if Hit.Parent:FindFirstChild("Humanoid") or Hit.Parent.Parent:FindFirstChild("Humanoid") then
                                    mouse1click()
                                end
                            else
                                mouse1click()
                            end
                        end
                    end)
                else
                    MouseConn:Disconnect()
                end
            end
        })

        CombatTab:Toggle({
            Text = "WallChecks",
            Callback = function(boolean)
                TriggerBotWallCheck = boolean
            end
        })
    end,

    [2262441883] = function(Window)
        
    end,

    [3297964905] = function(Window)
        
    end,

}

local function CreateUI()
    print("NiggaFied")
    for Id, Function in pairs(SupportedGames) do
        if Id == GameId then
            local GameName = game:GetService("MarketplaceService"):GetProductInfo(GameId).Name

            local Window = UILib:Create({
                Title = "LarWare "..GameName
            })

            local WelcomeTab = Window:NewTab({
                Title = "Welcome!"
            })

            Function(Window)
        end
    end
end

CreateUI()