local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.BreakBlockDamageType
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "highlight", "block-highlighter").BlockHighlighter
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "shared", "block", "block-meta").BlockHealthType
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u9 = v8.AnimationUtil
local u10 = v8.GameQueryUtil
local u11 = v8.SoundManager
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.ContextActionService
local u17 = v15.Players
local u18 = v15.TweenService
local u19 = v15.UserInputService
local u20 = v15.Workspace
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "BlockRepair"
    end
})
u27.__index = u27
function u27.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(u30) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u5
        [4] = u21
        [5] = u6
    --]]
    u30.maid = u12.new()
    u30.highlightMaid = u12.new()
    u30.healthbarProgressRef = u14.createRef()
    u30.healthbarMaid = u12.new()
    u30.cooldown = 0.3
    u30.range = 12
    u30.lastHitTime = 0
    u30.blockHighlighter = u5.new(u21, u6.SELECT)
    u30.blockHighlighter:setRange(u30.range)
    u30.blockHighlighter:setAllowHighlight(function(p31, _) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        return u30:canHighlight(p31)
    end)
    u30.blockHighlighter:setOnHighlight(function(p32, _) --[[ Line: 53 ]]
        if not p32 then
            return nil
        end
    end)
    u30.blockHighlighter:setOnHighlightEnded(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30.highlightMaid:DoCleaning()
    end)
end
function u27.canHighlight(_, p33) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    if p33 then
        local v34 = u24(p33.Name).block
        if v34 then
            if v34.noRegen then
                return false
            else
                return not p33:GetAttribute("NoBreak")
            end
        else
            return false
        end
    else
        return false
    end
end
function u27.repairBlock(p35, p36, p37) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u9
        [3] = u17
        [4] = u23
        [5] = u22
        [6] = u24
        [7] = u26
        [8] = u4
        [9] = u25
        [10] = u11
        [11] = u3
        [12] = u7
    --]]
    p35.lastHitTime = u20:GetServerTimeNow()
    u9:playAnimation(u17.LocalPlayer, u23:getAssetId(u22.BUILDER_HAMMER_HIT), {
        ["fadeInTime"] = 0.02
    })
    local v38 = u24(p37.Name).block
    if v38 ~= nil then
        v38 = v38.breakType
    end
    local v39 = u26.FORTIFY_BLOCK
    if v38 == u4.STONE then
        v39 = u26.STONE_BREAK
    elseif v38 == u4.WOOD then
        v39 = u26.WOOD_BREAK
    elseif v38 ~= u4.DIRT and v38 == u4.WOOL then
        v39 = u26.WOOL_BREAK
    end
    local v40 = u25.Client:Get("RepairBlock"):CallServer({
        ["blockPosition"] = p36
    })
    u11:playSound(v39, {
        ["position"] = u3:getWorldPosition(p36)
    })
    local v41 = u3:getStore():getBlockData(p36)
    local v42 = u3:getHandlerRegistry():getHandler(p37.Name)
    if v42 ~= nil then
        v42 = v42:getBlockMeta()
    end
    local v43 = ""
    local v44
    if v42 == nil then
        v44 = v42
    else
        v44 = v42.healthType
    end
    if v44 == u7.GLOBAL then
        v43 = "Health"
    else
        if v42 ~= nil then
            v42 = v42.healthType
        end
        if v42 == u7.PERSONAL then
            local _ = v43 == u17.LocalPlayer.Name .. "_Health"
        else
            local v45 = u3
            v43 = tostring(v45:getDefaultHealthKey())
        end
    end
    local v46 = p37:GetAttribute("MaxHealth")
    if v41 ~= nil then
        v41 = v41:GetAttribute(v43)
    end
    if v41 == nil then
        v41 = p37:GetAttribute("Health")
    end
    if v46 == 0 or (v46 ~= v46 or (not v46 or v40 < 0)) then
        return nil
    end
    p35:updateHealthbar({
        ["blockPosition"] = p36
    }, v41, v46, v40, p37)
end
function u27.enable(u47) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u20
        [3] = u21
        [4] = u6
        [5] = u16
    --]]
    u47.blockHighlighter:enable()
    u47.maid:GiveTask(function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47.blockHighlighter:disable()
    end)
    u47.maid:GiveTask(u19.TouchTapInWorld:Connect(function(p48, p49) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u20
            [3] = u21
            [4] = u6
        --]]
        if p49 then
            return nil
        end
        if u47.lastHitTime + u47.cooldown > u20:GetServerTimeNow() then
            return nil
        end
        local v50 = u21:getBlockSelector():getMouseInfo(u6.SELECT, {
            ["ray"] = u20.CurrentCamera:ViewportPointToRay(p48.X, p48.Y),
            ["range"] = u47.range
        })
        local v51
        if v50 == nil then
            v51 = v50
        else
            v51 = v50.target
        end
        if v51 then
            v51 = u47:canHighlight(v50.target.blockInstance)
        end
        if v51 then
            u47:repairBlock(v50.target.blockRef.blockPosition, v50.target.blockInstance)
        end
    end))
    u16:BindAction("repair-block", function(_, p52, _) --[[ Line: 184 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u20
            [3] = u21
            [4] = u6
        --]]
        if p52 ~= Enum.UserInputState.Begin then
            return nil
        end
        if u47.lastHitTime + u47.cooldown > u20:GetServerTimeNow() then
            return nil
        end
        local v53 = u21:getBlockSelector():getMouseInfo(u6.SELECT, {
            ["range"] = u47.range
        })
        local v54
        if v53 == nil then
            v54 = v53
        else
            v54 = v53.target
        end
        if v54 then
            v54 = u47:canHighlight(v53.target.blockInstance)
        end
        if v54 then
            u47:repairBlock(v53.target.blockRef.blockPosition, v53.target.blockInstance)
        end
    end, false, Enum.UserInputType.MouseButton1)
    u47.maid:GiveTask(function() --[[ Line: 206 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:UnbindAction("repair-block")
    end)
end
function u27.disable(p55) --[[ Line: 210 ]]
    p55.maid:DoCleaning()
end
function u27.updateHealthbar(u56, u57, p58, u59, p60, u61) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u10
        [4] = u14
        [5] = u7
        [6] = u17
        [7] = u18
        [8] = u1
    --]]
    if u61:GetAttribute("NoHealthbar") then
        return nil
    end
    local v62 = not u56.healthbarPart
    if not v62 then
        local v63 = u56.healthbarBlockRef
        if v63 ~= nil then
            v63 = v63.blockPosition
        end
        v62 = v63 ~= u57.blockPosition
    end
    if v62 then
        u56.healthbarMaid:DoCleaning()
        u56.healthbarBlockRef = u57
        u56.healthbarPart = u13("Part", {
            ["Name"] = "BlockHealthbar",
            ["Size"] = Vector3.new(1, 1, 1),
            ["Transparency"] = 1,
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CFrame"] = CFrame.new(u3:getWorldPosition(u57.blockPosition)),
            ["Parent"] = u61
        })
        u10:setQueryIgnored(u56.healthbarPart, true)
        local u64 = u14.mount(u14.createElement("BillboardGui", {
            ["StudsOffset"] = Vector3.new(0, 2.5, 0),
            ["MaxDistance"] = 40,
            ["AlwaysOnTop"] = true,
            ["Adornee"] = u56.healthbarPart,
            ["Size"] = UDim2.fromScale(4, 0.2)
        }, { u14.createElement("Frame", {
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }, { u14.createElement("Frame", {
                    [u14.Ref] = u56.healthbarProgressRef,
                    ["Size"] = UDim2.fromScale(p58 / u59, 1),
                    ["BackgroundColor3"] = Color3.fromRGB(39, 231, 68),
                    ["BorderSizePixel"] = 0
                }) }) }), u56.healthbarPart)
        if u3:getStore():getBlockData(u57.blockPosition) then
            task.spawn(function() --[[ Line: 262 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u57
                    [3] = u61
                    [4] = u7
                    [5] = u17
                    [6] = u56
                    [7] = u18
                    [8] = u59
                --]]
                local u65 = u3:getStore():waitForBlockData(u57.blockPosition)
                if not u65 then
                    return nil
                end
                local v66 = u3:getHandlerRegistry():getHandler(u61.Name)
                if v66 ~= nil then
                    v66 = v66:getBlockMeta()
                end
                local u67 = ""
                local v68
                if v66 == nil then
                    v68 = v66
                else
                    v68 = v66.healthType
                end
                if v68 == u7.GLOBAL then
                    u67 = "Health"
                else
                    if v66 ~= nil then
                        v66 = v66.healthType
                    end
                    if v66 == u7.PERSONAL then
                        local _ = u67 == u17.LocalPlayer.Name .. "_Health"
                    else
                        local v69 = u3
                        u67 = tostring(v69:getDefaultHealthKey())
                    end
                end
                u56.healthbarMaid:GiveTask(u65.AttributeChanged:Connect(function(p70) --[[ Line: 292 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u65
                        [3] = u18
                        [4] = u56
                        [5] = u59
                    --]]
                    if p70 ~= u67 then
                        return nil
                    end
                    local v71 = u65:GetAttribute(u67)
                    local v72 = u18
                    local v73 = u56.healthbarProgressRef:getValue()
                    local v74 = TweenInfo.new(u56.cooldown, Enum.EasingStyle.Quad)
                    local v75 = {}
                    local v76 = UDim2.fromScale
                    local v77 = v71 / u59
                    v75.Size = v76(math.max(v77, 0), 1)
                    v72:Create(v73, v74, v75):Play()
                end))
            end)
        else
            local v92 = u3:getStore():getBlockDataFolder().ChildAdded:Connect(function(p78) --[[ Line: 307 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u61
                    [3] = u57
                    [4] = u7
                    [5] = u17
                    [6] = u56
                    [7] = u18
                    [8] = u59
                --]]
                if p78.Name ~= u3:getStore():getBlockDataName(u61, u57.blockPosition) then
                    return nil
                end
                task.spawn(function() --[[ Line: 262 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u57
                        [3] = u61
                        [4] = u7
                        [5] = u17
                        [6] = u56
                        [7] = u18
                        [8] = u59
                    --]]
                    local u79 = u3:getStore():waitForBlockData(u57.blockPosition)
                    if not u79 then
                        return nil
                    end
                    local v80 = u3:getHandlerRegistry():getHandler(u61.Name)
                    if v80 ~= nil then
                        v80 = v80:getBlockMeta()
                    end
                    local u81 = ""
                    local v82
                    if v80 == nil then
                        v82 = v80
                    else
                        v82 = v80.healthType
                    end
                    if v82 == u7.GLOBAL then
                        u81 = "Health"
                    else
                        if v80 ~= nil then
                            v80 = v80.healthType
                        end
                        if v80 == u7.PERSONAL then
                            local _ = u81 == u17.LocalPlayer.Name .. "_Health"
                        else
                            local v83 = u3
                            u81 = tostring(v83:getDefaultHealthKey())
                        end
                    end
                    u56.healthbarMaid:GiveTask(u79.AttributeChanged:Connect(function(p84) --[[ Line: 292 ]]
                        --[[
                        Upvalues:
                            [1] = u81
                            [2] = u79
                            [3] = u18
                            [4] = u56
                            [5] = u59
                        --]]
                        if p84 ~= u81 then
                            return nil
                        end
                        local v85 = u79:GetAttribute(u81)
                        local v86 = u18
                        local v87 = u56.healthbarProgressRef:getValue()
                        local v88 = TweenInfo.new(u56.cooldown, Enum.EasingStyle.Quad)
                        local v89 = {}
                        local v90 = UDim2.fromScale
                        local v91 = v85 / u59
                        v89.Size = v90(math.max(v91, 0), 1)
                        v86:Create(v87, v88, v89):Play()
                    end))
                end)
            end)
            u56.healthbarMaid:GiveTask(v92)
        end
        local u93 = true
        u56.healthbarMaid:GiveTask(function() --[[ Line: 316 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u56
                [3] = u14
                [4] = u64
            --]]
            u93 = false
            u56.healthbarBlockRef = nil
            u14.unmount(u64)
            local v94 = u56.healthbarPart
            if v94 ~= nil then
                v94:Destroy()
            end
            u56.healthbarPart = nil
        end)
        u1.Promise.delay(5):andThen(function() --[[ Line: 327 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u56
            --]]
            if u93 then
                u56.healthbarMaid:DoCleaning()
            end
        end)
    end
    local v95 = u18
    local v96 = u56.healthbarProgressRef:getValue()
    local v97 = TweenInfo.new(u56.cooldown, Enum.EasingStyle.Quad)
    local v98 = {}
    local v99 = UDim2.fromScale
    local v100 = (p58 + p60) / u59
    v98.Size = v99(math.min(v100, 1), 1)
    v95:Create(v96, v97, v98):Play()
end
return {
    ["BlockRepair"] = u27
}