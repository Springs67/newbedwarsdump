local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayer
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "BlockHuntHunterController"
    end,
    ["__index"] = u4
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    u4.constructor(p12, { u6.BLOCK_HUNT })
    p12.Name = "BlockHuntHunterController"
end
function u9.onGameInit(_) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u7
        [4] = u2
        [5] = u5
    --]]
    u8.Client:Get("BHSetHunter"):Connect(function(u13) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u2
            [4] = u5
        --]]
        local v14 = u3.Controllers.TeamController:getPlayerTeam(u13.player)
        if v14 ~= nil then
            v14 = v14.id
        end
        if v14 ~= u7.HUNTERS then
            return nil
        end
        u2(function(p15) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u5
            --]]
            if p15 == u13.player then
                return nil
            end
            if p15.Team == u13.player.Team then
                return nil
            end
            local v16 = u5:getEntity(p15)
            if not v16 then
                return nil
            end
            v16:hideNametag()
        end)
    end)
end
u3.CreateController(u9.new())
return nil