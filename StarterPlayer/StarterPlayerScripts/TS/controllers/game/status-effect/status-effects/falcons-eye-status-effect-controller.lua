local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "FalconsEyeStatusEffectController"
    end,
    ["__index"] = u10
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p17)
    p17.Name = "FalconsEyeStatusEffectController"
    p17.maidMap = {}
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
        [3] = u8
        [4] = u9
        [5] = u13
    --]]
    u10.KnitStart(u18)
    u12.Client:Get("FalconsEyeMarked"):Connect(function(p19) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u18
        --]]
        local v20 = u8:GetPlayerFromCharacter(p19.target)
        if u8.LocalPlayer == p19.giver then
            u18:setEffects(p19.target)
        end
        if v20 and u8.LocalPlayer == v20 then
            u18:setEffects(p19.target)
        end
    end)
    u12.Client:Get("FalconsEyeUnmarked"):Connect(function(p21) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u18
        --]]
        local v22 = u8:GetPlayerFromCharacter(p21.target)
        if u8.LocalPlayer ~= p21.giver and u8.LocalPlayer ~= v22 then
            return nil
        end
        local v23 = u18.maidMap[p21.target]
        if not v23 then
            return nil
        end
        v23:DoCleaning()
    end)
    u9.StatusEffectRemoved:connect(function(p24) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u18
        --]]
        if p24.statusEffect == u13.FALCONS_EYE then
            local v25 = u18.maidMap[p24.entityInstance]
            if not v25 then
                return nil
            end
            v25:DoCleaning()
        end
    end)
end
function u14.setEffects(p26, p27, p28, p29) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u11
        [4] = u8
        [5] = u7
        [6] = u4
    --]]
    local v30 = u5
    local v31 = {
        ["ResetOnSpawn"] = false,
        ["AlwaysOnTop"] = true,
        ["Parent"] = p27.PrimaryPart,
        ["Size"] = UDim2.fromScale(3, 3),
        ["Children"] = { u5("ImageLabel", {
                ["ImageTransparency"] = 0.25,
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://16830265561",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = p28 or UDim2.new(1.5, 0, 1.5, 0),
                ["ImageColor3"] = p29 or u2.WHITE
            }) }
    }
    local u32 = v30("BillboardGui", v31)
    local v33 = u11:getPlayerFromEntityInstance(p27)
    if v33 and v33 == u8.LocalPlayer then
        u7:AddTag(u32, "FirstPersonHidden")
    end
    if not p26.maidMap[p27] then
        p26.maidMap[p27] = u4.new()
    end
    p26.maidMap[p27]:GiveTask(function() --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:Destroy()
    end)
end
v3.CreateController(u14.new())
return nil