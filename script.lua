local content = get("story-content")
local choice1 = get("choice-1")
local choice2 = get("choice-2")

local storyStages = {
	["You just moved into a new house after the death of your mother under mysterious circumstances..."] = {
		content = "You just moved into a new house after the death of your mother under mysterious circumstances...",
		choices = { "Explore the house", "Go to the park" }
	},
	["Explore the house"] = {
		content = "You hear strange noises and see flickering lights.",
		choices = { "Investigate the basement", "Check the attic" }
	},
	["Go to the park"] = {
		content = "You meet a new friend who seems to know a lot about your house.",
		choices = { "Talk to the friend", "Return home" }
	},
	["Investigate the basement"] = {
		content = "You find an old diary with dark secrets.",
		choices = { "Read the diary", "Ignore it and leave" }
	},
	["Check the attic"] = {
		content = "You find strange symbols and old photographs.",
		choices = { "Inspect the symbols", "Look at the photographs" }
	},
	["Talk to the friend"] = {
		content = "The friend reveals that your house has a dark past involving a cult.",
		choices = { "Learn more about the cult", "Invite the friend to your house" }
	},
	["Return home"] = {
		content = "You feel a cold breeze and hear whispers.",
		choices = { "Investigate the basement", "Check the attic" }
	},
	["Read the diary"] = {
		content = "The diary reveals that the cult plans to destroy the world through sacrifices.",
		choices = { "Tell your friends", "Hide the diary" }
	},
	["Ignore it and leave"] = {
		content = "The noises grow louder, and the atmosphere becomes more oppressive.",
		choices = { "Investigate the basement", "Check the attic" }
	},
	["Inspect the symbols"] = {
		content = "The symbols seem to be part of a ritual.",
		choices = { "Perform the ritual", "Destroy the symbols" }
	},
	["Look at the photographs"] = {
		content = "The photographs show your mother with the cult members.",
		choices = { "Confront the cult", "Investigate further" }
	},
	["Learn more about the cult"] = {
		content = "You discover the cult plans to destroy the world through sacrifices.",
		choices = { "Tell your friends", "Investigate the cult's hideout" }
	},
	["Invite the friend to your house"] = {
		content = "Your friend helps you uncover more secrets about the cult.",
		choices = { "Confront the cult", "Perform a protection ritual" }
	},
	["Tell your friends"] = {
		content = "Your friends agree to help you stop the cult.",
		choices = { "Plan an attack on the cult", "Investigate the cult's hideout" }
	},
	["Hide the diary"] = {
		content = "The cult finds out about your knowledge and comes after you.",
		choices = { "Defend yourself", "Escape" }
	},
	["Perform the ritual"] = {
		content = "The ritual backfires and you accidentally summon dark forces.",
		choices = { "Fight the dark forces", "Seek help from friends" }
	},
	["Destroy the symbols"] = {
		content = "The cult realizes their symbols are destroyed and come after you.",
		choices = { "Defend yourself", "Escape" }
	},
	["Confront the cult"] = {
		content = "The cult overpowers you, but you manage to escape with crucial information.",
		choices = { "Seek help from friends", "Go into hiding" }
	},
	["Investigate further"] = {
		content = "You find evidence that your mother was trying to stop the cult.",
		choices = { "Continue her work", "Seek help from friends" }
	},
	["Plan an attack on the cult"] = {
		content = "You and your friends plan a risky attack on the cult's hideout.",
		choices = { "Execute the plan", "Abandon the plan" }
	},
	["Investigate the cult's hideout"] = {
		content = "You discover the cult's hideout is heavily guarded.",
		choices = { "Sneak in", "Go back and plan" }
	},
	["Defend yourself"] = {
		content = "You manage to fend off the cult members but at a great cost.",
		choices = { "Seek medical help", "Go into hiding" }
	},
	["Escape"] = {
		content = "You narrowly escape the cult's clutches.",
		choices = { "Seek help from friends", "Plan your next move" }
	},
	["Fight the dark forces"] = {
		content = "You fight bravely but realize you need help.",
		choices = { "Seek help from friends", "Perform a banishing ritual" }
	},
	["Seek help from friends"] = {
		content = "Your friends help you devise a plan to stop the cult.",
		choices = { "Plan an attack on the cult", "Perform a protection ritual" }
	},
	["Go into hiding"] = {
		content = "You go into hiding to gather more information.",
		choices = { "Seek help from friends", "Plan your next move" }
	},
	["Continue her work"] = {
		content = "You vow to stop the cult and continue your mother's work.",
		choices = { "Plan an attack on the cult", "Investigate the cult's hideout" }
	},
	["Execute the plan"] = {
		content = "You and your friends manage to infiltrate the cult's hideout.",
		choices = { "Destroy the cult", "Rescue captives" }
	},
	["Abandon the plan"] = {
		content = "You decide the plan is too risky and seek another way.",
		choices = { "Investigate further", "Seek help from friends" }
	},
	["Sneak in"] = {
		content = "You manage to sneak into the hideout undetected.",
		choices = { "Destroy the cult", "Rescue captives" }
	},
	["Go back and plan"] = {
		content = "You return to gather more information and plan better.",
		choices = { "Plan an attack on the cult", "Seek help from friends" }
	},
	["Seek medical help"] = {
		content = "You recover and prepare for the final showdown.",
		choices = { "Plan an attack on the cult", "Seek help from friends" }
	},
	["Plan your next move"] = {
		content = "You carefully plan your next move against the cult.",
		choices = { "Plan an attack on the cult", "Investigate further" }
	},
	["Perform a banishing ritual"] = {
		content = "The banishing ritual works, but you are left weakened.",
		choices = { "Seek medical help", "Plan your next move" }
	},
	["Perform a protection ritual"] = {
		content = "The protection ritual shields you from the cult's influence temporarily.",
		choices = { "Plan an attack on the cult", "Investigate the cult's hideout" }
	},
	["Destroy the cult"] = {
		content = "You manage to destroy the cult at the cost of your own life.",
		choices = { "The End" }
	},
	["Rescue captives"] = {
		content = "You rescue the captives and expose the cult.",
		choices = { "The End" }
	},
	["The End"] = {
		content = "You have reached the end of this path. Restart to explore other outcomes.",
		choices = { "Restart", "" }
	},
	["Restart"] = {
		content = "You just moved into a new house after the death of your mother under mysterious circumstances...",
		choices = { "Explore the house", "Go to the park" }
	}
}

function updateStory(choiceContent)
	local stage = storyStages[choiceContent]

	content.set_content(stage.content)
	choice1.set_content(stage.choices[1])
	choice2.set_content(stage.choices[2])
end

choice1.on_click(function()
	local choiceContent = choice1.get_content()
	updateStory(choiceContent)
end)

choice2.on_click(function()
	local choiceContent = choice2.get_content()
	updateStory(choiceContent)
end)