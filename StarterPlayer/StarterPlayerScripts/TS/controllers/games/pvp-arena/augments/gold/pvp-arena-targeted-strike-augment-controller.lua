local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "PvPArenaTargetedStrikeAugmentController"
    end,
    ["__index"] = u9
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
        [1] = u9
        [2] = u7
        [3] = u3
    --]]
    u9.constructor(p13, u7.TARGETED_STRIKE)
    p13.Name = "PvPArenaTargetedStrikeAugmentController"
    p13.billboardMaid = u3.new()
end
function u10.onGameInit(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.Client:Get("PvPArenaTargetedStrikeTriggered"):Connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u14
        --]]
        if u5.LocalPlayer == p15.applyingPlayer then
            u14:applyEffects(p15.markedPlayer)
        end
    end)
    u8.Client:Get("PvPArenaTargetedStrikeRemoved"):Connect(function(_) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14.billboardMaid:DoCleaning()
    end)
end
function u10.onActivated(_) --[[ Line: 40 ]] end
function u10.applyEffects(p16, p17) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    local v18 = u6:getEntity(p17)
    if v18 ~= nil then
        v18 = v18:getInstance()
    end
    if not v18 then
        return nil
    end
    local v19 = u4
    local v20 = {
        ["ResetOnSpawn"] = false,
        ["AlwaysOnTop"] = true,
        ["Parent"] = v18.PrimaryPart,
        ["Size"] = UDim2.fromScale(3, 3),
        ["Children"] = { u4("ImageLabel", {
                ["ImageTransparency"] = 0.25,
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://16830265561",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["ImageColor3"] = Color3.fromRGB(255, 0, 0)
            }) }
    }
    local u21 = v19("BillboardGui", v20)
    p16.billboardMaid:GiveTask(function() --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:Destroy()
    end)
end
v2.CreateController(u10.new())
return nil