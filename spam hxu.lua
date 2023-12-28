-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local ID = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local FrameCorner = Instance.new("UICorner")
local FrameStroke = Instance.new("UIStroke")
local UICorner1 = Instance.new("UICorner")
local UIStroke1 = Instance.new("UIStroke")
local ToggleButton = Instance.new("TextButton")
local cuf = Instance.new("UICorner")



--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Frame.BorderColor3 = Color3.fromRGB(16, 16, 16)
Frame.Position = UDim2.new(0.326547235, 0, 0.442340851, 0)
Frame.Size = UDim2.new(0.4, 0, 0.4, 0)
Frame.Active = true
Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(62, 62, 62)
UIStroke.Parent = Frame


ID.Name = "ID"
ID.Parent = Frame
ID.BackgroundColor3 = Color3.new(0, 0, 0)
ID.BorderColor3 = Color3.new(0.333333, 0, 0)
ID.BorderSizePixel = 2
ID.Position = UDim2.new(0.20, 0, 0.8, -65)
ID.Size = UDim2.new(0, 222, 0, 40)
ID.Font = Enum.Font.SourceSansBold
ID.Text = "Type Massage"
ID.TextColor3 = Color3.new(1, 1, 1)
ID.TextScaled = true
ID.TextSize = 8.000
ID.TextStrokeColor3 = Color3.new(1, 1, 1)
ID.TextWrapped = true


FrameCorner.Name = "FrameCorner"
	FrameCorner.Parent = ID

	FrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	FrameStroke.Color = Color3.fromRGB(135, 135, 135)
	FrameStroke.Name = "FrameStroke"
	FrameStroke.Parent = ID


Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame_2.BorderColor3 = Color3.fromRGB(16, 16, 16)
Frame_2.Size = UDim2.new(1, 0, 0.26777932, 0)

UICorner1.CornerRadius = UDim.new(0, 4)
UICorner1.Parent = Frame_2

UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke1.Color = Color3.fromRGB(62, 62, 62)
UIStroke1.Parent = Frame_2

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1.00234735, 0, 1.08253634, 0)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = "Spam Message | By freedev"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000




-- Scripts:

local function changeColor()
    while true do
        TextLabel.TextColor3 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        TextLabel.TextStrokeColor3 = TextLabel.TextColor3
        wait(3)
    end
end

coroutine.wrap(changeColor)()


cuf.CornerRadius = UDim.new(0, 4)
cuf.Parent = ToggleButton


ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = Frame
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.20, 0, 0.8, -10) 
ToggleButton.Size = UDim2.new(0, 222, 0, 30)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "Spam Massage"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14.000

local isToggled = false
local spamTimer = 1

local function sendSpamMessage()
    while isToggled do
        local args = {
            [1] = ID.Text, -- Use the content of the TextBox with ID
            [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(3)
    end
end

local function toggleButton()
    ToggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        if isToggled then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            spamTimer = coroutine.create(sendSpamMessage)
            coroutine.resume(spamTimer)
        else
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            if spamTimer then
                coroutine.yield(spamTimer)
            end
        end
    end)
end

toggleButton()

