task.spawn(function()
	repeat task.wait() until shared.VapeFullyLoaded
	if GuiLibrary.ObjectsThatCanBeSaved["Blatant modeToggle"]["Api"].Enabled then return end
	if AutoLeave.Enabled == false then
		AutoLeave.ToggleButton(false)
	end
end)

runcode(function()
	local ChatPos1 = {Value = 500}
	local ChatPosition = {Enabled = true}
	local ChatColor = {Enabled = true}
	local Chat = {Enabled = false}
	Chat = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		Name = "Chat",
		HoverText = "Customizes the chat color, position and text color",
		Function = function(callback)
			if callback then
				if ChatColor.Enabled then
					task.spawn(function()
						repeat
							task.wait(1)
							task.spawn(function()
								game:GetService("Chat"):SetBubbleChatSettings({
									BackgroundColor3 = Color3.fromRGB(255, 0, 255),
									TextColor3 = Color3.fromRGB(255, 255, 255)
								})
							end)
						until (not Chat.Enabled)
					end)
				end
				if ChatPosition.Enabled then
					game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0, ChatPos1.Value))
				else
					game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0, 0, 0, 0))
				end
			end
		end
	})
	ChatPos1 = Chat.CreateSlider({
		Name = "Position",
		Min = 200,
		Max = 700,
		Function = function(val) end, 
		Default = 500
	})
	ChatPosition = Chat.CreateToggle({
		Name = "Position",
		HoverText = "Changes the chat position",
		Function = function() end,
	})
	ChatColor = Chat.CreateToggle({
		Name = "Color",
		HoverText = "Changes the bubble chat color",
		Function = function() end,
	})
end)

runcode(function()
	local HeightIncrease = {Value = 600}
	local Velo = {Value = 5}
	local Boost = {Enabled = true}
	local Speed = {Value = 20}
    local FastAirJump = {Enabled = false}
    FastAirJump = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
        Name = "UltraHighjumpV3",
		HoverText = "Boosts You In The Air",
        Function = function(callback)
           	if callback then
                task.spawn(function()
					repeat
						local taskwait = 0.1
						local taskwait2 = 0.05
						lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, HeightIncrease.Value, 0)
						task.wait(taskwait)
						lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, Velo.Value, 0)
						task.wait(taskwait2)
					until (not FastAirJump.Enabled)
                end)
            end
        end
    })
    HeightIncrease = FastAirJump.CreateSlider({
        Name = "Boost Amount",
        Min = 1,
        Max = 500, 
        Function = function(val) end,
        Default = 500
    })
	Velo = FastAirJump.CreateSlider({
        Name = "Front Boost",
        Min = 1,
        Max = 20, 
        Function = function(val) end,
        Default = 5
    })
	Boost = FastAirJump.CreateToggle({
		Name = "Extra Boost",
		Function = function() end,
	})
end)




runcode(function()
    local FastFlyBoost = {Value = 2}
    local FastFlySlow = {Value = 0.2}
    local FastFlyDelay = {Value = 0}
    local FastFlyEndDelay = {Value = 1.1}
	local FastFly = {Enabled = false}
	FastFly = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		Name = "FastFly",
		HoverText = "Flies fast",
		Function = function(callback)
			if callback then
                _G.FastFly = true
				game.Workspace.Gravity = 0
				while _G.FastFly == true do 
                    task.wait(FastFlySlow.Value)
					local plr = game.Players.LocalPlayer
					plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.HumanoidRootPart.CFrame.lookVector * FastFlyBoost.Value
					task.wait(FastFlyDelay.Value)
					plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.HumanoidRootPart.CFrame.lookVector * FastFlyBoost.Value
					task.wait(FastFlyDelay.Value)
					plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.HumanoidRootPart.CFrame.lookVector * FastFlyBoost.Value
					task.wait(FastFlyDelay.Value)
					plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.HumanoidRootPart.CFrame.lookVector * FastFlyBoost.Value
					task.wait(FastFlyDelay.Value)
					plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.HumanoidRootPart.CFrame.lookVector * FastFlyBoost.Value
					task.wait(FastFlyDelay.Value)
					plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.HumanoidRootPart.CFrame.lookVector * FastFlyBoost.Value
					task.wait(FastFlyDelay.Value)
					plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.HumanoidRootPart.CFrame.lookVector * FastFlyBoost.Value
					task.wait(FastFlyEndDelay.Value)
				end
            else
                _G.FastFly = false
                game.Workspace.Gravity = 192
            end
        end
    })
    FastFlyBoost = FastFly.CreateSlider({
		Name = "Boost",
		Min = 1,
		Max = 2,
		Function = function(val) end, 
		Default = 2
	})
    FastFlySlow = FastFly.CreateSlider({
		Name = "Slowdown",
		Min = 0.1,
		Max = 0.2,
		Function = function(val) end, 
		Default = 0.2
	})
    FastFlyDelay = FastFly.CreateSlider({
		Name = "Boost Delay",
		Min = 0,
		Max = 0.1,
		Function = function(val) end, 
		Default = 0
	})
    FastFlyEndDelay = FastFly.CreateSlider({
		Name = "End Slowdown",
		Min = 0,
		Max = 1.1,
		Function = function(val) end, 
		Default = 1.1
	})
end)
																
																
runcode(function()
	local tppos
	bedwars["ClientHandler"]:WaitFor("EntityDamageEvent"):andThen(function(p6)
		connectionstodisconnect[#connectionstodisconnect + 1] = p6:Connect(function(p7)
			if (p7.knockbackMultiplier == nil or p7.knockbackMultiplier.disabled == nil) and p7.entityInstance == lplr.Character then 
				if entity.isAlive and tppos then 
					entity.character.HumanoidRootPart.CFrame = CFrame.new(tppos)
					tppos = nil
					local bodyvelo = Instance.new("BodyVelocity")
					bodyvelo.MaxForce = Vector3.new(9e9, 0, 9e9)
					bodyvelo.Velocity = Vector3.zero
					bodyvelo.Parent = entity.character.HumanoidRootPart
					task.wait(0.75)
					bodyvelo:Destroy()
				end
			end
		end)
	end)
	local damagetpmod = {["Enabled"] = false}
	damagetpmod = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "DamageTP",
		["Function"] = function(callback)
			if callback then
				local mousepos = game.Players.LocalPlayer:GetMouse().UnitRay
				local rayparams = RaycastParams.new()
				rayparams.FilterDescendantsInstances = {workspace.Map, workspace:FindFirstChild("SpectatorPlatform")}
				rayparams.FilterType = Enum.RaycastFilterType.Whitelist
				local ray = workspace:Raycast(mousepos.Origin, mousepos.Direction * 40000, rayparams)
				if ray then tppos = ray.Position createwarning("DamageTP", "Set TP Position\nTake damage to teleport.", 3) end
				damagetpmod["ToggleButton"](false)
			end
		end
	})
end)
																													
																	local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChatTag = Players.LocalPlayer.Name
local ChatTag = {}
ChatTag[Players.LocalPlayer.Name] =
    {
        TagText = "Pearlware Private",
        TagColor = Color3.new(255, 0, 10), -- color
    }
    local oldchanneltab
    local oldchannelfunc
    local oldchanneltabs = {}

for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
    if
        v.Function
        and #debug.getupvalues(v.Function) > 0
        and type(debug.getupvalues(v.Function)[1]) == "table"
        and getmetatable(debug.getupvalues(v.Function)[1])
        and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
    then
        oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
        oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
        getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
            local tab = oldchannelfunc(Self, Name)
            if tab and tab.AddMessageToChannel then
                local addmessage = tab.AddMessageToChannel
                if oldchanneltabs[tab] == nil then
                    oldchanneltabs[tab] = tab.AddMessageToChannel
                end
                tab.AddMessageToChannel = function(Self2, MessageData)
                    if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
                        if ChatTag[Players[MessageData.FromSpeaker].Name] then
                            MessageData.ExtraData = {
                                NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(255,0,10)
                                    or Players[MessageData.FromSpeaker].TeamColor.Color,
                                Tags = {
                                    table.unpack(MessageData.ExtraData.Tags),
                                    {
                                        TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
                                        TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
                                    },
                                },
                            }
                        end
                    end
                    return addmessage(Self2, MessageData)
                end
            end
            return tab
        end
    end
end
																	
																	
local pearlware = {["Enabled"] = false}
    pearlware = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "SkyTP",
        ["HoverText"] = "Temporarily Puts you in the skybox for atleast 5 seconds. Use with balloon for no anticheat. ",
            ["Function"] = function(callback)
                if callback then
                      spawn(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").SpectatorPlatform.floor.CFrame
                end)
            end
        end
    })																

																	

local Bed TP = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    Name = "BedTp",
    Function = function(callback) 
        if callback then
            local ClosestBedMag = math.huge
local ClosestBed = false
local lplr = game.Players.LocalPlayer
function GetNearestBedToPosition()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "bed" and v:FindFirstChild("Covers") and v.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
            if (lplr.Character.HumanoidRootPart.Position - v.Position).Magnitude < ClosestBedMag then
                ClosestBedMag = (lplr.Character.HumanoidRootPart.Position - v.Position).Magnitude
                ClosestBed = v
            end
       end
    end
    return ClosestBed
end
local bed = GetNearestBedToPosition().Position
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1000,3009,3900)
task.wait(1)
game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(bed) + Vector3.new(0,5,0)

        end
    end,
    Default = false,
    HoverText = "might not work the first time"
})																	

																																															
runcode(function()
    local InfJump = {["Enabled"] = false}
        InfJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "InfiniteJump",
        ["Function"] = function(callback)
            if callback then
                local InfiniteJumpEnabled = true
                game:GetService("UserInputService").JumpRequest:connect(function()
                    if InfiniteJumpEnabled then
                        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
                    end
                end)
            end
        end,

    })
end)

																	
	


runcode(function()
	local tppos2
	local deathtpmod = {["Enabled"] = false}
	connectionstodisconnect[#connectionstodisconnect + 1] = lplr:GetAttributeChangedSignal("LastTeleported"):Connect(function(char)
		if tppos2 then 	
			task.spawn(function()
				task.wait(0.1)
				local root = entityLibrary.isAlive and entityLibrary.character.Humanoid.Health > 0 and entityLibrary.character.HumanoidRootPart
				if root and tppos2 then 
					local check = (lplr:GetAttribute("LastTeleported") - lplr:GetAttribute("SpawnTime")) < 1
					RunLoops:BindToHeartbeat("TPRedirection", 1, function(dt)
						if root and tppos2 then 
							local dist = ((check and 700 or 1200) * dt)
							if (tppos2 - root.CFrame.p).Magnitude > dist then
								root.CFrame = root.CFrame + (tppos2 - root.CFrame.p).Unit * dist
								root.Velocity = (tppos2 - root.CFrame.p).Unit * 20
							else
								root.CFrame = root.CFrame + (tppos2 - root.CFrame.p)
							end
						end
					end)
					RunLoops:BindToStepped("TPRedirection", 1, function()
						if entityLibrary.isAlive then 
							for i,v in pairs(lplr.Character:GetChildren()) do 
								if v:IsA("BasePart") then v.CanCollide = false end
							end
						end
					end)
					repeat
						task.wait()
					until tppos2 == nil or (tppos2 - root.CFrame.p).Magnitude < 1
					RunLoops:UnbindFromHeartbeat("TPRedirection")
					RunLoops:UnbindFromStepped("TPRedirection")
					createwarning("TPRedirection", "Teleported.", 5)
					tppos2 = nil
				end
			end)
		end
	end)
	deathtpmod = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		Name = "TPRedirectionv2",
		Function = function(callback)
			if callback then
				local mousepos = lplr:GetMouse().UnitRay
				local rayparams = RaycastParams.new()
				rayparams.FilterDescendantsInstances = {workspace.Map, workspace:FindFirstChild("SpectatorPlatform")}
				rayparams.FilterType = Enum.RaycastFilterType.Whitelist
				local ray = workspace:Raycast(mousepos.Origin, mousepos.Direction * 10000, rayparams)
				if ray then 
					tppos2 = ray.Position
					game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("ResetCharacter"):FireServer()
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					local warning = createwarning("TPRedirection", "Set TP Position", 3)
				end
				deathtpmod.ToggleButton(false)
			end
		end
	})
end)		




local playerlist = {Enabled = false}
            playerlist = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
                ["Name"] = "Old Leaderboard",
                ["Function"] = function(callback)
                    if callback then
                        task.spawn(function()
                            repeat task.wait() until game:IsLoaded()
                            game.StarterGui:SetCoreGuiEnabled("PlayerList",  true)
                        end)
                        else
                            game.StarterGui:SetCoreGuiEnabled("PlayerList",  false)
                    end
                end,

            })




  runcode(function()
    local semiACEnabled = false
    local semiACButton = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
        ["Name"] = "Semi AC Disabler",
        ["HoverText"] = "Disables semi-anti-cheat by killing your root part temporarily",
        ["Function"] = function(callback)
            semiACEnabled = callback
            if semiACEnabled then
                local character = game:GetService("Players").LocalPlayer.Character
                if character then
                    local primaryPart = character.PrimaryPart
                    if primaryPart then
                        primaryPart.Parent = nil
                        character:MoveTo(character:GetPivot().Position)
                        wait(0.01)
                        primaryPart.Parent = character
                    else
                        createwarning("pearlware", "Your characters RootPart has been niggerfied", 6.9)
                    end
                else
                    createwarning("pearlware", "Your character turned into a nigger so we killed em", 6.9)
                end
            else
                createwarning("pearlware", "You need to reset to disable Semi-AC Disabler", 6.9)
            end
        end
    })
end)



local playa = {["Enabled"] = false}
playa = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Player Logs",
    ["Function"] = function(callback)
        if callback then
            local function createwarning(title, text, delay)
                local suc, res = pcall(function()
                    local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
                    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
                    return frame
                end)
                return (suc and res)
            end

            local function playerJoined(player)
                createwarning("Pearlware", player.Name .. " has joined the game. Be careful. People can record/ban you.", 5)
            end

            local function playerLeft(player)
                createwarning("Pearlware", player.Name .. " has left the game, probably ragequitted or couldn't handle Pearlware.", 5)
            end

            game.Players.PlayerAdded:Connect(playerJoined)
            game.Players.PlayerRemoving:Connect(playerLeft)
        else
            game.Players.PlayerAdded:Disconnect()
            game.Players.PlayerRemoving:Disconnect()
        end
    end
})


local Hack = {["Enabled"] = false}
Hack = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
    ["Name"] = "Hacker Detector",
    ["HoverText"] = "A bit buggy but still works",
    ["Function"] = function(callback)
        if callback then
            local success, result = pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
            end)
            if success then
                local function createwarning(title, text, delay)
                    local suc, res = pcall(function()
                        local frame = GuiLibrary.CreateNotification(title, text, delay, "assets/WarningNotification.png")
                        frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
                        return frame
                    end)
                    return (suc and res)
                end
                createwarning("Pearlware", "Hacker detected!", 5)
            else
                print("No hackers found.")
            end
        end
    end
})



local fpsToggle = {["Enabled"] = false}
fpsToggle = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "FPS Display",
    ["Function"] = function(callback)
        if callback then
            local fpsLabel = Drawing.new("Text")
            fpsLabel.Position = Vector2.new((workspace.CurrentCamera.ViewportSize.X - 100), 5)
            fpsLabel.Size = 20
            fpsLabel.Color = Color3.fromRGB(255, 255, 255)
            fpsLabel.Outline = true
            fpsLabel.Center = true
            fpsLabel.Visible = true
            fpsLabel.Text = "FPS: "
            local lastTick = tick()
            local function updateFPS()
                local currentTick = tick()
                fpsLabel.Text = "FPS: " .. math.floor(1 / (currentTick - lastTick))
                lastTick = currentTick
            end
            fpsLabel.Visible = true
            game:GetService("RunService").RenderStepped:Connect(updateFPS)
        else
            fpsLabel:Remove()
            game:GetService("RunService").RenderStepped:Disconnect()
        end
    end
})


local disconnectEnabled = false

local disconnectToggle = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Do not press",
    ["Function"] = function(callback)
        if callback then
            disconnectEnabled = true
        else
            disconnectEnabled = false
        end
    end
})

disconnectToggle:AddToggle("Enabled")

game.Players.PlayerRemoving:Connect(function(player)
    if player == game.Players.LocalPlayer then
        if disconnectEnabled then
            game:GetService("TeleportService"):Teleport(game.PlaceId, player)
        end
    end
end)



fasterheatseekerreal = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
["Name"] = "HeatSeeker V2.5",
["Function"] = function(sin)
if math.sin then
task.spawn(function()
repeat
createwarning("Pearlware", "Boosted weeee", 2)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
wait(0.05)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 26
wait(0.1)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 35
wait(0.2)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 11
wait(3)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
wait(0.4)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 26
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 35
wait(0.3)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
wait(0.5)
until (not math.sin)
end)
else
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
end
end
})


local EmeraldGEN = {["Enabled"] = false}
    EmeraldGEN = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Emerald Gen Tp",
        ["HoverText"] = "only takes if there are actual emeralds in the location if it doesnt give you anything then try again later",
            ["Function"] = function(callback)
                if callback then
                      spawn(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ItemDrops.emerald.CFrame
                end)
            end
        end
    })



local DimGen = {["Enabled"] = false}
    DimGen = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Diamond Gen TP",
        ["HoverText"] = "may take a few times",
            ["Function"] = function(callback)
                if callback then
                      spawn(function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ItemDrops.diamond.CFrame
                end)
            end
        end
    }) 


runcode(function()
	local funnyfly = {["Enabled"] = false}
	local funnyflyhigh = {["Enabled"] = false}
	local flyacprogressbar
	local flyacprogressbarframe
	local flyacprogressbarframe2
	local flyacprogressbartext
	local bodyvelo
	funnyfly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FunnyFly",
		["Function"] = function(callback)
			if callback then 
				local starty
				local starttick = tick()
				task.spawn(function()
					local timesdone = 0
					if GuiLibrary["ObjectsThatCanBeSaved"]["SpeedModeDropdown"]["Api"]["Value"] == "CFrame" or GuiLibrary["ObjectsThatCanBeSaved"]["SpeedModeDropdown"]["Api"]["Value"] == "Heatseeker" then
						local doboost = true
						repeat
							timesdone = timesdone + 1
							if entity.isAlive then
								local root = entity.character.HumanoidRootPart
								if starty == nil then 
									starty = root.Position.Y
								end
								if not bodyvelo then 
									bodyvelo = Instance.new("BodyVelocity")
									bodyvelo.MaxForce = Vector3.new(0, 1000000, 0)
									bodyvelo.Parent = root
									bodyvelo.Velocity = Vector3.zero
								else
									bodyvelo.Parent = root
								end
								for i = 1, 15 do 
									task.wait(0.01)
									if (not funnyfly["Enabled"]) then break end
									bodyvelo.Velocity = Vector3.new(0, i * (funnyflyhigh["Enabled"] and 10 or 10), 0)
								end
								if (not isnetworkowner(root)) then
									break 
								end
							else
								break
							end
						until (not funnyfly["Enabled"])
					else
						local warning = createwarning("FunnyFly", "FunnyFly only works with\nspeed on CFrame mode", 5)
						pcall(function()
							warning:GetChildren()[5].Position = UDim2.new(0, 46, 0, 38)
						end)
					end
					if funnyfly["Enabled"] then 
						funnyfly["ToggleButton"](false)
					end
				end)
			else
				if bodyvelo then 
					bodyvelo:Destroy()
					bodyvelo = nil
				end
			end
		end
	})
	funnyflyhigh = funnyfly.CreateToggle({
		["Name"] = "High",
		["Function"] = function() end
	})
end)


local DamageIndicator = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "DamageIndicator",
    ["HoverText"] = "No PearlWare?",
    ["Function"] = function(callback)
        if callback then
            spawn(function()
                local originalCreate = bedwars["DamageIndicator"].Create
                bedwars["DamageIndicator"].Create = function(moonalicous, niggaplease, ...)
                    niggaplease.Parent.Text = "No PearlWare?"
                    return originalCreate(moonalicous, niggaplease, ...)
                end
            end)
        end
    end
})



local GuiLibrary = require(game:GetService("ReplicatedStorage"):WaitForChild("GuiLibrary"))

local isZoomedOut = false
local maxDistance = 500

local zoomToggle = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateToggle({
    ["Name"] = "ZoomOut",
    ["Function"] = function(enabled)
        isZoomedOut = enabled
        if enabled then
            workspace.CurrentCamera.MaxZoomDistance = maxDistance
        else
            workspace.CurrentCamera.MaxZoomDistance = 0
        end
    end
})
