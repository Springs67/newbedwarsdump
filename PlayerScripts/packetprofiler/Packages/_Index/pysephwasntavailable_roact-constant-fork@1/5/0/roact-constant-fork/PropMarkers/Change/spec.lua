-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Type = require(script.Parent.Parent.Type);
    local Change = require(script.Parent.Change);
    it("should yield change listener objects when indexed", function() -- Line: 6
        -- upvalues: Type (copy), Change (copy)
        expect(Type.of(Change.Text)).to.equal(Type.HostChangeEvent);
        expect(Type.of(Change.Selected)).to.equal(Type.HostChangeEvent);
    end);
    it("should yield the same object when indexed again", function() -- Line: 11
        -- upvalues: Change (copy)
        local Text = Change.Text;
        local Text2 = Change.Text;
        local Selected = Change.Selected;
        expect(Text).to.equal(Text2);
        expect(Text).never.to.equal(Selected);
    end);
end;