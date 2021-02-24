-- About: Just testing out Vim out with Roblox
--[[
    Tools: Rojo, Selene
    Very cool!
]]

-- Creating a part that will do fun stuff!

-- Services Needed:
local TweenService = game:GetService("TweenService")

-- //Variables\\

-- TweenInfo
local tweenInfo = TweenInfo.new(1)

-- //Functions\\

local function createPart(parentOfPart)
    local newPart = Instance.new("Part")
    newPart.Name = "Generated Part"
    newPart.Parent = parentOfPart or workspace

    return newPart
end


local function partGoMove(part, numberOfTimeToChangeCFrame)
    if not part then return end
    numberOfTimeToChangeCFrame = numberOfTimeToChangeCFrame or 10

    for _ = 0, numberOfTimeToChangeCFrame do
        local randomYPosition = math.random(5, 12)

        local randomRotation = CFrame.Angles(math.random(1, 10), math.random(1, 10), math.random(1, 10))

        local partTweeningProperty = {
            CFrame = CFrame.new(Vector3.new(0, randomYPosition, 0)) * randomRotation
        }

        TweenService:Create(part, tweenInfo, partTweeningProperty):Play()
        
        wait(1)
    end
end

local newPart = createPart(workspace)
newPart.Anchored = true
newPart.Position = Vector3.new(0, 5, 0)

partGoMove(newPart, 10)
