local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local GameId = tonumber(game.PlaceId)

local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/666walker/ZepsyyCodesLUA_Modified/main/code", true))()

local function RayCast(Point1, Point2, WL)
    local Cast = Ray.new(Point1, (Point2 - Point1).Unit * 9999)
    return workspace:FindPartOnRayWithIgnoreList(Cast, WL, false, true)
end

local function HumanoidCheck(Part, TeamCheck)
    if Part and Part.Parent then
        local Parent = Part.Parent
        local Humanoid = Parent:FindFirstChild("Humanoid")
        local HPlayer = Players:GetPlayerFromCharacter(Parent)

        if Humanoid then
            if TeamCheck then
                if not (Player.TeamColor == HPlayer.TeamColor) then
                    return Parent, Humanoid
                end
            else
                return Parent, Humanoid
            end
        else
            if Part.Parent.Parent then
                Parent = Part.Parent.Parent
                Humanoid = Parent:FindFirstChild("Humanoid")

                if Humanoid then
                    if TeamCheck then
                        if not (Player.TeamColor == HPlayer.TeamColor) then
                            return Parent, Humanoid
                        end
                    else
                        return Parent, Humanoid
                    end
                end
            end
        end
    end

    return nil
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

    [7142695791] = {function(Window) -- th3ltgrounds
        
    end, {"TriggerBot"}},

    [155615604] = {function(Window) -- pl
        
    end, {"TriggerBot"}},

}

local GlobalTabs = {
    ["TriggerBot"] = function(Window)
        local TriggerRenderConn

        local TriggerBotValue = false
        local TriggerBotWallCheck = false
        local TriggerBotTeamCheck = false
        local TriggerBotDelay = 0
        local TriggerBotDistanceCheck = 1500
        local TriggerBotDebounce = false
        local TriggerBotShotDelay = 100

        local MouseDown = false

        local TriggerBotTab = Window:NewTab({
            Title = "Trigger Bot"
        })

        TriggerBotTab:Toggle({
            Text = "Trigger Bot",
            Callback = function(boolean)
                TriggerBotValue = boolean

                if TriggerBotValue then
                    TriggerRenderConn = RunService.RenderStepped:Connect(function()
                        if Mouse.Target and Player.Character:FindFirstChildOfClass("Tool") then
                            if TriggerBotWallCheck then
                                if (Mouse.Hit.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= TriggerBotDistanceCheck then
                                    print("Distance good")
                                    local Hit, Position = RayCast(Player.Character.HumanoidRootPart.Position, Mouse.Hit.Position, {Player.Character})
                                    local Parent, Humanoid = HumanoidCheck(Hit, TriggerBotTeamCheck)

                                    if Humanoid then
                                        print("Humanoid found")
                                        if TriggerBotValue then
                                            task.delay(TriggerBotDelay/1000, function()
                                                if not TriggerBotDebounce then
                                                    TriggerBotDebounce = true
                                                    if HumanoidCheck(Mouse.Target, TriggerBotTeamCheck) then
                                                        print("yes")
                                                        mouse1press()
                                                        MouseDown = true
                                                    else
                                                        if MouseDown then
                                                            print("no")
                                                            mouse1release()
                                                            MouseDown = false
                                                        end
                                                    end

                                                    task.wait(TriggerBotShotDelay/1000)
                                                    TriggerBotDebounce = false
                                                end
                                            end)
                                        end
                                    elseif not Humanoid then
                                        if MouseDown then
                                            print("no")
                                            mouse1release()
                                            MouseDown = false
                                        end
                                    end
                                end
                             else
                                if (Mouse.Hit.Position - Player.Character.HumanoidRootPart.Position).Magnitude <= TriggerBotDistanceCheck then
                                    print("Distance good")
                                    local Parent, Humanoid = HumanoidCheck(Mouse.Target, TriggerBotTeamCheck)
                                    if Humanoid then
                                        print("humanoid found")
                                        if TriggerBotValue then
                                            print("triggerbot")
                                            task.delay(TriggerBotDelay/1000, function()
                                                if not TriggerBotDebounce then
                                                    TriggerBotDebounce = true
                                                    if HumanoidCheck(Mouse.Target, TriggerBotTeamCheck) then
                                                        print("yes")
                                                        mouse1press()
                                                        MouseDown = true
                                                    else
                                                        if MouseDown then
                                                            print("no")
                                                            mouse1release()
                                                            MouseDown = false
                                                        end
                                                    end

                                                    task.wait(TriggerBotShotDelay/1000)
                                                    TriggerBotDebounce = false
                                                end
                                            end)
                                        end
                                    elseif not Humanoid then
                                        if MouseDown then
                                            print("no")
                                            mouse1release()
                                            MouseDown = false
                                        end
                                    end
                                end
                            end
                        end
                    end)
                else
                    TriggerRenderConn:Disconnect()
                end
            end
        })

        TriggerBotTab:Toggle({
            Text = "Wall Checks",
            Callback = function(boolean)
                TriggerBotWallCheck = boolean
            end
        })

        TriggerBotTab:Toggle({
            Text = "Team Check",
            Callback = function(boolean)
                TriggerBotTeamCheck = boolean
            end
        })

        TriggerBotTab:Slider({
            Text = "Delay (in ms)",
            Def = 0,

            Callback = function(Value)
                TriggerBotDelay = Value
            end
        })

        TriggerBotTab:Slider({
            Text = "Distance Check (in studs)",
            Min = 100,
            Max = 1500,
            Def = 1500,

            Callback = function(Value)
                TriggerBotDistanceCheck = tonumber(Value)
            end
        })

        TriggerBotTab:Slider({
            Text = "Shot Delay (in ms)",
            Min = 100,
            Max = 2000,
            Def = 100,

            Callback = function(Value)
                TriggerBotShotDelay = Value
            end
        })
    end,

    ["CustomCrosshair"] = function(Window)
        local CustomCrossTab = Window:NewTab({
            Title = "Custom Crosshair"
        })


    end,
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
                GlobalTabs[TabName](Window)
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