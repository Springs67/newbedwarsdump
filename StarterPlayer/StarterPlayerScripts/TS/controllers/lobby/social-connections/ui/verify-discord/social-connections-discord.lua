local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.CornerFiller
local u6 = v2.Empty
local u7 = v2.ImageId
local u8 = v2.SoundManager
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = u1.import(script, script.Parent.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard
local u18 = v14.Client:GetNamespace("SocialConnections")
return {
    ["SocialConnectionsDiscord"] = v12.new(u11)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u18
            [3] = u8
            [4] = u15
            [5] = u9
            [6] = u11
            [7] = u17
            [8] = u7
            [9] = u16
            [10] = u5
            [11] = u4
            [12] = u6
            [13] = u3
            [14] = u1
            [15] = u13
        --]]
        local v21 = p20.useState
        local v22 = p20.useEffect
        local v23, u24 = v21(false)
        local v25, u26 = v21("")
        local v27 = u19.store.SocialConnections.connections.discord.validated
        local u28 = u10.new()
        v22(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u28
                [3] = u24
                [4] = u19
                [5] = u26
                [6] = u8
                [7] = u15
                [8] = u9
            --]]
            u18:WaitFor("VerificationStatusResolved"):andThen(function(p29) --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u24
                    [3] = u19
                    [4] = u26
                    [5] = u8
                    [6] = u15
                    [7] = u9
                --]]
                u28:GiveTask(p29:Connect(function(p30, p31, p32, p33) --[[ Line: 30 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u19
                        [3] = u26
                        [4] = u8
                        [5] = u15
                        [6] = u9
                    --]]
                    u24(false)
                    if not p31 and (p31 == u19.store.SocialConnections.connections.discord.validated and not p33) then
                        u26("Cannot verify, please try again.")
                        u8:playSound(u15.INFO_NOTIFICATION)
                    end
                    if p30 ~= u19.store.SocialConnections.connections.discord.verificationCode then
                        u9.Controllers.SocialConnectionsController:updateDiscordStore({
                            ["verificationCode"] = p30,
                            ["validated"] = p31,
                            ["legacyDiscordVerification"] = p32
                        })
                        u26("")
                        return nil
                    end
                    if p31 ~= u19.store.SocialConnections.connections.discord.validated then
                        u9.Controllers.SocialConnectionsController:updateDiscordStore({
                            ["verificationCode"] = p30,
                            ["validated"] = p31,
                            ["legacyDiscordVerification"] = p32
                        })
                        u8:playSound(u15.INFO_NOTIFICATION)
                        u26("")
                        return nil
                    end
                end))
            end)
            u18:Get("RegisterUser"):SendToServer()
            return function() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:DoCleaning()
            end
        end, {})
        local v34 = {
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["LayoutOrder"] = u19.LayoutOrder
        }
        local v35 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }), u11.createElement(u17, {
                ["Text"] = "<b>Verify</b> your Discord account <font color=\"#1EA1F2\">discord.gg/RobloxBedWars</font>",
                ["CornerFill"] = true,
                ["LayoutOrder"] = 1,
                ["ImageId"] = u7.SATELITE
            }) }
        local _ = #v35
        local v36 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 78),
            ["BackgroundColor3"] = u16.backgroundPrimary
        }
        local v37 = { u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), u11.createElement(u5, {
                ["TopLeft"] = true,
                ["TopRight"] = true
            }) }
        local v38 = #v37
        local v39 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v40 = { u11.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 8),
                ["PaddingBottom"] = UDim.new(0, 8),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            }) }
        local v41 = #v40
        local v42
        if v27 then
            v42 = u11.createFragment({
                ["DiscordConnectConnected"] = u11.createElement("TextLabel", {
                    ["Text"] = "<b>Your Discord has been verified!</b>",
                    ["RichText"] = true,
                    ["TextSize"] = 16,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Font"] = Enum.Font.Roboto
                })
            })
        else
            local v43 = {
                ["AutomaticSize"] = Enum.AutomaticSize.XY
            }
            local v44 = { u11.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }), u11.createElement("TextLabel", {
                    ["Text"] = "Discord Verification Code: ",
                    ["AutoLocalize"] = false,
                    ["TextSize"] = 14,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["Size"] = UDim2.new(0, 0, 0, 14),
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold)
                }) }
            local _ = #v44
            local v45 = {
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["Size"] = UDim2.new(0, 0, 0, 14)
            }
            local v46 = u19.store.SocialConnections.connections.discord.verificationCode
            v45.Text = v46 == nil and "Generating Code" or v46
            v45.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold)
            v45.TextEditable = false
            v45.ClearTextOnFocus = false
            v45.AutoLocalize = false
            v45.TextColor3 = u16.textPrimary
            v45.TextXAlignment = Enum.TextXAlignment.Left
            v45.TextSize = 14
            v45.BackgroundTransparency = 1
            v45.LayoutOrder = 2
            v44.DiscordVerficationCode = u11.createElement("TextBox", v45)
            v42 = u11.createElement(u6, v43, v44)
        end
        local v47 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.fromScale(0.75, 1)
        }
        local v48 = {
            u11.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 3)
            }),
            [#v48 + 1] = v42
        }
        local v49 = #v48
        local v50 = not v27
        if v50 then
            v50 = u11.createFragment({
                ["DiscordConnectInstructions"] = u11.createElement("Frame", {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0, 0)
                }, {
                    u11.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["Padding"] = UDim.new(0, 0)
                    }),
                    u11.createElement("TextLabel", {
                        ["Text"] = "1. Join the BedWars Discord at <b><font color=\"#FFFFFF\">discord.gg/RobloxBedWars</font></b>",
                        ["RichText"] = true,
                        ["TextSize"] = 12,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0, 12),
                        ["TextColor3"] = u16.textSecondary,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["Font"] = Enum.Font.Roboto
                    }),
                    u11.createElement("TextLabel", {
                        ["Text"] = "2. Enter your code in the <b><font color=\"#FFFFFF\">#verification</font></b> Discord channel",
                        ["RichText"] = true,
                        ["TextSize"] = 12,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0, 12),
                        ["TextColor3"] = u16.textSecondary,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["Font"] = Enum.Font.Roboto
                    }),
                    u11.createElement("TextLabel", {
                        ["Text"] = "3. Then click <b><font color=\"#FFFFFF\">Verify</font></b>",
                        ["RichText"] = true,
                        ["TextSize"] = 12,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0, 12),
                        ["TextColor3"] = u16.textSecondary,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["Font"] = Enum.Font.Roboto
                    })
                })
            })
        end
        if v50 then
            v48[v49 + 1] = v50
        end
        v40.DiscordConnectTextInfo = u11.createElement("Frame", v47, v48)
        local v51
        if v27 then
            v51 = u11.createElement(u3, {
                ["Text"] = "Unlink",
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["Size"] = UDim2.fromScale(0.25, 0.5),
                ["Loading"] = v23,
                ["OnClick"] = u1.async(function() --[[ Line: 250 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u1
                        [3] = u18
                        [4] = u13
                        [5] = u26
                    --]]
                    u24(true)
                    local v52 = u1.await(u18:Get("UnverifyUser"):CallServerAsync())
                    local v53
                    if v52 then
                        v53 = v52.timeout
                    else
                        v53 = v52
                    end
                    if v53 ~= 0 and (v53 == v53 and v53) then
                        local v54 = v52.timeout - u13:GetServerTimeNow()
                        local v55 = math.round(v54)
                        u26("Please wait " .. tostring(v55) .. " second" .. (v55 == 1 and "" or "s") .. " before trying again.")
                        u24(false)
                    end
                end)
            })
        else
            v51 = v27
        end
        if v51 then
            v40[v41 + 1] = v51
        end
        local v56 = #v40
        local v57 = not v27
        if v57 then
            v57 = u11.createElement(u3, {
                ["Text"] = "Verify",
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["Size"] = UDim2.fromScale(0.25, 0.5),
                ["Loading"] = v23,
                ["OnClick"] = u1.async(function() --[[ Line: 271 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u1
                        [3] = u18
                        [4] = u26
                        [5] = u13
                    --]]
                    u24(true)
                    local v58 = u1.await(u18:Get("VerifyUser"):CallServerAsync())
                    local v59
                    if v58 then
                        v59 = v58.timeout
                    else
                        v59 = v58
                    end
                    if v59 ~= 0 and (v59 == v59 and v59) then
                        local v60 = u26
                        local v61 = v58.timeout - u13:GetServerTimeNow()
                        local v62 = math.round(v61)
                        v60("Please wait " .. tostring(v62) .. " seconds before trying again.")
                        u24(false)
                    end
                end)
            })
        end
        if v57 then
            v40[v56 + 1] = v57
        end
        v37[v38 + 1] = u11.createElement("Frame", v39, v40)
        v37[v38 + 2] = u11.createElement("TextLabel", {
            ["RichText"] = true,
            ["TextSize"] = 12,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 12),
            ["Position"] = UDim2.new(0, 0, 1, -12),
            ["Text"] = v25,
            ["TextColor3"] = u16.backgroundError,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["Font"] = Enum.Font.Roboto
        })
        v35.DiscordConnectionContent = u11.createElement("Frame", v36, v37)
        return u11.createFragment({
            ["DiscordConnectionContainer"] = u11.createElement("Frame", v34, v35)
        })
    end)
}