local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.MarketplaceService
local u5 = v3.Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-dev-products").BattlePassLevelDevProducts
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BattlePassController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
    --]]
    u6.constructor(p14)
    p14.Name = "BattlePassController"
    p14.remotes = u10.Client:GetNamespace("BattlePass")
end
function u11.KnitStart(p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u9
    --]]
    u5.LocalPlayer:GetAttributeChangedSignal("BattlePassXP"):Connect(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
        --]]
        u7:dispatch({
            ["type"] = "BattlePassSetXP",
            ["experience"] = u5.LocalPlayer:GetAttribute("BattlePassXP")
        })
    end)
    u7:dispatch({
        ["type"] = "BattlePassSetPaid",
        ["paid"] = u5.LocalPlayer:GetAttribute("BattlePassPaid")
    })
    u5.LocalPlayer:GetAttributeChangedSignal("BattlePassPaid"):Connect(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
        --]]
        u7:dispatch({
            ["type"] = "BattlePassSetPaid",
            ["paid"] = u5.LocalPlayer:GetAttribute("BattlePassPaid")
        })
    end)
    if u9.isActiveBattlePass() then
        p15.remotes:WaitFor("GetBattlePass"):andThen(function(p16) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            u7:dispatch({
                ["type"] = "BattlePassUpdateAll",
                ["battlePass"] = p16:CallServer()
            })
        end)
    end
end
function u11.promptPurchaseToLevel(_, p17) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u8
        [4] = u4
        [5] = u5
    --]]
    if not u9.isActiveBattlePass() then
        return nil
    end
    local v18 = p17 - u7:getState().BattlePass.level
    if v18 > 0 and v18 - 1 < #u8 then
        local v19 = u8[v18 - 1 + 1]
        u4:PromptProductPurchase(u5.LocalPlayer, v19)
    end
end
function u11.promptBattlePassPurchase(_) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u4
        [4] = u5
    --]]
    if not u7:getState().BattlePass.paid and u9.isActiveBattlePass() then
        u4:PromptGamePassPurchase(u5.LocalPlayer, u9.BATTLE_PASS_SEASON_GAMEPASS)
    end
end
v2.CreateController(u11.new())
return nil