--!strict

-- Types
export type Properties = {[string]: any}
export type EventCallback = (...any) -> ()
export type PaletteColor = "Background" | "Surface" | "Control" | "SurfaceHover" | "Border" | "Accent" | "Danger" | "Text" | "MutedText"
export type Palette = {
	Background: Color3,
	Surface: Color3,
	Control: Color3,
	SurfaceHover: Color3,
	Border: Color3,
	Accent: Color3,
	Danger: Color3,
	Text: Color3,
	MutedText: Color3,
}
export type PalettePreset = {Name: string, Palette: Palette}
export type PaletteColorInfo = {Name: PaletteColor, Label: string}
type KeybindCapture = {_keybind: Enum.KeyCode?, SetKeybind: (self: any, keyCode: Enum.KeyCode?) -> ()}
type TransparencyBindings = {[string]: number}
export type WindowOptions = {
	Name: string?,
	Title: string?,
	Logo: string?,
	Size: UDim2?,
	Position: UDim2?,
	ToggleKey: Enum.KeyCode?,
	Palette: {[string]: Color3}?,
	Transparency: number?,
	Scale: number?,
}
export type PageOptions = {
	Name: string,
	Icon: string?,
	IconPosition: UDim2?,
	IconSize: UDim2?,
	ButtonPosition: UDim2?,
}
export type SectionOptions = {Name: string, Description: string?}
export type LabelOptions = {Text: string, Color: Color3?, Size: number?}
export type Label = {
	GetColor: (self: Label) -> Color3,
	GetSize: (self: Label) -> number,
	GetText: (self: Label) -> string,
	SetColor: (self: Label, color: Color3) -> (),
	SetSize: (self: Label, size: number) -> (),
	SetText: (self: Label, text: string) -> (),
	Instance: TextLabel,
	[string]: any,
}
export type ButtonOptions = {Description: string?, Callback: (() -> ())?}
export type KeybindOptions = {Enabled: boolean?, Default: Enum.KeyCode?}
export type KeybindControlOptions = {Text: string, Default: Enum.KeyCode?, Callback: ((Enum.KeyCode) -> ())?}
export type KeybindControl = {
	GetValue: (self: KeybindControl) -> Enum.KeyCode,
	SetKeybind: (self: KeybindControl, keyCode: Enum.KeyCode?) -> (),
	SetValue: (self: KeybindControl, keyCode: Enum.KeyCode) -> (),
	Instance: Frame,
	[string]: any,
}
export type ToggleOptions = {Text: string, Description: string?, Default: boolean?, Keybind: KeybindOptions?, Callback: ((boolean) -> ())?}
export type SliderOptions = {
	Minimum: number,
	Maximum: number,
	Default: number?,
	Step: number?,
	Suffix: string?,
	Callback: ((number) -> ())?,
}
export type DropdownOptions = {
	Text: string,
	Description: string?,
	Options: {string},
	Default: string?,
	OpenDirection: ("Auto" | "Up" | "Down")?,
	Callback: ((string) -> ())?,
}
export type ColorPickerOptions = {
	Text: string,
	Description: string?,
	Default: Color3,
	Callback: ((Color3) -> ())?,
}
export type TextBoxOptions = {
	Description: string?,
	Default: string?,
	Placeholder: string?,
	ClearOnFocus: boolean?,
	KeyCapture: boolean?,
	Callback: ((string, boolean) -> ())?,
}
export type ImageOptions = {Image: string, Height: number?, ScaleType: Enum.ScaleType?, Color: Color3?}
export type CardOptions = {Title: string, Description: string, Icon: string?, Callback: (() -> ())?}
export type PalettePresetOptions = {Name: string, Palette: Palette, Callback: (() -> ())?}
export type HomeOptions = {
	Welcome: string?,
	HubName: string?,
	Status: string?,
	Version: string?,
	Logo: string?,
	Footer: string?,
	Cards: {CardOptions}?,
}
export type Toggle = {
	GetValue: (self: Toggle) -> boolean,
	GetKeybind: (self: Toggle) -> Enum.KeyCode?,
	SetKeybind: (self: Toggle, keyCode: Enum.KeyCode?) -> (),
	SetValue: (self: Toggle, value: boolean, emit: boolean?) -> (),
	Instance: Frame,
	[string]: any,
}
export type Slider = {
	GetValue: (self: Slider) -> number,
	SetValue: (self: Slider, value: number, emit: boolean?) -> (),
	Instance: Frame,
	[string]: any,
}
export type Dropdown = {
	GetValue: (self: Dropdown) -> string,
	SetOpen: (self: Dropdown, open: boolean) -> (),
	SetValue: (self: Dropdown, value: string, emit: boolean?) -> (),
	Instance: Frame,
	[string]: any,
}
export type ColorPicker = {
	GetValue: (self: ColorPicker) -> Color3,
	SetOpen: (self: ColorPicker, open: boolean) -> (),
	SetValue: (self: ColorPicker, value: Color3, emit: boolean?) -> (),
	Instance: Frame,
	[string]: any,
}
export type TextBoxControl = {
	GetValue: (self: TextBoxControl) -> string,
	SetValue: (self: TextBoxControl, value: string, emit: boolean?) -> (),
	Instance: Frame,
	Input: TextBox,
	[string]: any,
}
export type Section = {
	AddButton: (self: Section, options: ButtonOptions) -> TextButton,
	AddCard: (self: Section, options: CardOptions) -> TextButton,
	AddColorPicker: (self: Section, options: ColorPickerOptions) -> ColorPicker,
	AddDropdown: (self: Section, options: DropdownOptions) -> Dropdown,
	AddImage: (self: Section, options: ImageOptions) -> ImageLabel,
	AddKeybind: (self: Section, options: KeybindControlOptions) -> KeybindControl,
	AddLabel: (self: Section, options: LabelOptions | string) -> Label,
	AddPalettePreset: (self: Section, options: PalettePresetOptions) -> TextButton,
	AddSeparator: (self: Section) -> Frame,
	AddSlider: (self: Section, options: SliderOptions) -> Slider,
	AddTextBox: (self: Section, options: TextBoxOptions) -> TextBoxControl,
	AddToggle: (self: Section, options: ToggleOptions) -> Toggle,
	Instance: Frame,
	[string]: any,
}
export type Page = {
	AddHome: (self: Page, options: HomeOptions?) -> Frame,
	AddSection: (self: Page, options: SectionOptions | string) -> Section,
	Select: (self: Page) -> (),
	Button: TextButton,
	Icon: ImageLabel?,
	Instance: ScrollingFrame,
	Name: string,
	[string]: any,
}
export type Window = {
	AddPage: (self: Window, options: PageOptions | string) -> Page,
	Destroy: (self: Window) -> (),
	GetPage: (self: Window, name: string) -> Page?,
	IsDestroyed: (self: Window) -> boolean,
	SelectPage: (self: Window, page: Page | string) -> (),
	GetPaletteColor: (self: Window, name: PaletteColor) -> Color3,
	SetFont: (self: Window, font: Enum.Font) -> (),
	SetPalette: (self: Window, palette: Palette) -> (),
	SetPaletteColor: (self: Window, name: PaletteColor, color: Color3) -> (),
	SetScale: (self: Window, scale: number) -> (),
	SetTransparency: (self: Window, transparency: number) -> (),
	SetToggleKey: (self: Window, keyCode: Enum.KeyCode) -> (),
	SetVisible: (self: Window, visible: boolean) -> (),
	Toggle: (self: Window) -> boolean,
	MainFrame: Frame,
	Root: ScreenGui,
	[string]: any,
}
export type Library = {
	Apply: <T>(instance: T, properties: Properties) -> T,
	Connect: (instance: Instance, eventName: string, callback: EventCallback) -> RBXScriptConnection,
	Create: <T>(className: string, properties: Properties?, children: {Instance}?) -> T,
	Observe: (instance: Instance, propertyName: string, callback: EventCallback) -> RBXScriptConnection,
	Tween: (instance: Instance, tweenInfo: TweenInfo, goals: Properties) -> Tween,
	new: (options: WindowOptions?) -> Window,
	Palette: Palette,
	PaletteColors: {PaletteColorInfo},
	[string]: any,
}

-- Constants
const DEFAULT_PALETTE: Palette = table.freeze({
	Background = Color3.fromRGB(17, 18, 22),
	Surface = Color3.fromRGB(22, 25, 32),
	Control = Color3.fromRGB(11, 13, 18),
	SurfaceHover = Color3.fromRGB(34, 39, 49),
	Border = Color3.fromRGB(57, 64, 77),
	Accent = Color3.fromRGB(120, 170, 235),
	Danger = Color3.fromRGB(196, 43, 28),
	Text = Color3.fromRGB(190, 205, 230),
	MutedText = Color3.fromRGB(143, 150, 163),
})
const GUI_OWNER_ATTRIBUTE: string = "UILibraryOwner"
const GUI_OWNER_VALUE: string = "ApotheosisUILibrary"
const PALETTE_COLORS: {PaletteColorInfo} = table.freeze({
	{ Name = "Background", Label = "Background" },
	{ Name = "Surface", Label = "Surface" },
	{ Name = "Control", Label = "Control Surface" },
	{ Name = "SurfaceHover", Label = "Surface Hover" },
	{ Name = "Border", Label = "Border" },
	{ Name = "Accent", Label = "Accent" },
	{ Name = "Danger", Label = "Close Button" },
	{ Name = "Text", Label = "Text" },
	{ Name = "MutedText", Label = "Muted Text" },
})
const LAYER = table.freeze({
	Window = 1,
	Page = 10,
	Section = 20,
	Content = 24,
	Sidebar = 40,
	Navigation = 44,
	TopBar = 60,
	Overlay = 100,
	Popup = 110,
})
const LAYOUT = table.freeze({
	WindowWidth = 655,
	WindowHeight = 424,
	WindowMinimumWidth = 560,
	WindowMinimumHeight = 360,
	WindowMaximumWidth = 1100,
	WindowMaximumHeight = 760,
	TopBarHeight = 47,
	TopBarRuleHeight = 1,
	TopBarInset = 8,
	TopBarButtonWidth = 46,
	TopBarButtonHeight = 47,
	TopBarDragRightInset = 92,
	TopBarTitleRightInset = 104,
	TopBarLogoSize = 37,
	SidebarWidth = 155,
	PageButtonHeight = 36,
	PageButtonGap = 4,
	PagePadding = 12,
	SectionPadding = 14,
	PageSectionGap = 12,
	SectionContentGap = 10,
	ControlGap = 6,
	ControlHeight = 42,
	ControlDescriptionHeight = 52,
	ControlRightInset = 8,
	ControlFieldWidth = 184,
	ControlFieldHeight = 30,
	ControlFieldRightInset = 200,
	DropdownLabelGap = 8,
	DropdownLeftPadding = 10,
	DropdownRightPadding = 10,
	DropdownOptionTextSize = 15,
	ToggleWidth = 44,
	ToggleHeight = 22,
	ToggleKeybindWidth = 68,
	ToggleKeybindGap = 8,
	ToggleKeybindLabelInset = 144,
	KeybindControlWidth = 88,
	SliderHeight = 42,
	SliderInset = 8,
	SliderValueWidth = 48,
	SliderValueGap = 12,
	SliderTrackHeight = 4,
	ColorPickerWidth = 270,
	ColorPickerHeight = 260,
	ColorPickerButtonWidth = 120,
	ColorPickerFieldHeight = 24,
	LabelHeight = 22,
	HomeInset = 12,
	HomeHeight = 325,
	HomeStatusTop = 44,
	HomeStatusHeight = 76,
	HomeMetadataLeft = 80,
	HomeStatusWidth = 60,
	HomeSeparatorLeft = 144,
	HomeVersionLeft = 164,
	HomeCardsTop = 136,
	HomeCardHeight = 121,
	HomeDividerTop = 273,
	HomeFooterTop = 281,
})
const FAST_TWEEN: TweenInfo = TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
const NORMAL_TWEEN: TweenInfo = TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
const DROPDOWN_TWEEN: TweenInfo = TweenInfo.new(0.18, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
const SECTION_TWEEN: TweenInfo = TweenInfo.new(0.24, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
const WINDOW_TWEEN: TweenInfo = TweenInfo.new(0.24, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
const INDICATOR_TWEEN: TweenInfo = TweenInfo.new(0.12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
const UI: Library = {} :: any
const WindowClass = {}
const PageClass = {}
const SectionClass = {}
const LabelClass = {}
const ToggleClass = {}
const KeybindControlClass = {}
const SliderClass = {}
const DropdownClass = {}
const ColorPickerClass = {}
const TextBoxClass = {}
const windowRegistry: {[Instance]: {[string]: Window}} = setmetatable({}, {__mode = "k"})

-- Services
const Players: Players = game:GetService("Players")
const CoreGuiService: CoreGui = game:GetService("CoreGui")
const RunService: RunService = game:GetService("RunService")
const TweenService: TweenService = game:GetService("TweenService")
const UserInputService: UserInputService = game:GetService("UserInputService")
const TextService: TextService = game:GetService("TextService")
const Workspace: Workspace = game:GetService("Workspace")

WindowClass.__index = WindowClass
PageClass.__index = PageClass
SectionClass.__index = SectionClass
LabelClass.__index = LabelClass
ToggleClass.__index = ToggleClass
KeybindControlClass.__index = KeybindControlClass
SliderClass.__index = SliderClass
DropdownClass.__index = DropdownClass
ColorPickerClass.__index = ColorPickerClass
TextBoxClass.__index = TextBoxClass

-- Functions
local function assertCondition(condition: boolean, message: string, level: number?): ()
	if not condition then
		error("UILibrary: " .. message, level or 3)
	end
end

local function isFiniteNumber(value: any): boolean
	return typeof(value) == "number"
		and value == value
		and value > -math.huge
		and value < math.huge
end

local function isFiniteUDim2(value: any): boolean
	return typeof(value) == "UDim2"
		and isFiniteNumber(value.X.Scale)
		and isFiniteNumber(value.X.Offset)
		and isFiniteNumber(value.Y.Scale)
		and isFiniteNumber(value.Y.Offset)
end

local function invoke(callback: EventCallback?, ...: any): ()
	if not callback then return end
	const success: boolean, reason: any = pcall(callback, ...)
	if not success then warn("UILibrary callback failed: " .. tostring(reason)) end
end

function UI.Apply<T>(instance: T, properties: Properties): T
	assertCondition(typeof(instance) == "Instance", "Apply expects an Instance")
	assertCondition(typeof(properties) == "table", "properties must be a table")
	const object: Instance = instance :: any
	const target: any = object
	local parent: Instance? = nil
	local hasParent: boolean = false
	for propertyName: string, value: any in properties do
		if propertyName == "Parent" then
			assertCondition(value == nil or typeof(value) == "Instance", "Parent must be an Instance or nil")
			parent = value
			hasParent = true
		else
			const success: boolean, reason: any = pcall(function(): ()
				target[propertyName] = value
			end)
			assertCondition(success, `cannot set {object.ClassName}.{propertyName}: {tostring(reason)}`, 2)
		end
	end
	if hasParent then object.Parent = parent end
	return instance
end

function UI.Create<T>(className: string, properties: Properties?, children: {Instance}?): T
	assertCondition(typeof(className) == "string" and #className > 0, "className must be non-empty")
	assertCondition(properties == nil or typeof(properties) == "table", "properties must be a table")
	assertCondition(children == nil or typeof(children) == "table", "children must be a table")
	const object: Instance = Instance.new(className)
	if properties then UI.Apply(object, properties) end
	if children then
		for index: number, child: Instance in children do
			assertCondition(typeof(child) == "Instance", `child #{index} must be an Instance`)
			child.Parent = object
		end
	end
	return object :: any
end

function UI.Connect(instance: Instance, eventName: string, callback: EventCallback): RBXScriptConnection
	assertCondition(typeof(instance) == "Instance", "Connect expects an Instance")
	assertCondition(typeof(eventName) == "string" and #eventName > 0, "eventName must be non-empty")
	assertCondition(typeof(callback) == "function", "callback must be a function")
	const success: boolean, signal: any = pcall(function(): any
		return (instance :: any)[eventName]
	end)
	assertCondition(success and typeof(signal) == "RBXScriptSignal", `{instance.ClassName}.{eventName} is not an event`)
	return signal:Connect(callback)
end

function UI.Observe(instance: Instance, propertyName: string, callback: EventCallback): RBXScriptConnection
	assertCondition(typeof(instance) == "Instance", "Observe expects an Instance")
	assertCondition(typeof(propertyName) == "string" and #propertyName > 0, "propertyName must be non-empty")
	assertCondition(typeof(callback) == "function", "callback must be a function")
	return instance:GetPropertyChangedSignal(propertyName):Connect(callback)
end

function UI.Tween(instance: Instance, tweenInfo: TweenInfo, goals: Properties): Tween
	assertCondition(typeof(instance) == "Instance", "Tween expects an Instance")
	assertCondition(typeof(tweenInfo) == "TweenInfo", "tweenInfo must be TweenInfo")
	assertCondition(typeof(goals) == "table", "goals must be a table")
	const tween: Tween = TweenService:Create(instance, tweenInfo, goals)
	tween:Play()
	return tween
end

local function create<T>(className: string, parent: Instance, properties: Properties?): T
	const values: Properties = if properties then table.clone(properties) else {}
	values.Parent = parent
	return UI.Create(className, values) :: T
end

local function corner(parent: Instance, radius: number | UDim): UICorner
	assertCondition(parent:IsA("GuiObject"), "UICorner parent must be a GuiObject")
	local cornerRadius: UDim
	if typeof(radius) == "number" then
		assertCondition(isFiniteNumber(radius) and radius >= 0, "corner radius must be a non-negative finite number")
		cornerRadius = UDim.new(0, radius)
	else
		assertCondition(typeof(radius) == "UDim", "corner radius must be a number or UDim")
		const udimRadius: UDim = radius :: UDim
		assertCondition(
			typeof(radius) == "UDim"
				and isFiniteNumber(udimRadius.Scale)
				and isFiniteNumber(udimRadius.Offset)
				and udimRadius.Scale >= 0
				and udimRadius.Offset >= 0,
			"corner radius must be a non-negative finite UDim"
		)
		cornerRadius = udimRadius
	end
	return create("UICorner", parent, { CornerRadius = cornerRadius })
end

local function stroke(parent: Instance, palette: Palette, transparency: number?): UIStroke
	const result: UIStroke = Instance.new("UIStroke")
	result.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	result.Color = palette.Border
	result.LineJoinMode = Enum.LineJoinMode.Round
	result.Thickness = 1
	result.Transparency = transparency or 0
	result:SetAttribute("PaletteColorRole", "Border")
	result.Parent = parent
	return result
end

local function padding(parent: Instance, left: number, right: number, top: number, bottom: number): UIPadding
	return create("UIPadding", parent, {
		PaddingBottom = UDim.new(0, bottom),
		PaddingLeft = UDim.new(0, left),
		PaddingRight = UDim.new(0, right),
		PaddingTop = UDim.new(0, top),
	})
end

local function list(parent: Instance, gap: number): UIListLayout
	return create("UIListLayout", parent, {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, gap),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
end

local function textLabel(parent: Instance, text: string, size: UDim2, textSize: number, color: Color3, zIndex: number): TextLabel
	return create("TextLabel", parent, {
		BackgroundTransparency = 1,
		FontFace = Font.fromEnum(Enum.Font.Gotham),
		Size = size,
		Text = text,
		TextColor3 = color,
		TextSize = textSize + 1,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = zIndex,
	})
end

local function track(window: Window, connection: RBXScriptConnection): RBXScriptConnection
	table.insert(window._connections, connection)
	return connection
end

local function setFont(instance: Instance, font: Enum.Font): ()
	if not instance:IsA("TextLabel") and not instance:IsA("TextButton") and not instance:IsA("TextBox") then return end
	const textObject: TextLabel | TextButton | TextBox = instance :: any
	textObject.FontFace = Font.fromEnum(font)
end

local function bindPaletteColors(window: Window, instance: Instance): ()
	local bindings: {[string]: PaletteColor}? = window._colorBindings[instance]
	for _, propertyName: string in { "BackgroundColor3", "TextColor3", "ImageColor3", "ScrollBarImageColor3", "Color" } do
		const success: boolean, color: any = pcall(function(): any
			return (instance :: any)[propertyName]
		end)
		if not success or typeof(color) ~= "Color3" then continue end
		const explicitRole: any = instance:GetAttribute("PaletteColorRole")
		if typeof(explicitRole) == "string" and window._palette[explicitRole] ~= nil then
			if not bindings then
				bindings = {}
				window._colorBindings[instance] = bindings
			end
			bindings[propertyName] = explicitRole
			continue
		end
		for _, paletteColor: PaletteColorInfo in PALETTE_COLORS do
			local role: PaletteColor = paletteColor.Name
			if window._palette[role] == color then
				if not bindings then
					bindings = {}
					window._colorBindings[instance] = bindings
				end
				bindings[propertyName] = role
				break
			end
		end
	end
end

local function setPaletteBinding(window: Window, instance: Instance, propertyName: string, role: PaletteColor): ()
	const bindings: {[string]: PaletteColor} = window._colorBindings[instance] or {}
	const target: any = instance
	bindings[propertyName] = role
	window._colorBindings[instance] = bindings
	target[propertyName] = window._palette[role]
end

local function setPaletteRole(window: Window, instance: Instance, propertyName: string, role: PaletteColor): ()
	const bindings: {[string]: PaletteColor} = window._colorBindings[instance] or {}
	bindings[propertyName] = role
	window._colorBindings[instance] = bindings
end

local function clearPaletteBinding(window: Window, instance: Instance, propertyName: string): ()
	const bindings: {[string]: PaletteColor}? = window._colorBindings[instance]
	if not bindings then return end
	bindings[propertyName] = nil
	if next(bindings) == nil then window._colorBindings[instance] = nil end
end

local function composeTransparency(window: Window, value: number): number
	return 1 - (1 - value) * (1 - window._transparency)
end

local function bindTransparency(window: Window, instance: Instance): ()
	const target: any = instance
	const bindings: TransparencyBindings = window._transparencyBindings[instance] or {}
	local changed: boolean = false
	local function bind(propertyName: string): ()
		if bindings[propertyName] ~= nil then return end
		const success: boolean, value: any = pcall(function(): any
			return target[propertyName]
		end)
		if not success or typeof(value) ~= "number" then return end
		bindings[propertyName] = value
		target[propertyName] = composeTransparency(window, value)
		changed = true
	end
	if instance:IsA("GuiObject") then bind("BackgroundTransparency") end
	if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then bind("TextTransparency") end
	if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then bind("ImageTransparency") end
	if instance:IsA("ScrollingFrame") then bind("ScrollBarImageTransparency") end
	if instance:IsA("UIStroke") then bind("Transparency") end
	if changed then window._transparencyBindings[instance] = bindings end
end

local function setTransparencyBase(window: Window, instance: Instance, propertyName: string, value: number): ()
	const target: any = instance
	if instance:IsA("CanvasGroup") and propertyName == "GroupTransparency" then
		target[propertyName] = value
		return
	end
	const bindings: TransparencyBindings = window._transparencyBindings[instance] or {}
	bindings[propertyName] = value
	window._transparencyBindings[instance] = bindings
	target[propertyName] = composeTransparency(window, value)
end

local function applyTransparency(window: Window, transparency: number): ()
	window._transparency = transparency
	if window._hidden then return end
	for instance: Instance, bindings: TransparencyBindings in window._transparencyBindings do
		if not instance.Parent and instance ~= window.MainFrame then
			window._transparencyBindings[instance] = nil
			continue
		end
		const target: any = instance
		for propertyName: string, value: number in bindings do
			target[propertyName] = composeTransparency(window, value)
		end
	end
end

local function applyWindowFont(window: Window, instance: Instance): ()
	if not instance:IsA("TextLabel") and not instance:IsA("TextButton") and not instance:IsA("TextBox") then return end
	const textObject: TextLabel | TextButton | TextBox = instance :: any
	window._fontUpdating[instance] = true
	setFont(instance, window._font)
	window._fontUpdating[instance] = nil
	if window._fontConnections[instance] then return end
	window._fontConnections[instance] = track(window, instance:GetPropertyChangedSignal("FontFace"):Connect(function(): ()
		if window._fontUpdating[instance] then return end
		const desiredFamily: string = Font.fromEnum(window._font).Family
		if textObject.FontFace.Family ~= desiredFamily then
			applyWindowFont(window, instance)
		end
	end))
end

local function animate(window: Window, instance: Instance, info: TweenInfo, goals: Properties, preserveTransparency: boolean?): Tween
	const previous: Tween? = window._tweens[instance]
	if previous then previous:Cancel() end
	const tweenGoals: Properties = table.clone(goals)
	const bindings: TransparencyBindings? = window._transparencyBindings[instance]
	if not preserveTransparency and bindings then
		for propertyName: string, value: any in goals do
			if bindings[propertyName] ~= nil and typeof(value) == "number" then
				bindings[propertyName] = value
				tweenGoals[propertyName] = composeTransparency(window, value)
			end
		end
	end
	const tween: Tween = TweenService:Create(instance, info, tweenGoals)
	window._tweens[instance] = tween
	tween.Completed:Once(function(): ()
		if window._tweens[instance] == tween then window._tweens[instance] = nil end
	end)
	tween:Play()
	return tween
end

local function cancelAnimation(window: Window, instance: Instance): ()
	const tween: Tween? = window._tweens[instance]
	if not tween then return end
	window._tweens[instance] = nil
	tween:Cancel()
end

local function closeDropdowns(window: Window, exception: Dropdown?): ()
	for _, dropdown: Dropdown in window._dropdowns do
		if dropdown ~= exception and dropdown._open then dropdown:SetOpen(false) end
	end
end

local function closeColorPickers(window: Window, exception: ColorPicker?): ()
	for _, picker: ColorPicker in window._colorPickers do
		if picker ~= exception and picker._open then picker:SetOpen(false) end
	end
end

local function containsPoint(object: GuiObject, point: Vector3): boolean
	const position: Vector2 = object.AbsolutePosition
	const size: Vector2 = object.AbsoluteSize
	return point.X >= position.X and point.X <= position.X + size.X
		and point.Y >= position.Y and point.Y <= position.Y + size.Y
end

local function viewportSize(): Vector2
	const camera: Camera? = Workspace.CurrentCamera
	return if camera then camera.ViewportSize else Vector2.new(1920, 1080)
end

local function keybindText(keyCode: Enum.KeyCode?): string
	if not keyCode then return "None" end
	const names: {[string]: string} = {
		Backquote = "`",
		Backspace = "⌫",
		Comma = ",",
		Delete = "⌦",
		Down = "↓",
		End = "↘",
		Equals = "=",
		Home = "↖",
		Insert = "Ins",
		KeypadEnter = "↵",
		Left = "←",
		LeftAlt = "⌥",
		LeftBracket = "[",
		LeftControl = "⌃",
		LeftShift = "⇧",
		Minus = "-",
		One = "1",
		PageDown = "⇟",
		PageUp = "⇞",
		Period = ".",
		Quote = "'",
		Right = "→",
		RightAlt = "⌥",
		RightBracket = "]",
		RightControl = "⌃",
		RightShift = "⇧",
		Semicolon = ";",
		Seven = "7",
		Slash = "/",
		Space = "␠",
		Tab = "⇥",
		Three = "3",
		Two = "2",
		Up = "↑",
		Zero = "0",
		Four = "4",
		Five = "5",
		Six = "6",
		Eight = "8",
		Nine = "9",
		BackSlash = "\\",
	}
	return names[keyCode.Name] or keyCode.Name
end

local function beginKeybindCapture(window: Window, target: KeybindCapture, button: TextButton): ()
	if window._keybindCapture == target then
		target:SetKeybind(target._keybind)
		return
	end
	if window._keybindCapture then
		const capturing: KeybindCapture = window._keybindCapture
		capturing:SetKeybind(capturing._keybind)
	end
	window._keybindCapture = target
	button.Text = "Press key"
	setPaletteBinding(window, button, "TextColor3", "Text")
	setPaletteRole(window, button, "BackgroundColor3", "SurfaceHover")
	animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
end

local function expandedWindowSize(window: Window, scale: number, viewport: Vector2): Vector2
	return Vector2.new(
		math.clamp(window._expandedSize.X.Scale * viewport.X + window._expandedSize.X.Offset, LAYOUT.WindowMinimumWidth, LAYOUT.WindowMaximumWidth),
		math.clamp(window._expandedSize.Y.Scale * viewport.Y + window._expandedSize.Y.Offset, LAYOUT.WindowMinimumHeight, LAYOUT.WindowMaximumHeight)
	) * scale
end

local function fittedScale(window: Window): number
	local viewport: Vector2 = window.Root.AbsoluteSize
	if viewport.X <= 0 or viewport.Y <= 0 then
		viewport = viewportSize()
	end
	const nominal: Vector2 = expandedWindowSize(window, 1, viewport)
	const fitRatio: number = math.min(
		1,
		math.max(0, (viewport.X - 32) / math.max(nominal.X, 1)),
		math.max(0, (viewport.Y - 32) / math.max(nominal.Y, 1))
	)
	return math.clamp(window._baseScale * fitRatio, 0.5, window._baseScale)
end

local function clampWindowPosition(window: Window, desired: UDim2, sizeOverride: Vector2?): UDim2
	local viewport: Vector2 = window.Root.AbsoluteSize
	if viewport.X <= 0 or viewport.Y <= 0 then
		viewport = viewportSize()
	end
	const size: Vector2 = sizeOverride or window.MainFrame.AbsoluteSize
	const halfWidth: number = math.min(size.X * 0.5, math.max(viewport.X * 0.5 - 8, 0))
	const halfHeight: number = math.min(size.Y * 0.5, math.max(viewport.Y * 0.5 - 8, 0))
	const desiredX: number = desired.X.Scale * viewport.X + desired.X.Offset
	const desiredY: number = desired.Y.Scale * viewport.Y + desired.Y.Offset
	const centerX: number = math.clamp(desiredX, halfWidth + 8, viewport.X - halfWidth - 8)
	const centerY: number = math.clamp(desiredY, halfHeight + 8, viewport.Y - halfHeight - 8)

	return UDim2.new(
		desired.X.Scale,
		centerX - desired.X.Scale * viewport.X,
		desired.Y.Scale,
		centerY - desired.Y.Scale * viewport.Y
	)
end

local function controlText(row: Frame, palette: Palette, titleText: string, description: string?, rightInset: number): TextLabel
	const title: TextLabel = textLabel(row, titleText, UDim2.new(1, -rightInset, 0, 20), 13, palette.Text, LAYER.Content + 1)
	title.Position = UDim2.fromOffset(0, if description then 5 else 11)
	if description and #description > 0 then
		const detail: TextLabel = textLabel(row, description, UDim2.new(1, -rightInset, 0, 18), 11, palette.MutedText, LAYER.Content + 1)
		detail.Position = UDim2.fromOffset(0, 24)
	end
	return title
end

local function dropdownFieldWidth(window: Window, options: {string}): number
	local longestText: number = 0
	for _, option: string in options do
		const bounds: Vector2 = TextService:GetTextSize(
			option,
			LAYOUT.DropdownOptionTextSize,
			window._font,
			Vector2.new(4096, 32)
		)
		longestText = math.max(longestText, bounds.X)
	end
	return math.ceil(longestText + LAYOUT.DropdownLeftPadding + LAYOUT.DropdownRightPadding + 8)
end

local function breakCards(section: Section): ()
	if section._cardRow and section._cardCount % 2 ~= 0 then
		section._cardCount += 1
	end

	section._cardRow = nil
end

local function row(section: Section, height: number, active: boolean?): Frame
	breakCards(section)
	const result: Frame = create("Frame", section.Instance, {
		Active = active == true,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, height),
		ZIndex = LAYER.Content,
	})
	return result
end

local function precision(step: number): number
	const decimal: string? = string.match(string.format("%.12f", step), "%.(%d+)")
	return if decimal then #string.gsub(decimal, "0+$", "") else 0
end

local function positionDropdown(dropdown: Dropdown): ()
	if not dropdown._open or dropdown._window:IsDestroyed() then return end
	const window: Window = dropdown._window
	const scale: number = math.max(window._scale.Scale, 0.01)
	const origin: Vector2 = window.MainFrame.AbsolutePosition
	const buttonPosition: Vector2 = dropdown._button.AbsolutePosition
	const buttonSize: Vector2 = dropdown._button.AbsoluteSize
	const windowSize: Vector2 = window.MainFrame.AbsoluteSize / scale
	const width: number = buttonSize.X / scale
	const x: number = math.clamp((buttonPosition.X - origin.X) / scale, 8, math.max(8, windowSize.X - width - 8))
	const buttonY: number = (buttonPosition.Y - origin.Y) / scale
	const downY: number = buttonY + buttonSize.Y / scale + 7
	const upY: number = buttonY - dropdown._panelHeight - 7
	local openUp: boolean = dropdown._direction == "Up"
	if dropdown._direction == "Auto" then
		const below: number = windowSize.Y - downY - 8
		const above: number = buttonY - 8
		openUp = below < dropdown._panelHeight and above > below
	end
	const y: number = math.clamp(if openUp then upY else downY, 8, math.max(8, windowSize.Y - dropdown._panelHeight - 8))
	dropdown._optionsFrame.Position = UDim2.fromOffset(x, y)
	dropdown._optionsFrame.Size = UDim2.fromOffset(width, dropdown._optionsFrame.Size.Y.Offset)
end

local function positionColorPicker(picker: ColorPicker): ()
	if not picker._open or picker._window:IsDestroyed() then return end
	const window: Window = picker._window
	const scale: number = math.max(window._scale.Scale, 0.01)
	const origin: Vector2 = window.MainFrame.AbsolutePosition
	const buttonPosition: Vector2 = picker._button.AbsolutePosition
	const buttonSize: Vector2 = picker._button.AbsoluteSize
	const windowSize: Vector2 = window.MainFrame.AbsoluteSize / scale
	const width: number = math.min(LAYOUT.ColorPickerWidth, math.max(windowSize.X - 16, 0))
	const height: number = math.min(LAYOUT.ColorPickerHeight, math.max(windowSize.Y - 16, 0))
	const x: number = math.clamp((buttonPosition.X - origin.X) / scale, 8, math.max(8, windowSize.X - width - 8))
	const buttonY: number = (buttonPosition.Y - origin.Y) / scale
	const downY: number = buttonY + buttonSize.Y / scale + 7
	const upY: number = buttonY - height - 7
	const below: number = windowSize.Y - downY - 8
	const above: number = buttonY - 8
	const openUp: boolean = below < height and above > below
	const y: number = math.clamp(if openUp then upY else downY, 8, math.max(8, windowSize.Y - height - 8))
	picker._panel.Position = UDim2.fromOffset(x, y)
	picker._panel.Size = UDim2.fromOffset(width, height)
end

local function moveIndicator(window: Window, page: Page): ()
	const target: GuiObject = page.Icon or page.Button

	if target.AbsoluteSize.Y <= 0 then
		task.defer(function(): ()
			if not window:IsDestroyed() and window._selectedPage == page then
				moveIndicator(window, page)
			end
		end)
		return
	end

	const scale: number = math.max(window._scale.Scale, 0.01)
	const origin: Vector2 = window._pageButtons.AbsolutePosition
	const position: Vector2 = target.AbsolutePosition
	const targetPosition: UDim2 = UDim2.fromOffset(
		math.max((position.X - origin.X - 8) / scale, 2),
		(position.Y - origin.Y + target.AbsoluteSize.Y * 0.5) / scale
	)

	if not window._indicator.Visible then
		window._indicator.Position = targetPosition
		window._indicator.Visible = true
		return
	end
	animate(window, window._indicator, INDICATOR_TWEEN, { Position = targetPosition })
end

-- Window Class
function UI.new(options: WindowOptions?): Window
	assertCondition(options == nil or typeof(options) == "table", "options must be a table")
	const settings: WindowOptions = options or {}
	const parent: Instance = CoreGuiService
	const name: string = settings.Name or "ModernUI"
	assertCondition(typeof(name) == "string" and #name > 0 and #name <= 100, "Name must contain 1-100 characters")
	const baseScale: number = settings.Scale or 1
	const size: UDim2 = settings.Size or UDim2.fromOffset(LAYOUT.WindowWidth, LAYOUT.WindowHeight)
	const position: UDim2 = settings.Position or UDim2.fromScale(0.5, 0.5)
	const toggleKey: Enum.KeyCode = settings.ToggleKey or Enum.KeyCode.Insert
	assertCondition(typeof(parent) == "Instance", "Parent must be an Instance")
	assertCondition(isFiniteNumber(baseScale) and baseScale >= 0.5 and baseScale <= 2, "Scale must be between 0.5 and 2")
	assertCondition(isFiniteUDim2(size), "Size must be a finite UDim2")
	assertCondition(isFiniteUDim2(position), "Position must be a finite UDim2")
	assertCondition(typeof(toggleKey) == "EnumItem" and toggleKey.EnumType == Enum.KeyCode and toggleKey ~= Enum.KeyCode.Unknown, "ToggleKey must be a valid Enum.KeyCode")
	assertCondition(settings.Palette == nil or typeof(settings.Palette) == "table", "Palette must be a table")
	assertCondition(settings.Transparency == nil or isFiniteNumber(settings.Transparency) and settings.Transparency >= 0 and settings.Transparency <= 1, "Transparency must be between 0 and 1")
	assertCondition(settings.Title == nil or typeof(settings.Title) == "string", "Title must be a string")
	assertCondition(settings.Logo == nil or typeof(settings.Logo) == "string", "Logo must be a string")

	const parentWindows: {[string]: Window}? = windowRegistry[parent]
	const previousWindow: Window? = if parentWindows then parentWindows[name] else nil
	const previousGui: Instance? = parent:FindFirstChild(name)
	if previousWindow then
		previousWindow:Destroy()
	elseif previousGui then
		assertCondition(
			previousGui:IsA("ScreenGui")
				and previousGui:GetAttribute(GUI_OWNER_ATTRIBUTE) == GUI_OWNER_VALUE,
			`CoreGui already contains an unrelated instance named '{name}'`
		)
		previousGui:Destroy()
	end
	const palette: Palette = table.clone(DEFAULT_PALETTE)
	const paletteProperties: any = palette
	if settings.Palette then
		for propertyName: string, value: Color3 in settings.Palette do
			assertCondition((DEFAULT_PALETTE :: any)[propertyName] ~= nil, `unknown palette color '{propertyName}'`)
			assertCondition(typeof(value) == "Color3", `palette color '{propertyName}' must be Color3`)
			paletteProperties[propertyName] = value
		end
	end
	const root: ScreenGui = UI.Create("ScreenGui", {
		DisplayOrder = 0,
		Name = name,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})
	root:SetAttribute(GUI_OWNER_ATTRIBUTE, GUI_OWNER_VALUE)
	root.Parent = parent
	const main: Frame = create("Frame", root, {
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = palette.Background,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = position,
		Size = size,
		ZIndex = LAYER.Window,
	})
	corner(main, 10)
	local sizeConstraint: UISizeConstraint = create("UISizeConstraint", main, {
		MaxSize = Vector2.new(LAYOUT.WindowMaximumWidth, LAYOUT.WindowMaximumHeight),
		MinSize = Vector2.new(LAYOUT.WindowMinimumWidth, LAYOUT.WindowMinimumHeight),
	})
	const scale: UIScale = create("UIScale", main, { Scale = baseScale })
	const topBar: Frame = create("Frame", main, { Active = true, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, LAYOUT.TopBarHeight), ZIndex = LAYER.TopBar })
	const dragHandle: Frame = create("Frame", topBar, { Active = true, BackgroundTransparency = 1, Size = UDim2.new(1, -LAYOUT.TopBarDragRightInset, 1, 0), ZIndex = LAYER.TopBar + 1 })
	if settings.Logo then
		create("ImageLabel", topBar, { BackgroundTransparency = 1, Image = settings.Logo, Position = UDim2.fromOffset(LAYOUT.TopBarInset, 3), ScaleType = Enum.ScaleType.Fit, Size = UDim2.fromOffset(LAYOUT.TopBarLogoSize, LAYOUT.TopBarLogoSize), ZIndex = LAYER.TopBar + 2 })
	end
	const titleOffset: number = if settings.Logo then 58 else 16
	const title: TextLabel = textLabel(topBar, settings.Title or "Window", UDim2.new(1, -titleOffset - LAYOUT.TopBarTitleRightInset, 0, LAYOUT.TopBarHeight), 17, palette.Text, LAYER.TopBar + 2)
	title.Position = UDim2.fromOffset(titleOffset, 0)
	const topBarDivider: Frame = create("Frame", main, { BackgroundColor3 = palette.Border, BorderSizePixel = 0, Position = UDim2.fromOffset(0, LAYOUT.TopBarHeight - LAYOUT.TopBarRuleHeight), Size = UDim2.new(1, 0, 0, LAYOUT.TopBarRuleHeight), ZIndex = LAYER.TopBar })
	topBarDivider:SetAttribute("PaletteColorRole", "Border")
	const minimize: TextButton = create("TextButton", topBar, { AutoButtonColor = false, BackgroundTransparency = 1, BorderSizePixel = 0, FontFace = Font.fromEnum(Enum.Font.Gotham), Position = UDim2.new(1, -LAYOUT.TopBarButtonWidth * 2, 0, 0), Size = UDim2.fromOffset(LAYOUT.TopBarButtonWidth, LAYOUT.TopBarButtonHeight), Text = "−", TextColor3 = palette.MutedText, TextSize = 21, ZIndex = LAYER.TopBar + 2 })
	const close: TextButton = create("TextButton", topBar, { AutoButtonColor = false, BackgroundTransparency = 1, BorderSizePixel = 0, FontFace = Font.fromEnum(Enum.Font.Gotham), Position = UDim2.new(1, -LAYOUT.TopBarButtonWidth, 0, 0), Size = UDim2.fromOffset(LAYOUT.TopBarButtonWidth, LAYOUT.TopBarButtonHeight), Text = "×", TextColor3 = palette.MutedText, TextSize = 17, ZIndex = LAYER.TopBar + 2 })
	corner(close, 10)
	local closeCornerFills: {Frame} = {}
	for _, fillPosition: UDim2 in {
		UDim2.fromOffset(0, 0),
		UDim2.new(0, 0, 1, -10),
		UDim2.new(1, -10, 1, -10),
	} do
		const cornerFill: Frame = create("Frame", close, {
			BackgroundColor3 = palette.Danger,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = fillPosition,
			Size = UDim2.fromOffset(10, 10),
			ZIndex = LAYER.TopBar + 3,
		})
		cornerFill:SetAttribute("PaletteColorRole", "Danger")
		table.insert(closeCornerFills, cornerFill)
	end
	const sidebar: Frame = create("Frame", main, { BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Position = UDim2.fromOffset(0, LAYOUT.TopBarHeight), Size = UDim2.new(0, LAYOUT.SidebarWidth, 1, -LAYOUT.TopBarHeight), ZIndex = LAYER.Sidebar })
	const pageButtons: ScrollingFrame = create("ScrollingFrame", sidebar, {
		Active = true,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = palette.Background,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(),
		ClipsDescendants = true,
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Size = UDim2.fromScale(1, 1),
		ZIndex = LAYER.Navigation,
	})
	const sidebarDivider: Frame = create("Frame", sidebar, { AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = palette.Border, BorderSizePixel = 0, Position = UDim2.fromScale(1, 0), Size = UDim2.new(0, 1, 1, 0), ZIndex = LAYER.Navigation })
	sidebarDivider:SetAttribute("PaletteColorRole", "Border")
	const indicator: Frame = create("Frame", pageButtons, { AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = palette.Accent, BorderSizePixel = 0, Size = UDim2.fromOffset(4, 20), Visible = false, ZIndex = LAYER.Navigation + 5 })
	corner(indicator, 2)
	const pages: Frame = create("Frame", main, { BackgroundTransparency = 1, ClipsDescendants = true, Position = UDim2.fromOffset(LAYOUT.SidebarWidth, LAYOUT.TopBarHeight), Size = UDim2.new(1, -LAYOUT.SidebarWidth, 1, -LAYOUT.TopBarHeight), ZIndex = LAYER.Page })
	const overlay: Frame = create("Frame", main, { Active = false, BackgroundTransparency = 1, ClipsDescendants = false, Size = UDim2.fromScale(1, 1), ZIndex = LAYER.Overlay })
	const self: Window = setmetatable({
		Root = root, MainFrame = main, _baseScale = baseScale, _connections = {}, _destroyed = false,
		_colorBindings = setmetatable({}, {__mode = "k"}), _transparencyBindings = setmetatable({}, {__mode = "k"}),
		_colorPickers = {}, _dropdowns = {}, _toggles = {}, _keybindCapture = nil,
		_expandedPosition = position, _expandedSize = size, _hidden = false, _minimized = false, _overlay = overlay, _pageButtons = pageButtons, _pageCount = 0,
		_indicator = indicator, _pages = {}, _pagesContainer = pages, _scale = scale, _selectedPage = nil, _sliderDrag = nil,
		_font = Enum.Font.Ubuntu, _fontConnections = {}, _fontUpdating = {}, _palette = palette,
		_toggleKey = toggleKey, _transparency = settings.Transparency or 0, _sizeConstraint = sizeConstraint,
		_transitionId = 0, _tweens = {}, _parent = parent, _name = name,
		_fadeState = {},
	}, WindowClass) :: any
	track(self, root.DescendantAdded:Connect(function(instance: Instance): ()
		applyWindowFont(self, instance)
		bindPaletteColors(self, instance)
		bindTransparency(self, instance)
	end))
	for _, instance: Instance in main:GetDescendants() do
		applyWindowFont(self, instance)
		bindPaletteColors(self, instance)
		bindTransparency(self, instance)
	end
	bindPaletteColors(self, main)
	bindTransparency(self, main)
	local activeParentWindows: {[string]: Window} = windowRegistry[parent]
	if not activeParentWindows then
		activeParentWindows = {}
		windowRegistry[parent] = activeParentWindows
	end
	activeParentWindows[name] = self
	local dragging: boolean = false
	local dragStart: Vector3 = Vector3.zero
	local startPosition: UDim2 = main.Position
	local targetPosition: UDim2 = main.Position
	local currentPosition: UDim2 = main.Position
	track(self, dragHandle.InputBegan:Connect(function(input: InputObject): ()
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		dragging = true
		dragStart = input.Position
		startPosition = main.Position
		targetPosition = startPosition
		currentPosition = startPosition
	end))
	track(self, UserInputService.InputChanged:Connect(function(input: InputObject): ()
		if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
		if dragging then
			const delta: Vector3 = input.Position - dragStart
			const desired: UDim2 = UDim2.new(
				startPosition.X.Scale,
				startPosition.X.Offset + delta.X,
				startPosition.Y.Scale,
				startPosition.Y.Offset + delta.Y
			)
			targetPosition = clampWindowPosition(self, desired)
		end
		if self._sliderDrag then self._sliderDrag(input) end
	end))
	track(self, UserInputService.InputEnded:Connect(function(input: InputObject): ()
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if dragging then
				main.Position = targetPosition
				currentPosition = targetPosition
				if self._minimized then
					const expandedPosition: UDim2 = self._expandedPosition
					self._expandedPosition = UDim2.new(
						expandedPosition.X.Scale,
						expandedPosition.X.Offset + targetPosition.X.Offset - startPosition.X.Offset,
						expandedPosition.Y.Scale,
						expandedPosition.Y.Offset + targetPosition.Y.Offset - startPosition.Y.Offset
					)
				else
					self._expandedPosition = targetPosition
				end
			end
			dragging = false
			self._sliderDrag = nil
		end
	end))
	track(self, RunService.RenderStepped:Connect(function(deltaTime: number): ()
		if not dragging then return end
		const alpha: number = 1 - math.exp(-25 * deltaTime)
		currentPosition = currentPosition:Lerp(targetPosition, alpha)
		main.Position = currentPosition
	end))
	track(self, UserInputService.InputBegan:Connect(function(input: InputObject, processed: boolean): ()
		if input.KeyCode ~= Enum.KeyCode.Unknown then
			const capturing: KeybindCapture? = self._keybindCapture
			if capturing then
				const keyboardInput: boolean = input.UserInputType == Enum.UserInputType.Keyboard
				if keyboardInput and UserInputService:GetFocusedTextBox() then return end
				if keyboardInput and input.KeyCode == Enum.KeyCode.Escape then
					capturing:SetKeybind(capturing._keybind)
				elseif keyboardInput and (input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Delete) then
					capturing:SetKeybind(nil)
				else
					capturing:SetKeybind(input.KeyCode)
				end
				return
			end
			const keyboardInput: boolean = input.UserInputType == Enum.UserInputType.Keyboard
			if processed or keyboardInput and UserInputService:GetFocusedTextBox() then return end
			if keyboardInput and input.KeyCode == self._toggleKey then self:Toggle() end
			for _, toggle: Toggle in self._toggles do
				if toggle._keybindEnabled and toggle._keybind == input.KeyCode then
					toggle:SetValue(not toggle._value, true)
				end
			end
			return
		end
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		for _, dropdown: Dropdown in self._dropdowns do
			if dropdown._open and not containsPoint(dropdown._button, input.Position) and not containsPoint(dropdown._optionsFrame, input.Position) then
				dropdown:SetOpen(false)
			end
		end
		for _, picker: ColorPicker in self._colorPickers do
			if picker._open and not containsPoint(picker._button, input.Position) and not containsPoint(picker._panel, input.Position) then
				picker:SetOpen(false)
			end
		end
	end))
	setPaletteBinding(self, minimize, "BackgroundColor3", "SurfaceHover")
	setPaletteBinding(self, minimize, "TextColor3", "MutedText")
	setPaletteBinding(self, close, "BackgroundColor3", "Danger")
	setPaletteBinding(self, close, "TextColor3", "MutedText")
	track(self, minimize.Activated:Connect(function(): ()
		closeDropdowns(self)
		closeColorPickers(self)
		self._minimized = not self._minimized
		if self._minimized then
			minimize.Text = "□"
			self._sizeConstraint.MinSize = Vector2.new(LAYOUT.WindowMinimumWidth, LAYOUT.TopBarHeight)
			local viewport: Vector2 = root.AbsoluteSize
			if viewport.X <= 0 or viewport.Y <= 0 then viewport = viewportSize() end
			const compactHeight: number = LAYOUT.TopBarHeight * self._scale.Scale
			const expandedHeight: number = math.clamp(
				self._expandedSize.Y.Scale * viewport.Y + self._expandedSize.Y.Offset,
				LAYOUT.WindowMinimumHeight,
				LAYOUT.WindowMaximumHeight
			) * self._scale.Scale
			const top: number = main.Position.Y.Scale * viewport.Y + main.Position.Y.Offset - main.AbsoluteSize.Y * 0.5
			const expandedCenter: number = top + expandedHeight * 0.5
			self._expandedPosition = UDim2.new(
				main.Position.X.Scale,
				main.Position.X.Offset,
				main.Position.Y.Scale,
				expandedCenter - main.Position.Y.Scale * viewport.Y
			)
			const compactPosition: UDim2 = UDim2.new(
				main.Position.X.Scale,
				main.Position.X.Offset,
				main.Position.Y.Scale,
				top + compactHeight * 0.5 - main.Position.Y.Scale * viewport.Y
			)
			animate(self, main, SECTION_TWEEN, {
				Position = compactPosition,
				Size = UDim2.new(self._expandedSize.X.Scale, self._expandedSize.X.Offset, 0, LAYOUT.TopBarHeight),
			})
		else
			minimize.Text = "−"
			self._sizeConstraint.MinSize = Vector2.new(LAYOUT.WindowMinimumWidth, LAYOUT.WindowMinimumHeight)
			const expandedPosition: UDim2 = clampWindowPosition(self, self._expandedPosition)
			const tween: Tween = animate(self, main, SECTION_TWEEN, { Position = expandedPosition, Size = self._expandedSize })
			tween.Completed:Once(function(playbackState: Enum.PlaybackState): ()
				if playbackState == Enum.PlaybackState.Completed and not self:IsDestroyed() and not self._minimized then
					self.MainFrame.Position = clampWindowPosition(self, self.MainFrame.Position)
					self._expandedPosition = self.MainFrame.Position
					self._scale.Scale = fittedScale(self)
				end
			end)
		end
	end))
	track(self, close.Activated:Connect(function(): () self:SetVisible(false) end))
	track(self, minimize.MouseEnter:Connect(function(): ()
		setPaletteRole(self, minimize, "BackgroundColor3", "SurfaceHover")
		setPaletteRole(self, minimize, "TextColor3", "Text")
		animate(self, minimize, FAST_TWEEN, { BackgroundTransparency = 0, TextColor3 = self._palette.Text })
	end))
	track(self, minimize.MouseLeave:Connect(function(): ()
		setPaletteRole(self, minimize, "BackgroundColor3", "SurfaceHover")
		setPaletteRole(self, minimize, "TextColor3", "MutedText")
		animate(self, minimize, FAST_TWEEN, { BackgroundTransparency = 1, TextColor3 = self._palette.MutedText })
	end))
	track(self, close.MouseEnter:Connect(function(): ()
		setPaletteRole(self, close, "BackgroundColor3", "Danger")
		setPaletteRole(self, close, "TextColor3", "Text")
		animate(self, close, FAST_TWEEN, { BackgroundTransparency = 0, TextColor3 = self._palette.Text })
		for _, cornerFill: Frame in closeCornerFills do
			animate(self, cornerFill, FAST_TWEEN, { BackgroundTransparency = 0 })
		end
	end))
	track(self, close.MouseLeave:Connect(function(): ()
		setPaletteRole(self, close, "BackgroundColor3", "Danger")
		setPaletteRole(self, close, "TextColor3", "MutedText")
		animate(self, close, FAST_TWEEN, { BackgroundTransparency = 1, TextColor3 = self._palette.MutedText })
		for _, cornerFill: Frame in closeCornerFills do
			animate(self, cornerFill, FAST_TWEEN, { BackgroundTransparency = 1 })
		end
	end))
	local function updateViewport(): ()
		self._scale.Scale = fittedScale(self)
		self.MainFrame.Position = clampWindowPosition(self, self.MainFrame.Position)
		if not self._minimized then self._expandedPosition = self.MainFrame.Position end
		if self._selectedPage then moveIndicator(self, self._selectedPage) end
		for _, dropdown: Dropdown in self._dropdowns do positionDropdown(dropdown) end
		for _, picker: ColorPicker in self._colorPickers do positionColorPicker(picker) end
	end
	track(self, root:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateViewport))
	updateViewport()
	track(self, root.AncestryChanged:Connect(function(_: Instance, newParent: Instance?): ()
		if not newParent and not self:IsDestroyed() then
			self:Destroy()
		end
	end))
	return self
end

-- Window Methods
function WindowClass:AddPage(options: PageOptions | string): Page
	assertCondition(typeof(options) == "string" or typeof(options) == "table", "page options must be a string or table")
	const settings: PageOptions = if typeof(options) == "string" then { Name = options } else options
	assertCondition(not self:IsDestroyed(), "cannot add a page to a destroyed window")
	assertCondition(typeof(settings.Name) == "string" and #settings.Name > 0, "page name must be non-empty")
	assertCondition(settings.Icon == nil or typeof(settings.Icon) == "string", "page icon must be a string")
	assertCondition(settings.IconPosition == nil or typeof(settings.IconPosition) == "UDim2", "page icon position must be UDim2")
	assertCondition(settings.IconSize == nil or typeof(settings.IconSize) == "UDim2", "page icon size must be UDim2")
	assertCondition(settings.ButtonPosition == nil or typeof(settings.ButtonPosition) == "UDim2", "page button position must be UDim2")
	assertCondition(self._pages[settings.Name] == nil, `page '{settings.Name}' already exists`)
	const button: TextButton = create("TextButton", self._pageButtons, {
		AutoButtonColor = false, BackgroundColor3 = self._palette.SurfaceHover, BackgroundTransparency = 1,
		BorderSizePixel = 0, FontFace = Font.fromEnum(Enum.Font.GothamMedium),
		Position = settings.ButtonPosition or UDim2.fromOffset(0, self._pageCount * (LAYOUT.PageButtonHeight + LAYOUT.PageButtonGap)),
		Size = UDim2.new(1, 0, 0, LAYOUT.PageButtonHeight), Text = "",
		ZIndex = LAYER.Navigation + 1,
	})
	setPaletteBinding(self, button, "BackgroundColor3", "SurfaceHover")
	const nameLabel: TextLabel = textLabel(
		button,
		settings.Name,
		UDim2.new(1, if settings.Icon then -52 else -22, 1, 0),
		14,
		self._palette.MutedText,
		LAYER.Navigation + 2
	)
	nameLabel.FontFace = Font.fromEnum(Enum.Font.GothamMedium)
	nameLabel.Position = UDim2.fromOffset(if settings.Icon then 43 else 13, 0)
	local icon: ImageLabel? = nil
	if settings.Icon then
		icon = create("ImageLabel", button, {
			BackgroundTransparency = 1, Image = settings.Icon, ImageColor3 = self._palette.MutedText,
			Position = settings.IconPosition or UDim2.fromOffset(11, 6), ScaleType = Enum.ScaleType.Fit,
			Size = settings.IconSize or UDim2.fromOffset(23, 23), ZIndex = LAYER.Navigation + 4,
		})
	end
	const pageGroup: CanvasGroup = create("CanvasGroup", self._pagesContainer, {
		BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true,
		GroupTransparency = 1, Interactable = false, Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromScale(1, 1), Visible = false, ZIndex = LAYER.Page,
	})
	const pageFrame: ScrollingFrame = create("ScrollingFrame", pageGroup, {
		AutomaticCanvasSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, BorderSizePixel = 0,
		CanvasSize = UDim2.new(), ClipsDescendants = true, Position = UDim2.fromOffset(0, 0),
		ScrollBarImageColor3 = self._palette.Accent, ScrollBarImageTransparency = 0.35, ScrollBarThickness = 3,
		Size = UDim2.fromScale(1, 1), ZIndex = LAYER.Page + 1,
	})
	padding(pageFrame, LAYOUT.PagePadding, LAYOUT.PagePadding, LAYOUT.PagePadding, LAYOUT.PagePadding)
	list(pageFrame, LAYOUT.PageSectionGap)
		const page: Page = setmetatable({
		Button = button, Icon = icon, Instance = pageFrame, Name = settings.Name,
		_group = pageGroup, _label = nameLabel, _window = self,
	}, PageClass) :: any
	self._pageCount += 1
	self._pages[settings.Name] = page
	track(self, button.Activated:Connect(function(): () self:SelectPage(page) end))
	track(self, button.MouseEnter:Connect(function(): ()
		setPaletteRole(self, button, "BackgroundColor3", "SurfaceHover")
		animate(self, button, NORMAL_TWEEN, { BackgroundTransparency = 0 })
		setPaletteRole(self, nameLabel, "TextColor3", "Text")
		animate(self, nameLabel, NORMAL_TWEEN, { TextColor3 = self._palette.Text })
		if icon then
			setPaletteRole(self, icon, "ImageColor3", "Text")
			animate(self, icon, NORMAL_TWEEN, { ImageColor3 = self._palette.Text })
		end
	end))
	track(self, button.MouseLeave:Connect(function(): ()
		const selected: boolean = self._selectedPage == page
		animate(self, button, NORMAL_TWEEN, { BackgroundTransparency = if selected then 0 else 1 })
		setPaletteRole(self, nameLabel, "TextColor3", if selected then "Text" else "MutedText")
		animate(self, nameLabel, NORMAL_TWEEN, { TextColor3 = if selected then self._palette.Text else self._palette.MutedText })
		if icon then
			setPaletteRole(self, icon, "ImageColor3", if selected then "Text" else "MutedText")
			animate(self, icon, NORMAL_TWEEN, { ImageColor3 = if selected then self._palette.Text else self._palette.MutedText })
		end
	end))
	if not self._selectedPage then self:SelectPage(page) end
	return page
end

function WindowClass:GetPage(name: string): Page?
	return self._pages[name]
end

function WindowClass:SelectPage(pageOrName: Page | string): ()
	const page: Page? = if typeof(pageOrName) == "string" then self._pages[pageOrName] else pageOrName
	assertCondition(page ~= nil and (page :: Page)._window == self, "page does not belong to this window")
	const selectedPage: Page = page :: Page
	if self._selectedPage == selectedPage then return end
	if self._keybindCapture then
		const capturing: KeybindCapture = self._keybindCapture
		capturing:SetKeybind(capturing._keybind)
	end
	closeDropdowns(self)
	closeColorPickers(self)
	self._selectedPage = selectedPage
	moveIndicator(self, selectedPage)

	for _, candidate: Page in self._pages do
		const selected: boolean = candidate == selectedPage
		const group: CanvasGroup = candidate._group
		cancelAnimation(self, candidate.Button)
		cancelAnimation(self, candidate._label)
		cancelAnimation(self, group)
		setPaletteRole(self, candidate.Button, "BackgroundColor3", "SurfaceHover")
		setTransparencyBase(self, candidate.Button, "BackgroundTransparency", if selected then 0 else 1)
		setPaletteRole(self, candidate._label, "TextColor3", if selected then "Text" else "MutedText")
		candidate._label.TextColor3 = if selected then self._palette.Text else self._palette.MutedText
		if candidate.Icon then
			cancelAnimation(self, candidate.Icon)
			setPaletteRole(self, candidate.Icon, "ImageColor3", if selected then "Text" else "MutedText")
			candidate.Icon.ImageColor3 = if selected then self._palette.Text else self._palette.MutedText
		end
		group.Visible = selected
		group.Interactable = selected
		setTransparencyBase(self, group, "GroupTransparency", if selected then 0 else 1)
		group.Position = UDim2.fromOffset(0, 0)
	end
end

function WindowClass:SetVisible(visible: boolean): ()
	assertCondition(typeof(visible) == "boolean", "visible must be a boolean")
	if self:IsDestroyed() or visible == not self._hidden then return end
	self._hidden = not visible
	self._transitionId += 1
	const transition: number = self._transitionId
	if not visible and self._keybindCapture then
		const capturing: Toggle = self._keybindCapture
		capturing:SetKeybind(capturing._keybind)
	end
	if not visible then
		const focusedTextBox: TextBox? = UserInputService:GetFocusedTextBox()
		if focusedTextBox and focusedTextBox:IsDescendantOf(self.MainFrame) then focusedTextBox:ReleaseFocus() end
	end
	if visible then
		self.Root.Enabled = true
		for object: Instance, state: Properties in self._fadeState do
			if object.Parent then
				const goals: Properties = {}
				for propertyName: string, value: number in state do
					goals[propertyName] = composeTransparency(self, value)
				end
				if object:IsA("UIStroke") then
					object.Transparency = 1
				elseif object:IsA("GuiObject") then
					object.BackgroundTransparency = 1
					if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
						object.TextTransparency = 1
					elseif object:IsA("ImageLabel") or object:IsA("ImageButton") then
						object.ImageTransparency = 1
					end
					if object:IsA("ScrollingFrame") then object.ScrollBarImageTransparency = 1 end
				end
				animate(self, object, WINDOW_TWEEN, goals, true)
			end
		end
		table.clear(self._fadeState)
	else
		closeDropdowns(self)
		closeColorPickers(self)
		const objects: {Instance} = self.MainFrame:GetDescendants()
		table.insert(objects, self.MainFrame)
		for _, instance: Instance in objects do
			if instance:IsA("GuiObject") then
				const object: GuiObject = instance
				const bindings: TransparencyBindings? = self._transparencyBindings[object]
				const state: Properties = {}
				const goals: Properties = {
					BackgroundTransparency = 1,
				}
				state.BackgroundTransparency = if bindings and bindings.BackgroundTransparency ~= nil
					then bindings.BackgroundTransparency
					else object.BackgroundTransparency
				if object:IsA("ScrollingFrame") then
					state.ScrollBarImageTransparency = if bindings and bindings.ScrollBarImageTransparency ~= nil
						then bindings.ScrollBarImageTransparency
						else object.ScrollBarImageTransparency
					goals.ScrollBarImageTransparency = 1
				end
				if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
					state.TextTransparency = if bindings and bindings.TextTransparency ~= nil
						then bindings.TextTransparency
						else object.TextTransparency
					goals.TextTransparency = 1
				elseif object:IsA("ImageLabel") or object:IsA("ImageButton") then
					state.ImageTransparency = if bindings and bindings.ImageTransparency ~= nil
						then bindings.ImageTransparency
						else object.ImageTransparency
					goals.ImageTransparency = 1
				end
				self._fadeState[object] = state
				animate(self, object, WINDOW_TWEEN, goals, true)
			elseif instance:IsA("UIStroke") then
				const bindings: TransparencyBindings? = self._transparencyBindings[instance]
				const state: Properties = {
					Transparency = if bindings and bindings.Transparency ~= nil then bindings.Transparency else instance.Transparency,
				}
				self._fadeState[instance] = state
				animate(self, instance, WINDOW_TWEEN, { Transparency = 1 }, true)
			end
		end
		task.delay(WINDOW_TWEEN.Time, function(): ()
			if not self:IsDestroyed() and self._transitionId == transition and self._hidden then self.Root.Enabled = false end
		end)
	end
end

function WindowClass:Toggle(): boolean
	const visible: boolean = self._hidden
	self:SetVisible(visible)
	return visible
end

function WindowClass:SetToggleKey(keyCode: Enum.KeyCode): ()
	assertCondition(typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode and keyCode ~= Enum.KeyCode.Unknown, "keyCode must be a valid Enum.KeyCode")
	self._toggleKey = keyCode
end

function WindowClass:SetScale(scale: number): ()
	assertCondition(isFiniteNumber(scale) and scale >= 0.5 and scale <= 2, "scale must be between 0.5 and 2")
	self._baseScale = scale
	self._scale.Scale = fittedScale(self)
	if self._selectedPage then moveIndicator(self, self._selectedPage) end
	for _, dropdown: Dropdown in self._dropdowns do positionDropdown(dropdown) end
	for _, picker: ColorPicker in self._colorPickers do positionColorPicker(picker) end
end

function WindowClass:SetTransparency(transparency: number): ()
	assertCondition(isFiniteNumber(transparency) and transparency >= 0 and transparency <= 1, "transparency must be between 0 and 1")
	applyTransparency(self, transparency)
end

function WindowClass:GetPaletteColor(name: PaletteColor): Color3
	assertCondition(self._palette[name] ~= nil, `unknown palette color '{name}'`)
	return self._palette[name]
end

function WindowClass:SetPaletteColor(name: PaletteColor, color: Color3): ()
	assertCondition(self._palette[name] ~= nil, `unknown palette color '{name}'`)
	assertCondition(typeof(color) == "Color3", "palette color must be a Color3")
	self._palette[name] = color
	for instance: Instance, bindings: {[string]: PaletteColor} in self._colorBindings do
		if not instance.Parent then
			self._colorBindings[instance] = nil
			continue
		end
		for propertyName: string, role: PaletteColor in bindings do
			const target: any = instance
			target[propertyName] = self._palette[role]
		end
	end
end

function WindowClass:SetPalette(palette: Palette): ()
	assertCondition(typeof(palette) == "table", "palette must be a table")
	for name: string, color: Color3 in palette do
		assertCondition(self._palette[name] ~= nil, `unknown palette color '{name}'`)
		assertCondition(typeof(color) == "Color3", `palette color '{name}' must be a Color3`)
	end
	for _, paletteColor: PaletteColorInfo in PALETTE_COLORS do
		assertCondition(typeof(palette[paletteColor.Name]) == "Color3", `palette is missing '{paletteColor.Name}'`)
	end
	for _, paletteColor: PaletteColorInfo in PALETTE_COLORS do
		self._palette[paletteColor.Name] = palette[paletteColor.Name]
	end
	for instance: Instance, bindings: {[string]: PaletteColor} in self._colorBindings do
		if not instance.Parent then
			self._colorBindings[instance] = nil
			continue
		end
		const target: any = instance
		for propertyName: string, role: PaletteColor in bindings do
			target[propertyName] = self._palette[role]
		end
	end
end

function WindowClass:SetFont(font: Enum.Font): ()
	assertCondition(typeof(font) == "EnumItem" and font.EnumType == Enum.Font, "font must be a valid Enum.Font")
	self._font = font
	for _, instance: Instance in self.MainFrame:GetDescendants() do
		applyWindowFont(self, instance)
	end
	for _, dropdown: Dropdown in self._dropdowns do dropdown._resize() end
end

function WindowClass:IsDestroyed(): boolean
	return self._destroyed
end

function WindowClass:Destroy(): ()
	if self._destroyed then return end
	self._destroyed = true
	self._sliderDrag = nil
	self._keybindCapture = nil
	for _, tween: Tween in self._tweens do pcall(tween.Cancel, tween) end
	for _, connection: RBXScriptConnection in self._connections do pcall(connection.Disconnect, connection) end
	table.clear(self._tweens)
	table.clear(self._connections)
	table.clear(self._dropdowns)
	table.clear(self._colorPickers)
	table.clear(self._toggles)
	table.clear(self._pages)
	const parentWindows: {[string]: Window}? = windowRegistry[self._parent]
	if parentWindows and parentWindows[self._name] == self then
		parentWindows[self._name] = nil
		if next(parentWindows) == nil then
			windowRegistry[self._parent] = nil
		end
	end
	self.Root:Destroy()
end

-- Page Methods
function PageClass:AddHome(options: HomeOptions?): Frame
	assertCondition(options == nil or typeof(options) == "table", "home options must be a table")
	const settings: HomeOptions = options or {}
	const window: Window = self._window
	const palette: Palette = window._palette
	assertCondition(not self._homeAdded, "a home view already exists on this page")
	assertCondition(settings.Cards == nil or typeof(settings.Cards) == "table", "home cards must be a table")
	assertCondition(#(settings.Cards or {}) <= 3, "home can display up to 3 cards")
	assertCondition(settings.Welcome == nil or typeof(settings.Welcome) == "string", "home welcome must be a string")
	assertCondition(settings.HubName == nil or typeof(settings.HubName) == "string", "home hub name must be a string")
	assertCondition(settings.Status == nil or typeof(settings.Status) == "string", "home status must be a string")
	assertCondition(settings.Version == nil or typeof(settings.Version) == "string", "home version must be a string")
	assertCondition(settings.Logo == nil or typeof(settings.Logo) == "string", "home logo must be a string")
	assertCondition(settings.Footer == nil or typeof(settings.Footer) == "string", "home footer must be a string")
	self._homeAdded = true
	const brightText: Color3 = palette.Text
	const home: Frame = create("Frame", self.Instance, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, LAYOUT.HomeHeight),
		ZIndex = LAYER.Content,
	})
	const player: Player? = Players.LocalPlayer
	const displayName: string = if player then player.DisplayName else "Player"
	const welcome: TextLabel = textLabel(home, settings.Welcome or "", UDim2.new(1, -LAYOUT.HomeInset * 2, 0, 25), 20, palette.Text, LAYER.Content + 1)
	welcome.FontFace = Font.fromEnum(Enum.Font.GothamBold)
	welcome.Position = UDim2.fromOffset(LAYOUT.HomeInset, 0)
	if not settings.Welcome then
		local hidden: boolean = false
		local transition: number = 0
		local function updateWelcome(): ()
			const name: string = if hidden then "••••••••" else displayName
			welcome.Text = `Welcome back, {name}.`
		end
		welcome.Active = true
		updateWelcome()
		track(window, welcome.InputBegan:Connect(function(input: InputObject): ()
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			transition += 1
			const currentTransition: number = transition
			const fadeOut: Tween = animate(window, welcome, FAST_TWEEN, { TextTransparency = 1 })
			fadeOut.Completed:Once(function(playbackState: Enum.PlaybackState): ()
				if playbackState ~= Enum.PlaybackState.Completed or transition ~= currentTransition or window:IsDestroyed() then return end
				hidden = not hidden
				updateWelcome()
				animate(window, welcome, FAST_TWEEN, { TextTransparency = 0 })
			end)
		end))
	end
	const statusCard: Frame = create("Frame", home, {
		BackgroundColor3 = palette.Surface,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(LAYOUT.HomeInset, LAYOUT.HomeStatusTop),
		Size = UDim2.new(1, -LAYOUT.HomeInset * 2, 0, LAYOUT.HomeStatusHeight),
		ZIndex = LAYER.Content + 1,
	})
	corner(statusCard, 8)
	const statusStroke: UIStroke = stroke(statusCard, palette, 0)
	const logo: ImageLabel = create("ImageLabel", statusCard, {
		BackgroundTransparency = 1,
		Image = settings.Logo or "",
		Position = UDim2.fromOffset(12, 13),
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(57, 50),
		ZIndex = LAYER.Content + 2,
	})
	const hubName: TextLabel = textLabel(statusCard, settings.HubName or "APOTHEOSIS HUB", UDim2.new(1, -LAYOUT.HomeMetadataLeft - 12, 0, 22), 18, brightText, LAYER.Content + 2)
	hubName.FontFace = Font.fromEnum(Enum.Font.GothamBold)
	hubName.Position = UDim2.fromOffset(LAYOUT.HomeMetadataLeft, 9)
	const status: TextLabel = textLabel(statusCard, settings.Status or "● READY", UDim2.fromOffset(LAYOUT.HomeStatusWidth, 18), 13, palette.Accent, LAYER.Content + 2)
	status.FontFace = Font.fromEnum(Enum.Font.GothamBold)
	status.Position = UDim2.fromOffset(LAYOUT.HomeMetadataLeft, 39)
	const separator: TextLabel = textLabel(statusCard, "|", UDim2.fromOffset(16, 18), 14, brightText, LAYER.Content + 2)
	separator.Position = UDim2.fromOffset(LAYOUT.HomeSeparatorLeft, 39)
	separator.TextXAlignment = Enum.TextXAlignment.Center
	const version: TextLabel = textLabel(statusCard, settings.Version or "v1.0", UDim2.fromOffset(80, 18), 12, palette.MutedText, LAYER.Content + 2)
	version.Position = UDim2.fromOffset(LAYOUT.HomeVersionLeft, 39)
	track(window, statusCard.MouseEnter:Connect(function(): ()
		setPaletteRole(window, statusCard, "BackgroundColor3", "SurfaceHover")
		setPaletteRole(window, statusStroke, "Color", "Accent")
		animate(window, statusCard, NORMAL_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
		animate(window, statusStroke, NORMAL_TWEEN, { Color = window._palette.Accent })
		setPaletteRole(window, statusStroke, "Color", "Accent")
		setPaletteRole(window, logo, "ImageColor3", "Accent")
		animate(window, logo, NORMAL_TWEEN, { ImageColor3 = window._palette.Accent })
	end))
	track(window, statusCard.MouseLeave:Connect(function(): ()
		setPaletteRole(window, statusCard, "BackgroundColor3", "Surface")
		setPaletteRole(window, statusStroke, "Color", "Border")
		animate(window, statusCard, NORMAL_TWEEN, { BackgroundColor3 = window._palette.Surface })
		animate(window, statusStroke, NORMAL_TWEEN, { Color = window._palette.Border })
		clearPaletteBinding(window, logo, "ImageColor3")
		animate(window, logo, NORMAL_TWEEN, { ImageColor3 = Color3.new(1, 1, 1) })
	end))

	const cards: {CardOptions} = settings.Cards or {}
	const cardCount: number = #cards
	const cardsContainer: Frame = create("Frame", home, {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(LAYOUT.HomeInset, LAYOUT.HomeCardsTop),
		Size = UDim2.new(1, -LAYOUT.HomeInset * 2, 0, LAYOUT.HomeCardHeight),
		ZIndex = LAYER.Content,
	})
	create("UIGridLayout", cardsContainer, {
		CellPadding = UDim2.fromOffset(8, 0),
		CellSize = UDim2.new(1 / math.max(cardCount, 1), -8 * math.max(cardCount - 1, 0) / math.max(cardCount, 1), 0, LAYOUT.HomeCardHeight),
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	for index: number = 1, cardCount do
		const cardOptions: CardOptions = cards[index]
		assertCondition(typeof(cardOptions.Title) == "string" and #cardOptions.Title > 0, "card title must be non-empty")
		assertCondition(typeof(cardOptions.Description) == "string", "card description must be a string")
		assertCondition(cardOptions.Icon == nil or typeof(cardOptions.Icon) == "string", "card icon must be a string")
		assertCondition(cardOptions.Callback == nil or typeof(cardOptions.Callback) == "function", "card callback must be a function")
		const card: TextButton = create("TextButton", cardsContainer, {
			AutoButtonColor = false,
			BackgroundColor3 = palette.Surface,
			BorderSizePixel = 0,
			LayoutOrder = index,
			Text = "",
			ZIndex = LAYER.Content + 1,
		})
		corner(card, 8)
		if cardOptions.Icon then
			create("ImageLabel", card, {
				BackgroundTransparency = 1,
				Image = cardOptions.Icon,
				Position = UDim2.fromOffset(10, 10),
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.fromOffset(34, 34),
				ZIndex = LAYER.Content + 2,
			})
		end
		const cardTitle: TextLabel = textLabel(card, cardOptions.Title, UDim2.new(1, -20, 0, 20), 14, brightText, LAYER.Content + 2)
		cardTitle.FontFace = Font.fromEnum(Enum.Font.GothamBold)
		cardTitle.Position = UDim2.fromOffset(10, 58)
		const cardDescription: TextLabel = textLabel(card, cardOptions.Description, UDim2.new(1, -20, 0, 28), 10, palette.MutedText, LAYER.Content + 2)
		cardDescription.Position = UDim2.fromOffset(10, 80)
		cardDescription.TextWrapped = true
		track(window, card.MouseEnter:Connect(function(): ()
			setPaletteRole(window, card, "BackgroundColor3", "SurfaceHover")
			animate(window, card, NORMAL_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
		end))
		track(window, card.MouseLeave:Connect(function(): ()
			setPaletteRole(window, card, "BackgroundColor3", "Surface")
			animate(window, card, NORMAL_TWEEN, { BackgroundColor3 = window._palette.Surface })
		end))
		track(window, card.Activated:Connect(function(): () invoke(cardOptions.Callback) end))
	end

	create("Frame", home, {
		BackgroundColor3 = palette.Surface,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(LAYOUT.HomeInset, LAYOUT.HomeDividerTop),
		Size = UDim2.new(1, -LAYOUT.HomeInset * 2, 0, 1),
		ZIndex = LAYER.Content + 1,
	})
	const footer: TextLabel = textLabel(home, settings.Footer or "Apotheosis Hub • V1.0", UDim2.fromOffset(180, 16), 11, palette.MutedText, LAYER.Content + 1)
	footer.Position = UDim2.fromOffset(LAYOUT.HomeInset, LAYOUT.HomeFooterTop)
	return home
end

function PageClass:AddSection(options: SectionOptions | string): Section
	assertCondition(typeof(options) == "string" or typeof(options) == "table", "section options must be a string or table")
	const settings: SectionOptions = if typeof(options) == "string" then { Name = options } else options
	assertCondition(typeof(settings.Name) == "string" and #settings.Name > 0, "section name must be non-empty")
	assertCondition(settings.Description == nil or typeof(settings.Description) == "string", "section description must be a string")
	const root: Frame = create("Frame", self.Instance, { AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = self._window._palette.Surface, BackgroundTransparency = 0.08, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0), ZIndex = LAYER.Section })
	corner(root, 10)
	stroke(root, self._window._palette, 0.38)
	padding(root, LAYOUT.SectionPadding, LAYOUT.SectionPadding, LAYOUT.SectionPadding, LAYOUT.SectionPadding)
	const rootLayout: UIListLayout = list(root, LAYOUT.SectionContentGap)
	const header: Frame = create("Frame", root, { BackgroundTransparency = 1, LayoutOrder = 0, Size = UDim2.new(1, 0, 0, if settings.Description then 44 else 27), ZIndex = LAYER.Section + 1 })
	const title: TextLabel = textLabel(header, settings.Name, UDim2.new(1, -40, 0, 24), 15, self._window._palette.Text, LAYER.Section + 2)
	title.FontFace = Font.fromEnum(Enum.Font.GothamBold)
	const collapseButton: TextButton = create("TextButton", header, {
		AnchorPoint = Vector2.new(1, 0.5),
		AutoButtonColor = false,
		BackgroundColor3 = self._window._palette.SurfaceHover,
		BackgroundTransparency = 0.1,
		BorderSizePixel = 0,
		FontFace = Font.fromEnum(Enum.Font.GothamBold),
		Position = UDim2.new(1, 0, 0, 12),
		Size = UDim2.fromOffset(28, 25),
		Text = "-",
		TextColor3 = self._window._palette.MutedText,
		TextSize = 17,
		ZIndex = LAYER.Section + 2,
	})
	corner(collapseButton, 7)
	if settings.Description then
		const description: TextLabel = textLabel(header, settings.Description, UDim2.new(1, -40, 0, 18), 11, self._window._palette.MutedText, LAYER.Section + 2)
		description.Position = UDim2.fromOffset(0, 24)
	end
	const contentClip: Frame = create("Frame", root, { AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, ClipsDescendants = false, Interactable = true, LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 0), ZIndex = LAYER.Content })
	const content: Frame = create("Frame", contentClip, { AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), ZIndex = LAYER.Content })
	list(content, LAYOUT.ControlGap)
	const section: Section = setmetatable({ Instance = content, _cardCount = 0, _cardRow = nil, _collapseButton = collapseButton, _collapsed = false, _contentClip = contentClip, _page = self, _root = root }, SectionClass) :: any
	setPaletteBinding(self._window, collapseButton, "BackgroundColor3", "SurfaceHover")
	setPaletteBinding(self._window, collapseButton, "TextColor3", "MutedText")
	track(self._window, collapseButton.MouseEnter:Connect(function(): ()
		setPaletteRole(self._window, collapseButton, "TextColor3", "Text")
		animate(self._window, collapseButton, FAST_TWEEN, { BackgroundTransparency = 0, TextColor3 = self._window._palette.Text })
	end))
	track(self._window, collapseButton.MouseLeave:Connect(function(): ()
		setPaletteRole(self._window, collapseButton, "TextColor3", "MutedText")
		animate(self._window, collapseButton, FAST_TWEEN, { BackgroundTransparency = 0.1, TextColor3 = self._window._palette.MutedText })
	end))
	track(self._window, collapseButton.Activated:Connect(function(): ()
		section._collapsed = not section._collapsed
		collapseButton.Text = if section._collapsed then "+" else "-"
		const scale: number = math.max(self._window._scale.Scale, 0.01)
		const contentHeight: number = content.AbsoluteSize.Y / scale
		const currentHeight: number = contentClip.AbsoluteSize.Y / scale
		if section._collapsed then
			rootLayout.Padding = UDim.new(0, 0)
			contentClip.AutomaticSize = Enum.AutomaticSize.None
			contentClip.ClipsDescendants = true
			contentClip.Interactable = false
			contentClip.Size = UDim2.new(1, 0, 0, currentHeight)
			animate(self._window, contentClip, SECTION_TWEEN, { Size = UDim2.new(1, 0, 0, 0) })
			animate(self._window, content, SECTION_TWEEN, { Position = UDim2.fromOffset(0, 5) })
		else
			rootLayout.Padding = UDim.new(0, LAYOUT.SectionContentGap)
			contentClip.AutomaticSize = Enum.AutomaticSize.None
			contentClip.ClipsDescendants = true
			contentClip.Interactable = true
			contentClip.Size = UDim2.new(1, 0, 0, currentHeight)
			const tween: Tween = animate(self._window, contentClip, SECTION_TWEEN, { Size = UDim2.new(1, 0, 0, contentHeight) })
			animate(self._window, content, SECTION_TWEEN, { Position = UDim2.fromOffset(0, 0) })
			tween.Completed:Once(function(playbackState: Enum.PlaybackState): ()
				if playbackState == Enum.PlaybackState.Completed and not self._window:IsDestroyed() and not section._collapsed then
					contentClip.ClipsDescendants = false
					contentClip.AutomaticSize = Enum.AutomaticSize.Y
				end
			end)
		end
	end))
	return section
end

function PageClass:Select(): ()
	self._window:SelectPage(self)
end

-- Section Methods
function SectionClass:AddLabel(options: LabelOptions | string): Label
	breakCards(self)
	assertCondition(typeof(options) == "string" or typeof(options) == "table", "label options must be a string or table")
	const settings: LabelOptions = if typeof(options) == "string" then { Text = options } else options
	assertCondition(typeof(settings.Text) == "string", "label text must be a string")
	assertCondition(settings.Size == nil or isFiniteNumber(settings.Size) and settings.Size > 0, "label size must be a positive finite number")
	assertCondition(settings.Color == nil or typeof(settings.Color) == "Color3", "label color must be a Color3")
	const label: TextLabel = textLabel(self.Instance, settings.Text, UDim2.new(1, 0, 0, LAYOUT.LabelHeight), settings.Size or 13, settings.Color or self._page._window._palette.Text, LAYER.Content + 1)
	label.AutomaticSize = Enum.AutomaticSize.Y
	label.TextTruncate = Enum.TextTruncate.None
	label.TextWrapped = true
	return setmetatable({ Instance = label }, LabelClass) :: any
end

function SectionClass:AddPalettePreset(options: PalettePresetOptions): TextButton
	const window: Window = self._page._window
	assertCondition(typeof(options.Name) == "string" and #options.Name > 0, "palette preset name must be non-empty")
	assertCondition(typeof(options.Palette) == "table", "palette preset must contain a palette")
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "palette preset callback must be a function")
	for _, paletteColor: PaletteColorInfo in PALETTE_COLORS do
		assertCondition(typeof(options.Palette[paletteColor.Name]) == "Color3", `palette preset is missing '{paletteColor.Name}'`)
	end
	breakCards(self)
	const presetIndex: number = self._palettePresetCount or 0
	if presetIndex % 2 == 0 then
		self._palettePresetRow = create("Frame", self.Instance, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 52),
			ZIndex = LAYER.Content,
		})
	end
	const presetRow: Frame = self._palettePresetRow
	const column: number = presetIndex % 2
	const button: TextButton = create("TextButton", presetRow, {
		AutoButtonColor = false,
		BackgroundColor3 = window._palette.Control,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Position = UDim2.new(column * 0.5, if column == 0 then 0 else 4, 0, 0),
		Size = UDim2.new(0.5, -4, 1, 0),
		Text = "",
		ZIndex = LAYER.Content + 1,
	})
	corner(button, 7)
	setPaletteBinding(window, button, "BackgroundColor3", "Control")
	const preview: Frame = create("Frame", button, {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(8, 7),
		Size = UDim2.new(1, -16, 0, 10),
		ZIndex = LAYER.Content + 2,
	})
	create("UIGridLayout", preview, {
		CellPadding = UDim2.fromOffset(2, 0),
		CellSize = UDim2.new(1 / #PALETTE_COLORS, -2, 1, 0),
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	for index: number, paletteColor: PaletteColorInfo in PALETTE_COLORS do
		const swatch: Frame = create("Frame", preview, {
			BackgroundColor3 = options.Palette[paletteColor.Name],
			BorderSizePixel = 0,
			LayoutOrder = index,
			ZIndex = LAYER.Content + 3,
		})
		corner(swatch, 2)
		clearPaletteBinding(window, swatch, "BackgroundColor3")
	end
	const nameLabel: TextLabel = textLabel(button, options.Name, UDim2.new(1, -16, 0, 19), 12, window._palette.Text, LAYER.Content + 2)
	nameLabel.Position = UDim2.fromOffset(8, 24)
	track(window, button.MouseEnter:Connect(function(): ()
		setPaletteRole(window, button, "BackgroundColor3", "SurfaceHover")
		animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover, BackgroundTransparency = 0 })
	end))
	track(window, button.MouseLeave:Connect(function(): ()
		setPaletteRole(window, button, "BackgroundColor3", "Control")
		animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.Control, BackgroundTransparency = 0 })
	end))
	track(window, button.Activated:Connect(function(): () invoke(options.Callback) end))
	self._palettePresetCount = presetIndex + 1
	return button
end

function LabelClass:GetText(): string
	return self.Instance.Text
end

function LabelClass:GetColor(): Color3
	return self.Instance.TextColor3
end

function LabelClass:GetSize(): number
	return self.Instance.TextSize
end

function LabelClass:SetColor(color: Color3): ()
	assertCondition(typeof(color) == "Color3", "label color must be a Color3")
	self.Instance.TextColor3 = color
end

function LabelClass:SetSize(size: number): ()
	assertCondition(isFiniteNumber(size) and size > 0, "label size must be a positive finite number")
	self.Instance.TextSize = size
end

function LabelClass:SetText(text: string): ()
	assertCondition(typeof(text) == "string", "label text must be a string")
	self.Instance.Text = text
end

function SectionClass:AddSeparator(): Frame
	breakCards(self)
	const separator: Frame = create("Frame", self.Instance, { BackgroundColor3 = self._page._window._palette.Border, BackgroundTransparency = 0.38, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 1), ZIndex = LAYER.Content + 1 })
	setPaletteBinding(self._page._window, separator, "BackgroundColor3", "Border")
	return separator
end

function SectionClass:AddImage(options: ImageOptions): ImageLabel
	breakCards(self)
	assertCondition(typeof(options.Image) == "string", "image must be a string")
	assertCondition(options.Height == nil or isFiniteNumber(options.Height) and options.Height > 0, "image height must be a positive finite number")
	assertCondition(options.Color == nil or typeof(options.Color) == "Color3", "image color must be a Color3")
	assertCondition(options.ScaleType == nil or typeof(options.ScaleType) == "EnumItem" and options.ScaleType.EnumType == Enum.ScaleType, "image scale type must be Enum.ScaleType")
	const image: ImageLabel = create("ImageLabel", self.Instance, { BackgroundColor3 = self._page._window._palette.SurfaceHover, BackgroundTransparency = 0.25, BorderSizePixel = 0, Image = options.Image, ImageColor3 = options.Color or Color3.new(1, 1, 1), ScaleType = options.ScaleType or Enum.ScaleType.Fit, Size = UDim2.new(1, 0, 0, options.Height or 120), ZIndex = LAYER.Content + 1 })
	corner(image, 8)
	return image
end

function SectionClass:AddButton(options: ButtonOptions): TextButton
	const window: Window = self._page._window
	assertCondition(options.Description == nil or typeof(options.Description) == "string", "button description must be a string")
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "button callback must be a function")
	breakCards(self)
	const button: TextButton = create("TextButton", self.Instance, { AutoButtonColor = false, BackgroundColor3 = window._palette.Control, BackgroundTransparency = 0, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, if options.Description then LAYOUT.ControlDescriptionHeight else LAYOUT.ControlHeight), Text = "", ZIndex = LAYER.Content + 1 })
	corner(button, 8)
	setPaletteBinding(window, button, "BackgroundColor3", "Control")
	if options.Description and #options.Description > 0 then
		const description: TextLabel = textLabel(button, options.Description, UDim2.new(1, -40, 0, 18), 11, window._palette.MutedText, LAYER.Content + 2)
		description.Position = UDim2.fromOffset(LAYOUT.SectionPadding, 17)
	end
	const arrow: TextLabel = textLabel(button, "›", UDim2.fromOffset(20, 30), 22, window._palette.MutedText, LAYER.Content + 2)
	arrow.AnchorPoint = Vector2.new(1, 0.5)
	arrow.Position = UDim2.new(1, -LAYOUT.ControlRightInset, 0.5, 0)
	arrow.TextXAlignment = Enum.TextXAlignment.Center
	setPaletteBinding(window, arrow, "TextColor3", "MutedText")
	track(window, button.MouseEnter:Connect(function(): ()
		setPaletteRole(window, button, "BackgroundColor3", "SurfaceHover")
		setPaletteRole(window, arrow, "TextColor3", "Text")
		animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
		animate(window, arrow, FAST_TWEEN, { TextColor3 = window._palette.Text })
	end))
	track(window, button.MouseLeave:Connect(function(): ()
		setPaletteRole(window, button, "BackgroundColor3", "Control")
		setPaletteRole(window, arrow, "TextColor3", "MutedText")
		animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.Control })
		animate(window, arrow, FAST_TWEEN, { TextColor3 = window._palette.MutedText })
	end))
	track(window, button.Activated:Connect(function(): () invoke(options.Callback) end))
	return button
end

function SectionClass:AddCard(options: CardOptions): TextButton
	const window: Window = self._page._window
	assertCondition(typeof(options.Title) == "string" and #options.Title > 0, "card title must be non-empty")
	assertCondition(typeof(options.Description) == "string", "card description must be a string")
	assertCondition(options.Icon == nil or typeof(options.Icon) == "string", "card icon must be a string")
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "card callback must be a function")
	if not self._cardRow or self._cardCount % 2 == 0 then
		self._cardRow = create("Frame", self.Instance, { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 72), ZIndex = LAYER.Content })
	end
	const column: number = self._cardCount % 2
	const card: TextButton = create("TextButton", self._cardRow, { AutoButtonColor = false, BackgroundColor3 = window._palette.Control, BackgroundTransparency = 0, BorderSizePixel = 0, Position = UDim2.new(column * 0.5, if column == 0 then 0 else 4, 0, 0), Size = UDim2.new(0.5, -4, 1, 0), Text = "", ZIndex = LAYER.Content + 1 })
	corner(card, 8)
	setPaletteBinding(window, card, "BackgroundColor3", "Control")
	const offset: number = if options.Icon then 55 else 13
	if options.Icon then
		const iconBackground: Frame = create("Frame", card, { AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = window._palette.SurfaceHover, BorderSizePixel = 0, Position = UDim2.new(0, 10, 0.5, 0), Size = UDim2.fromOffset(35, 35), ZIndex = LAYER.Content + 2 })
		corner(iconBackground, 8)
		create("ImageLabel", iconBackground, { BackgroundTransparency = 1, Image = options.Icon, ImageColor3 = window._palette.Accent, Position = UDim2.fromOffset(6, 6), ScaleType = Enum.ScaleType.Fit, Size = UDim2.fromOffset(23, 23), ZIndex = LAYER.Content + 3 })
	end
	const title: TextLabel = textLabel(card, options.Title, UDim2.new(1, -offset - 7, 0, 20), 13, window._palette.Text, LAYER.Content + 2)
	title.FontFace = Font.fromEnum(Enum.Font.GothamBold)
	title.Position = UDim2.fromOffset(offset, 17)
	const description: TextLabel = textLabel(card, options.Description, UDim2.new(1, -offset - 7, 0, 26), 10, window._palette.MutedText, LAYER.Content + 2)
	description.Position = UDim2.fromOffset(offset, 37)
	description.TextWrapped = true
	self._cardCount += 1
	track(window, card.MouseEnter:Connect(function(): ()
		setPaletteRole(window, card, "BackgroundColor3", "SurfaceHover")
		animate(window, card, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
	end))
	track(window, card.MouseLeave:Connect(function(): ()
		setPaletteRole(window, card, "BackgroundColor3", "Control")
		animate(window, card, FAST_TWEEN, { BackgroundColor3 = window._palette.Control })
	end))
	track(window, card.Activated:Connect(function(): () invoke(options.Callback) end))
	return card
end

function SectionClass:AddKeybind(options: KeybindControlOptions): KeybindControl
	const window: Window = self._page._window
	assertCondition(typeof(options.Text) == "string" and #options.Text > 0, "keybind text must be non-empty")
	assertCondition(
		options.Default == nil or typeof(options.Default) == "EnumItem"
			and options.Default.EnumType == Enum.KeyCode
			and options.Default ~= Enum.KeyCode.Unknown,
		"keybind default must be a valid Enum.KeyCode"
	)
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "keybind callback must be a function")
	const container: Frame = row(self, LAYOUT.ControlHeight)
	const defaultKeybind: Enum.KeyCode = options.Default or Enum.KeyCode.RightShift
	controlText(container, window._palette, options.Text, nil, LAYOUT.KeybindControlWidth + LAYOUT.ControlRightInset + LAYOUT.DropdownLabelGap)
	const button: TextButton = create("TextButton", container, {
		AnchorPoint = Vector2.new(1, 0.5),
		AutoButtonColor = false,
		BackgroundColor3 = window._palette.Control,
		BorderSizePixel = 0,
		FontFace = Font.fromEnum(Enum.Font.Gotham),
		Position = UDim2.new(1, -LAYOUT.ControlRightInset, 0.5, 0),
		Size = UDim2.fromOffset(LAYOUT.KeybindControlWidth, LAYOUT.ControlFieldHeight),
		Text = keybindText(defaultKeybind),
		TextColor3 = window._palette.Text,
		TextSize = 12,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = LAYER.Content + 2,
	})
	corner(button, 6)
	setPaletteBinding(window, button, "BackgroundColor3", "Control")
	setPaletteBinding(window, button, "TextColor3", "Text")
	const keybind: KeybindControl = setmetatable({
		Instance = container,
		_keybind = defaultKeybind,
		_default = defaultKeybind,
		_button = button,
		_hovered = false,
		_callback = options.Callback,
		_window = window,
	}, KeybindControlClass) :: any
	track(window, button.Activated:Connect(function(): ()
		beginKeybindCapture(window, keybind, button)
	end))
	track(window, button.MouseEnter:Connect(function(): ()
		keybind._hovered = true
		if window._keybindCapture ~= keybind then
			setPaletteRole(window, button, "BackgroundColor3", "SurfaceHover")
			animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
		end
	end))
	track(window, button.MouseLeave:Connect(function(): ()
		keybind._hovered = false
		if window._keybindCapture ~= keybind then
			setPaletteRole(window, button, "BackgroundColor3", "Control")
			setPaletteRole(window, button, "TextColor3", "Text")
			animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.Control, TextColor3 = window._palette.Text })
		end
	end))
	return keybind
end

function SectionClass:AddToggle(options: ToggleOptions): Toggle
	const window: Window = self._page._window
	assertCondition(typeof(options.Text) == "string" and #options.Text > 0, "toggle text must be non-empty")
	assertCondition(options.Description == nil or typeof(options.Description) == "string", "toggle description must be a string")
	assertCondition(options.Default == nil or typeof(options.Default) == "boolean", "toggle default must be a boolean")
	assertCondition(options.Keybind == nil or typeof(options.Keybind) == "table", "toggle keybind must be a table")
	assertCondition(
		options.Keybind == nil or options.Keybind.Enabled == nil or typeof(options.Keybind.Enabled) == "boolean",
		"toggle keybind Enabled must be a boolean"
	)
	assertCondition(
		options.Keybind == nil
			or options.Keybind.Default == nil
			or typeof(options.Keybind.Default) == "EnumItem"
				and options.Keybind.Default.EnumType == Enum.KeyCode
				and options.Keybind.Default ~= Enum.KeyCode.Unknown,
		"toggle default keybind must be a valid Enum.KeyCode"
	)
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "toggle callback must be a function")
	const container: Frame = row(self, if options.Description then LAYOUT.ControlDescriptionHeight else LAYOUT.ControlHeight)
	const keybindEnabled: boolean = options.Keybind ~= nil and options.Keybind.Enabled ~= false
	const defaultKeybind: Enum.KeyCode? = if keybindEnabled and options.Keybind then options.Keybind.Default else nil
	controlText(container, window._palette, options.Text, options.Description, if keybindEnabled then LAYOUT.ToggleKeybindLabelInset else 58)
	const trackButton: TextButton = create("TextButton", container, { AnchorPoint = Vector2.new(1, 0.5), AutoButtonColor = false, BackgroundColor3 = window._palette.Border, BorderSizePixel = 0, Position = UDim2.new(1, -LAYOUT.ControlRightInset, 0.5, 0), Size = UDim2.fromOffset(LAYOUT.ToggleWidth, LAYOUT.ToggleHeight), Text = "", ZIndex = LAYER.Content + 2 })
	corner(trackButton, UDim.new(1, 0))
	const knob: Frame = create("Frame", trackButton, { BackgroundColor3 = window._palette.MutedText, BorderSizePixel = 0, Position = UDim2.fromOffset(3, 3), Size = UDim2.fromOffset(16, 16), ZIndex = LAYER.Content + 3 })
	corner(knob, UDim.new(1, 0))
	local keybindButton: TextButton? = nil
	if keybindEnabled then
		keybindButton = create("TextButton", container, {
			AnchorPoint = Vector2.new(1, 0.5),
			AutoButtonColor = false,
			BackgroundColor3 = window._palette.Control,
			BorderSizePixel = 0,
			FontFace = Font.fromEnum(Enum.Font.Gotham),
			Position = UDim2.new(1, -LAYOUT.ControlRightInset - LAYOUT.ToggleWidth - LAYOUT.ToggleKeybindGap, 0.5, 0),
			Size = UDim2.fromOffset(LAYOUT.ToggleKeybindWidth, LAYOUT.ControlFieldHeight),
			Text = keybindText(defaultKeybind),
			TextColor3 = window._palette.Text,
			TextSize = 12,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = LAYER.Content + 2,
		})
		corner(keybindButton, 6)
		setPaletteBinding(window, keybindButton, "TextColor3", "Text")
		setPaletteBinding(window, keybindButton, "BackgroundColor3", "Control")
	end
	const toggle: Toggle = setmetatable({
		Instance = container,
		_callback = options.Callback,
		_keybind = defaultKeybind,
		_keybindButton = keybindButton,
		_keybindEnabled = keybindEnabled,
		_keybindHovered = false,
		_knob = knob,
		_track = trackButton,
		_value = false,
		_window = window,
	}, ToggleClass) :: any
	track(window, trackButton.MouseEnter:Connect(function(): ()
		setPaletteRole(window, trackButton, "BackgroundColor3", "SurfaceHover")
		animate(window, trackButton, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
	end))
	track(window, trackButton.MouseLeave:Connect(function(): ()
		setPaletteRole(window, trackButton, "BackgroundColor3", if toggle._value then "SurfaceHover" else "Border")
		animate(window, trackButton, FAST_TWEEN, { BackgroundColor3 = if toggle._value then window._palette.SurfaceHover else window._palette.Border })
	end))
	if keybindButton then
		track(window, keybindButton.Activated:Connect(function(): ()
			beginKeybindCapture(window, toggle, keybindButton)
		end))
		track(window, keybindButton.MouseEnter:Connect(function(): ()
			toggle._keybindHovered = true
			if window._keybindCapture ~= toggle then
				setPaletteRole(window, keybindButton, "BackgroundColor3", "SurfaceHover")
				animate(window, keybindButton, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
			end
		end))
		track(window, keybindButton.MouseLeave:Connect(function(): ()
			toggle._keybindHovered = false
			if window._keybindCapture ~= toggle then
				setPaletteRole(window, keybindButton, "BackgroundColor3", "Control")
				setPaletteRole(window, keybindButton, "TextColor3", "Text")
				animate(window, keybindButton, FAST_TWEEN, { BackgroundColor3 = window._palette.Control, TextColor3 = window._palette.Text })
			end
		end))
	end
	table.insert(window._toggles, toggle)
	toggle:SetValue(options.Default == true, false)
	track(window, trackButton.Activated:Connect(function(): () toggle:SetValue(not toggle._value, true) end))
	return toggle
end

function ToggleClass:GetValue(): boolean
	return self._value
end

function ToggleClass:GetKeybind(): Enum.KeyCode?
	return self._keybind
end

function ToggleClass:SetKeybind(keyCode: Enum.KeyCode?): ()
	assertCondition(
		keyCode == nil or typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode and keyCode ~= Enum.KeyCode.Unknown,
		"keybind must be a valid Enum.KeyCode or nil"
	)
	if not self._keybindEnabled then return end
	self._keybind = keyCode
	if self._window._keybindCapture == self then self._window._keybindCapture = nil end
	const button: TextButton? = self._keybindButton
	if button then
		button.Text = keybindText(keyCode)
		setPaletteBinding(self._window, button, "TextColor3", "Text")
		const backgroundRole: PaletteColor = if self._keybindHovered then "SurfaceHover" else "Control"
		setPaletteRole(self._window, button, "BackgroundColor3", backgroundRole)
		animate(self._window, button, FAST_TWEEN, { BackgroundColor3 = self._window._palette[backgroundRole], TextColor3 = self._window._palette.Text })
	end
end

function KeybindControlClass:GetValue(): Enum.KeyCode
	return self._keybind
end

function KeybindControlClass:SetValue(keyCode: Enum.KeyCode): ()
	self:SetKeybind(keyCode)
end

function KeybindControlClass:SetKeybind(keyCode: Enum.KeyCode?): ()
	assertCondition(
		keyCode == nil or typeof(keyCode) == "EnumItem" and keyCode.EnumType == Enum.KeyCode and keyCode ~= Enum.KeyCode.Unknown,
		"keybind must be a valid Enum.KeyCode or nil"
	)
	const updatedKeybind: Enum.KeyCode = keyCode or self._default
	const changed: boolean = self._keybind ~= updatedKeybind
	self._keybind = updatedKeybind
	if self._window._keybindCapture == self then self._window._keybindCapture = nil end
	self._button.Text = keybindText(updatedKeybind)
	setPaletteBinding(self._window, self._button, "TextColor3", "Text")
	const backgroundRole: PaletteColor = if self._hovered then "SurfaceHover" else "Control"
	setPaletteRole(self._window, self._button, "BackgroundColor3", backgroundRole)
	animate(self._window, self._button, FAST_TWEEN, { BackgroundColor3 = self._window._palette[backgroundRole], TextColor3 = self._window._palette.Text })
	if changed then invoke(self._callback, updatedKeybind) end
end

function ToggleClass:SetValue(value: boolean, emit: boolean?): ()
	assertCondition(typeof(value) == "boolean", "toggle value must be a boolean")
	if self._value == value and emit ~= false then return end
	self._value = value
	setPaletteRole(self._window, self._track, "BackgroundColor3", if value then "SurfaceHover" else "Border")
	setPaletteRole(self._window, self._knob, "BackgroundColor3", if value then "Text" else "MutedText")
	animate(self._window, self._track, NORMAL_TWEEN, { BackgroundColor3 = if value then self._window._palette.SurfaceHover else self._window._palette.Border })
	animate(self._window, self._knob, NORMAL_TWEEN, { BackgroundColor3 = if value then self._window._palette.Text else self._window._palette.MutedText, Position = if value then UDim2.fromOffset(25, 3) else UDim2.fromOffset(3, 3) })
	if emit ~= false then invoke(self._callback, value) end
end

function SectionClass:AddSlider(options: SliderOptions): Slider
	assertCondition(isFiniteNumber(options.Minimum), "slider minimum must be a finite number")
	assertCondition(isFiniteNumber(options.Maximum), "slider maximum must be a finite number")
	assertCondition(options.Maximum > options.Minimum, "slider maximum must be greater than minimum")
	assertCondition(options.Step == nil or isFiniteNumber(options.Step) and options.Step > 0, "slider step must be a positive finite number")
	assertCondition(options.Default == nil or isFiniteNumber(options.Default), "slider default must be a finite number")
	assertCondition(options.Suffix == nil or typeof(options.Suffix) == "string", "slider suffix must be a string")
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "slider callback must be a function")
	const window: Window = self._page._window
	const container: Frame = row(self, LAYOUT.SliderHeight)
	const step: number = options.Step or 1
	const valueLabel: TextLabel = textLabel(container, "", UDim2.fromOffset(LAYOUT.SliderValueWidth, 20), 12, window._palette.Accent, LAYER.Content + 2)
	valueLabel.AnchorPoint = Vector2.new(1, 0.5)
	valueLabel.Position = UDim2.new(1, -LAYOUT.ControlRightInset, 0.5, 0)
	valueLabel.TextXAlignment = Enum.TextXAlignment.Right
	const trackRightInset: number = LAYOUT.ControlRightInset + LAYOUT.SliderValueWidth + LAYOUT.SliderValueGap
	const bar: Frame = create("Frame", container, { AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = window._palette.Border, BorderSizePixel = 0, Position = UDim2.new(0, LAYOUT.SliderInset, 0.5, 0), Size = UDim2.new(1, -LAYOUT.SliderInset - trackRightInset, 0, LAYOUT.SliderTrackHeight), ZIndex = LAYER.Content + 1 })
	corner(bar, 2)
	const fill: Frame = create("Frame", bar, { BackgroundColor3 = window._palette.Accent, BorderSizePixel = 0, Size = UDim2.fromScale(0, 1), ZIndex = LAYER.Content + 2 })
	corner(fill, 2)
	const knob: Frame = create("Frame", bar, { AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = window._palette.Text, BorderSizePixel = 0, Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromOffset(13, 13), ZIndex = LAYER.Content + 3 })
	corner(knob, UDim.new(1, 0))
	const dragArea: TextButton = create("TextButton", container, { AutoButtonColor = false, BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.fromOffset(0, 0), Size = UDim2.fromScale(1, 1), Text = "", ZIndex = LAYER.Content + 5 })
	const slider: Slider = setmetatable({ Instance = container, _callback = options.Callback, _fill = fill, _knob = knob, _maximum = options.Maximum, _minimum = options.Minimum, _precision = precision(step), _step = step, _suffix = options.Suffix or "", _value = options.Minimum, _valueLabel = valueLabel }, SliderClass) :: any
	local function update(input: InputObject): ()
		const width: number = bar.AbsoluteSize.X
		if width <= 0 then return end
		slider:SetValue(options.Minimum + (options.Maximum - options.Minimum) * math.clamp((input.Position.X - bar.AbsolutePosition.X) / width, 0, 1), true)
	end
	track(window, dragArea.InputBegan:Connect(function(input: InputObject): ()
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			window._sliderDrag = update
			update(input)
			animate(window, knob, FAST_TWEEN, { Size = UDim2.fromOffset(16, 16) })
		end
	end))
	track(window, dragArea.InputEnded:Connect(function(input: InputObject): ()
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			window._sliderDrag = nil
			animate(window, knob, FAST_TWEEN, { Size = UDim2.fromOffset(13, 13) })
		end
	end))
	slider:SetValue(options.Default or options.Minimum, false)
	return slider
end

function SliderClass:GetValue(): number
	return self._value
end

function SliderClass:SetValue(value: number, emit: boolean?): ()
	assertCondition(isFiniteNumber(value), "slider value must be a finite number")
	const stepped: number = self._minimum + math.round((value - self._minimum) / self._step) * self._step
	const clamped: number = math.clamp(stepped, self._minimum, self._maximum)
	const changed: boolean = self._value ~= clamped
	const alpha: number = (clamped - self._minimum) / (self._maximum - self._minimum)
	self._value = clamped
	self._fill.Size = UDim2.fromScale(alpha, 1)
	self._knob.Position = UDim2.fromScale(alpha, 0.5)
	self._valueLabel.Text = string.format(`%.{self._precision}f`, clamped) .. self._suffix
	if emit ~= false and changed then invoke(self._callback, clamped) end
end

local function setDropdownVisual(dropdown: Dropdown, active: boolean, hovered: boolean, tweenInfo: TweenInfo?): ()
	const window: Window = dropdown._window
	const currentTween: TweenInfo = tweenInfo or FAST_TWEEN
	const backgroundRole: PaletteColor = if active or hovered then "SurfaceHover" else "Control"
	setPaletteRole(window, dropdown._button, "BackgroundColor3", backgroundRole)
	animate(window, dropdown._button, currentTween, { BackgroundColor3 = window._palette[backgroundRole] })
end

function SectionClass:AddDropdown(options: DropdownOptions): Dropdown
	assertCondition(typeof(options.Options) == "table" and #options.Options > 0, "dropdown must have at least one option")
	assertCondition(typeof(options.Text) == "string" and #options.Text > 0, "dropdown text must be non-empty")
	assertCondition(options.Description == nil or typeof(options.Description) == "string", "dropdown description must be a string")
	assertCondition(options.OpenDirection == nil or options.OpenDirection == "Auto" or options.OpenDirection == "Up" or options.OpenDirection == "Down", "dropdown open direction must be Auto, Up, or Down")
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "dropdown callback must be a function")
	const seen: {[string]: boolean} = {}
	for _, option: string in options.Options do
		assertCondition(typeof(option) == "string" and #option > 0 and not seen[option], "dropdown options must be unique non-empty strings")
		seen[option] = true
	end
	const defaultValue: string = options.Default or options.Options[1]
	assertCondition(typeof(defaultValue) == "string" and seen[defaultValue] == true, "default dropdown value is not an option")
	const window: Window = self._page._window
	const container: Frame = row(self, if options.Description then LAYOUT.ControlDescriptionHeight else LAYOUT.ControlHeight)
	const fieldWidth: number = dropdownFieldWidth(window, options.Options)
	const labelInset: number = fieldWidth + LAYOUT.ControlRightInset + LAYOUT.DropdownLabelGap
	const label: TextLabel = textLabel(container, options.Text, UDim2.new(1, -labelInset, 0, 20), 13, window._palette.Text, LAYER.Content + 3)
	label.Position = UDim2.fromOffset(0, if options.Description then 5 else 11)
	local description: TextLabel? = nil
	if options.Description and #options.Description > 0 then
		description = textLabel(container, options.Description, UDim2.new(1, -labelInset, 0, 18), 11, window._palette.MutedText, LAYER.Content + 3)
		description.Position = UDim2.fromOffset(0, 24)
	end
	const button: TextButton = create("TextButton", container, { AnchorPoint = Vector2.new(1, 0.5), AutoButtonColor = false, BackgroundColor3 = window._palette.Control, BorderSizePixel = 0, FontFace = Font.fromEnum(Enum.Font.Gotham), Position = UDim2.new(1, -LAYOUT.ControlRightInset, 0.5, 0), Size = UDim2.fromOffset(fieldWidth, LAYOUT.ControlFieldHeight), Text = "", TextColor3 = window._palette.Text, TextSize = LAYOUT.DropdownOptionTextSize, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = LAYER.Content + 2 })
	corner(button, 6)
	setPaletteBinding(window, button, "BackgroundColor3", "Control")
	setPaletteBinding(window, button, "TextColor3", "Text")
	padding(button, LAYOUT.DropdownLeftPadding, LAYOUT.DropdownRightPadding, 0, 0)
	const panelHeight: number = math.min(#options.Options * 24 + 10, 157)
	const optionsFrame: ScrollingFrame = create("ScrollingFrame", window._overlay, { AutomaticCanvasSize = Enum.AutomaticSize.Y, BackgroundColor3 = window._palette.Background, BorderSizePixel = 0, CanvasSize = UDim2.new(), ClipsDescendants = true, ScrollBarImageColor3 = window._palette.Accent, ScrollBarThickness = 2, Size = UDim2.fromOffset(fieldWidth, panelHeight), Visible = false, ZIndex = LAYER.Popup })
	corner(optionsFrame, 6)
	stroke(optionsFrame, window._palette, 0.15)
	padding(optionsFrame, 5, 5, 5, 5)
	list(optionsFrame, 0)
	const dropdown: Dropdown = setmetatable({ Instance = container, _button = button, _buttons = {}, _callback = options.Callback, _direction = options.OpenDirection or "Auto", _hovered = false, _label = label, _open = false, _options = table.clone(options.Options), _optionsFrame = optionsFrame, _panelHeight = panelHeight, _value = defaultValue, _window = window }, DropdownClass) :: any
	table.insert(window._dropdowns, dropdown)
	dropdown._resize = function(): ()
		const updatedWidth: number = dropdownFieldWidth(window, options.Options)
		button.Size = UDim2.fromOffset(updatedWidth, LAYOUT.ControlFieldHeight)
		label.Size = UDim2.new(1, -updatedWidth - LAYOUT.ControlRightInset - LAYOUT.DropdownLabelGap, 0, 20)
		if description then
			description.Size = UDim2.new(1, -updatedWidth - LAYOUT.ControlRightInset - LAYOUT.DropdownLabelGap, 0, 18)
		end
		positionDropdown(dropdown)
	end
	for _, option: string in options.Options do
		const optionButton: TextButton = create("TextButton", optionsFrame, { AutoButtonColor = false, BackgroundColor3 = window._palette.SurfaceHover, BackgroundTransparency = 1, BorderSizePixel = 0, FontFace = Font.fromEnum(Enum.Font.Gotham), Size = UDim2.new(1, 0, 0, 26), Text = option, TextColor3 = window._palette.MutedText, TextSize = LAYOUT.DropdownOptionTextSize, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = LAYER.Popup + 1 })
		corner(optionButton, 6)
		padding(optionButton, 8, 8, 0, 0)
		dropdown._buttons[option] = optionButton
		track(window, optionButton.MouseEnter:Connect(function(): ()
			if dropdown._value ~= option then
				setPaletteRole(window, optionButton, "TextColor3", "Text")
				animate(window, optionButton, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover, BackgroundTransparency = 0, TextColor3 = window._palette.Text })
			end
		end))
		track(window, optionButton.MouseLeave:Connect(function(): ()
			if dropdown._value ~= option then
				setPaletteRole(window, optionButton, "TextColor3", "MutedText")
				animate(window, optionButton, FAST_TWEEN, { BackgroundTransparency = 1, TextColor3 = window._palette.MutedText })
			end
		end))
		track(window, optionButton.Activated:Connect(function(): ()
			dropdown:SetValue(option, true)
			dropdown:SetOpen(false)
		end))
	end
	track(window, button.Activated:Connect(function(): () dropdown:SetOpen(not dropdown._open) end))
	track(window, button.MouseEnter:Connect(function(): ()
		dropdown._hovered = true
		if not dropdown._open then
			setDropdownVisual(dropdown, false, true)
		end
	end))
	track(window, button.MouseLeave:Connect(function(): ()
		dropdown._hovered = false
		if not dropdown._open then
			setDropdownVisual(dropdown, false, false)
		end
	end))
	track(window, button:GetPropertyChangedSignal("AbsolutePosition"):Connect(function(): () positionDropdown(dropdown) end))
	track(window, button:GetPropertyChangedSignal("AbsoluteSize"):Connect(function(): () positionDropdown(dropdown) end))
	track(window, self._page.Instance:GetPropertyChangedSignal("CanvasPosition"):Connect(function(): () positionDropdown(dropdown) end))
	dropdown._resize()
	dropdown:SetValue(defaultValue, false)
	return dropdown
end

function DropdownClass:GetValue(): string
	return self._value
end

function DropdownClass:SetOpen(open: boolean): ()
	assertCondition(typeof(open) == "boolean", "dropdown open state must be a boolean")
	if self._open == open or self._window:IsDestroyed() then return end
	self._open = open
	if open then
		closeDropdowns(self._window, self)
		closeColorPickers(self._window)
		self._optionsFrame.Visible = true
		positionDropdown(self)
	else
		self._optionsFrame.Visible = false
	end
	setDropdownVisual(self, open, not open and self._hovered, DROPDOWN_TWEEN)
end

function DropdownClass:SetValue(value: string, emit: boolean?): ()
	assertCondition(typeof(value) == "string", "dropdown value must be a string")
	assertCondition(table.find(self._options, value) ~= nil, `'{value}' is not a dropdown option`)
	const changed: boolean = self._value ~= value
	self._value = value
	self._button.Text = value
	for option: string, optionButton: TextButton in self._buttons do
		const selected: boolean = option == value
		const backgroundRole: PaletteColor = "SurfaceHover"
		setPaletteRole(self._window, optionButton, "BackgroundColor3", backgroundRole)
		optionButton.BackgroundColor3 = self._window._palette[backgroundRole]
		optionButton.BackgroundTransparency = if selected then 0 else 1
		setPaletteBinding(self._window, optionButton, "TextColor3", if selected then "Text" else "MutedText")
	end
	if emit ~= false and changed then invoke(self._callback, value) end
end

local function colorHex(value: Color3): string
	return string.format("#%02X%02X%02X", math.floor(value.R * 255 + 0.5), math.floor(value.G * 255 + 0.5), math.floor(value.B * 255 + 0.5))
end

local function parseHex(value: string): Color3?
	local hex: string = string.gsub(string.upper(value), "^#", "")
	if #hex == 3 then
		hex = string.sub(hex, 1, 1):rep(2) .. string.sub(hex, 2, 2):rep(2) .. string.sub(hex, 3, 3):rep(2)
	end
	if #hex ~= 6 or not string.match(hex, "^%x%x%x%x%x%x$") then return nil end
	const red: number? = tonumber(string.sub(hex, 1, 2), 16)
	const green: number? = tonumber(string.sub(hex, 3, 4), 16)
	const blue: number? = tonumber(string.sub(hex, 5, 6), 16)
	if red == nil or green == nil or blue == nil then return nil end
	return Color3.fromRGB(red, green, blue)
end

local function colorChannel(value: string): number?
	const numberValue: number? = tonumber(value)
	if not numberValue or not isFiniteNumber(numberValue) then return nil end
	return math.floor(math.clamp(numberValue + 0.5, 0, 255))
end

local function colorRatio(value: string, maximum: number): number?
	const numberValue: number? = tonumber(value)
	if not numberValue or not isFiniteNumber(numberValue) then return nil end
	return math.clamp(numberValue / maximum, 0, 1)
end

function SectionClass:AddColorPicker(options: ColorPickerOptions): ColorPicker
	const window: Window = self._page._window
	assertCondition(typeof(options.Text) == "string" and #options.Text > 0, "color picker text must be non-empty")
	assertCondition(options.Description == nil or typeof(options.Description) == "string", "color picker description must be a string")
	assertCondition(typeof(options.Default) == "Color3", "color picker default must be a Color3")
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "color picker callback must be a function")
	const container: Frame = row(self, if options.Description then LAYOUT.ControlDescriptionHeight else LAYOUT.ControlHeight)
	controlText(container, window._palette, options.Text, options.Description, LAYOUT.ColorPickerButtonWidth + LAYOUT.ControlRightInset + LAYOUT.DropdownLabelGap)
	const button: TextButton = create("TextButton", container, {
		AnchorPoint = Vector2.new(1, 0.5),
		AutoButtonColor = false,
		BackgroundColor3 = window._palette.Control,
		BorderSizePixel = 0,
		Position = UDim2.new(1, -LAYOUT.ControlRightInset, 0.5, 0),
		Size = UDim2.fromOffset(LAYOUT.ColorPickerButtonWidth, LAYOUT.ControlFieldHeight),
		Text = "",
		ZIndex = LAYER.Content + 2,
	})
	corner(button, 6)
	setPaletteBinding(window, button, "BackgroundColor3", "Control")
	const swatch: Frame = create("Frame", button, {
		BackgroundColor3 = options.Default,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(7, 6),
		Size = UDim2.fromOffset(30, 18),
		ZIndex = LAYER.Content + 3,
	})
	corner(swatch, 4)
	const valueLabel: TextLabel = textLabel(button, colorHex(options.Default), UDim2.new(1, -47, 1, 0), 11, window._palette.Text, LAYER.Content + 3)
	valueLabel.Position = UDim2.fromOffset(43, 0)

	const panel: Frame = create("Frame", window._overlay, {
		Active = true,
		BackgroundColor3 = window._palette.Background,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Size = UDim2.fromOffset(LAYOUT.ColorPickerWidth, LAYOUT.ColorPickerHeight),
		Visible = false,
		ZIndex = LAYER.Popup,
	})
	corner(panel, 8)
	stroke(panel, window._palette, 0.1)

	const svFrame: Frame = create("Frame", panel, {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(12, 12),
		Size = UDim2.fromOffset(196, 132),
		ZIndex = LAYER.Popup + 1,
	})
	corner(svFrame, 5)
	const svGradient: UIGradient = create("UIGradient", svFrame, {
		Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromHSV(0, 1, 1)),
	})
	const valueOverlay: Frame = create("Frame", svFrame, {
		BackgroundColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		ZIndex = LAYER.Popup + 2,
	})
	corner(valueOverlay, 5)
	create("UIGradient", valueOverlay, {
		Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0)),
		Rotation = 90,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0),
		}),
	})
	const svMarker: Frame = create("Frame", svFrame, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(10, 10),
		ZIndex = LAYER.Popup + 4,
	})
	corner(svMarker, UDim.new(1, 0))
	create("UIStroke", svMarker, { Color = Color3.new(1, 1, 1), Thickness = 2 })
	const svInput: TextButton = create("TextButton", svFrame, {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		Text = "",
		ZIndex = LAYER.Popup + 5,
	})

	const hueFrame: Frame = create("Frame", panel, {
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(218, 12),
		Size = UDim2.fromOffset(18, 132),
		ZIndex = LAYER.Popup + 1,
	})
	corner(hueFrame, 5)
	create("UIGradient", hueFrame, {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(1 / 6, Color3.fromRGB(255, 255, 0)),
			ColorSequenceKeypoint.new(2 / 6, Color3.fromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(3 / 6, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(4 / 6, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(5 / 6, Color3.fromRGB(255, 0, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
		}),
		Rotation = 90,
	})
	const hueMarker: Frame = create("Frame", hueFrame, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = window._palette.Text,
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(22, 4),
		ZIndex = LAYER.Popup + 4,
	})
	corner(hueMarker, 2)
	create("UIStroke", hueMarker, { Color = window._palette.Background, Thickness = 1 })
	const hueInput: TextButton = create("TextButton", hueFrame, {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		Text = "",
		ZIndex = LAYER.Popup + 5,
	})

	const hexLabel: TextLabel = textLabel(panel, "HEX", UDim2.fromOffset(28, 24), 11, window._palette.MutedText, LAYER.Popup + 1)
	hexLabel.Position = UDim2.fromOffset(12, 153)
	const hexInput: TextBox = create("TextBox", panel, {
		BackgroundColor3 = window._palette.Control,
		BorderSizePixel = 0,
		ClearTextOnFocus = false,
		FontFace = Font.fromEnum(Enum.Font.Gotham),
		Position = UDim2.fromOffset(42, 152),
		Size = UDim2.fromOffset(104, LAYOUT.ColorPickerFieldHeight),
		Text = colorHex(options.Default),
		TextColor3 = window._palette.Text,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = LAYER.Popup + 1,
	})
	corner(hexInput, 5)
	setPaletteBinding(window, hexInput, "BackgroundColor3", "Control")
	stroke(hexInput, window._palette, 0.5)
	local rgbInputs: {TextBox} = {}
	const channelNames: {string} = { "R", "G", "B" }
	for index: number, channelName: string in channelNames do
		const left: number = 12 + (index - 1) * 76
		const channelLabel: TextLabel = textLabel(panel, channelName, UDim2.fromOffset(12, 22), 11, window._palette.MutedText, LAYER.Popup + 1)
		channelLabel.Position = UDim2.fromOffset(left, 190)
		const channelInput: TextBox = create("TextBox", panel, {
			BackgroundColor3 = window._palette.Control,
			BorderSizePixel = 0,
			ClearTextOnFocus = false,
			FontFace = Font.fromEnum(Enum.Font.Gotham),
			Position = UDim2.fromOffset(left + 14, 188),
			Size = UDim2.fromOffset(54, LAYOUT.ColorPickerFieldHeight),
			Text = "0",
			TextColor3 = window._palette.Text,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = LAYER.Popup + 1,
		})
		corner(channelInput, 5)
		setPaletteBinding(window, channelInput, "BackgroundColor3", "Control")
		stroke(channelInput, window._palette, 0.5)
		rgbInputs[index] = channelInput
	end
	local hsvInputs: {TextBox} = {}
	const hsvNames: {string} = { "H°", "S%", "V%" }
	for index: number, channelName: string in hsvNames do
		const left: number = 12 + (index - 1) * 76
		const channelLabel: TextLabel = textLabel(panel, channelName, UDim2.fromOffset(24, 22), 10, window._palette.MutedText, LAYER.Popup + 1)
		channelLabel.Position = UDim2.fromOffset(left, 222)
		const channelInput: TextBox = create("TextBox", panel, {
			BackgroundColor3 = window._palette.Control,
			BorderSizePixel = 0,
			ClearTextOnFocus = false,
			FontFace = Font.fromEnum(Enum.Font.Gotham),
			Position = UDim2.fromOffset(left + 26, 220),
			Size = UDim2.fromOffset(48, LAYOUT.ColorPickerFieldHeight),
			Text = "0",
			TextColor3 = window._palette.Text,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = LAYER.Popup + 1,
		})
		corner(channelInput, 5)
		setPaletteBinding(window, channelInput, "BackgroundColor3", "Control")
		stroke(channelInput, window._palette, 0.5)
		hsvInputs[index] = channelInput
	end
	const preview: Frame = create("Frame", panel, {
		BackgroundColor3 = window._palette.Surface,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(156, 152),
		Size = UDim2.fromOffset(102, LAYOUT.ColorPickerFieldHeight),
		ZIndex = LAYER.Popup + 1,
	})
	corner(preview, 5)
	setPaletteBinding(window, preview, "BackgroundColor3", "Surface")
	const previewSwatch: Frame = create("Frame", preview, {
		BackgroundColor3 = options.Default,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(4, 3),
		Size = UDim2.fromOffset(18, 18),
		ZIndex = LAYER.Popup + 2,
	})
	corner(previewSwatch, 4)
	clearPaletteBinding(window, swatch, "BackgroundColor3")
	clearPaletteBinding(window, previewSwatch, "BackgroundColor3")
	const previewText: TextLabel = textLabel(preview, colorHex(options.Default), UDim2.new(1, -28, 1, 0), 11, window._palette.Text, LAYER.Popup + 2)
	previewText.Position = UDim2.fromOffset(27, 0)

	local picker: ColorPicker = setmetatable({
		Instance = container,
		_button = button,
		_callback = options.Callback,
		_color = options.Default,
		_hexInput = hexInput,
		_hue = 0,
		_hueFrame = hueFrame,
		_hueMarker = hueMarker,
		_hovered = false,
		_open = false,
		_panel = panel,
		_preview = preview,
		_previewSwatch = previewSwatch,
		_previewText = previewText,
		_rgbInputs = rgbInputs,
		_hsvInputs = hsvInputs,
		_svFrame = svFrame,
		_svGradient = svGradient,
		_svInput = svInput,
		_svMarker = svMarker,
		_swatch = swatch,
		_valueLabel = valueLabel,
		_window = window,
		_hueInput = hueInput,
		_saturation = 0,
		_brightness = 1,
	}, ColorPickerClass) :: any
	local function updateSV(input: InputObject): ()
		const size: Vector2 = svFrame.AbsoluteSize
		if size.X <= 0 or size.Y <= 0 then return end
		const saturation: number = math.clamp((input.Position.X - svFrame.AbsolutePosition.X) / size.X, 0, 1)
		const brightness: number = 1 - math.clamp((input.Position.Y - svFrame.AbsolutePosition.Y) / size.Y, 0, 1)
		picker:SetValue(Color3.fromHSV(picker._hue, saturation, brightness), true)
	end
	local function updateHue(input: InputObject): ()
		const size: Vector2 = hueFrame.AbsoluteSize
		if size.Y <= 0 then return end
		const hue: number = math.clamp((input.Position.Y - hueFrame.AbsolutePosition.Y) / size.Y, 0, 1)
		picker._hue = hue
		picker:SetValue(Color3.fromHSV(hue, picker._saturation, picker._brightness), true)
	end
	track(window, svInput.InputBegan:Connect(function(input: InputObject): ()
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		window._sliderDrag = updateSV
		updateSV(input)
	end))
	track(window, hueInput.InputBegan:Connect(function(input: InputObject): ()
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
		window._sliderDrag = updateHue
		updateHue(input)
	end))
	track(window, hexInput.FocusLost:Connect(function(): ()
		const color: Color3? = parseHex(hexInput.Text)
		if color then picker:SetValue(color, true) else picker:SetValue(picker._color, false) end
	end))
	for _, channelInput: TextBox in rgbInputs do
		track(window, channelInput.FocusLost:Connect(function(): ()
			const red: number? = colorChannel(rgbInputs[1].Text)
			const green: number? = colorChannel(rgbInputs[2].Text)
			const blue: number? = colorChannel(rgbInputs[3].Text)
			if red and green and blue then
				picker:SetValue(Color3.fromRGB(red, green, blue), true)
			else
				picker:SetValue(picker._color, false)
			end
		end))
	end
	for _, channelInput: TextBox in hsvInputs do
		track(window, channelInput.FocusLost:Connect(function(): ()
			const hue: number? = colorRatio(hsvInputs[1].Text, 360)
			const saturation: number? = colorRatio(hsvInputs[2].Text, 100)
			const brightness: number? = colorRatio(hsvInputs[3].Text, 100)
			if hue and saturation and brightness then
				picker._hue = hue
				picker:SetValue(Color3.fromHSV(hue, saturation, brightness), true)
			else
				picker:SetValue(picker._color, false)
			end
		end))
	end
	table.insert(window._colorPickers, picker)
	track(window, button.Activated:Connect(function(): () picker:SetOpen(not picker._open) end))
	track(window, button.MouseEnter:Connect(function(): ()
		picker._hovered = true
		if not picker._open then
			setPaletteRole(window, button, "BackgroundColor3", "SurfaceHover")
			animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
		end
	end))
	track(window, button.MouseLeave:Connect(function(): ()
		picker._hovered = false
		if not picker._open then
			setPaletteRole(window, button, "BackgroundColor3", "Control")
			animate(window, button, FAST_TWEEN, { BackgroundColor3 = window._palette.Control })
		end
	end))
	track(window, button:GetPropertyChangedSignal("AbsolutePosition"):Connect(function(): () positionColorPicker(picker) end))
	track(window, button:GetPropertyChangedSignal("AbsoluteSize"):Connect(function(): () positionColorPicker(picker) end))
	track(window, self._page.Instance:GetPropertyChangedSignal("CanvasPosition"):Connect(function(): () positionColorPicker(picker) end))
	picker:SetValue(options.Default, false)
	return picker
end

function ColorPickerClass:GetValue(): Color3
	return self._color
end

function ColorPickerClass:SetOpen(open: boolean): ()
	assertCondition(typeof(open) == "boolean", "color picker open state must be a boolean")
	if self._open == open or self._window:IsDestroyed() then return end
	self._open = open
	if open then
		closeDropdowns(self._window, nil)
		closeColorPickers(self._window, self)
		positionColorPicker(self)
		self._panel.Visible = true
	else
		self._panel.Visible = false
	end
	const backgroundRole: PaletteColor = if open or self._hovered then "SurfaceHover" else "Control"
	setPaletteRole(self._window, self._button, "BackgroundColor3", backgroundRole)
	animate(self._window, self._button, FAST_TWEEN, { BackgroundColor3 = self._window._palette[backgroundRole] })
end

function ColorPickerClass:SetValue(value: Color3, emit: boolean?): ()
	assertCondition(typeof(value) == "Color3", "color picker value must be a Color3")
	const changed: boolean = self._color ~= value
	self._color = value
	local hue: number, saturation: number, brightness: number = value:ToHSV()
	if saturation > 0 then self._hue = hue end
	self._saturation = saturation
	self._brightness = brightness
	const hex: string = colorHex(value)
	const red: number = math.floor(value.R * 255 + 0.5)
	const green: number = math.floor(value.G * 255 + 0.5)
	const blue: number = math.floor(value.B * 255 + 0.5)
	self._swatch.BackgroundColor3 = value
	self._valueLabel.Text = hex
	self._preview.BackgroundColor3 = self._window._palette.Surface
	self._previewSwatch.BackgroundColor3 = value
	self._previewText.Text = hex
	self._hexInput.Text = hex
	self._rgbInputs[1].Text = tostring(red)
	self._rgbInputs[2].Text = tostring(green)
	self._rgbInputs[3].Text = tostring(blue)
	self._hsvInputs[1].Text = string.format("%.0f", self._hue * 360)
	self._hsvInputs[2].Text = string.format("%.1f", self._saturation * 100)
	self._hsvInputs[3].Text = string.format("%.1f", self._brightness * 100)
	self._svGradient.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromHSV(self._hue, 1, 1))
	self._svMarker.Position = UDim2.new(self._saturation, 0, 1 - self._brightness, 0)
	self._hueMarker.Position = UDim2.new(0.5, 0, self._hue, 0)
	if emit ~= false and changed then invoke(self._callback, value) end
end

function SectionClass:AddTextBox(options: TextBoxOptions): TextBoxControl
	const window: Window = self._page._window
	assertCondition(options.Description == nil or typeof(options.Description) == "string", "text box description must be a string")
	assertCondition(options.Default == nil or typeof(options.Default) == "string", "text box default must be a string")
	assertCondition(options.Placeholder == nil or typeof(options.Placeholder) == "string", "text box placeholder must be a string")
	assertCondition(options.ClearOnFocus == nil or typeof(options.ClearOnFocus) == "boolean", "ClearOnFocus must be a boolean")
	assertCondition(options.KeyCapture == nil or typeof(options.KeyCapture) == "boolean", "KeyCapture must be a boolean")
	assertCondition(options.Callback == nil or typeof(options.Callback) == "function", "text box callback must be a function")
	local defaultKey: string = options.Default or "RightShift"
	if options.KeyCapture then
		local keySuccess: boolean, defaultKeyCode: EnumItem? = pcall(function(): EnumItem?
			return Enum.KeyCode[defaultKey]
		end)
		assertCondition(keySuccess and defaultKeyCode ~= nil and defaultKeyCode ~= Enum.KeyCode.Unknown, "text box default must be a valid key name")
	end
	const container: Frame = row(self, if options.Description then LAYOUT.ControlDescriptionHeight else LAYOUT.ControlHeight)
	if options.Description and #options.Description > 0 then
		const description: TextLabel = textLabel(container, options.Description, UDim2.new(1, -198, 0, 18), 11, window._palette.MutedText, LAYER.Content + 1)
		description.Position = UDim2.fromOffset(0, 24)
	end
	const input: TextBox = create("TextBox", container, { AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = window._palette.Control, BorderSizePixel = 0, ClearTextOnFocus = options.ClearOnFocus == true, FontFace = Font.fromEnum(Enum.Font.Gotham), PlaceholderColor3 = window._palette.MutedText, PlaceholderText = options.Placeholder or "Enter text", Position = UDim2.new(1, -LAYOUT.ControlRightInset, 0.5, 0), Size = UDim2.fromOffset(LAYOUT.ControlFieldWidth, LAYOUT.ControlFieldHeight), Text = options.Default or "", TextColor3 = window._palette.Text, TextSize = 13, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = LAYER.Content + 2 })
	corner(input, 7)
	setPaletteBinding(window, input, "BackgroundColor3", "Control")
	stroke(input, window._palette, 0.45)
	padding(input, 9, 9, 0, 0)
	const textBox: TextBoxControl = setmetatable({ Input = input, Instance = container, _callback = options.Callback, _keyCapture = options.KeyCapture == true, _currentKey = defaultKey }, TextBoxClass) :: any
	track(window, input.Focused:Connect(function(): ()
		setPaletteRole(window, input, "BackgroundColor3", "SurfaceHover")
		animate(window, input, FAST_TWEEN, { BackgroundColor3 = window._palette.SurfaceHover })
	end))
	if options.KeyCapture then
		local capturing: boolean = false
		input.Text = textBox._currentKey
		input.ClearTextOnFocus = false
		input.TextEditable = false
		track(window, input.Focused:Connect(function(): ()
			capturing = true
			input.Text = "Press a key..."
		end))
		track(window, UserInputService.InputBegan:Connect(function(inputObject: InputObject): ()
			if not capturing or inputObject.UserInputType ~= Enum.UserInputType.Keyboard or inputObject.KeyCode == Enum.KeyCode.Unknown then return end
			capturing = false
			if inputObject.KeyCode == Enum.KeyCode.Escape then
				input.Text = textBox._currentKey
			else
				textBox._currentKey = inputObject.KeyCode.Name
				input.Text = textBox._currentKey
				invoke(textBox._callback, textBox._currentKey, true)
			end
			input:ReleaseFocus()
		end))
		track(window, input.FocusLost:Connect(function(): ()
			capturing = false
			setPaletteRole(window, input, "BackgroundColor3", "Control")
			animate(window, input, FAST_TWEEN, {
				BackgroundColor3 = window._palette.Control,
			})
		end))
	else
		track(window, input.FocusLost:Connect(function(enterPressed: boolean): ()
			setPaletteRole(window, input, "BackgroundColor3", "Control")
			animate(window, input, FAST_TWEEN, { BackgroundColor3 = window._palette.Control })
			invoke(textBox._callback, input.Text, enterPressed)
		end))
	end
	return textBox
end

function TextBoxClass:GetValue(): string
	return self.Input.Text
end

function TextBoxClass:SetValue(value: string, emit: boolean?): ()
	assertCondition(typeof(value) == "string", "text box value must be a string")
	if self._keyCapture then
		local keySuccess: boolean, keyCode: EnumItem? = pcall(function(): EnumItem?
			return Enum.KeyCode[value]
		end)
		assertCondition(keySuccess and keyCode ~= nil and keyCode ~= Enum.KeyCode.Unknown, "text box key must be a valid key name")
		self._currentKey = value
	end
	const changed: boolean = self.Input.Text ~= value
	self.Input.Text = value
	if emit ~= false and changed then invoke(self._callback, value, false) end
end

-- Main
UI.Palette = DEFAULT_PALETTE
UI.PaletteColors = PALETTE_COLORS
UI.Window = WindowClass
UI.Page = PageClass
UI.Section = SectionClass
UI.Label = LabelClass
UI.Toggle = ToggleClass
UI.Slider = SliderClass
UI.Dropdown = DropdownClass
UI.ColorPicker = ColorPickerClass
UI.TextBox = TextBoxClass

return UI
