local _, Addon = ...
local L = Addon.Locals
if GetLocale() ~= 'deDE' then return end
	
L.AddWaypoint = 'Wegpunkt hinzuf\195\188gen'
L.AlertUpgrades = 'Alarm f\195\188r Upgrades'
L.AlertUpgradesTip = 'Wenn deaktiviert, wird die Upgrades Alarm-Meldung nicht im Kampf gezeigt, aber Upgrades werden immer noch mit einem Symbol gekennzeichnet (|TInterface\\GossipFrame\\AvailableQuestIcon:0:0:-1:-2|t).'
L.AskForfeit = 'Keine Upgrades verf\195\188gbar. Kampf beenden?'
L.AvailableBreeds = '\nVerf\195\188gbare Rassen:'
L.PromptForfeit = 'Aufforderung verwirkt'
L.PromptForfeitTip = 'Wenn aktiviert, wirst Du aufgefordert, einen Kampf zu verlieren, wenn keine Upgrades verf\195\188gbar sind.'
L.BattlePets = 'Kampf Haustiere'
L.Breed = 'Rasse'
L.BreedExplanation = 'Legt fest, wie gewonnene Statistiken je Level verteilt werden.'
L.CapturedPets = 'Gefangene Haustiere'
L.CommonSearches = 'H\195\164ufige Suchbegriffe'
L.FilterPets = 'Haustiere Filtern'
L.ShowJournal = 'Im Haustierf\195\188hrer anzeigen'
L.Maximized = 'Maximiert'
L.NoneCollected = 'Nicht gesammelt'
L.ShowPets = 'Kampfhaustiere anzeigen'
L.ShowStables = 'Stallmeister anzeigen'
L.StableTip = '|cffffd200Hier k\195\182nnen Haustiere gegen eine|nkleine Geb\195\188hr geheilt werden.|r'
L.UpgradeAlert = 'Besseres Kampfhaustier entdeckt!'
L.ZoneTracker = 'Zonen Tracker'

L.FAQ = {
	'Wie filter ich die Kartenanzeige f\195\188r bestimmte Haustiere?',
	'Es ist ein Filter oben rechts auf der Weltkarte. Schau Dir das Tutorial f\195\188r Informationen und allgemeine Beispiele an.',

	'Wie schaltet man den Zonen Tracker ein oder aus?',
	'Rechts klick auf deine Quest-Ziel \195\188bersicht und Kampfhaustiere EIN oder AUS schalten. Alternativ kannst du auch das Haustiermen\195\188 aufrufen und unten rechts die Option EIN oder AUS schalten.',

	'Wie zeige ich bereits gefangene Haustiere im Zonen Tracker an?',
	'Rechts klick auf die Quest-Ziel \195\188bersicht und aktiviere Gefangene Haustiere',

	'Wie deaktiviere ich die Kampf Upgrade Alarme?',
	'Gehe in den Login Bildschirm und deaktiviere in der Addon Liste PetTracker Upgrades.',

	'Wie kann ich mir das Tutorial noch mal ansehen?',
	'Klicke auf den Knopf rechts von Dir.'
}

L.Tutorial = {
[[Willkommen! Du benutzt jetzt |cffffd200PetTracker|r, by |cffffd200Jaliborc|r.

Dieses Tutorial hilft Dir, schnell mit dem Addon zurecht zu kommen, so das du Dich schnell wieder dem wichtigen widmen kannst: Haustiere zu fassen ... aehm ... ein zu fangen!]],

[[PetTracker hilft Dir den Fortschritt in deiner Zone an zu zeigen.

Der |cffffd200Zonen Tracker|r zeigt welche Haustiere Dir fehlen, und die Seltenheit der gefangenen Haustiere.]],

[[Um den Zonen Tracker zu verbergen, |cffffd200rechts klick|r auf die Quest-Ziel Uebersicht. Dann deaktiviere die |cffffd200Kampfhaustier anzeige|r.

Die Anzeige |cffffd200Gefangene Haustiere|r kann auch deaktiviert werden, um nur die fehlenden Haustiere anzeigen zu lassen.]],

[[Jetzt schauen wir uns an was PetTracker auf der Weltkarte fuer uns machen kann. Bitte |cffffd200oeffne|r die Weltkarte um fortzufahren.]],

[[PetTracker zeigt die moeglichen Qullen aller Haustiere auf der Weltkarte an, von gefangenen Standorten bis zu ungefangenen und Stallmeister.

Um die Standorte zu deaktivieren, oeffne das |cffffd200Kartenoptionen|r Dropdown Menue, und deaktiviere |cffffd200Kampfhaustiere anzeigen|r.]],

[[Die Anzeige der Haustiere kann man auch Filtern in dem man in die Suchanzeige etwas eintraegt. Hier ein paar Beispiele:

• |cffffd200Katzen|r fuer Katzen.
• |cffffd200Fehlt|r fuer Haustiere die fehlen.
• |cffffd200Aqua|r fuer Wasser Haustiere.
• |cffffd200Quest|r fuer Haustiere, erhaeltlich durch Quests.
• |cffffd200Wald|r fuer Haustiere innerhalb eines Waldes.]],

[[Die Suche kann kombiniert werden um noch praezisere Ergebnisse zu bekommen:

• |cffffd200Aqua Katze|r fuer... richtig, Wasser Katzen!
• |cffffd200nicht Katze|r fuer alles was nicht eine Katze ist.
• |cffffd200selten|r fuer Haustiere, von denen man ungewoehnliche oder bessere im besitz hat.
• |cffffd200Wald oder Aqua|r fuer Haustiere im Wald oder Wasser.|r]],

[[Das war es Leute! Denkt dran, das Tutorial kann zu jeder Zeit unter den |cffffd200Interface Optionen|r, angeschaut werden.]]
}