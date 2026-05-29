local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u12 = v1.import(script, script.Parent, "ui", "angel-ui").AngelKitApp
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "AngelController"
    end,
    ["__index"] = u11
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u4
    --]]
    u11.constructor(p16, u9.ANGEL)
    p16.Name = "AngelController"
    p16.maid = u4.new()
    p16.didFirstLevelUp = false
end
function u13.KnitStart(p17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p17)
end
function u13.onKitLocalActivated(u18, p19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u12
    --]]
    p19:GiveTask(task.defer(function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u12
            [4] = u18
        --]]
        local v20 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5(u12, {
            ["undefined"] = nil
        }))
        u18.maid:GiveTask(v20)
    end))
end
function u13.onKitLocalDeactivated(_) --[[ Line: 45 ]] end
function u13.onKitReplicationActivated(u21, u22) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u2
        [4] = u7
        [5] = u8
    --]]
    u10.Client:OnEvent("AngelProgress", function(p23) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u21
            [3] = u2
            [4] = u7
            [5] = u8
        --]]
        u6:dispatch({
            ["type"] = "KitAngelIncrementProgress",
            ["progress"] = p23.newProgress
        })
        if p23.levelUp and not u21.didFirstLevelUp then
            u21.didFirstLevelUp = true
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u7.TRINITY_SWAP_FORM, u8[u7.TRINITY_SWAP_FORM].triggerConfig):andThen(function(p24) --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21.maid:GiveTask(p24)
            end)
        end
    end):andThen(function(p25) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:GiveTask(p25)
    end)
end
function u13.onKitReplicationDeactivated(_) --[[ Line: 68 ]] end
function u13.onInnateAbilityEnabled(_, _, _) --[[ Line: 70 ]] end
function u13.onAbilityUsed(_, _, _) --[[ Line: 72 ]] end
function u13.onKitDisabled(p26) --[[ Line: 74 ]]
    p26.maid:DoCleaning()
end
v3.CreateController(u13.new())
return nil