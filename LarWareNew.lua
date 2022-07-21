local GameId = game.GameId

local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZepsyyCodesLUA/Ellik/main/source.lua', true))()

local SupportedGames = {
    [5872075530] = function(Window) -- anarchy
        local TriggerBot = false
        local AimAssist = false

        local CombatTab = Window:NewTab({
            Title = "Combat"
        })

        CombatTab:Toggle({
            Text = "Trigger Bot",
            Callback = function(boolean)
                TriggerBot = boolean
            end
        })
    end,

    [2262441883] = function(Window)
        
    end,

    [3297964905] = function(Window)
        
    end,

}

local function CreateUI()
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