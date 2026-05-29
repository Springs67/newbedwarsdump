local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.ReplicatedStorage
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "DetonatedBombController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p12)
    p12.Name = "DetonatedBombController"
    p12.bombMap = {}
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    u6.KnitStart(u13)
    u7.Client:Get("BombStickEvent"):Connect(function(p14) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if not p14.hitPart then
            return nil
        end
        u13:attachBomb(p14.hitPart, p14.cFrame, p14.hitEntity, p14.bombOwner)
    end)
    u7.Client:Get("BombExplosion"):Connect(function(p15) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:bombExplosion(p15.player)
    end)
end
function u9.registerBomb(p16, p17, p18) --[[ Line: 41 ]]
    local v19 = p16.bombMap[p17]
    if v19 then
        local v20 = p16.bombMap
        local v21 = {}
        local v22 = #v21
        local v23 = #v19
        table.move(v19, 1, v23, v22 + 1, v21)
        v21[v22 + v23 + 1] = p18
        v20[p17] = v21
    else
        p16.bombMap[p17] = { p18 }
    end
end
function u9.bombExplosion(p24, p25) --[[ Line: 62 ]]
    local v26 = p24.bombMap[p25]
    if not v26 then
        return nil
    end
    for _, v27 in v26 do
        v27:Destroy()
    end
    p24.bombMap[p25] = {}
end
function u9.attachBomb(p28, p29, p30, p31, p32) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
    --]]
    local v33 = u5.Assets.Effects.DetonatedBomb:Clone()
    if not v33.PrimaryPart then
        return nil
    end
    local v34 = v33.PrimaryPart:WaitForChild("Indicator", 3)
    if v34 and p32 == u4.LocalPlayer then
        v34.Color = Color3.fromRGB(26, 255, 5)
    elseif v34 and p32.Team == u4.LocalPlayer.Team then
        v34.Color = Color3.fromRGB(217, 252, 23)
    end
    v33.Parent = p29
    local v35
    if p31 then
        v35 = p30:Lerp(CFrame.new(p29.Position), 0.5)
    else
        v35 = p30 * CFrame.Angles(0, 1.5707963267948966, 0)
    end
    v33:PivotTo(v35)
    u8:weldParts(p29, v33.PrimaryPart)
    p28:registerBomb(p32, v33)
end
v2.CreateController(u9.new())
return nil