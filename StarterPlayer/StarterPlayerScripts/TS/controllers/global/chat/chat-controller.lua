local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.TextChatService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "chat", "chat-tag-meta").ChatTagMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "chat", "chat-tag-type").ChatTagType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "chat", "chat-util").ChatUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "ChatController"
    end,
    ["__index"] = u9
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "ChatController"
    p16.defaultChatChannel = "RBXGeneral"
    p16.playerChatGradients = {}
end
function u13.KnitStart(u17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u2
        [4] = u5
        [5] = u11
    --]]
    u9.KnitStart(u17)
    local u18 = game:GetService("TextChatService")
    task.spawn(function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
        --]]
        u17.windowConfig = u18:WaitForChild("ChatWindowConfiguration")
        u17.windowConfig.HeightScale = 0.85
        u17.windowConfig.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        u17.windowConfig.TextStrokeTransparency = 0.5
        u17.windowConfig.FontFace = Font.new(Font.fromEnum(Enum.Font.Gotham).Family, Enum.FontWeight.Bold)
    end)
    task.spawn(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:WaitForChild("BubbleChatConfiguration").LocalPlayerStudsOffset = Vector3.new(0, 1.5, 0)
    end)
    task.spawn(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:enableChannelTabs()
    end)
    function u18.OnChatWindowAdded(p19) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u7
            [3] = u2
            [4] = u5
            [5] = u11
        --]]
        local v20 = u17.windowConfig:DeriveNewMessageProperties()
        local v21 = p19.TextSource
        if v21 ~= nil then
            v21 = v21.UserId
        end
        local v22
        if v21 == 0 or (v21 ~= v21 or not v21) then
            v22 = nil
        else
            v22 = u7:GetPlayerByUserId(v21)
        end
        if v22 then
            local v23 = v22:GetAttribute("ChatNameColor")
            if v23 then
                local v24 = u2.richTextColor(v23)
                local v25 = p19.PrefixText
                p19.PrefixText = "<font color=\'" .. v24 .. "\'>" .. (v25 == nil and "" or v25) .. "</font>"
            end
            if u17.playerChatGradients[v22.UserId] == nil then
                local v26 = u17:getPrefixTagsGradient(v22)
                local v27
                if v26 then
                    v27 = u5("UIGradient", {
                        ["Color"] = v26
                    })
                else
                    v27 = nil
                end
                u17.playerChatGradients[v22.UserId] = v27
            end
            local v28 = u17.playerChatGradients[v22.UserId]
            if v28 then
                local v29 = u17:getPrefixTagsByType(v22)
                local v30
                if v29[u11.RANK] == nil then
                    v30 = ""
                else
                    local v31 = v29[u11.RANK]
                    v30 = tostring(v31) .. " "
                end
                local v32 = v29[u11.CLAN]
                v20.PrefixText = v32 == nil and "" or v32
                v20.Text = v30 .. p19.PrefixText .. " " .. p19.Text
                v20.PrefixTextProperties = u17.windowConfig:DeriveNewMessageProperties()
                v28:Clone().Parent = v20.PrefixTextProperties
                return v20
            end
            local v33 = u17:getPrefixTags(v22)
            local v34 = p19.PrefixText
            v20.PrefixText = v33 .. (v34 == nil and "" or v34)
            v20.Text = p19.Text
        end
        return v20
    end
end
function u13.displayMessage(p35, p36, p37) --[[ Line: 119 ]]
    if p37 == nil then
        p37 = p35.defaultChatChannel
    end
    local v38 = p35:getTextChannel(p37)
    if not v38 then
        return nil
    end
    v38:DisplaySystemMessage(p36)
end
function u13.enableChannelTabs(_) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
    --]]
    if u12.LEGACY_TEXT_CHAT_ENABLED or not u12.TEXT_CHANNELS_ENABLED then
        return nil
    end
    u8:WaitForChild("ChannelTabsConfiguration", 3.5).Enabled = true
end
function u13.disableChannelTabs(_) --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8:WaitForChild("ChannelTabsConfiguration", 3.5).Enabled = false
end
function u13.getTextChannel(_, p39) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
    --]]
    if u12.LEGACY_TEXT_CHAT_ENABLED or not u12.TEXT_CHANNELS_ENABLED then
        return nil
    else
        return u8:WaitForChild("TextChannels"):WaitForChild(p39)
    end
end
function u13.getPrefixTags(_, p40) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u10
    --]]
    local v41 = p40:FindFirstChild("Tags")
    if not v41 then
        return ""
    end
    local v42 = u4.values(u11)
    local function v45(p43, p44) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        return u10[p43].displayOrder < u10[p44].displayOrder
    end
    table.sort(v42, v45)
    local v46 = ""
    for _, v47 in v42 do
        local v48 = nil
        for _, v49 in v41:GetChildren() do
            if v49.Name == tostring(v47) and v49:IsA("StringValue") then
                local v50 = not v48
                if not v50 then
                    local v51 = v48:GetAttribute("TagPriority")
                    local v52 = v51 == nil and 0 or v51
                    local v53 = v49:GetAttribute("TagPriority")
                    v50 = v52 < (v53 == nil and 0 or v53)
                end
                if v50 then
                    v48 = v49
                end
            end
        end
        if v48 then
            v46 = v46 .. v48.Value .. " "
        end
    end
    return v46
end
function u13.getPrefixTagsByType(_, p54) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
    --]]
    local v55 = p54:FindFirstChild("Tags")
    if not v55 then
        return {}
    end
    local v56 = {}
    for _, v57 in u4.values(u11) do
        local v58 = nil
        for _, v59 in v55:GetChildren() do
            if v59.Name == tostring(v57) and v59:IsA("StringValue") then
                local v60 = not v58
                if not v60 then
                    local v61 = v58:GetAttribute("TagPriority")
                    local v62 = v61 == nil and 0 or v61
                    local v63 = v59:GetAttribute("TagPriority")
                    v60 = v62 < (v63 == nil and 0 or v63)
                end
                if v60 then
                    v58 = v59
                end
            end
        end
        if v58 then
            v56[v57] = v58.Value
        end
    end
    return v56
end
function u13.getPrefixTagsGradient(_, p64) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u10
    --]]
    local v65 = p64:FindFirstChild("Tags")
    if v65 then
        local v66 = u4.values(u11)
        local function v69(p67, p68) --[[ Line: 238 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            return u10[p67].displayOrder < u10[p68].displayOrder
        end
        table.sort(v66, v69)
        local v70 = 0
        local v71 = {}
        for v72, v73 in v66 do
            local _ = v72 - 1
            local v74 = v65:FindFirstChild(v73)
            local v75
            if v74 == nil then
                v75 = v74
            else
                v75 = v74:IsA("StringValue")
            end
            local v76
            if v75 then
                v76 = v74:GetAttribute("Gradient")
            else
                v76 = nil
            end
            if v76 ~= nil then
                v70 = v70 + 1
                v71[v70] = v76
            end
        end
        if #v71 == 0 then
            return nil
        else
            return v71[1]
        end
    else
        return nil
    end
end
v3.CreateController(u13.new())
return nil