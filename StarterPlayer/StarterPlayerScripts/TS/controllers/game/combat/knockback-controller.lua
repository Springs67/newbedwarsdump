local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "KnockbackController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
    --]]
    u7.constructor(p15)
    p15.Name = "KnockbackController"
    p15.lastKnockbackTime = 0
    p15.recentlyReceivedKnockback = u2.new(0.3)
end
function u12.KnitStart(u16) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u5
        [4] = u6
        [5] = u11
        [6] = u10
    --]]
    u8.On(function(p17, _, p18, p19, p20, p21, p22, _, _, _, _, _, _, _) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u16
            [4] = u6
            [5] = u11
            [6] = u10
        --]]
        local v23 = p18 ~= u9.FALL and (p17 == u5.LocalPlayer.Character and p17.PrimaryPart)
        if v23 then
            local v24
            if p19 then
                local v25 = p19.X
                local v26 = p19.Y
                local v27 = p19.Z
                v24 = Vector3.new(v25, v26, v27)
            else
                v24 = nil
            end
            if v24 == nil and (p20 and p20.PrimaryPart) then
                v24 = p20.PrimaryPart.Position
            end
            local v28
            if p21 == nil then
                v28 = p21
            else
                v28 = p21.disabled
            end
            if not v28 then
                local v29 = u5.LocalPlayer.Character.PrimaryPart
                if v29 ~= nil then
                    v29 = v29.AssemblyMass
                end
                local v30 = (v29 == 0 or (v29 ~= v29 or not v29)) and 0 or v29
                local v31 = u5:GetPlayerFromCharacter(p20)
                if v31 then
                    local v32 = u16.recentlyReceivedKnockback:getValues()
                    if #v32 > 0 and v32[1] ~= v31.UserId then
                        return nil
                    end
                end
                if u6:GetServerTimeNow() - u16.lastKnockbackTime <= 0.05 then
                    return nil
                end
                u16.lastKnockbackTime = u6:GetServerTimeNow()
                if v31 then
                    u16.recentlyReceivedKnockback:add(v31.UserId)
                end
                if p22 ~= nil then
                    u11.Client:Get("AckKnockback"):SendToServer({
                        ["knockbackId"] = p22,
                        ["playerPosition"] = v23.Position
                    })
                end
                u10.applyKnockback(v23, v30, v24, p21)
            end
        end
    end)
end
function u12.getLastKnockbackTime(p33) --[[ Line: 95 ]]
    return p33.lastKnockbackTime
end
return {
    ["KnockbackController"] = v3.CreateController(u12.new())
}