local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.RunService
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "GetItemPopupController"
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
    --]]
    u7.constructor(p15)
    p15.Name = "GetItemPopupController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
    --]]
    u7.KnitStart(u16)
    u9.Client:Get("GetItemPopupServerToClient"):Connect(function(p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:createPopup(p17.player, p17.itemPart, p17.offset)
    end)
end
function u12.createPopup(_, p18, p19, p20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
        [3] = u5
        [4] = u11
        [5] = u6
        [6] = u8
    --]]
    local u21 = p18.Character
    if u21 ~= nil then
        u21 = u21.PrimaryPart
    end
    if not u21 then
        return nil
    end
    task.spawn(function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
            [3] = u21
        --]]
        local v22 = u2
        local v23 = u10.COIN_FOUNTAIN_2
        local v24 = {}
        local v25 = u21
        if v25 ~= nil then
            v25 = v25.Position
        end
        v24.position = v25
        v24.volumeMultiplier = 2
        v22:playSound(v23, v24)
        task.wait(0.1)
        local v26 = u2
        local v27 = u10.COIN_FOUNTAIN_1
        local v28 = {}
        local v29 = u21
        if v29 ~= nil then
            v29 = v29.Position
        end
        v28.position = v29
        v28.volumeMultiplier = 2
        v26:playSound(v27, v28)
    end)
    local u30 = u5.Assets.Misc.GetItemPopup:Clone()
    u30.Parent = u21
    local v31 = p19:Clone()
    v31:PivotTo(u30.Pivot.SpinPivot.CFrame)
    v31.Parent = u30.Pivot.SpinPivot
    u11:weldParts(v31, u30.Pivot.SpinPivot)
    local v32 = 0
    local u33 = {}
    for v34, v35 in v31:GetDescendants() do
        local _ = v34 - 1
        local v36 = v35:IsA("BasePart")
        if v36 then
            v36 = v35.Transparency ~= 1
        end
        if v36 == true then
            v32 = v32 + 1
            u33[v32] = v35
        end
    end
    table.insert(u33, v31)
    local u37 = p20 or Vector3.new(0, 4, 0)
    local v38 = u21.Position
    local v39 = u37
    u30:PivotTo(CFrame.new(v38 + v39))
    local u40 = u30.Pivot.SpinPivot
    local u41 = 0
    local u42 = nil
    u42 = u6.Heartbeat:Connect(function(p43) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u8
            [3] = u40
            [4] = u21
            [5] = u37
            [6] = u30
            [7] = u42
            [8] = u33
        --]]
        u41 = u41 + p43
        local v44 = u8
        local v45 = 100 * p43
        v44.rotateLocalDegrees(u40, Vector3.new(0, 1, 0) * v45)
        local v46 = u8
        local v47 = u21.Position
        local v48 = u37
        v46.setPosition(u30, v47 + v48)
        if u41 > 1 then
            local v49 = u41 - 1
            if v49 >= 1 then
                u30:Destroy()
                if u42 then
                    u42:Disconnect()
                    return
                end
            else
                for v50, v51 in u33 do
                    local _ = v50 - 1
                    v51.Transparency = v49
                end
            end
        end
    end)
end
v3.CreateController(u12.new())
return nil