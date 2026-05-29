local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "CharacterScaleController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "CharacterScaleController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
        [4] = u6
    --]]
    u4.KnitStart(p11)
    u2(function(_, u12, p13) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
        --]]
        local v14 = u12:WaitForChild("Humanoid")
        v14:WaitForChild("BodyDepthScale")
        local function u21(p15) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u5
                [3] = u6
            --]]
            if not u12.Parent then
                return nil
            end
            local v16 = 0
            local v17 = {}
            for v18, v19 in u12:GetChildren() do
                local _ = v18 - 1
                if v19:IsA("Accessory") == true then
                    v16 = v16 + 1
                    v17[v16] = v19
                end
            end
            for _, v20 in v17 do
                if v20:GetAttribute("Amount") ~= nil or (v20:GetAttribute("ArmorSlot") ~= nil or v20:GetAttribute("IsBackpack") == true) then
                    u5:updateAccessoryScale(u12, v20, p15)
                end
            end
            u6:weldCharacterAccessories(u12)
        end
        p13:GiveTask(v14.BodyDepthScale.Changed:Connect(function(u22) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            task.spawn(function() --[[ Line: 58 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u22
                --]]
                task.wait()
                u21(u22)
            end)
        end))
        p13:GiveTask(u12.ChildAdded:Connect(function(p23) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u12
            --]]
            if not p23:IsA("Accessory") then
                return nil
            end
            u5:updateAccessoryScale(u12, p23)
        end))
        u21(v14.BodyDepthScale.Value)
    end)
end
v3.CreateController(u7.new())
return nil