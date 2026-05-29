local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "image-input").ImageInput
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanManagementEmblemUpload"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u7
            [4] = u5
            [5] = u9
            [6] = u4
            [7] = u10
        --]]
        local v13 = p12.useState
        local v14 = u11.CurrentEmblem
        local u15, u16 = v13(v14 == nil and "" or v14)
        local v17, u18 = v13(false)
        local function v20() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u6
                [3] = u15
                [4] = u11
                [5] = u2
            --]]
            u18(true)
            u6.Controllers.ClanController:updateClanEmblem(u15, u11.ClanId):andThen(function(p19) --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u2
                --]]
                u18(false)
                if not p19.success then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = p19.errorMessage
                    })
                end
            end)
        end
        local v21 = u7.createFragment
        local v23 = {
            ["EmblemUploadContainer"] = u7.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 60)
            }, { u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 0)
                }), u7.createElement(u9, {
                    ["InputBoxLabel"] = "Clan Emblem",
                    ["StartingValue"] = u15,
                    ["OnInput"] = function(p22) --[[ Name: OnInput, Line 48 ]]
                        --[[
                        Upvalues:
                            [1] = u16
                        --]]
                        u16(p22)
                    end,
                    ["ContainerProps"] = {
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.new(0.5, 0, 1, 0)
                    }
                }), u7.createElement(u4, {
                    ["Text"] = "<b>Update Emblem</b>",
                    ["Selectable"] = false,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(0.2, 0, 0, 30),
                    ["BackgroundColor3"] = u10.backgroundSuccess,
                    ["OnClick"] = v17 and function() --[[ Line: 61 ]] end or v20,
                    ["Loading"] = v17
                }) })
        }
        return v21(v23)
    end)
}