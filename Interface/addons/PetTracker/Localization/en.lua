local _, Addon = ...
local L = {}

L.AddWaypoint = 'Add Waypoint'
L.AlertUpgrades = 'Alert for Upgrades'
L.AlertUpgradesTip = 'If disabled, the wild upgrades alert box will not be shown in combat, but upgrades will still be marked with a symbol (|TInterface\\GossipFrame\\AvailableQuestIcon:0:0:-1:-2|t).'
L.AskForfeit = 'No upgrades are available. Quit battle?'
L.AvailableBreeds = '\nAvailable Breeds:'
L.PromptForfeit = 'Prompt for Forfeit'
L.PromptForfeitTip = 'If enabled, you will be prompted to forfeit a battle when no upgrades are available.'
L.BattlePets = 'Battle Pets'
L.Breed = 'Breed'
L.BreedExplanation = 'Determines how stats gained at each level are distributed.'
L.CapturedPets = 'Captured Pets'
L.CommonSearches = 'Common Searches'
L.FilterPets = 'Filter Pets'
L.ShowJournal = 'Show in Journal'
L.Maximized = 'Maximized'
L.NoneCollected = 'None Collected'
L.ShowPets = 'Show Battle Pets'
L.ShowStables = 'Show Stables'
L.StableTip = '|cffffd200Come here to heal your|npets for a small fee.|r'
L.UpgradeAlert = 'Wild upgrades have appeared!'
L.ZoneTracker = 'Zone Tracker'

L.FAQ = {
	'How do I make the map display specific pets only?',
	'There is a filter box at the top right corner of the world map. See the tutorial for more information and common examples.',

	'How do I toggle the Zone Tracker again?',
	'Right-Click on the objectives header and toggle Battle Pets. Alternatively, open the Pet Journal and click Zone Tracker at the bottom right corner.',

	'How do I display the pets I have captured in the Zone Tracker?',
	'Right-Click on the objectives header and enable Missing Pets',

	'How do I disable the battle upgrade alerts?',
	'Go to the login screen and disable PetTracker Upgrades in the addon list.',

	'How can I see the tutorial again?',
	'Click on the button at your right.'
}

L.Tutorial = {
[[Welcome! You are now using |cffffd200PetTracker|r, by |cffffd200Jaliborc|r.

This short tutorial will help you to quickly get started with the addon, so that you can get back to do what is trully important: to catch... ahem... capture them all!]],

[[PetTracker will help you to monitor your progress in the zone you are in.

The |cffffd200Zone Tracker|r displays which pets you are missing, and the rarity of the ones you have captured.]],

[[To hide the zone tracker, |cffffd200right-click|r on the objectives list header. Then, disable |cffffd200Display Battle Pets|r.

You can also disable |cffffd200Display Captured Pets|r to show only the pets you are missing.]],

[[Now we will see what PetTracker can do for your World Map. Please |cffffd200open|r it to get started.]],

[[PetTracker displays the possible sources of all pets on the world map, from capture locations to vendors.

To hide these locations, open the |cffffd200Map Options|r dropdown, and disable |cffffd200Show Battle Pets|r.]],

[[You can also filter which pets are displayed by typing on the highlighted search box. Here are some examples:

• |cffffd200Cat|r for cats.
• |cffffd200Missing|r for species you do not own.
• |cffffd200Aquatic|r for aquatic species.
• |cffffd200Quest|r for species obtainable through questing.
• |cffffd200Forest|r for species that inhabit forests.]],

[[You can further combine searches for even more precise results:

• |cffffd200Aquatic Cat|r for... you got it, aquatic cats!
• |cffffd200Not Cat|r for everything that is not a cat.
• |cffffd200> Common|r for species of which you have an uncommon or better pet.
• |cffffd200Forest or Aquatic|r for species that inhabit forests or are aquatic.|r]],

[[That's it folks! Remember you can always watch this tutorial again at the |cffffd200Interface Options|r, under the |cffffd200Addons|r category.]]
}

Addon.Locals = L