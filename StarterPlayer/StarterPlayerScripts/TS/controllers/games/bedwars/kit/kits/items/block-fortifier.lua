local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "highlight", "block-highlighter").BlockHighlighter
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ContextActionService
local u10 = v8.Players
local u11 = v8.UserInputService
local u12 = v8.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "builder", "builder-util").BuilderUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "BlockFortifier"
    end
})
u23.__index = u23
function u23.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(u26) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u3
        [4] = u14
        [5] = u4
        [6] = u19
        [7] = u22
        [8] = u10
        [9] = u17
        [10] = u13
        [11] = u20
    --]]
    u26.maid = u6.new()
    u26.highlightMaid = u6.new()
    u26.costGuiRef = u7.createRef()
    u26.blockHighlighter = u3.new(u14, u4.SELECT)
    u26.blockHighlighter:setAllowHighlight(function(p27, _) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        return u26:canHighlight(p27)
    end)
    u26.blockHighlighter:setOnHighlight(function(u28, _) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u6
            [3] = u26
            [4] = u7
            [5] = u22
            [6] = u10
            [7] = u17
            [8] = u13
        --]]
        if not u28 then
            return nil
        end
        local u29 = Color3.fromRGB(155, 155, 155)
        local v30 = u19(u28.Name).drawBridgeSource
        if v30 ~= 0 and (v30 == v30 and (v30 ~= "" and v30)) then
            local u31 = u6.new()
            u26.highlightMaid:GiveTask(u31)
            local function u44() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u28
                    [3] = u7
                    [4] = u26
                    [5] = u29
                    [6] = u22
                    [7] = u10
                --]]
                u31:DoCleaning()
                local v32 = u28:GetAttribute("BridgeExtended")
                if v32 == nil then
                    v32 = false
                end
                local v33 = u28:GetAttribute("BridgeActive")
                if v33 == nil then
                    v33 = false
                end
                local v34 = u7.createElement
                local v35 = "BillboardGui"
                local v36 = {
                    [u7.Ref] = u26.costGuiRef,
                    ["Adornee"] = u28,
                    ["Size"] = UDim2.new(2, 0, 2, 0),
                    ["StudsOffsetWorldSpace"] = Vector3.new(0, 4, 0),
                    ["AlwaysOnTop"] = true
                }
                local v37 = {}
                local v38 = u7.createElement
                local v39 = "Frame"
                local v40 = {
                    ["BackgroundTransparency"] = 0.7,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                }
                local v41
                if v33 then
                    v41 = u29
                elseif v32 then
                    v41 = u22.mcRed
                else
                    v41 = u22.mcGreen
                end
                v40.BackgroundColor3 = v41
                __set_list(v37, 1, {v38(v39, v40, { u7.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.05, 0)
    }), u7.createElement("TextLabel", {
        ["Font"] = "RobotoMono",
        ["RichText"] = true,
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Text"] = "<b>" .. (v33 and "Working " or (v32 and "Disable " or "Enable ")) .. "</b>",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["Size"] = UDim2.fromScale(0.9, 0.4),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }) })})
                local v42 = v34(v35, v36, v37)
                u26.costHandle = u7.mount(v42, u10.LocalPlayer:WaitForChild("PlayerGui"))
                u31:GiveTask(function() --[[ Line: 98 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                        [2] = u7
                    --]]
                    if u26.costHandle then
                        u7.unmount(u26.costHandle)
                    end
                    local v43 = u26.costGuiRef:getValue()
                    if v43 ~= nil then
                        v43:Destroy()
                    end
                end)
            end
            u44()
            u26.highlightMaid:GiveTask(u28:GetAttributeChangedSignal("BridgeActive"):Connect(function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                u44()
            end))
            u26.highlightMaid:GiveTask(u28:GetAttributeChangedSignal("BridgeExtended"):Connect(function() --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                u44()
            end))
            return nil
        end
        if not u26:hasEnoughMaterialsToUpgrade(u28.Name) then
            u29 = u22.mcRed
        end
        local v45 = u17.getFortificationCost(u28.Name)
        if v45 then
            local v46 = u7.createElement("BillboardGui", {
                [u7.Ref] = u26.costGuiRef,
                ["Adornee"] = u28,
                ["Size"] = UDim2.new(2, 0, 2, 0),
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 4, 0),
                ["AlwaysOnTop"] = true
            }, { u7.createElement("Frame", {
                    ["BackgroundTransparency"] = 0.7,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["BackgroundColor3"] = u29
                }, { u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.05, 0)
                    }), u7.createElement(u13, {
                        ["IgnoreInitialPop"] = true,
                        ["DisplayOneAmount"] = true,
                        ["ItemType"] = v45[1].currency,
                        ["Amount"] = v45[1].amount
                    }) }) })
            u26.costHandle = u7.mount(v46, u10.LocalPlayer:WaitForChild("PlayerGui"))
            u26.highlightMaid:GiveTask(function() --[[ Line: 148 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                local v47 = u26.costGuiRef:getValue()
                if v47 ~= nil then
                    v47:Destroy()
                end
            end)
        end
    end)
    u26.blockHighlighter:setOnHighlightEnded(function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26.highlightMaid:DoCleaning()
    end)
    u20.Client:WaitFor("BlockFortified"):andThen(function(p48) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        return p48:Connect(function(p49, p50) --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26:playFortifyEffect(p49, p50)
        end)
    end)
end
function u23.hasEnoughMaterialsToUpgrade(_, p51) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u17
        [3] = u18
        [4] = u10
    --]]
    local v52 = u19(p51).drawBridgeSource
    if v52 ~= 0 and (v52 == v52 and (v52 ~= "" and v52)) then
        return true
    end
    local v53 = u17.getFortificationCost(p51)
    if not v53 then
        return false
    end
    for _, v54 in v53 do
        if not u18.hasEnough(u10.LocalPlayer, v54.currency, v54.amount) then
            return false
        end
    end
    return true
end
function u23.playFortifyEffect(_, p55, p56) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u2
        [3] = u5
        [4] = u21
    --]]
    if u10.LocalPlayer:DistanceFromCharacter(u2:getWorldPosition(p56)) < 50 then
        local v57 = u5
        local v58 = u21.FORTIFY_BLOCK
        local v59 = {}
        local v60
        if u10.LocalPlayer == p55 then
            v60 = nil
        else
            v60 = u2:getWorldPosition(p56)
        end
        v59.position = v60
        v57:playSound(v58, v59)
    end
end
function u23.canHighlight(_, p61) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u17
    --]]
    if not p61 then
        return false
    end
    local v62 = u19(p61.Name).drawBridgeSource
    if v62 ~= 0 and (v62 == v62 and (v62 ~= "" and v62)) then
        return true
    end
    local v63
    if p61 == nil then
        v63 = p61
    else
        v63 = p61:GetAttribute("PlacedByUserId")
    end
    if v63 == 0 or (v63 ~= v63 or (not v63 or v63 == 0)) then
        return false
    end
    local v64
    if p61 == nil or p61:GetAttribute("Fortified") == true then
        v64 = false
    else
        v64 = u17.getFortificationCost(p61.Name) ~= nil
    end
    return v64
end
function u23.fortifyBlock(p65, u66) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
        [3] = u15
        [4] = u1
        [5] = u20
    --]]
    u16:playAnimation(u10.LocalPlayer, u15.BUILDER_HAMMER_HIT, {
        ["fadeInTime"] = 0.02,
        ["fadeSamePriorityTracks"] = false
    })
    p65:playFortifyEffect(u10.LocalPlayer, u66)
    u1.try(function() --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u66
        --]]
        u20.Client:Get("FortifyBlock"):SendToServer(u66)
    end, function(p67) --[[ Line: 217 ]]
        warn("Failed block placement:", p67)
    end)
end
function u23.enable(u68) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u4
        [4] = u12
        [5] = u9
    --]]
    u68.blockHighlighter:enable()
    u68.maid:GiveTask(function() --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u68
        --]]
        u68.blockHighlighter:disable()
    end)
    u68.maid:GiveTask(u11.TouchTapInWorld:Connect(function(p69, p70) --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u4
            [3] = u12
            [4] = u68
        --]]
        if p70 then
            return nil
        end
        local v71 = u14:getBlockSelector():getMouseInfo(u4.SELECT, {
            ["ray"] = u12.CurrentCamera:ViewportPointToRay(p69.X, p69.Y)
        })
        local v72
        if v71 == nil then
            v72 = v71
        else
            v72 = v71.target
        end
        if v72 then
            v72 = u68:canHighlight(v71.target.blockInstance)
        end
        if v72 and u68:hasEnoughMaterialsToUpgrade(v71.target.blockInstance.Name) then
            u68:fortifyBlock(v71.target.blockRef.blockPosition)
        end
    end))
    u9:BindAction("fortify-block", function(_, p73, _) --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u4
            [3] = u68
        --]]
        if p73 ~= Enum.UserInputState.Begin then
            return nil
        end
        local v74 = u14:getBlockSelector():getMouseInfo(u4.SELECT)
        local v75
        if v74 == nil then
            v75 = v74
        else
            v75 = v74.target
        end
        if v75 then
            v75 = u68:canHighlight(v74.target.blockInstance)
        end
        if v75 and u68:hasEnoughMaterialsToUpgrade(v74.target.blockInstance.Name) then
            u68:fortifyBlock(v74.target.blockRef.blockPosition)
        end
    end, false, Enum.UserInputType.MouseButton1)
    u68.maid:GiveTask(function() --[[ Line: 268 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9:UnbindAction("fortify-block")
    end)
end
function u23.disable(p76) --[[ Line: 272 ]]
    p76.maid:DoCleaning()
end
return {
    ["BlockFortifier"] = u23
}