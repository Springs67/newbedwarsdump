-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local v3 = u2.Component:extend("KitUpperViewport");

function v3.init(p4, p5) -- Line: 9
end;

function v3.render(p6) -- Line: 11
    -- upvalues: u1 (copy), u2 (copy), KitViewport (copy)
    local v7 = u1.copy(p6.props);
    v7.kit = nil;
    v7[u2.Children] = nil;
    local v8 = {
        Kit = p6.props.kit
    };
    local v9 = {};
    local v10 = #v9;
    local v11 = p6.props[u2.Children];

    if v11 then
        for i, v in v11 do
            if type(i) == "number" then
                v9[v10 + i] = v;
            else
                v9[i] = v;
            end;
        end;
    end;

    return u2.createElement(KitViewport, v8, v9);
end;

return {
    KitUpperViewport = v3
};