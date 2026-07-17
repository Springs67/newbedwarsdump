-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KitUpperViewport = RuntimeLib.import(script, script.Parent, "kit-upper-viewport").KitUpperViewport;
local v3 = u2.Component:extend("AvatarUpper");

function v3.init(p4) -- Line: 9
end;

function v3.render(p5) -- Line: 11
    -- upvalues: u1 (copy), u2 (copy), KitUpperViewport (copy)
    local v6 = u1.copy(p5.props);
    v6.store = nil;
    v6.player = nil;
    v6[u2.Children] = nil;

    if p5.props.store.Bedwars.othersUsingKitSkin[p5.props.player.UserId] then
        local v7 = {
            kit = p5.props.store.Bedwars.kits[p5.props.player.UserId]
        };

        for i, v in v6 do
            v7[i] = v;
        end;

        local v8 = {};
        local v9 = #v8;
        local v10 = p5.props[u2.Children];

        if v10 then
            for i, v in v10 do
                if type(i) == "number" then
                    v8[v9 + i] = v;
                else
                    v8[i] = v;
                end;
            end;
        end;

        return u2.createElement(KitUpperViewport, v7, v8);
    end;

    local v11 = {
        ScaleType = "Crop",
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p5.props.player.UserId) .. "&w=352&h=352"
    };

    for i, v in v6 do
        v11[i] = v;
    end;

    local v12 = {};
    local v13 = #v12;
    local v14 = p5.props[u2.Children];

    if v14 then
        for i, v in v14 do
            if type(i) == "number" then
                v12[v13 + i] = v;
            else
                v12[i] = v;
            end;
        end;
    end;

    return u2.createElement("ImageLabel", v11, v12);
end;

return {
    AvatarUpper = v3
};