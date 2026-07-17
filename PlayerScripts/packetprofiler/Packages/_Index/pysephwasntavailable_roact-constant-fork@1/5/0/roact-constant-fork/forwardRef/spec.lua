-- Decompiled with Potassium's decompiler.

return function() -- Line: 4
    local assign = require(script.Parent.assign);
    local createElement = require(script.Parent.createElement);
    local createRef = require(script.Parent.createRef);
    local forwardRef = require(script.Parent.forwardRef);
    local createReconciler = require(script.Parent.createReconciler);
    local Component = require(script.Parent.Component);
    local GlobalConfig = require(script.Parent.GlobalConfig);
    local Ref = require(script.Parent.PropMarkers.Ref);
    local u1 = createReconciler((require(script.Parent.RobloxRenderer)));
    it("should update refs when switching between children", function() -- Line: 18
        -- upvalues: createElement (copy), Ref (copy), forwardRef (copy), assign (copy), createRef (copy), u1 (copy)
        local function FunctionComponent(p2) -- Line: 19
            -- upvalues: createElement (ref), Ref (ref)
            local forwardedRef = p2.forwardedRef;
            local v3;

            if p2.setRefOnDiv then
                v3 = nil;
            else
                v3 = forwardedRef;
                forwardedRef = nil;
            end;

            return createElement("Frame", nil, {
                First = createElement("Frame", {
                    [Ref] = forwardedRef
                }, {
                    Child = createElement("TextLabel", {
                        Text = "First"
                    })
                }),
                Second = createElement("ScrollingFrame", {
                    [Ref] = v3
                }, {
                    Child = createElement("TextLabel", {
                        Text = "Second"
                    })
                })
            });
        end;

        local v6 = forwardRef(function(p4, p5) -- Line: 48
            -- upvalues: createElement (ref), FunctionComponent (copy), assign (ref)
            return createElement(FunctionComponent, assign({}, p4, {
                forwardedRef = p5
            }));
        end);
        local v7 = createRef();
        local v8 = createElement(v6, {
            [Ref] = v7,
            setRefOnDiv = true
        });
        local v9 = u1.mountVirtualTree(v8, nil, "switch refs");
        expect(v7.current.ClassName).to.equal("Frame");
        u1.unmountVirtualTree(v9);
        local v10 = createElement(v6, {
            [Ref] = v7,
            setRefOnDiv = false
        });
        local v11 = u1.mountVirtualTree(v10, nil, "switch refs");
        expect(v7.current.ClassName).to.equal("ScrollingFrame");
        u1.unmountVirtualTree(v11);
    end);
    it("should support rendering nil", function() -- Line: 71
        -- upvalues: forwardRef (copy), createRef (copy), createElement (copy), Ref (copy), u1 (copy)
        local v14 = forwardRef(function(p12, p13) -- Line: 72
            return nil;
        end);
        local v15 = createRef();
        local v16 = createElement(v14, {
            [Ref] = v15
        });
        local v17 = u1.mountVirtualTree(v16, nil, "nil ref");
        expect(v15.current).to.equal(nil);
        u1.unmountVirtualTree(v17);
    end);
    it("should support rendering nil for multiple children", function() -- Line: 84
        -- upvalues: forwardRef (copy), createRef (copy), createElement (copy), Ref (copy), u1 (copy)
        local v20 = forwardRef(function(p18, p19) -- Line: 85
            return nil;
        end);
        local v21 = createRef();
        local v22 = createElement("Frame", nil, {
            NoRef1 = createElement("Frame"),
            WithRef = createElement(v20, {
                [Ref] = v21
            }),
            NoRef2 = createElement("Frame")
        });
        local v23 = u1.mountVirtualTree(v22, nil, "multiple children nil ref");
        expect(v21.current).to.equal(nil);
        u1.unmountVirtualTree(v23);
    end);
    itSKIP("should support defaultProps", function() -- Line: 103
        -- upvalues: createElement (copy), Ref (copy), forwardRef (copy), assign (copy), createRef (copy), u1 (copy)
        local function u25(p24) -- Line: 104
            -- upvalues: createElement (ref), Ref (ref)
            return createElement("Frame", {
                [Ref] = p24.forwardedRef
            }, {
                OptionalChild = p24.optional,
                RequiredChild = p24.required
            });
        end;

        local v28 = forwardRef(function(p26, p27) -- Line: 116
            -- upvalues: createElement (ref), u25 (copy), assign (ref)
            return createElement(u25, assign({}, p26, {
                forwardedRef = p27
            }));
        end);
        v28.defaultProps = {
            optional = createElement("TextLabel")
        };
        local v29 = createRef();
        local v30 = createElement(v28, {
            [Ref] = v29,
            optional = createElement("Frame"),
            required = createElement("ScrollingFrame")
        });
        local v31 = u1.mountVirtualTree(v30, nil, "with optional");
        expect(v29.current:FindFirstChild("OptionalChild").ClassName).to.equal("Frame");
        expect(v29.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame");
        u1.unmountVirtualTree(v31);
        local v32 = createElement(v28, {
            [Ref] = v29,
            required = createElement("ScrollingFrame")
        });
        local v33 = u1.mountVirtualTree(v32, nil, "with default");
        expect(v29.current:FindFirstChild("OptionalChild").ClassName).to.equal("TextLabel");
        expect(v29.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame");
        u1.unmountVirtualTree(v33);
    end);
    it("should error if not provided a callback when type checking is enabled", function() -- Line: 153
        -- upvalues: GlobalConfig (copy), forwardRef (copy)
        GlobalConfig.scoped({
            typeChecks = true
        }, function() -- Line: 156
            -- upvalues: forwardRef (ref)
            expect(function() -- Line: 157
                -- upvalues: forwardRef (ref)
                forwardRef(nil);
            end).to.throw();
        end);
        GlobalConfig.scoped({
            typeChecks = true
        }, function() -- Line: 164
            -- upvalues: forwardRef (ref)
            expect(function() -- Line: 165
                -- upvalues: forwardRef (ref)
                forwardRef("foo");
            end).to.throw();
        end);
    end);
    it("should work without a ref to be forwarded", function() -- Line: 171
        -- upvalues: createElement (copy), assign (copy), Ref (copy), forwardRef (copy), u1 (copy)
        local function Child() -- Line: 172
            return nil;
        end;

        local function Wrapper(p34) -- Line: 176
            -- upvalues: createElement (ref), Child (copy), assign (ref), Ref (ref)
            return createElement(Child, assign({}, p34, {
                [Ref] = p34.forwardedRef
            }));
        end;

        local v37 = createElement(forwardRef(function(p35, p36) -- Line: 180
            -- upvalues: createElement (ref), Wrapper (copy), assign (ref)
            return createElement(Wrapper, assign({}, p35, {
                forwardedRef = p36
            }));
        end), {
            value = 123
        });
        local v38 = u1.mountVirtualTree(v37, nil, "nil ref");
        u1.unmountVirtualTree(v38);
    end);
    it("should forward a ref for a single child", function() -- Line: 189
        -- upvalues: createElement (copy), Ref (copy), assign (copy), forwardRef (copy), createRef (copy), u1 (copy)
        local u39 = nil;

        local function u41(p40) -- Line: 191
            -- upvalues: u39 (ref), createElement (ref), Ref (ref)
            u39 = p40.value;

            return createElement("Frame", {
                [Ref] = p40[Ref]
            });
        end;

        local function u43(p42) -- Line: 198
            -- upvalues: createElement (ref), u41 (copy), assign (ref), Ref (ref)
            return createElement(u41, assign({}, p42, {
                [Ref] = p42.forwardedRef
            }));
        end;

        local v46 = forwardRef(function(p44, p45) -- Line: 202
            -- upvalues: createElement (ref), u43 (copy), assign (ref)
            return createElement(u43, assign({}, p44, {
                forwardedRef = p45
            }));
        end);
        local v47 = createRef();
        local v48 = createElement(v46, {
            [Ref] = v47,
            value = 123
        });
        local v49 = u1.mountVirtualTree(v48, nil, "single child ref");
        expect(u39).to.equal(123);
        expect(v47.current.ClassName).to.equal("Frame");
        u1.unmountVirtualTree(v49);
    end);
    it("should forward a ref for multiple children", function() -- Line: 215
        -- upvalues: createElement (copy), Ref (copy), assign (copy), forwardRef (copy), createRef (copy), u1 (copy)
        local function u51(p50) -- Line: 216
            -- upvalues: createElement (ref), Ref (ref)
            return createElement("Frame", {
                [Ref] = p50[Ref]
            });
        end;

        local function u53(p52) -- Line: 222
            -- upvalues: createElement (ref), u51 (copy), assign (ref), Ref (ref)
            return createElement(u51, assign({}, p52, {
                [Ref] = p52.forwardedRef
            }));
        end;

        local v56 = forwardRef(function(p54, p55) -- Line: 226
            -- upvalues: createElement (ref), u53 (copy), assign (ref)
            return createElement(u53, assign({}, p54, {
                forwardedRef = p55
            }));
        end);
        local v57 = createRef();
        local v58 = createElement("Frame", nil, {
            NoRef1 = createElement("Frame"),
            WithRef = createElement(v56, {
                [Ref] = v57
            }),
            NoRef2 = createElement("Frame")
        });
        local v59 = u1.mountVirtualTree(v58, nil, "multi child ref");
        expect(v57.current.ClassName).to.equal("Frame");
        u1.unmountVirtualTree(v59);
    end);
    it("should maintain child instance and ref through updates", function() -- Line: 242
        -- upvalues: createElement (copy), Ref (copy), assign (copy), forwardRef (copy), u1 (copy)
        local u60 = nil;

        local function u62(p61) -- Line: 244
            -- upvalues: u60 (ref), createElement (ref), Ref (ref)
            u60 = p61.value;

            return createElement("Frame", {
                [Ref] = p61[Ref]
            });
        end;

        local function u64(p63) -- Line: 251
            -- upvalues: createElement (ref), u62 (copy), assign (ref), Ref (ref)
            return createElement(u62, assign({}, p63, {
                [Ref] = p63.forwardedRef
            }));
        end;

        local v67 = forwardRef(function(p65, p66) -- Line: 255
            -- upvalues: createElement (ref), u64 (copy), assign (ref)
            return createElement(u64, assign({}, p65, {
                forwardedRef = p66
            }));
        end);
        local u68 = 0;
        local u69 = nil;

        local function v71(p70) -- Line: 262
            -- upvalues: u68 (ref), u69 (ref)
            u68 = u68 + 1;
            u69 = p70;
        end;

        local v72 = createElement(v67, {
            [Ref] = v71,
            value = 123
        });
        local v73 = u1.mountVirtualTree(v72, nil, "maintains instance");
        expect(u60).to.equal(123);
        expect(u69.ClassName).to.equal("Frame");
        expect(u68).to.equal(1);
        local v74 = createElement(v67, {
            [Ref] = v71,
            value = 456
        });
        local v75 = u1.updateVirtualTree(v73, v74);
        expect(u60).to.equal(456);
        expect(u68).to.equal(1);
        u1.unmountVirtualTree(v75);
    end);
    it("should not re-run the render callback on a deep setState", function() -- Line: 282
        -- upvalues: Component (copy), createElement (copy), Ref (copy), forwardRef (copy), assign (copy), u1 (copy)
        local u76 = nil;
        local u77 = {};
        local u78 = Component:extend("Inner");

        function u78.render(p79) -- Line: 287
            -- upvalues: u77 (ref), u76 (ref), createElement (ref), Ref (ref)
            table.insert(u77, "Inner");
            u76 = p79;

            return createElement("Frame", {
                [Ref] = p79.props.forwardedRef
            });
        end;

        local function Middle(p80) -- Line: 293
            -- upvalues: u77 (ref), createElement (ref), u78 (copy)
            table.insert(u77, "Middle");

            return createElement(u78, p80);
        end;

        local u83 = forwardRef(function(p81, p82) -- Line: 298
            -- upvalues: u77 (ref), createElement (ref), Middle (copy), assign (ref)
            table.insert(u77, "Forward");

            return createElement(Middle, assign({}, p81, {
                forwardedRef = p82
            }));
        end);
        local v84 = u1.mountVirtualTree(createElement(function() -- Line: 303, Name: App
            -- upvalues: u77 (ref), createElement (ref), u83 (copy)
            table.insert(u77, "App");

            return createElement(u83);
        end), nil, "deep setState");
        expect(#u77).to.equal(4);
        expect(u77[1]).to.equal("App");
        expect(u77[2]).to.equal("Forward");
        expect(u77[3]).to.equal("Middle");
        expect(u77[4]).to.equal("Inner");
        u77 = {};
        u76:setState({});
        expect(#u77).to.equal(1);
        expect(u77[1]).to.equal("Inner");
        u1.unmountVirtualTree(v84);
    end);
    it("should not include the ref in the forwarded props", function() -- Line: 322
        -- upvalues: createElement (copy), Ref (copy), forwardRef (copy), assign (copy), createRef (copy), u1 (copy)
        local u85 = nil;

        local function CaptureProps(p86) -- Line: 324
            -- upvalues: u85 (ref), createElement (ref), Ref (ref)
            u85 = p86;

            return createElement("Frame", {
                [Ref] = p86.forwardedRef
            });
        end;

        local v89 = forwardRef(function(p87, p88) -- Line: 329
            -- upvalues: createElement (ref), CaptureProps (copy), assign (ref)
            return createElement(CaptureProps, assign({}, p87, {
                forwardedRef = p88
            }));
        end);
        local v90 = createRef();
        local v91 = createElement(v89, {
            [Ref] = v90
        });
        local v92 = u1.mountVirtualTree(v91, nil, "no ref in props");
        expect(u85).to.be.ok();
        expect(u85.forwardedRef).to.equal(v90);
        expect(u85[Ref]).to.equal(nil);
        u1.unmountVirtualTree(v92);
    end);
end;