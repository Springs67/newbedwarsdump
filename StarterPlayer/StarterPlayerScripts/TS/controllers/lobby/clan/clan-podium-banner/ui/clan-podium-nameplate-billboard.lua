local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color")
local u5 = v4.ChatTagColorDefinition
local u6 = v4.ClanChatTagColorOptions
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types")
local u8 = v7.CLAN_PODIUM_DISPLAY_NAME_ATTRIBUTE
local u9 = v7.CLAN_PODIUM_DISPLAY_TAG_ATTRIBUTE
local u10 = v7.CLAN_PODIUM_TAG_CHAT_COLOR_ATTRIBUTE
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["getPodiumBillboardAdornee"] = function(p12) --[[ Name: getPodiumBillboardAdornee, Line 14 ]]
        if p12:IsA("BasePart") then
            return p12
        elseif p12:IsA("Model") then
            local v13 = p12:FindFirstChild("NameplateAdornee", true)
            local v14
            if v13 == nil then
                v14 = v13
            else
                v14 = v13:IsA("BasePart")
            end
            if v14 then
                return v13
            else
                return p12.PrimaryPart or p12:FindFirstChildWhichIsA("BasePart", true)
            end
        else
            return nil
        end
    end,
    ["getNameplateOffset"] = function(p15, p16) --[[ Name: getNameplateOffset, Line 38 ]]
        local v17
        if p15:IsA("Model") then
            v17 = p15:GetPivot()
        else
            v17 = p16.CFrame
        end
        return v17.RightVector * 4
    end,
    ["ClanPodiumNameplateBillboard"] = v3.new(u2)(function(u18, p19) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u10
            [4] = u6
            [5] = u5
            [6] = u2
            [7] = u11
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local function u26() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u8
                [3] = u9
                [4] = u10
                [5] = u6
            --]]
            local v22 = {}
            local v23 = u18.PodiumModel:GetAttribute(u8)
            v22.name = v23 == nil and "" or v23
            local v24 = u18.PodiumModel:GetAttribute(u9)
            v22.tag = v24 == nil and "" or v24
            local v25 = u18.PodiumModel:GetAttribute(u10)
            if type(v25) ~= "number" then
                v25 = u6.Default
            end
            v22.tagChatColorOption = v25
            return v22
        end
        local v27, u28 = v20(u26)
        v21(function() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u26
                [3] = u18
                [4] = u8
                [5] = u9
                [6] = u10
            --]]
            local function v29() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u26
                --]]
                u28((u26()))
            end
            local u30 = u18.PodiumModel:GetAttributeChangedSignal(u8):Connect(v29)
            local u31 = u18.PodiumModel:GetAttributeChangedSignal(u9):Connect(v29)
            local u32 = u18.PodiumModel:GetAttributeChangedSignal(u10):Connect(v29)
            return function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u31
                    [3] = u32
                --]]
                u30:Disconnect()
                u31:Disconnect()
                u32:Disconnect()
            end
        end, {})
        local v33 = u5[v27.tagChatColorOption]
        local v34 = {
            ["AlwaysOnTop"] = true,
            ["LightInfluence"] = 0.5,
            ["MaxDistance"] = 80,
            ["ResetOnSpawn"] = false,
            ["Adornee"] = u18.Adornee,
            ["Size"] = UDim2.fromOffset(200, 68),
            ["StudsOffsetWorldSpace"] = u18.StudsOffsetWorldSpace
        }
        local v35 = {}
        local _ = #v35
        local v36 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v37 = {
            ["ClanName"] = u2.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextSize"] = 22,
                ["TextScaled"] = true,
                ["TextWrapped"] = false,
                ["RichText"] = false,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.new(1, -8, 0, 28),
                ["Position"] = UDim2.fromOffset(4, 5),
                ["AutomaticSize"] = Enum.AutomaticSize.None,
                ["Text"] = v27.name,
                ["TextColor3"] = u11.textPrimary,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }, { u2.createElement("UITextSizeConstraint", {
                    ["MinTextSize"] = 18,
                    ["MaxTextSize"] = 26
                }) })
        }
        local _ = #v37
        local v38 = v33.kind == "Gradient"
        if v38 then
            local v39 = {
                ["Color"] = v33.gradient
            }
            local v40 = v33.rotation
            v39.Rotation = v40 == nil and 0 or v40
            v38 = u2.createElement("UIGradient", v39)
        end
        local v41 = {
            ["BackgroundTransparency"] = 1,
            ["TextSize"] = 17,
            ["TextScaled"] = true,
            ["TextWrapped"] = false,
            ["AutoLocalize"] = false,
            ["Size"] = UDim2.new(1, -8, 0, 22),
            ["Position"] = UDim2.fromOffset(4, 38),
            ["Text"] = "[" .. v27.tag .. "]"
        }
        local v42
        if v33.kind == "Color" then
            v42 = v33.color
        else
            v42 = Color3.fromRGB(255, 255, 255)
        end
        v41.TextColor3 = v42
        v41.TextTransparency = v33.kind == "Gradient" and 0 or 0.25
        v41.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v41.TextXAlignment = Enum.TextXAlignment.Center
        v41.TextYAlignment = Enum.TextYAlignment.Center
        local v43 = { u2.createElement("UITextSizeConstraint", {
                ["MinTextSize"] = 14,
                ["MaxTextSize"] = 20
            }) }
        local v44 = #v43
        if v38 then
            v43[v44 + 1] = v38
        end
        v37.ClanTag = u2.createElement("TextLabel", v41, v43)
        v35.NameplateRoot = u2.createElement("Frame", v36, v37)
        return u2.createFragment({
            ["ClanPodiumNameplateBillboard"] = u2.createElement("BillboardGui", v34, v35)
        })
    end)
}