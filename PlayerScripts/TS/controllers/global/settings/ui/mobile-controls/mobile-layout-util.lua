-- Decompiled with Potassium's decompiler.

local v1 = {
    ButtonMaxSize = 150,
    ButtonMinSize = 15
};
local u2 = {
    SwordSwing = "rbxassetid://9214721575",
    Sprint = "rbxassetid://9214720260",
    Jump = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png",
    Ping = "rbxassetid://13694647600",
    MoveMountDown = "rbxassetid://9215842213",
    MoveMountUp = "rbxassetid://9214720847",
    AutoBridge = "rbxassetid://9214721352",
    Interact = "rbxassetid://12439453599",
    BlockBreak = "rbxassetid://13388603085",
    Consume = "rbxassetid://9215515909",
    FireProjectile = "rbxassetid://13383037656",
    Recall = "rbxassetid://12504361273",
    DropItem = "rbxassetid://9214720847"
};

function v1.getImage(p3) -- Line: 24
    -- upvalues: u2 (copy)
    return u2[p3];
end;

function v1.getImageRectOffset(p4) -- Line: 29
    if p4 == "Jump" then
        return Vector2.new(1, 146);
    end;

    return Vector2.zero;
end;

function v1.getImageRectSize(p5) -- Line: 33
    if p5 == "Jump" then
        return Vector2.new(144, 144);
    end;

    return Vector2.zero;
end;

return {
    MobileLayoutUtil = v1
};