local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "HeadhunterController"
    end,
    ["__index"] = u7
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p11)
    p11.Name = "HeadhunterController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u5
        [4] = u2
        [5] = u1
        [6] = u4
        [7] = u3
    --]]
    u7.KnitStart(p12)
    u6.ProjectileLaunched:connect(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u1
            [4] = u4
            [5] = u3
        --]]
        local v14 = p13:getShooterHandItem()
        if v14 ~= nil then
            v14 = string.match(v14.itemType, "headhunter")
        end
        if v14 == 0 or (v14 ~= v14 or (v14 == "" or not v14)) then
            return nil
        end
        local v15 = p13.shooter == u5.LocalPlayer.Character
        local u16 = p13.shooter
        if u16 ~= nil then
            u16 = nil
            for v17, v18 in u16:GetChildren() do
                local _ = v17 - 1
                local v19
                if string.match(v18.Name, "headhunter") == nil then
                    v19 = false
                else
                    v19 = v18:IsA("Accessory")
                end
                if v19 == true then
                    u16 = v18
                    break
                end
            end
        end
        local u20 = u2.Controllers.ViewmodelController:getViewModel()
        if u20 ~= nil then
            u20 = nil
            for v21, v22 in u20:GetChildren() do
                local _ = v21 - 1
                local v23
                if string.match(v22.Name, "headhunter") == nil then
                    v23 = false
                else
                    v23 = v22:IsA("Accessory")
                end
                if v23 == true then
                    u20 = v22
                    break
                end
            end
        end
        if v15 then
            u2.Controllers.ScreenShakeController:shake(p13.origin, Vector3.new(0, -1, 0), {
                ["magnitude"] = 0.1
            })
        end
        if not u16 then
            return nil
        end
        local v27, v28 = u1.try(function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            u16.Handle.Arrow.Transparency = 1
            for v24, v25 in u16.Handle.Arrow:GetDescendants() do
                local _ = v24 - 1
                if v25:IsA("BasePart") then
                    v25.Transparency = 1
                end
            end
        end, function(p26) --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u3
                [3] = u1
            --]]
            u4.Debug("Failed to get headhunter arrow model: {reason}", u3(p26))
            return u1.TRY_RETURN, {}
        end)
        if v27 then
            return unpack(v28)
        end
        if u20 and v15 then
            u20.Handle.Arrow.Transparency = 1
            for v29, v30 in u20.Handle.Arrow:GetDescendants() do
                local _ = v29 - 1
                if v30:IsA("BasePart") then
                    v30.Transparency = 1
                end
            end
            task.delay(0.6, function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u20
                --]]
                if u16 and u20 then
                    u16.Handle.Arrow.Transparency = 0
                    u20.Handle.Arrow.Transparency = 0
                    for v31, v32 in u16.Handle.Arrow:GetDescendants() do
                        local _ = v31 - 1
                        if v32:IsA("BasePart") then
                            v32.Transparency = 0
                        end
                    end
                    for v33, v34 in u20.Handle.Arrow:GetDescendants() do
                        local _ = v33 - 1
                        if v34:IsA("BasePart") then
                            v34.Transparency = 0
                        end
                    end
                end
            end)
        end
        for v35, u36 in u16.Handle.Arrow.Attachment:GetChildren() do
            local _ = v35 - 1
            if u36:IsA("ParticleEmitter") then
                u36.Enabled = true
                task.delay(0.1, function() --[[ Line: 145 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                    --]]
                    u36.Enabled = false
                end)
            end
        end
        if u20 and v15 then
            for v37, u38 in u20.Handle.Arrow.Attachment:GetChildren() do
                local _ = v37 - 1
                if u38:IsA("ParticleEmitter") then
                    u38.Enabled = true
                    task.delay(0.1, function() --[[ Line: 158 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                        --]]
                        u38.Enabled = false
                    end)
                end
            end
        end
        if u16.Handle.Arrow.SmokeAttachment then
            u16.Handle.Arrow.SmokeAttachment.Smoke.Enabled = true
            task.delay(0.6, function() --[[ Line: 170 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                if u16 then
                    u16.Handle.Arrow.SmokeAttachment.Smoke.Enabled = false
                end
            end)
        end
        local v39
        if u20 == nil then
            v39 = u20
        else
            v39 = u20.Handle.Arrow.SmokeAttachment
        end
        if not v39 then
            v15 = v39
        end
        if v15 then
            u20.Handle.Arrow.SmokeAttachment.Smoke.Enabled = true
            task.delay(0.6, function() --[[ Line: 186 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                if u20 then
                    u20.Handle.Arrow.SmokeAttachment.Smoke.Enabled = false
                end
            end)
        end
    end)
end
u2.CreateController(u8.new())
return nil