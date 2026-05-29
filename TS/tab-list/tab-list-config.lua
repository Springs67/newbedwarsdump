local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = nil
local function v7() --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v5 = u3.CurrentCamera.ViewportSize.X * u4.widthScale
    local v6 = u3.CurrentCamera.ViewportSize.Y * u4.heightScale
    return { v5 / 2, v6 * u4.rows.cards.height }
end
local v8 = {
    ["openedPositionX"] = 0.5,
    ["closedPositionX"] = 1.5,
    ["openedPositionY"] = 0.1,
    ["closedPositionY"] = 0.1,
    ["maxRowSizeX"] = 650,
    ["maxRowSizeY"] = 36,
    ["heightScale"] = v2.isSmallScreen() and 0.8 or 0.6
}
v2.isSmallScreen()
local v9 = 0.6
v8.widthScale = v9
v8.maxRowSize = Vector2.new(650, 36)
v8.visible = {
    ["columnHeaders"] = true,
    ["teamCards"] = true
}
v8.bgTransparency = {
    ["columnHeaders"] = 0.5,
    ["cardHeader"] = 0.4,
    ["playerRow"] = 0.4
}
local v10 = {}
local v11 = {
    ["totalWidth"] = 0.9,
    ["avatar"] = {
        ["width"] = 36 - (v2.isSmallScreen() and 8 or 0)
    },
    ["players"] = {
        ["leftPadding"] = 0.05
    }
}
v10.left = v11
v10.right = {
    ["totalWidth"] = 0.1,
    ["stats"] = {
        ["width"] = 0.7
    },
    ["kills"] = {
        ["width"] = 0.1
    }
}
v8.columns = v10
v8.rows = {
    ["columnHeaders"] = {
        ["bottomBorderHeight"] = 1
    },
    ["cards"] = {
        ["height"] = 0.93,
        ["scrollingHeight"] = 1,
        ["card"] = {
            ["height"] = 0,
            ["cardHeader"] = {
                ["height"] = 0.07
            },
            ["playerRow"] = {
                ["height"] = 0.07,
                ["bottomBorderHeight"] = 1
            }
        }
    }
}
u4 = v8
return {
    ["calcCardsDimensions"] = v7,
    ["tabListLayout"] = u4
}