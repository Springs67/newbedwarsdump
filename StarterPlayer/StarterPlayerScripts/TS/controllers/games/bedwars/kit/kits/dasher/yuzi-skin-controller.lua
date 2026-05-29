local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuint
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u11 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "YuziSkinController"
    end,
    ["__index"] = u11
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
        [1] = u11
        [2] = u9
    --]]
    u11.constructor(p15, u9.DASHER)
    p15.Name = "YuziSkinController"
    p15.spinMotorCache = {}
end
function u12.KnitStart(p16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p16)
end
function u12.onKitLocalActivated(_, _) --[[ Line: 35 ]] end
function u12.onKitLocalDeactivated(_) --[[ Line: 37 ]] end
function u12.onKitReplicationActivated(u17, p18) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u10
        [4] = u9
        [5] = u8
    --]]
    p18:GiveTask(u2(function(p19, u20, u21) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
            [3] = u9
            [4] = u8
            [5] = u17
        --]]
        local v22 = u3.Controllers.KitController:getKitSkin(u20)
        if u10(p19, u9.DASHER) then
            return nil
        end
        local function u24(p23) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u21
                [3] = u17
                [4] = u20
            --]]
            if p23 ~= u8.DASHER_CURSED then
                return false
            end
            u21:GiveTask(u17:applyVoodooSkinEffect(u20))
            return true
        end
        if not u24(v22) then
            u21:GiveTask(u20:GetAttributeChangedSignal("KitSkin"):Connect(function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u20
                    [3] = u24
                --]]
                u24((u3.Controllers.KitController:getKitSkin(u20)))
            end))
        end
    end))
end
function u12.onKitReplicationDeactivated(_) --[[ Line: 66 ]] end
function u12.onInnateAbilityEnabled(_, _, _) --[[ Line: 68 ]] end
function u12.onAbilityUsed(_, _, _) --[[ Line: 70 ]] end
function u12.applyVoodooSkinEffect(p25, p26) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
        [4] = u6
    --]]
    local v27 = u5.new()
    local u28 = p25:getSpinMotor(p26)
    if u28 then
        local u29 = 0
        v27:GiveTask(u6.Heartbeat:Connect(function(p30) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u7
                [3] = u4
                [4] = u28
            --]]
            if u29 > 1 then
                u7(0.2, u4, function(p31) --[[ Line: 78 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28.C0 = u28.C0 * CFrame.Angles(0, 0, (math.rad(p31)))
                end, 0, 3)
                u29 = 0
            end
            u29 = u29 + p30
        end))
    end
    return v27
end
function u12.windUpMotor(p32, p33) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    local u34 = p32:getSpinMotor(p33)
    if not u34 then
        return nil
    end
    u7(0.45, u4, function(p35) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34.C0 = u34.C0 * CFrame.Angles(0, 0, (math.rad(p35)))
    end, 0, 1440)
end
function u12.getSpinMotor(u36, u37) --[[ Line: 107 ]]
    if u36.spinMotorCache[u37] == nil then
        local u38 = nil
        u38 = u37.AncestryChanged:Connect(function() --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u38
                [3] = u36
            --]]
            if not u37.Parent then
                u38:Disconnect()
                u36.spinMotorCache[u37] = nil
            end
        end)
        local v39 = u37:WaitForChild("3DClothing", 3)
        if v39 ~= nil then
            v39 = v39:WaitForChild("Spin", 3)
        end
        local v40 = u37:WaitForChild("3DClothing", 3)
        if v40 ~= nil then
            v40 = v40:WaitForChild("Welding", 3)
            if v40 ~= nil then
                v40 = v40:WaitForChild("Spin->UpperTorso", 3)
            end
        end
        if v39 and (v40 and u37:WaitForChild("UpperTorso", 3)) then
            u36.spinMotorCache[u37] = {
                ["motor"] = v40
            }
            return v40
        else
            u36.spinMotorCache[u37] = {
                ["motor"] = nil
            }
            return nil
        end
    else
        local v41 = u36.spinMotorCache[u37]
        if v41 ~= nil then
            v41 = v41.motor
        end
        return v41
    end
end
u3.CreateController(u12.new())
return nil