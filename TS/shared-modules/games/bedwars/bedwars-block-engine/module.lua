local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
u2:getBlockBreakableHook():connect(function(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    if not p4.player then
        return nil
    end
    local v5 = u3.getGamePlayer(p4.player):getTeamId()
    local v6 = u2:getStore():getBlockAt(p4.blockRef.blockPosition)
    if v5 ~= "" and (v5 and (v6 and v6:GetAttribute("Team" .. v5 .. "NoBreak") == true)) then
        p4:setCancelled(true)
    end
    if v6 then
        local v7 = p4.player.UserId
        if v6:GetAttribute("Player" .. tostring(v7) .. "NoBreak") == true then
            p4:setCancelled(true)
        end
    end
end)
return {}