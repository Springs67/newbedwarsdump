-- Decompiled with Potassium's decompiler.

local Packages = require(script.Parent.Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local v1 = Roact.Component:extend("PacketFrame");

function v1.render(u2) -- Line: 9
    -- upvalues: Roact (copy)
    local props = u2.props;

    return Roact.createElement("ImageLabel", {
        Image = "rbxassetid://10370998310",
        BorderSizePixel = 0,
        Size = props.PacketsChanged:map(function(p3) -- Line: 12
            -- upvalues: props (copy), Roact (ref), u2 (copy)
            local v4 = p3[props.Index];

            if not v4 then
                return Roact.Constant.SkipBindingUpdate;
            end;

            local v5 = math.min(v4.TotalSize / u2.props.MaxFrameSize, 1);
            local v6 = UDim2.fromScale(1 / props.MaxFrames, v5);

            if v6 == u2.PreviousFrameSize then
                return Roact.Constant.SkipBindingUpdate;
            end;

            u2.PreviousFrameSize = v6;

            return v6;
        end),
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(1 - props.Index / props.MaxFrames, 1),
        Visible = props.PacketsChanged:map(function(p7) -- Line: 31
            -- upvalues: props (copy), u2 (copy), Roact (ref)
            local v8 = p7[props.Index] ~= nil;

            if v8 == u2.PreviousIsVisible then
                return Roact.Constant.SkipBindingUpdate;
            end;

            u2.PreviousIsVisible = v8;

            return v8;
        end),
        BorderColor3 = Color3.new(1, 1, 1)
    });
end;

return v1;