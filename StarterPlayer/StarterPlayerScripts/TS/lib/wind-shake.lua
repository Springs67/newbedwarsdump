local u1 = game:GetService("CollectionService")
local u2 = game:GetService("RunService")
local u3 = require(script.Settings)
local v4 = require(script.Octree)
local u5 = u3.new(script, {
    ["WindDirection"] = Vector3.new(0.5, 0, 0.5),
    ["WindSpeed"] = 20,
    ["WindPower"] = 0.5
})
local u6 = Instance.new("BindableEvent")
local u7 = Instance.new("BindableEvent")
local u8 = Instance.new("BindableEvent")
local u9 = Instance.new("BindableEvent")
local u10 = Instance.new("BindableEvent")
return {
    ["Handled"] = 0,
    ["Active"] = 0,
    ["ObjectMetadata"] = {},
    ["Octree"] = v4.new(),
    ["LastUpdate"] = os.clock(),
    ["ObjectShakeAdded"] = u6.Event,
    ["ObjectShakeRemoved"] = u7.Event,
    ["ObjectShakeUpdated"] = u8.Event,
    ["Paused"] = u9.Event,
    ["Resumed"] = u10.Event,
    ["Connect"] = function(u11, p12, p13) --[[ Name: Connect, Line 56 ]]
        local u14 = u11[p12]
        local v15 = typeof(u14) == "function"
        local v16 = "Unknown function: " .. p12
        assert(v15, v16)
        return p13:Connect(function(...) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u11
            --]]
            return u14(u11, ...)
        end)
    end,
    ["AddObjectShake"] = function(p17, p18, p19) --[[ Name: AddObjectShake, Line 65 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u6
        --]]
        if typeof(p18) == "Instance" then
            if p18:IsA("BasePart") then
                local v20 = p17.ObjectMetadata
                if not v20[p18] then
                    p17.Handled = p17.Handled + 1
                    v20[p18] = {
                        ["Node"] = p17.Octree:CreateNode(p18.Position, p18),
                        ["Settings"] = u3.new(p18, u5),
                        ["Seed"] = math.random(1000) * 0.1,
                        ["Origin"] = p18.CFrame
                    }
                    p17:UpdateObjectSettings(p18, p19)
                    u6:Fire(p18)
                end
            else
                return
            end
        else
            return
        end
    end,
    ["RemoveObjectShake"] = function(p21, p22) --[[ Name: RemoveObjectShake, Line 95 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        if typeof(p22) == "Instance" then
            local v23 = p21.ObjectMetadata
            local v24 = v23[p22]
            if v24 then
                p21.Handled = p21.Handled - 1
                v23[p22] = nil
                v24.Settings:Destroy()
                v24.Node:Destroy()
                if p22:IsA("BasePart") then
                    p22.CFrame = v24.Origin
                end
            end
            u7:Fire(p22)
        end
    end,
    ["Update"] = function(p25) --[[ Name: Update, Line 117 ]]
        local v26 = os.clock()
        local v27 = v26 - p25.LastUpdate
        if v27 < 0.022222222222222223 then
            return
        else
            p25.LastUpdate = v26
            debug.profilebegin("WindShake")
            local v28 = workspace.CurrentCamera
            if v28 then
                v28 = v28.CFrame
            end
            debug.profilebegin("Octree Search")
            local v29 = p25.Octree:RadiusSearch(v28.Position + v28.LookVector * 115, 120)
            debug.profileend()
            local v30 = #v29
            p25.Active = v30
            if v30 >= 1 then
                local v31 = v27 * 8
                local v32 = math.min(1, v31)
                local v33 = table.create(v30)
                local v34 = p25.ObjectMetadata
                debug.profilebegin("Calc")
                for v35, v36 in ipairs(v29) do
                    local v37 = v34[v36]
                    local v38 = v37.LastCompute or 0
                    local v39 = v37.Origin
                    local v40 = v37.CFrame or v39
                    if v26 - v38 > 0.03333333333333333 then
                        local v41 = v37.Settings
                        local v42 = v37.Seed
                        local v43 = v41.WindPower * 0.1
                        local v44 = v26 * (v41.WindSpeed * 0.08)
                        local v45 = math.noise(v44, 0, v42) * v43
                        local v46 = math.noise(v44, 0, -v42) * v43
                        local v47 = math.noise(v44, 0, v42 + v42) * v43
                        local v48 = v36.PivotOffset
                        v37.Target = (v39 * v48 * CFrame.Angles(v45, v46, v47) + v41.WindDirection * ((0.5 + math.noise(v44, v42, v42)) * v43)) * v48:Inverse()
                        v37.LastCompute = v26
                    end
                    local v49 = v40:Lerp(v37.Target, v32)
                    v37.CFrame = v49
                    v33[v35] = v49
                end
                debug.profileend()
                workspace:BulkMoveTo(v29, v33, Enum.BulkMoveMode.FireCFrameChanged)
                debug.profileend()
            end
        end
    end,
    ["Pause"] = function(p50) --[[ Name: Pause, Line 184 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        if p50.UpdateConnection then
            p50.UpdateConnection:Disconnect()
            p50.UpdateConnection = nil
        end
        p50.Active = 0
        p50.Running = false
        u9:Fire()
    end,
    ["Resume"] = function(p51) --[[ Name: Resume, Line 196 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u10
        --]]
        if not p51.Running then
            p51.Running = true
            p51.UpdateConnection = p51:Connect("Update", u2.Heartbeat)
            u10:Fire()
        end
    end,
    ["Init"] = function(p52) --[[ Name: Init, Line 209 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u1
        --]]
        if not p52.Initialized then
            p52.Initialized = true
            local v53 = script:GetAttribute("WindPower")
            local v54 = script:GetAttribute("WindSpeed")
            local v55 = script:GetAttribute("WindDirection")
            if typeof(v53) ~= "number" then
                script:SetAttribute("WindPower", u5.WindPower)
            end
            if typeof(v54) ~= "number" then
                script:SetAttribute("WindSpeed", u5.WindSpeed)
            end
            if typeof(v55) ~= "Vector3" then
                script:SetAttribute("WindDirection", u5.WindDirection)
            end
            p52:Cleanup()
            p52.AddedConnection = p52:Connect("AddObjectShake", (u1:GetInstanceAddedSignal("WindShake")))
            p52.RemovedConnection = p52:Connect("RemoveObjectShake", (u1:GetInstanceRemovedSignal("WindShake")))
            for _, v56 in pairs(u1:GetTagged("WindShake")) do
                p52:AddObjectShake(v56)
            end
            p52:Resume()
        end
    end,
    ["Cleanup"] = function(p57) --[[ Name: Cleanup, Line 251 ]]
        if p57.Initialized then
            p57:Pause()
            if p57.AddedConnection then
                p57.AddedConnection:Disconnect()
                p57.AddedConnection = nil
            end
            if p57.RemovedConnection then
                p57.RemovedConnection:Disconnect()
                p57.RemovedConnection = nil
            end
            table.clear(p57.ObjectMetadata)
            p57.Octree:ClearNodes()
            p57.Handled = 0
            p57.Active = 0
            p57.Initialized = false
        end
    end,
    ["UpdateObjectSettings"] = function(p58, p59, p60) --[[ Name: UpdateObjectSettings, Line 276 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if typeof(p59) == "Instance" then
            if typeof(p60) == "table" then
                if p58.ObjectMetadata[p59] or p59 == script then
                    for v61, v62 in pairs(p60) do
                        p59:SetAttribute(v61, v62)
                    end
                    u8:Fire(p59)
                end
            else
                return
            end
        else
            return
        end
    end,
    ["UpdateAllObjectSettings"] = function(p63, p64) --[[ Name: UpdateAllObjectSettings, Line 296 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if typeof(p64) == "table" then
            for v65, _ in pairs(p63.ObjectMetadata) do
                for v66, v67 in pairs(p64) do
                    v65:SetAttribute(v66, v67)
                end
                u8:Fire(v65)
            end
        end
    end,
    ["SetDefaultSettings"] = function(p68, p69) --[[ Name: SetDefaultSettings, Line 309 ]]
        p68:UpdateObjectSettings(script, p69)
    end
}