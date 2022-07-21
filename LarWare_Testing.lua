local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local GameId = tonumber(game.PlaceId)

local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/666walker/ZepsyyCodesLUA_Modified/main/code", true))()

local function RayCast(Point1, Point2, WL)
    local Cast = Ray.new(Point1, (Point2 - Point1).Unit * 10000)
    return workspace:FindPartOnRayWithIgnoreList(Cast, WL, false, true)
end

local SupportedGames = {
    [5872075530] = {function(Window) -- anarchy
        
    end, {"TriggerBot"}},

    [2262441883] = {function(Window) -- es

    end, {"TriggerBot"}},

    [3297964905] = {function(Window) -- weaponry

    end, {"TriggerBot"}},

    [2996067865] = {function(Window) -- th3ltgrounds
        
    end, {"TriggerBot"}},
}

local GlobalTabs = {
    ["TriggerBot"] = function()
        local TriggerRenderConn

        local TriggerBot = false
        local TriggerBotWallCheck = false

        local AimAssist = false

        local TriggerBotTab = Window:NewTab({
            Title = "Trigger Bot"
        })

        TriggerBotTab:Toggle({
            Text = "Trigger Bot",
            Callback = function(boolean)
                TriggerBot = boolean

                if boolean then
                    TriggerRenderConn = RunService.RenderStepped:Connect(function()
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
                    TriggerRenderConn:Disconnect()
                end
            end
        })

        CombatTab:Toggle({
            Text = "Wall Checks",
            Callback = function(boolean)
                TriggerBotWallCheck = boolean
            end
        })
    end
}

local function CreateUI()
    local NameGame = game:GetService("MarketplaceService"):GetProductInfo(GameId).Name

    if SupportedGames[GameId] then
        local Window = UILib:Create({
            Title = "LarWare",
            GameName = NameGame,
        })
    
        local WelcomeTab = Window:NewTab({
            Title = "Welcome!"
        })

        SupportedGames[GameId][1]()

        if SupportedGames[GameId][2] then
            for _, TabName in pairs(SupportedGames[GameId][2]) do
                GlobalTabs[TabName]()
            end
        end
    else
        local Window = UILib:Create({
            Title = "LarWare",
            GameName = "Unsupported Game",
        })
    end
end

CreateUI()