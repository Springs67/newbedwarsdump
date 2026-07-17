-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local UILayers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local v16 = v2.new(u1)(function(p4, p5) -- Line: 10
    -- upvalues: Flamework (copy), UILayers (copy), FullScreenMenuBackgroundPresets (copy), u1 (copy), FullScreenMenu (copy)
    local useState = p5.useState;
    local u6, u7 = useState(nil);
    local v8, u9 = useState(false);

    local function v10() -- Line: 14
        -- upvalues: Flamework (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
    end;

    local v11 = {
        ContainerSize = UDim2.fromScale(1, 1)
    };
    local v12 = {};

    for i, v in FullScreenMenuBackgroundPresets.GENERIC_BW_IMAGE_PRESET do
        v12[i] = v;
    end;

    v11.Background = v12;
    v11.ExitButton = {
        OnClick = v10
    };
    v11.BackButton = {
        ShouldShow = v8,

        OnClick = function() -- Line: 30, Name: OnClick
            -- upvalues: u6 (copy), u9 (copy), u7 (copy)
            local v13 = u6;

            if v13 ~= nil then
                v13();
            end;

            local v14 = u9;

            if v14 ~= nil then
                v14(false);
            end;

            local v15 = u7;

            if v15 ~= nil then
                v15(function() -- Line: 41
                end);
            end;
        end
    };
    v11.EnableButtonBackgroundPanel = true;
    v11.DisableScaleComponent = true;
    v11.ScreenGuiProps = {
        ClipToDeviceSafeArea = false
    };
    v11.UseFrame = true;

    return u1.createElement(FullScreenMenu, v11);
end);

return {
    CollectionApp = v3.connect(function(p17, p18) -- Line: 54
        local v19 = {};

        for i, v in p18 do
            v19[i] = v;
        end;

        v19.SelectedEmotes = p17.Locker.selectedEmotes;

        return v19;
    end)(v16)
};