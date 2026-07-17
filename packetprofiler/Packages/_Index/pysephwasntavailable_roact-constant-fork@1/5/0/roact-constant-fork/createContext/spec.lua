-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local Component = require(script.Parent.Component);
    local NoopRenderer = require(script.Parent.NoopRenderer);
    local Children = require(script.Parent.PropMarkers.Children);
    local createContext = require(script.Parent.createContext);
    local createElement = require(script.Parent.createElement);
    local createFragment = require(script.Parent.createFragment);
    local createReconciler = require(script.Parent.createReconciler);
    local createSpy = require(script.Parent.createSpy);
    local u1 = createReconciler(NoopRenderer);
    local u2 = createReconciler((require(script.Parent.RobloxRenderer)));
    it("should return a table", function() -- Line: 18
        -- upvalues: createContext (copy)
        local v3 = createContext("Test");
        expect(v3).to.be.ok();
        expect((type(v3))).to.equal("table");
    end);
    it("should contain a Provider and a Consumer", function() -- Line: 24
        -- upvalues: createContext (copy)
        local v4 = createContext("Test");
        expect(v4.Provider).to.be.ok();
        expect(v4.Consumer).to.be.ok();
    end);
    describe("Provider", function() -- Line: 30
        -- upvalues: createContext (copy), createSpy (copy), createElement (copy), u1 (copy)
        it("should render its children", function() -- Line: 31
            -- upvalues: createContext (ref), createSpy (ref), createElement (ref), u1 (ref)
            local v5 = createContext("Test");
            local v6 = createSpy(function() -- Line: 34
                return nil;
            end);
            local v7 = createElement(v5.Provider, {
                value = "Test"
            }, {
                Listener = createElement(v6.value)
            });
            local v8 = u1.mountVirtualTree(v7, nil, "Provide Tree");
            u1.unmountVirtualTree(v8);
            expect(v6.callCount).to.equal(1);
        end);
    end);
    describe("Consumer", function() -- Line: 51
        -- upvalues: createContext (copy), createElement (copy), u1 (copy), createSpy (copy), Component (copy), createFragment (copy), Children (copy)
        it("should expect a render function", function() -- Line: 52
            -- upvalues: createContext (ref), createElement (ref), u1 (ref)
            local u9 = createElement(createContext("Test").Consumer);
            expect(function() -- Line: 56
                -- upvalues: u1 (ref), u9 (copy)
                u1.mountVirtualTree(u9, nil, "Provide Tree");
            end).to.throw();
        end);
        it("should return the default value if there is no Provider", function() -- Line: 61
            -- upvalues: createSpy (ref), createContext (ref), createElement (ref), u1 (ref)
            local v10 = createSpy();
            local v11 = createElement(createContext("Test").Consumer, {
                render = v10.value
            });
            local v12 = u1.mountVirtualTree(v11, nil, "Provide Tree");
            u1.unmountVirtualTree(v12);
            v10:assertCalledWith("Test");
        end);
        it("should pass the value to the render function", function() -- Line: 75
            -- upvalues: createSpy (ref), createContext (ref), createElement (ref), u1 (ref)
            local u13 = createSpy();
            local u14 = createContext("Test");
            local v15 = createElement(u14.Provider, {
                value = "NewTest"
            }, {
                Listener = createElement(function() -- Line: 79, Name: Listener
                    -- upvalues: createElement (ref), u14 (copy), u13 (copy)
                    return createElement(u14.Consumer, {
                        render = u13.value
                    });
                end)
            });
            local v16 = u1.mountVirtualTree(v15, nil, "Provide Tree");
            u1.unmountVirtualTree(v16);
            u13:assertCalledWith("NewTest");
        end);
        it("should update when the value updates", function() -- Line: 97
            -- upvalues: createSpy (ref), createContext (ref), createElement (ref), u1 (ref)
            local u17 = createSpy();
            local u18 = createContext("Test");

            local function Listener() -- Line: 101
                -- upvalues: createElement (ref), u18 (copy), u17 (copy)
                return createElement(u18.Consumer, {
                    render = u17.value
                });
            end;

            local v19 = createElement(u18.Provider, {
                value = "NewTest"
            }, {
                Listener = createElement(Listener)
            });
            local v20 = u1.mountVirtualTree(v19, nil, "Provide Tree");
            expect(u17.callCount).to.equal(1);
            u17:assertCalledWith("NewTest");
            u1.updateVirtualTree(v20, createElement(u18.Provider, {
                value = "ThirdTest"
            }, {
                Listener = createElement(Listener)
            }));
            expect(u17.callCount).to.equal(2);
            u17:assertCalledWith("ThirdTest");
            u1.unmountVirtualTree(v20);
        end);
        it("should update when the value updates through an update blocking component", function() -- Line: 138
            -- upvalues: createSpy (ref), createContext (ref), Component (ref), createFragment (ref), Children (ref), createElement (ref), u1 (ref)
            local u21 = createSpy();
            local u22 = createContext("Test");
            local v23 = Component:extend("UpdateBlocker");

            function v23.render(p24) -- Line: 144
                -- upvalues: createFragment (ref), Children (ref)
                return createFragment(p24.props[Children]);
            end;

            function v23.shouldUpdate(p25) -- Line: 148
                return false;
            end;

            local function v26() -- Line: 152
                -- upvalues: createElement (ref), u22 (copy), u21 (copy)
                return createElement(u22.Consumer, {
                    render = u21.value
                });
            end;

            local v27 = createElement(u22.Provider, {
                value = "NewTest"
            }, {
                Blocker = createElement(v23, nil, {
                    Listener = createElement(v26)
                })
            });
            local v28 = u1.mountVirtualTree(v27, nil, "Provide Tree");
            expect(u21.callCount).to.equal(1);
            u21:assertCalledWith("NewTest");
            u1.updateVirtualTree(v28, createElement(u22.Provider, {
                value = "ThirdTest"
            }, {
                Blocker = createElement(v23, nil, {
                    Listener = createElement(v26)
                })
            }));
            expect(u21.callCount).to.equal(2);
            u21:assertCalledWith("ThirdTest");
            u1.unmountVirtualTree(v28);
        end);
        it("should behave correctly when the default value is nil", function() -- Line: 188
            -- upvalues: createContext (ref), createSpy (ref), createElement (ref), u1 (ref)
            local u29 = createContext(nil);
            local u30 = createSpy();

            local function v31() -- Line: 192
                -- upvalues: createElement (ref), u29 (copy), u30 (copy)
                return createElement(u29.Consumer, {
                    render = u30.value
                });
            end;

            local v32 = u1.mountVirtualTree(createElement(v31), nil, "Provide Tree");
            expect(u30.callCount).to.equal(1);
            u30:assertCalledWith(nil);
            local v33 = u1.updateVirtualTree(v32, createElement(v31));
            u1.unmountVirtualTree(v33);
            expect(u30.callCount).to.equal(2);
            u30:assertCalledWith(nil);
        end);
    end);
    describe("Update order", function() -- Line: 210
        -- upvalues: createContext (copy), createElement (copy), u1 (copy)
        it("should update context at the same time as props", function() -- Line: 264
            -- upvalues: createContext (ref), createElement (ref), u1 (ref)
            local u34 = false;
            local u35 = false;
            local u36 = 0;
            local u37 = createContext("default");

            local function v40(u38) -- Line: 273
                -- upvalues: createElement (ref), u37 (copy), u36 (ref), u34 (ref), u35 (ref)
                return createElement(u37.Consumer, {
                    render = function(p39) -- Line: 275, Name: render
                        -- upvalues: u36 (ref), u38 (copy), u34 (ref), u35 (ref)
                        u36 = u36 + 1;

                        if p39 == "context_1" then
                            expect(u38.someProp).to.equal("prop_1");
                            u34 = true;

                            return;
                        end;

                        if p39 ~= "context_2" then
                            error("Unexpected context value");

                            return;
                        end;

                        expect(u38.someProp).to.equal("prop_2");
                        u35 = true;
                    end
                });
            end;

            local v41 = createElement(u37.Provider, {
                value = "context_1"
            }, {
                Child = createElement(v40, {
                    someProp = "prop_1"
                })
            });
            local v42 = createElement(u37.Provider, {
                value = "context_2"
            }, {
                Child = createElement(v40, {
                    someProp = "prop_2"
                })
            });
            local v43 = u1.mountVirtualTree(v41, nil, "UpdateObservationIsFun");
            u1.updateVirtualTree(v43, v42);
            expect(u36).to.equal(2);
            expect(u34).to.equal(true);
            expect(u35).to.equal(true);
        end);
    end);
    it("does not throw if willUnmount is called twice on a context consumer", function() -- Line: 317
        -- upvalues: createContext (copy), Component (copy), createElement (copy), ReplicatedStorage (copy), u2 (copy)
        local u44 = createContext({});
        local u45 = Component:extend("LowestComponent");

        function u45.init(p46) -- Line: 321
        end;

        function u45.render(p47) -- Line: 323
            -- upvalues: createElement (ref)
            return createElement("Frame");
        end;

        function u45.didMount(p48) -- Line: 327
            p48.props.onDidMountCallback();
        end;

        local u49 = Component:extend("FirstComponent");

        function u49.init(p50) -- Line: 332
        end;

        function u49.render(p51) -- Line: 334
            -- upvalues: createElement (ref), u44 (copy)
            return createElement(u44.Consumer, {
                render = function() -- Line: 336, Name: render
                    -- upvalues: createElement (ref)
                    return createElement("TextLabel");
                end
            });
        end;

        local u52 = Component:extend("ChildComponent");

        function u52.init(p53) -- Line: 344
            p53:setState({
                firstTime = true
            });
        end;

        local u54 = nil;

        function u52.render(p55) -- Line: 350
            -- upvalues: createElement (ref), u49 (copy), u45 (copy)
            if p55.state.firstTime then
                return createElement(u49);
            end;

            return createElement(u45, {
                onDidMountCallback = p55.props.onDidMountCallback
            });
        end;

        function u52.didMount(u56) -- Line: 360
            -- upvalues: u54 (ref)
            u54 = function() -- Line: 361
                -- upvalues: u56 (copy)
                u56:setState({
                    firstTime = false
                });
            end;
        end;

        local v57 = Component:extend("ParentComponent");
        local u58 = 0;

        function v57.init(u59) -- Line: 370
            -- upvalues: u58 (ref)
            u59:setState({
                count = 1
            });

            function u59.onDidMountCallback() -- Line: 373
                -- upvalues: u58 (ref), u59 (copy)
                u58 = u58 + 1;

                if u59.state.count < 5 then
                    u59:setState({
                        count = u59.state.count + 1
                    });
                end;
            end;
        end;

        function v57.render(p60) -- Line: 381
            -- upvalues: createElement (ref), u44 (copy), u52 (copy)
            return createElement("Frame", {}, {
                Provider = createElement(u44.Provider, {
                    value = {}
                }, {
                    ChildComponent = createElement(u52, {
                        count = p60.state.count,
                        onDidMountCallback = p60.onDidMountCallback
                    })
                })
            });
        end;

        local ScreenGui = Instance.new("ScreenGui");
        ScreenGui.Parent = ReplicatedStorage;
        u2.mountVirtualNode(createElement(v57), ScreenGui, "Some Key");
        expect(function() -- Line: 400
            -- upvalues: u54 (ref)
            u54();
        end).never.to.throw();
    end);
end;