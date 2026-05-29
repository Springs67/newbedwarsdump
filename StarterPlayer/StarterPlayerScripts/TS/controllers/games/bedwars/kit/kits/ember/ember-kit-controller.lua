local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.ReplicatedStorage
local u9 = v6.RunService
local u10 = v6.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u17 = v1.import(script, script.Parent, "emberUI", "ember-progress-bar").EmberProgressBar
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "EmberKitController"
    end,
    ["__index"] = u16
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
        [3] = u5
    --]]
    u16.constructor(p21, u14.EMBER)
    p21.Name = "EmberKitController"
    p21.upgradeRequirement = 10
    p21.maid = u5.new()
end
function u18.onKitLocalActivated(_, p22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u17
    --]]
    p22:GiveTask((u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u11(u17))))
end
function u18.onKitLocalDeactivated(_) --[[ Line: 43 ]] end
function u18.onKitReplicationActivated(u23, u24) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
    --]]
    u15.Client:OnEvent("EmberProgress", function(p25) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u23
        --]]
        u12:dispatch({
            ["type"] = "KitEmberIncrementProgress",
            ["progress"] = p25.incrementProgress / u23.upgradeRequirement
        })
    end):andThen(function(p26) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:GiveTask(p26)
    end)
    u15.Client:OnEvent("PlayEmberEffect", function(p27) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:createEffect(p27.player)
    end):andThen(function(p28) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:GiveTask(p28)
    end)
end
function u18.onKitReplicationDeactivated(_) --[[ Line: 60 ]] end
function u18.onInnateAbilityEnabled(_, _, _) --[[ Line: 62 ]] end
function u18.onAbilityUsed(_, _, _) --[[ Line: 64 ]] end
function u18.createEffect(p29, p30) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
        [3] = u3
        [4] = u7
        [5] = u10
        [6] = u9
    --]]
    local u31 = u13:getEntity(p30)
    if not u31 then
        return nil
    end
    p29:playAscendEffect(u31)
    local u32 = u8.Assets.Effects.EmberUpgrade:Clone()
    local v33 = { u32 }
    local v34 = #v33
    local v35 = u32:GetDescendants()
    table.move(v35, 1, #v35, v34 + 1, v33)
    for v36, v37 in v33 do
        local _ = v36 - 1
        u3:setQueryIgnored(v37, true)
    end
    for v38, v39 in u32:GetDescendants() do
        local _ = v38 - 1
        if v39:IsA("Part") then
            v39:SetAttribute("InitialTransparency", 1)
        end
    end
    u7:AddTag(u32, "FirstPersonHidden")
    u32:PivotTo(u31:getInstance():GetPrimaryPartCFrame())
    u32.Parent = u10
    u9.Heartbeat:Connect(function() --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u32
        --]]
        if not u31:isAlive() or u31:getInstance().PrimaryPart == nil then
            u32:Destroy()
            return nil
        end
        u32:PivotTo(u31:getInstance():GetPrimaryPartCFrame())
    end)
end
function u18.playAscendEffect(_, u40) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u10
        [4] = u9
    --]]
    local u41 = u8.Assets.Effects.EmberAscend:Clone()
    u7:AddTag(u41, "FirstPersonHidden")
    u41:PivotTo(u40:getInstance():GetPrimaryPartCFrame())
    u41.Parent = u10
    local u42 = tick() + 1
    u9.Heartbeat:Connect(function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u41
            [3] = u40
        --]]
        if u42 < tick() then
            u41:Destroy()
        end
        if tick() < u42 then
            u41:PivotTo(u40:getInstance():GetPrimaryPartCFrame())
        end
    end)
end
v4.CreateController(u18.new())
return nil