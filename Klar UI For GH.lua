local Library = {}

local Players = game:GetService("Players")
local RS 	  = game:GetService("RunService")
local TS	  = game:GetService("TweenService")
local UIS 	  = game:GetService("UserInputService")

-- // Gui 2 lua by vFishy / xn90ubwbzuqegtn \\ --

function createInstance(className, properties)
	local instance = Instance.new(className)
	for k, v in pairs(properties) do
		if typeof(k) ~= 'string' then
			continue
		end

		instance[k] = v
	end
	return instance
end

local Theme = {
	MainColor = Color3.fromRGB(83, 0, 248),
	Background = Color3.fromRGB(0, 0 ,0),
	ValueColor = Color3.fromRGB(0, 0, 0), -- Value Frame for slider,
	DropOptionsColor = Color3.fromRGB(25, 26, 29),
	BGTransp = 0
}
	
local function CreateDrag(gui)
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		TS:Create(gui, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play();
	end

	local lastEnd = 0
	local lastMoved = 0
	local con
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
		end
	end)

	UIS.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)


	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
			lastMoved = os.clock()
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

function Library:Build()
	
	local Window = {
		ActiveTab = nil,
		AP = Theme.MainColor
	}
	
	local UIyay = Instance.new("ScreenGui", RS:IsStudio() and Players.LocalPlayer.PlayerGui or gethui())
	UIyay.ZIndexBehavior = Enum.ZIndexBehavior.Global
	
	local Main = createInstance("Frame", {
		Name = "Main",
		Position = UDim2.new(.5, 0, .5, 0),
		Size = UDim2.new(0.000, 709.000, 0.000, 442.000),
		Parent = UIyay,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ZIndex = 1
	})

	CreateDrag(Main)
	
	if UIS.TouchEnabled then
		local Mobilecard = createInstance("ImageButton", {
			Name = "Mobilecard",
			Position = UDim2.new(0.500, 0.000, 0.100, 0.000),
			Size = UDim2.new(0.000, 35.000, 0.000, 35.000),
			Parent = UIyay,
			AutoButtonColor = false,
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundColor3 = Theme.Background,
			BorderSizePixel = 0,
			ZIndex = 1000
		})

		CreateDrag(Mobilecard)
		
		local UICorner = createInstance("UICorner", {
			Parent = Mobilecard,
			CornerRadius = UDim.new(0, 6)
		})

		local CardLogo = createInstance("ImageLabel", {
			Name = "CardLogo",
			Position = UDim2.new(0.500, 0.000, 0.500, 0.000),
			Size = UDim2.new(1.200, 0.000, 1.200, 0.000),
			Parent = Mobilecard,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			ImageColor3 = Theme.MainColor,
			Image = "http://www.roblox.com/asset/?id=116128456854624",
			BorderSizePixel = 0,
			ZIndex = 1001
		})
		
		Mobilecard.MouseButton1Click:Connect(function()
			Main.Visible = not Main.Visible
		end)
	end
	
	local MC = createInstance("UICorner", {
		Parent = Main
	})

	local Header = createInstance("Frame", {
		Name = "Header",
		Position = UDim2.new(0.021, 0.000, 0.035, 0.000),
		Size = UDim2.new(0.000, 606.000, 0.000, 56.000),
		Parent = Main,
		BackgroundTransparency = 0.5,
		BackgroundColor3 = Color3.fromRGB(18, 16, 18),
		BorderSizePixel = 0,
		ZIndex = 2
	})

	local HC = createInstance("UICorner", {
		Parent = Header
	})
	
	local HeaderLayout = createInstance("UIListLayout", {
		Parent = Header,
		Padding = UDim.new(0, 3),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	local HeaderPad = createInstance("UIPadding", {
		Parent = Header,
		PaddingLeft = UDim.new(0, 5)
	})
	
	local HeaderPFP = createInstance("Frame", {
		Name = "HeaderPFP",
		Position = UDim2.new(0.899, 0.000, 0.035, 0.000),
		Size = UDim2.new(0.000, 68.000, 0.000, 56.000),
		Parent = Main,
		BackgroundTransparency = 0.5,
		BackgroundColor3 = Color3.fromRGB(18, 16, 18),
		BorderSizePixel = 0,
		ZIndex = 2
	})
	
	local Logo = createInstance("ImageLabel", {
		Name = "111",
		Position = UDim2.new(0.500, 0.000, 0.500, 0.000),
		Size = UDim2.new(1.2, 0, 1.2, 0),
		Parent = HeaderPFP,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		ImageTransparency = .2,
		ImageColor3 = Theme.MainColor,
		Image = "http://www.roblox.com/asset/?id=116128456854624",
		BorderSizePixel = 0,
		ZIndex = 3
	})

	local HPC = createInstance("UICorner", {
		Parent = HeaderPFP
	})

	local HPUIAC = createInstance("UIAspectRatioConstraint", {
		AspectRatio = 1.000,
		Parent = HeaderPFP
	})
	
	local NotifHolder = createInstance("Frame", {
		Name = "NotifHolder",
		Position = UDim2.new(1.000, 0.000, 0.000, 0.000),
		Size = UDim2.new(0.101, 100.000, 1.000, 0.000),
		Parent = UIyay,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		ZIndex = 15
	})
	
	UIS.InputBegan:Connect(function(input, gpe)
		if gpe then return end
		if input.KeyCode == Enum.KeyCode.LeftControl then
			Main.Visible = not Main.Visible
		end
	end)
	
	function Window:Notify(Text, Time)

		local UIListLayout = createInstance("UIListLayout", {
			Parent = NotifHolder,
			Padding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		local UIPadding = createInstance("UIPadding", {
			Parent = NotifHolder,
			PaddingBottom = UDim.new(0, 10)
		})

		local Notification = createInstance("Frame", {
			Name = "Notification",
			Position = UDim2.new(0.857, 0.000, 0.902, 0.000),
			Size = UDim2.new(0.000, 274.000, 0.000, 93.000),
			Parent = NotifHolder,
			BackgroundColor3 = Theme.Background,
			BackgroundTransparency = Theme.BGTransp,
			BorderSizePixel = 0,
			ZIndex = 20
		})

		local UICorner = createInstance("UICorner", {
			Parent = Notification
		})

		local Timer = createInstance("Frame", {
			Name = "Timer",
			Position = UDim2.new(0.090, 0.000, 0.863, 0.000),
			Size = UDim2.new(0.000, 223.000, 0.000, 5.000),
			Parent = Notification,
			BackgroundColor3 = Theme.MainColor,
			BorderSizePixel = 0,
			ZIndex = 21
		})

		local TimerCorner = createInstance("UICorner", {
			Parent = Timer,
			CornerRadius = UDim.new(1, 0)
		})

		local TextLabel = createInstance("TextLabel", {
			Name = "TextLabel",
			Position = UDim2.new(0.090, 0.000, 0.075, 0.000),
			Size = UDim2.new(0.000, 222.000, 0.000, 67.000),
			Parent = Notification,
			BackgroundTransparency = 1,
			Font = Enum.Font.SourceSans,
			Text = Text,
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			TextColor3 = Color3.fromRGB(230, 230, 230),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 22,
			BorderSizePixel = 0,
			ZIndex = 22
		})

		local UITextSizeConstraint = createInstance("UITextSizeConstraint", {
			Parent = TextLabel,
			MaxTextSize = 25,
			MinTextSize = 1
		})
		
		local tween = TS:Create(Timer, TweenInfo.new(Time, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 5)})
		tween:Play()
		tween.Completed:Connect(function()
			TS:Create(Timer, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
			TS:Create(Notification, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
			TS:Create(TextLabel, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextTransparency = 1}):Play()
			task.delay(.15, function()
				Notification:Destroy()
			end)
		end)
		
		
	end
	
	function Window:Tab(Asset)
		
		local TabInfo = {}
		
		local Tab = createInstance("ImageButton", {
			Name = "Tab",
			Position = UDim2.new(0.000, 0.000, 0.000, 0.000),
			Size = UDim2.new(0.000, 70.000, 0.000, 56.000),
			Parent = Header,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutoButtonColor = false,
			BorderSizePixel = 0,
			ZIndex = 3
		})

		local Icon = createInstance("ImageLabel", {
			Name = "Icon",
			Position = UDim2.new(0.500, 0.000, 0.500, 0.000),
			Size = UDim2.new(0.000, 25.000, 0.000, 31.000),
			Parent = Tab,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageTransparency = 0.7,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			Image = "rbxassetid://"..Asset,
			BorderSizePixel = 0,
			ZIndex = 4
		})

		local UIAspectRatioConstraint = createInstance("UIAspectRatioConstraint", {
			AspectRatio = 1.000,
			Parent = Icon
		})

		local Highlight = createInstance("Frame", {
			Name = "1",
			Position = UDim2.new(0.500, 0.000, 1.000, 0.000),
			Size = UDim2.new(0.000, 36.000, 0.000, 6.000),
			Parent = Tab,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BackgroundColor3 = Theme.MainColor,
			BorderSizePixel = 0,
			ZIndex = 4
		})

		local HighlightConsraint = createInstance("UISizeConstraint", {
			Parent = Highlight
		})

		local HighlightCorner = createInstance("UICorner", {
			Parent = Highlight,
			CornerRadius = UDim.new(1, 0)
		})
		
		local Canvas = createInstance("ScrollingFrame", {
			Name = "Canvas",
			Position = UDim2.new(0.021, 0.000, 0.195, 0.000),
			Size = UDim2.new(0.000, 678.000, 0.000, 339.000),
			Parent = Main,
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			ClipsDescendants = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 1
		})

		local UIListLayout = createInstance("UIListLayout", {
			Parent = Canvas,
			Padding = UDim.new(0, 15),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		local Left = createInstance("Frame", {
			Name = "Left",
			Position = UDim2.new(0.446, 0.000, 0.249, 0.000),
			Size = UDim2.new(0.000, 331.000, 1.000, 0.000),
			Parent = Canvas,
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(11, 10, 11),
			LayoutOrder = 1,
			BorderSizePixel = 0,
			ZIndex = 2
		})

		local UIListLayout_13 = createInstance("UIListLayout", {
			Parent = Left,
			Padding = UDim.new(0, 15),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		
		local Right = createInstance("Frame", {
			Name = "Right",
			Position = UDim2.new(0.511, 0.000, -0.442, 0.000),
			Size = UDim2.new(0.000, 331.000, 2.608, 0.000),
			Parent = Canvas,
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(11, 10, 11),
			LayoutOrder = 2,
			BorderSizePixel = 0,
			ZIndex = 2
		})
		
		local UIListLayout_50 = createInstance("UIListLayout", {
			Parent = Right,
			Padding = UDim.new(0, 15),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		
		local TabSpeed = .35
		
		function TabInfo:Activate()
			if Window.ActiveTab ~= nil then Window.ActiveTab:Deactivate() end
			Icon.Name = "111"
			TS:Create(Highlight, TweenInfo.new(TabSpeed, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play()
			TS:Create(Icon, TweenInfo.new(TabSpeed, Enum.EasingStyle.Sine), {ImageTransparency = 0.2}):Play()
			TS:Create(Icon, TweenInfo.new(TabSpeed, Enum.EasingStyle.Sine), {ImageColor3 = Theme.MainColor}):Play()
			Canvas.Visible = true
			Window.ActiveTab = TabInfo
		end
		
		function TabInfo:Deactivate()
			Icon.Name = "Icon"
			TS:Create(Highlight, TweenInfo.new(TabSpeed, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
			TS:Create(Icon, TweenInfo.new(TabSpeed, Enum.EasingStyle.Sine), {ImageTransparency = 0.7}):Play()
			TS:Create(Icon, TweenInfo.new(TabSpeed, Enum.EasingStyle.Sine), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			Canvas.Visible = false
		end
		
		if Window.ActiveTab == nil then TabInfo:Activate() end
		
		Tab.MouseButton1Down:Connect(function()
			TabInfo:Activate()
		end)
		
		
		function TabInfo:Section(Title, Side)
			
			local SectionInfo = {}
			
			local Section = createInstance("Frame", {
				Name = "Section",
				Position = UDim2.new(0.003, 0.000, 0.000, 0.000),
				Size = UDim2.new(1.000, 0.000, 0.000, 0.000),
				BackgroundTransparency = 0.5,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(18, 16, 18),
				BorderSizePixel = 0,
				ZIndex = 2
			})
			
			if Side:lower() == "left" then
				Section.Parent = Left
			else
				Section.Parent = Right
			end

			local HC_14 = createInstance("UICorner", {
				Parent = Section
			})

			local SectionTitle = createInstance("TextLabel", {
				Name = "11",
				Position = UDim2.new(0.046, 0.000, 0.000, 0.000),
				Size = UDim2.new(0.000, 319.000, 0.000, 20.000),
				Parent = Section,
				BackgroundTransparency = 1,
				Font = Enum.Font.SourceSansBold,
				Text = Title and Title:upper() or "TITLE : NONE",
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextWrapped = true,
				TextColor3 = Color3.fromRGB(83, 0, 248),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				BorderSizePixel = 0,
				ZIndex = 3
			})

			local UIListLayout_15 = createInstance("UIListLayout", {
				Parent = Section,
				Padding = UDim.new(0, 5),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			})

			local UIPadding = createInstance("UIPadding", {
				Parent = Section,
				PaddingBottom = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5)
			})
			
			function SectionInfo:Toggle(Title, Options)
				
				local ToggleInfo = {
					Value = Options.Default or false,
					Callback = Options.Callback or function() end
				}
				
				local Toggle_16 = createInstance("ImageButton", {
					Name = "Toggle_16",
					Position = UDim2.new(0.648, 0.000, 0.533, 0.000),
					Size = UDim2.new(1.000, 0.000, 0.000, 25.000),
					Parent = Section,
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
					ZIndex = 3
				})

				local ToggleTitle_17 = createInstance("TextLabel", {
					Name = "ToggleTitle_17",
					Position = UDim2.new(0.046, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 271.000, 0.000, 17.000),
					Parent = Toggle_16,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = Enum.Font.SourceSans,
					Text = Title,
					TextScaled = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextWrapped = true,
					TextColor3 = Color3.fromRGB(107, 107, 107),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					BorderSizePixel = 0,
					ZIndex = 4
				})

				local Switch_18 = createInstance("Frame", {
					Name = "Switch_18",
					Position = UDim2.new(0.820, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 35.000, 0.000, 10.000),
					Parent = Toggle_16,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(33, 35, 39),
					BorderSizePixel = 0,
					ZIndex = 5
				})

				local UICorner_19 = createInstance("UICorner", {
					Parent = Switch_18,
					CornerRadius = UDim.new(1, 0)
				})

				local Knob_20 = createInstance("Frame", {
					Name = "Knob_20",
					Position = UDim2.new(0.000, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 16.000, 0.000, 19.000),
					Parent = Switch_18,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(65, 66, 72),
					BorderSizePixel = 0,
					ZIndex = 6
				})

				local KCS_21 = createInstance("UIAspectRatioConstraint", {
					AspectRatio = 1.000,
					Parent = Knob_20
				})

				local KC_22 = createInstance("UICorner", {
					Parent = Knob_20,
					CornerRadius = UDim.new(1, 0)
				})

				local KnobInner_23 = createInstance("Frame", {
					Name = "KnobInner_23",
					Position = UDim2.new(0.500, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 10.000, 0.000, 10.000),
					Parent = Knob_20,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(33, 35, 39),
					BorderSizePixel = 0,
					ZIndex = 6
				})

				local KICNS_24 = createInstance("UIAspectRatioConstraint", {
					AspectRatio = 1.000,
					Parent = KnobInner_23
				})

				local KIC_25 = createInstance("UICorner", {
					Parent = KnobInner_23,
					CornerRadius = UDim.new(1, 0)
				})
				
				function ToggleInfo:SetVisual(v)
					if ToggleInfo.Value then
						TS:Create(ToggleTitle_17, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
						TS:Create(Knob_20, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Position = UDim2.new(0.570, 0.000, 0.500, 0.000)}):Play()
						TS:Create(Switch_18, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Theme.MainColor}):Play()
						TS:Create(KnobInner_23, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Theme.MainColor}):Play()
						TS:Create(Knob_20, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Theme.MainColor}):Play()
						TS:Create(Switch_18, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 0.7}):Play()
						Knob_20.Name = "1"
						KnobInner_23.Name = "1"
						Switch_18.Name = "1"
					else
						TS:Create(ToggleTitle_17, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(107, 107, 107)}):Play()
						TS:Create(Knob_20, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Position = UDim2.new(0.000, 0.000, 0.500, 0.000)}):Play()
						TS:Create(KnobInner_23, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(33, 35, 39)}):Play()
						TS:Create(Knob_20, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(65, 66, 72)}):Play()
						TS:Create(Switch_18, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(33, 35, 39)}):Play()
						TS:Create(Switch_18, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play()
						Knob_20.Name = "2"
						KnobInner_23.Name = "2"
						Switch_18.Name = "2"
					end
				end
				
				function ToggleInfo:Toggle(v)
					if v == nil then
						ToggleInfo.Value = not ToggleInfo.Value
					else
						ToggleInfo.Value = v
					end
					ToggleInfo:SetVisual(ToggleInfo.Value)
					ToggleInfo.Callback(ToggleInfo.Value)
				end
				
				Toggle_16.MouseButton1Down:Connect(function()
					ToggleInfo:Toggle()
				end)
				
				return ToggleInfo
			end
			
			function SectionInfo:Slider(Title, Options)
				
				local SliderInfo = {
					Value 		= Options.Default or 0,
					Min   		= Options.Min or 0,
					Max   		= Options.Max or 100,
					Float		= Options.Float or 1,
					Suffix 	    = Options.Suffix or "",
					Callback    = Options.Callback or function() end,
				}
				
				local Slider = createInstance("ImageButton", {
					Name = "Slider",
					Position = UDim2.new(0.648, 0.000, 0.533, 0.000),
					Size = UDim2.new(1.000, 0.000, 0.000, 25.000),
					Parent = Section,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
					AutoButtonColor = false,
					ZIndex = 3
				})

				local SliderTitle = createInstance("TextLabel", {
					Name = "SliderTitle",
					Position = UDim2.new(0.046, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 271.000, 0.000, 17.000),
					Parent = Slider,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = Enum.Font.SourceSans,
					Text = Title,
					TextScaled = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextWrapped = true,
					TextColor3 = Color3.fromRGB(107, 107, 107),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					BorderSizePixel = 0,
					ZIndex = 4
				})

				local SliderBack = createInstance("Frame", {
					Name = "SliderBack",
					Position = UDim2.new(0.521, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 134.000, 0.000, 5.000),
					Parent = Slider,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(33, 35, 39),
					BorderSizePixel = 0,
					ZIndex = 5
				})

				local SliderBackCorner = createInstance("UICorner", {
					Parent = SliderBack,
					CornerRadius = UDim.new(1, 0)
				})

				local SliderMain = createInstance("Frame", {
					Name = "1",
					Position = UDim2.new(0.000, 0.000, 0.000, 0.000),
					Size = UDim2.new(0.000, 64.000, 0.000, 5.000),
					Parent = SliderBack,
					BackgroundColor3 = Color3.fromRGB(83, 0, 248),
					BorderSizePixel = 0,
					ZIndex = 6
				})

				local SMC = createInstance("UICorner", {
					Parent = SliderMain,
					CornerRadius = UDim.new(1, 0)
				})

				local SliderKnob = createInstance("Frame", {
					Name = "SliderKnob",
					Position = UDim2.new(1.000, 0.000, 0.500, 0.000),
					Size = UDim2.new(1.500, 0.000, 1.500, 0.000),
					Parent = SliderMain,
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
					ZIndex = 7
				})

				local SKARCNS = createInstance("UIAspectRatioConstraint", {
					AspectRatio = 1.000,
					Parent = SliderKnob
				})

				local SKC = createInstance("UICorner", {
					Parent = SliderKnob,
					CornerRadius = UDim.new(1, 0)
				})
				
				local Valueframe = createInstance("Frame", {
					Name = "1",
					Position = UDim2.new(0.500, 0.000, 0.000, -20.000),
					Size = UDim2.new(0.000, 0.000, 0.000, 15.000),
					Parent = SliderKnob,
					AnchorPoint = Vector2.new(0.5, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = Color3.fromRGB(83, 0, 248),
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					ZIndex = 100
				})

				local ValueText = createInstance("TextLabel", {
					Name = "ValueText",
					Position = UDim2.new(0.000, 0.000, 0.000, 0.000),
					Size = UDim2.new(0.000, 0.000, 1.000, 0.000),
					Parent = Valueframe,
					BackgroundTransparency = 1,
					Font = Enum.Font.SourceSans,
					Text = SliderInfo.Value,
					AutomaticSize = Enum.AutomaticSize.X,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextColor3 = Theme.ValueColor,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextTransparency = 1,
					TextSize = 14,
					BorderSizePixel = 0,
					ZIndex = 101
				})

				local Valuecorner = createInstance("UICorner", {
					Parent = Valueframe,
					CornerRadius = UDim.new(0, 6)
				})

				local ValuePad = createInstance("UIPadding", {
					Parent = Valueframe,
					PaddingLeft = UDim.new(0, 5),
					PaddingRight = UDim.new(0, 5)
				})
				
				SliderInfo.Callback(SliderInfo.Value)

				--ValueText.FocusLost:Connect(function()
				--	local toNum
				--	pcall(function()
				--		toNum = tonumber(ValueText.Text)
				--	end)
				--	if toNum then
				--		SliderInfo:Set(math.clamp(ValueText.Text, SliderInfo.Min, SliderInfo.Max))
				--	else
				--		ValueText.Text = tostring(SliderInfo.Value)
				--	end
				--end)

				-- // Functions

				local PercentVal = SliderInfo.Value
				if math.abs(SliderInfo.Min) ~= SliderInfo.Min then
					PercentVal = SliderInfo.Value + math.abs(SliderInfo.Min)
				elseif SliderInfo.Min ~= 0 then
					PercentVal = SliderInfo.Value - math.abs(SliderInfo.Min)
				end
				local Percent = (PercentVal/(SliderInfo.Max-SliderInfo.Min));

				local decimalPlaces = 0
				if SliderInfo.Float < 1 then
					decimalPlaces = string.match(tostring(SliderInfo.Float), "%.(%d+)") and #string.match(tostring(SliderInfo.Float), "%.(%d+)") or 0
				end

				local Connection;
				UIS.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						if(Connection) then
							TS:Create(Valueframe, TweenInfo.new(.1, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
							TS:Create(ValueText, TweenInfo.new(.1, Enum.EasingStyle.Sine), {TextTransparency = 1}):Play()
							Connection:Disconnect();
							Connection = nil;
						end;
					end;
				end)

				function SliderInfo:Set(Value)
					if math.abs(SliderInfo.Min) ~= SliderInfo.Min then
						Value = Value + math.abs(SliderInfo.Min)
					elseif SliderInfo.Min ~= 0 then
						Value = Value - math.abs(SliderInfo.Min)
					end

					local Percent = (Value/(SliderInfo.Max-SliderInfo.Min));
					local Steps = (SliderInfo.Max - SliderInfo.Min) / SliderInfo.Float
					local NearestStep = math.floor(Percent * Steps + 0.5) / Steps

					SliderInfo.Value = SliderInfo.Min + (SliderInfo.Max - SliderInfo.Min) * NearestStep
					
					TS:Create(SliderMain, TweenInfo.new(.1, Enum.EasingStyle.Sine), {Size = UDim2.fromScale(NearestStep, 1)}):Play()

					local decimalPlaces = 0
					if SliderInfo.Float < 1 then
						decimalPlaces = string.match(tostring(SliderInfo.Float), "%.(%d+)") and #string.match(tostring(SliderInfo.Float), "%.(%d+)") or 0
					end

					SliderInfo.Value = tonumber(string.format("%.2f", SliderInfo.Value))
					ValueText.Text = string.format("%."..decimalPlaces.."f", SliderInfo.Value)..SliderInfo.Suffix
					pcall(SliderInfo.Callback, SliderInfo.Value) 
				end

				SliderInfo:Set(SliderInfo.Value)

				Slider.MouseButton1Down:Connect(function()
					if(Connection) then
						Connection:Disconnect();
					end;

					TS:Create(Valueframe, TweenInfo.new(.1, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play()
					TS:Create(ValueText, TweenInfo.new(.1, Enum.EasingStyle.Sine), {TextTransparency = 0}):Play()
					
					Connection = RS.Heartbeat:Connect(function()
						local Mouse = UIS:GetMouseLocation();
						Percent = math.clamp((Mouse.X - SliderBack.AbsolutePosition.X) / (SliderBack.AbsoluteSize.X), 0, 1);

						local Steps = (SliderInfo.Max - SliderInfo.Min) / SliderInfo.Float
						local NearestStep = math.floor(Percent * Steps + 0.5) / Steps

						SliderInfo.Value = SliderInfo.Min + (SliderInfo.Max - SliderInfo.Min) * NearestStep

						SliderInfo:Set(SliderInfo.Value)
					end);
				end)
				
				return SliderInfo
			end
			
			function SectionInfo:Keybind(Title, Options)
				
				local BindInfo = {
					Name 	  = Options.Name or "Keybind",
					Value     = Options.Default or nil,
					Callback  = Options.Callback or function() end,
				}
				
				local KeyBind = createInstance("ImageButton", {
					Name = "Keybind",
					Position = UDim2.new(0.648, 0.000, 0.533, 0.000),
					Size = UDim2.new(1.000, 0.000, 0.000, 25.000),
					Parent = Section,
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
					ZIndex = 3
				})

				local BindTitle = createInstance("TextLabel", {
					Name = "BindTitle",
					Position = UDim2.new(0.046, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 271.000, 0.000, 17.000),
					Parent = KeyBind,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = Enum.Font.SourceSans,
					Text = 'Keybind',
					TextScaled = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextWrapped = true,
					TextColor3 = Color3.fromRGB(107, 107, 107),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					BorderSizePixel = 0,
					ZIndex = 4
				})

				local BG = createInstance("Frame", {
					Name = "BG",
					Position = UDim2.new(0.925, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 0.000, 0.000, 20.000),
					Parent = KeyBind,
					BackgroundTransparency = 0.3499999940395355,
					AnchorPoint = Vector2.new(1, 0.5),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = Color3.fromRGB(33, 35, 39),
					BorderSizePixel = 0,
					ZIndex = 5
				})

				local UICorner = createInstance("UICorner", {
					Parent = BG,
					CornerRadius = UDim.new(0, 5)
				})

				local SelectedTitle = createInstance("TextLabel", {
					Name = "SelectedTitle",
					Position = UDim2.new(0.000, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 20.000, 0.000, 17.000),
					Parent = BG,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = Enum.Font.SourceSans,
					Text = BindInfo.Value,
					AutomaticSize = Enum.AutomaticSize.X,
					TextScaled = true,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextWrapped = true,
					TextColor3 = Color3.fromRGB(77, 78, 85),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 15,
					BorderSizePixel = 0,
					ZIndex = 7
				})

				local UIPadding = createInstance("UIPadding", {
					Parent = BG,
					PaddingLeft = UDim.new(0, 5),
					PaddingRight = UDim.new(0, 5)
				})
				
				function BindInfo:UpdateKey(key)
					BindInfo.Value = key
					SelectedTitle.Text = tostring(BindInfo.Value):gsub("Enum.KeyCode.", "")
				end
				
				if BindInfo.Value then 
					if BindInfo.Value == "MouseButton1" or  BindInfo.Value == "MouseButton2" then
						BindInfo:UpdateKey(Enum.UserInputType[BindInfo.Value])
						SelectedTitle.Text = Options.Default
					elseif BindInfo.Value:lower() == "none" then
						-- Nothing lol
					else
						BindInfo:UpdateKey(Enum.KeyCode[BindInfo.Value])
					end
				else
					SelectedTitle.Text = "None"
				end

				local KeyConnection

				KeyBind.MouseButton1Down:Connect(function()
					SelectedTitle.Text = "..."

					if KeyConnection then
						KeyConnection:Disconnect()
					end

					KeyConnection = UIS.InputBegan:Connect(function(input, gpe)
						TS:Create(SelectedTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
						TS:Create(BindTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
						if gpe then return end
						if input.UserInputType then
							BindInfo.Value = input.UserInputType
							SelectedTitle.Text = tostring(input.UserInputType):gsub("Enum.UserInputType.", "")
							KeyConnection:Disconnect()
							TS:Create(SelectedTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(77, 78, 85)}):Play()
							TS:Create(BindTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(107, 107, 107)}):Play()
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								return
							end
						end
						if input.KeyCode == Enum.KeyCode.Backspace then
							BindInfo.Value = nil
							SelectedTitle.Text = "None"
							KeyConnection:Disconnect()
							TS:Create(SelectedTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(77, 78, 85)}):Play()
							TS:Create(BindTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(107, 107, 107)}):Play()
							return
						end
						if input.KeyCode then
							BindInfo.Value = input.KeyCode
							SelectedTitle.Text = tostring(BindInfo.Value):gsub("Enum.KeyCode.", "")
							TS:Create(SelectedTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(77, 78, 85)}):Play()
							TS:Create(BindTitle, TweenInfo.new(.2, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(107, 107, 107)}):Play()
							KeyConnection:Disconnect()
						end
					end)

				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if BindInfo.Value and input.UserInputType == BindInfo.Value then
						BindInfo.Callback(tostring(BindInfo.Value):gsub("Enum.UserInputType.", ""))
					elseif BindInfo.Value and input.KeyCode == BindInfo.Value then
						BindInfo.Callback(tostring(BindInfo.Value):gsub("Enum.KeyCode.", ""))
					end
				end)

				return BindInfo
			end
			
			function SectionInfo:Dropdown(Title, Options)
				
				local DropInfo = {
					Options = Options.Options or {},
					Value 	= Options.Default or "None",
					Callback = Options.Callback or function() end
				}
				

				local DropDown = createInstance("ImageButton", {
					Name = "DropDown",
					Position = UDim2.new(0.648, 0.000, 0.533, 0.000),
					Size = UDim2.new(1.000, 0.000, 0.000, 25.000),
					Parent = Section,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
					AutoButtonColor = false,
					ZIndex = 3
				})

				local DropDownTitle = createInstance("TextLabel", {
					Name = "DropDownTitle",
					Position = UDim2.new(0.046, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 271.000, 0.000, 17.000),
					Parent = DropDown,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = Enum.Font.SourceSans,
					Text = Title,
					TextScaled = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextWrapped = true,
					TextColor3 = Color3.fromRGB(107, 107, 107),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					BorderSizePixel = 0,
					ZIndex = 4
				})

				local BG = createInstance("Frame", {
					Name = "BG",
					Position = UDim2.new(0.403, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 148.000, 0.000, 20.000),
					Parent = DropDown,
					BackgroundTransparency = 0.3499999940395355,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(33, 35, 39),
					BorderSizePixel = 0,
					ZIndex = 5
				})

				local UICorner_26 = createInstance("UICorner", {
					Parent = BG,
					CornerRadius = UDim.new(0, 5)
				})

				local SelectedTitle = createInstance("TextLabel", {
					Name = "SelectedTitle",
					Position = UDim2.new(0.046, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 135.000, 0.000, 17.000),
					Parent = BG,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = Enum.Font.SourceSans,
					Text = DropInfo.Value,
					TextScaled = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextWrapped = true,
					TextColor3 = Color3.fromRGB(77, 78, 85),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 15,
					BorderSizePixel = 0,
					ZIndex = 7
				})

				local Square = createInstance("Frame", {
					Name = "Square",
					Position = UDim2.new(0.862, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.000, 20.000, 0.000, 20.000),
					Parent = DropDown,
					BackgroundTransparency = 0.3499999940395355,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(33, 35, 39),
					BorderSizePixel = 0,
					ZIndex = 5
				})

				local UICorner_27 = createInstance("UICorner", {
					Parent = Square,
					CornerRadius = UDim.new(0, 5)
				})

				local ImageLabel = createInstance("ImageLabel", {
					Name = "ImageLabel",
					Position = UDim2.new(0.500, 0.000, 0.500, 0.000),
					Size = UDim2.new(1.000, 0.000, 1.000, 0.000),
					Parent = Square,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					ImageColor3 = Color3.fromRGB(77, 78, 85),
					Image = "rbxassetid://6034818372",
					BorderSizePixel = 0,
					ZIndex = 6
				})

				local OptionsHolder = createInstance("ImageButton", {
					Name = "holderyay",
					Position = UDim2.new(0.403, 0.000, 1.060, 0.000),
					Size = UDim2.new(0.000, 172.000, 0.000, 0.000),
					Parent = DropDown,
					Visible = false,
					--AutomaticSize = Enum.AutomaticSize.Y,
					AutoButtonColor = false,
					BackgroundColor3 = Color3.fromRGB(25, 26, 29),
					BorderSizePixel = 0,
					ZIndex = 1000
				})

				local UICorner_28 = createInstance("UICorner", {
					Parent = OptionsHolder,
					CornerRadius = UDim.new(0, 5)
				})
				
				DropInfo.Callback(DropInfo.Value)

				local CurrentOption
				local CurrentHighlight
				local Spacing = 0
				
				for i, v in DropInfo.Options do
					
					if i == 1 then
						Spacing = 5
					else
						Spacing = Spacing + 22
					end
					
					local Frame_32 = createInstance("Frame", {
						Name = "Frame_32",
						Position = UDim2.new(0.000, 0.000, 0.000, Spacing),
						Size = UDim2.new(0.000, 172.000, 0.000, 17.000),
						Parent = OptionsHolder,
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BorderSizePixel = 0,
						ZIndex = 1001
					})
					
					local TextButton_33 = createInstance("TextButton", {
						Name = "Frame_32",
						Position = UDim2.new(0.040, 0.000, 0.000, 0.000),
						Size = UDim2.new(0.000, 165.000, 0.000, 17.000),
						Parent = Frame_32,
						BackgroundTransparency = 1,
						Font = Enum.Font.SourceSans,
						Text = v,
						TextScaled = true,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						TextWrapped = true,
						TextColor3 = Color3.fromRGB(77, 78, 85),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						TextTransparency = 1,
						AutoButtonColor = false,
						TextSize = 14,
						BorderSizePixel = 0,
						ZIndex = 2001
					})

					local Highlight_34 = createInstance("Frame", {
						Name = "1",
						Position = UDim2.new(0.000, -1.000, 0.520, 0.000),
						Size = UDim2.new(0.000, 3.000, 0.000, 13.000),
						Parent = Frame_32,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundColor3 = Color3.fromRGB(83, 0, 248),
						BorderSizePixel = 0,
						ZIndex = 1003
					})
					
					if v == DropInfo.Value then
						
						CurrentOption = TextButton_33
						CurrentHighlight = Highlight_34
						
						TS:Create(Highlight_34, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play()
						TS:Create(CurrentOption, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0.000, 159.000, 0.000, 17.000)}):Play()
						TS:Create(TextButton_33, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
						TS:Create(CurrentOption, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Position = UDim2.new(0.074, 0.000, 0.000, 0.000)}):Play()
					end
					
					TextButton_33.MouseButton1Down:Connect(function()
						if CurrentOption and CurrentHighlight then
							TS:Create(CurrentOption, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(77, 78, 85)}):Play()
							TS:Create(CurrentOption, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0.000, 165.000, 0.000, 17.000)}):Play()
							TS:Create(CurrentOption, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Position = UDim2.new(0.040, 0.000, 0.000, 0.000)}):Play()
							TS:Create(CurrentHighlight, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
						end
						
						CurrentOption = TextButton_33
						CurrentHighlight = Highlight_34
						
						TS:Create(Highlight_34, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play()
						TS:Create(CurrentOption, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0.000, 159.000, 0.000, 17.000)}):Play()
						TS:Create(TextButton_33, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
						TS:Create(CurrentOption, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Position = UDim2.new(0.074, 0.000, 0.000, 0.000)}):Play()
						
						DropInfo.Callback(v)
						
						for i = #v, 0, -1 do
							task.wait(.025)
							SelectedTitle.Text = string.sub(v, i)
						end
					end)
					
				end
				
				DropDown.MouseButton1Down:Connect(function()
					if OptionsHolder.Visible then
						TS:Create(OptionsHolder, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0.000, 172.000, 0.000, 0.000)}):Play()
						TS:Create(DropDownTitle, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(77, 78, 85)}):Play()
						for i, v in OptionsHolder:GetDescendants() do
							if v:IsA("TextButton") then
								TS:Create(v, TweenInfo.new(.1, Enum.EasingStyle.Sine), {TextTransparency = 1}):Play()
							elseif v.Name == "1" then
								TS:Create(v, TweenInfo.new(.15, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
							end
						end
						task.wait(.15)
						OptionsHolder.Visible = false
					else
						OptionsHolder.Visible = true
						task.wait()
						TS:Create(OptionsHolder, TweenInfo.new(.1, Enum.EasingStyle.Sine), {Size = UDim2.new(0.000, 172.000, 0.000, Spacing + 22)}):Play()
						TS:Create(DropDownTitle, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextColor3 = Color3.fromRGB(230, 230, 230)}):Play()
						if CurrentHighlight then TS:Create(CurrentHighlight, TweenInfo.new(.05, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play() end
						for i, v in OptionsHolder:GetDescendants() do
							if v:IsA("TextButton") then
								TS:Create(v, TweenInfo.new(.15, Enum.EasingStyle.Sine), {TextTransparency = 0}):Play()
							end
						end
					end
				end)
				
				return DropInfo
			end
			
			return SectionInfo
		end
		
		return TabInfo
	end
	
	function Window:UpdateTheme(Settings)
		Main.BackgroundColor3 = Theme.Background
		Mobilecard.BackgroundColor3 = Theme.Background
		Main.BackgroundTransparency = Theme.BGTransp
		Mobilecard.BackgroundColor3 = Theme.Background
		Mobilecard.BackgroundTransparency = Theme.BGTransp
		CardLogo.ImageColor3 = Theme.MainColor
		
		for i, v in Main:GetDescendants() do
			if v.Name == "1" then
				v.BackgroundColor3 = Theme.MainColor
			elseif v.Name == "11" then
				v.TextColor3 = Theme.MainColor
			elseif v.Name == "111" then
				v.ImageColor3 = Theme.MainColor
			elseif v.Name == "holderyay" then
				v.BackgroundColor3 = Theme.DropOptionsColor
			end
		end
	end
	
	return Window
end

local Lib = Library:Build()


ThemeSet = setmetatable({}, {
	__index = Theme,
	__newindex = function(self, key, val)
		if key == "MainColor" then
			rawset(Theme, key, val)
			Lib:UpdateTheme()
		end
		if key == "Background" then
			rawset(Theme, key, val)
			Lib:UpdateTheme()
		end
		if key == "BGTransp" then
			rawset(Theme, key, val)
			Lib:UpdateTheme()
		end
		if key == "DropOptionsColor" then
			rawset(Theme, key, val)
			Lib:UpdateTheme()
		end
		return rawset(Theme, key, val)
	end
})