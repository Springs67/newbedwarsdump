local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameCoreSharedConfig
local u5 = v3.getAbilityMeta
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "ScriptAbilityController"
    end,
    ["__index"] = u8
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p13)
    p13.Name = "ScriptAbilityController"
    p13.abilityMaidMap = {}
end
function u10.KnitStart(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u5
        [4] = u7
        [5] = u2
    --]]
    u8.KnitStart(u14)
    u9.Client:OnEvent("ScriptBulkUpdateAbility", function(p15) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        for v16, v17 in p15.abilityDtos do
            local _ = v16 - 1
            u14:convertDtoToAbilityMeta(v17)
        end
    end)
    u9.Client:OnEvent("ScriptCreateAbility", function(p18) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:convertDtoToAbilityMeta(p18.abilityDto)
    end)
    u9.Client:OnEvent("ScriptEnableAbility", function(p19) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u2
            [4] = u14
        --]]
        if not u5(p19.abilityName) then
            return nil
        end
        local u20 = u7.new()
        local v21 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v22 = p19.abilityName
        local v23 = {
            ["abilityType"] = p19.abilityType or "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = p19.iconImage
            }
        }
        v21:enableAbility(v22, v23):andThen(function(p24) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:GiveTask(p24)
        end)
        u14.abilityMaidMap[p19.abilityName] = u20
    end)
    u9.Client:OnEvent("ScriptRemoveAbility", function(p25) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        local v26 = u14.abilityMaidMap[p25.abilityName]
        if v26 ~= nil then
            v26:DoCleaning()
        end
    end)
end
function u10.convertDtoToAbilityMeta(_, p27) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v28 = u4.AbilityMetatable
    local v29 = p27.name
    local v30 = {
        ["actionBarName"] = p27.name,
        ["usableProgress"] = {
            ["displayProgressOnButton"] = true,
            ["progressNeededPerUse"] = p27.progressNeededPerUse,
            ["stacks"] = p27.maxProgress / p27.progressNeededPerUse,
            ["initialProgress"] = p27.maxProgress
        }
    }
    v28[v29] = v30
end
v6.CreateController(u10.new())
return nil