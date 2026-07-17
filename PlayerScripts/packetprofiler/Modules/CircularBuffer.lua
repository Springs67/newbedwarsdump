-- Decompiled with Potassium's decompiler.

local function rotate_indice(p1, p2) -- Line: 3
    return (p1 - 1) % p2 + 1;
end;

local u6 = {
    filled = function(p3) -- Line: 9, Name: filled
        return #p3.history == p3.max_length;
    end,

    push = function(p4, p5) -- Line: 13, Name: push
        if not p4:filled() then
            p4.history[#p4.history + 1] = p5;

            return;
        end;

        p4.history[p4.oldest] = p5;
        p4.oldest = p4.oldest == p4.max_length and 1 or p4.oldest + 1;
    end,

    metatable = {}
};

function u6.metatable.__index(p7, p8) -- Line: 27
    local v9 = #p7.history;

    if p8 == 0 or v9 < math.abs(p8) then
        return nil;
    end;

    if p8 >= 1 then
        return p7.history[(p7.oldest - p8 - 1) % v9 + 1];
    end;

    if p8 <= -1 then
        return p7.history[(p8 + 1 + p7.oldest - 1) % v9 + 1];
    end;
end;

function u6.metatable.__len(p10) -- Line: 41
    return #p10.history;
end;

function u6.new(p11) -- Line: 45
    -- upvalues: u6 (copy)
    if type(p11) ~= "number" or p11 <= 1 then
        error("Buffer length must be a positive integer");
    end;

    local v12 = {
        oldest = 1,
        history = {},
        max_length = p11,
        push = u6.push,
        filled = u6.filled
    };
    setmetatable(v12, u6.metatable);

    return v12;
end;

return u6;