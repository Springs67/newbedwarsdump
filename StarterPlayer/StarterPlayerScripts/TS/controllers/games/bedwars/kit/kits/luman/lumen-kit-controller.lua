local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.ReplicatedStorage
local u8 = v5.RunService
local u9 = v5.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u16 = v1.import(script, script.Parent, "ui", "lumen-progress-bar").LumenProgressBar
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "LumenKitController"
    end,
    ["__index"] = u15
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
    --]]
    u15.constructor(p20, u13.LUMEN)
    p20.Name = "LumenKitController"
    p20.upgradeRequirement = 10
end
function u17.onKitLocalActivated(_, p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
        [3] = u16
    --]]
    p21:GiveTask((u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u10(u16))))
end
function u17.onKitLocalDeactivated(_) --[[ Line: 41 ]] end
function u17.onKitReplicationActivated(u22, u23) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
    --]]
    u14.Client:OnEvent("LumenProgress", function(p24) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u22
        --]]
        u11:dispatch({
            ["type"] = "KitLumenIncrementProgress",
            ["progress"] = p24.incrementProgress / u22.upgradeRequirement
        })
    end):andThen(function(p25) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:GiveTask(p25)
    end)
    u14.Client:OnEvent("PlayLumenEffect", function(p26) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:createEffect(p26)
    end):andThen(function(p27) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:GiveTask(p27)
    end)
end
function u17.onKitReplicationDeactivated(_) --[[ Line: 58 ]] end
function u17.onInnateAbilityEnabled(_, _, _) --[[ Line: 60 ]] end
function u17.onAbilityUsed(_, _, _) --[[ Line: 62 ]] end
function u17.createEffect(p28, p29) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u3
        [4] = u6
        [5] = u9
        [6] = u8
    --]]
    local u30 = u12:getEntity(p29)
    if not u30 then
        return nil
    end
    p28:playAscendEffect(u30)
    local u31 = u7.Assets.Effects.LumenUpgrade:Clone()
    local v32 = { u31 }
    local v33 = #v32
    local v34 = u31:GetDescendants()
    table.move(v34, 1, #v34, v33 + 1, v32)
    for v35, v36 in v32 do
        local _ = v35 - 1
        u3:setQueryIgnored(v36, true)
    end
    for v37, v38 in u31:GetDescendants() do
        local _ = v37 - 1
        if v38:IsA("Part") then
            v38:SetAttribute("InitialTransparency", 1)
        end
    end
    u6:AddTag(u31, "FirstPersonHidden")
    u31:PivotTo(u30:getInstance():GetPrimaryPartCFrame())
    u31.Parent = u9
    u8.Heartbeat:Connect(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
        --]]
        if not u30:isAlive() or u30:getInstance().PrimaryPart == nil then
            return nil
        end
        u31:PivotTo(u30:getInstance():GetPivot())
    end)
end
function u17.playAscendEffect(_, u39) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u9
        [4] = u8
    --]]
    local u40 = u7.Assets.Effects.LumenAscend:Clone()
    u6:AddTag(u40, "FirstPersonHidden")
    u40:PivotTo(u39:getInstance():GetPrimaryPartCFrame())
    u40.Parent = u9
    local u41 = tick() + 1
    local u42 = nil
    u42 = u8.Heartbeat:Connect(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u40
            [3] = u42
            [4] = u39
        --]]
        if u41 < tick() then
            u40:Destroy()
            u42:Disconnect()
        end
        if tick() < u41 then
            u40:PivotTo(u39:getInstance():GetPivot())
        end
    end)
end
v4.CreateController(u17.new())
return nil