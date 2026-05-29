local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ReplicatedStorage
local u5 = v3.Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "DisguiseBushController"
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
    p12.Name = "DisguiseBushController"
end
function u9.KnitStart(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u5
        [4] = u4
        [5] = u8
    --]]
    u6.KnitStart(p13)
    u7.Client:OnEvent("ApplyBushDisguise", function(p14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u8
        --]]
        local v15 = p14.target.Character
        if not v15 then
            return nil
        end
        if not v15:IsDescendantOf(u5) then
            v15.AncestryChanged:Wait()
        end
        local v16 = v15:WaitForChild("Humanoid")
        local u17 = u4.Assets.Misc.BushDisguise:Clone()
        v16:AddAccessory(u17)
        u8:weldCharacterAccessories(v15)
        v15.Destroying:Connect(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17:Destroy()
        end)
        task.delay(60, function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            if u17 then
                u17:Destroy()
            end
        end)
    end)
end
v2.CreateController(u9.new())
return nil