local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u11 = v1.import(script, script.Parent, "og", "og-nametag").OGNameTag
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ClassicBedwarsController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
    --]]
    u7.constructor(p15, { u9.BEDWARS })
    p15.Name = "ClassicBedwarsController"
    p15.forceRescaleMaid = {}
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u5
        [4] = u10
        [5] = u8
        [6] = u4
    --]]
    u7.KnitStart(u16)
    u2(function(p17, p18) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u10
            [3] = u8
            [4] = u16
        --]]
        if u5.Controllers.MatchController:getQueueTypeAsync():expect() ~= u10.BEDWARS_OG_TO4 then
            return nil
        end
        local v19 = u8:getEntity(p17)
        if v19 then
            v19:hideNametag()
            u16:attachOGNametag(p18)
        end
    end)
    u5.Controllers.MatchController:getQueueTypeAsync():andThen(function(p20) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
        --]]
        if p20 == u10.BEDWARS_OG_TO4 then
            u4.Controllers.BedHealthDisplayController:disableBedHealthBillboards()
            u4.Controllers.BedHealthDisplayController:removeBedHealthBillboards()
        end
    end)
end
function u12.attachOGNametag(_, u21) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u11
    --]]
    local u22 = u8:getEntity(u21)
    if u22 ~= nil then
        u22 = u22:getInstance()
    end
    if not u22 then
        return nil
    end
    task.spawn(function() --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u11
            [3] = u22
            [4] = u21
        --]]
        local v23 = {
            ["EntityInstance"] = u22
        }
        u6.mount(u6.createElement(u11, v23), u21:WaitForChild("Head", 3))
    end)
end
u4.CreateController(u12.new())
return nil