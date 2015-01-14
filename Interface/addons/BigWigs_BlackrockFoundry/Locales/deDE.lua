local L = BigWigs:NewBossLocale("Gruul", "deDE")
if not L then return end
if L then

end

L = BigWigs:NewBossLocale("Oregorger", "deDE")
if L then
	L.berserk_trigger = "Der Hunger hat Erzfresser in den Wahnsinn getrieben!"

	L.shard_explosion = "Explosiver Splitter Explosion"
	L.shard_explosion_desc = "Separate hervorgehobene Leiste f�r die Explosion."

	L.hunger_drive_power = "%dx %s - %d Erz �brig!"
end

L = BigWigs:NewBossLocale("The Blast Furnace", "deDE")
if L then
	L.heat_increased_message = "Hitze erh�ht! Flammenzunge alle %s Sek."
end

L = BigWigs:NewBossLocale("Hans'gar and Franzok", "deDE")
if L then

end

L = BigWigs:NewBossLocale("Flamebender Ka'graz", "deDE")
if L then
	L.molten_torrent_self = "Geschmolzene Sturzflut auf Dir"
	L.molten_torrent_self_desc = "Spezieller Countdown f�r die Geschmolzene Sturzflut auf Dir."
	L.molten_torrent_self_bar = "Du explodierst!"
end

L = BigWigs:NewBossLocale("Kromog", "deDE")
if L then

end

L = BigWigs:NewBossLocale("Beastlord Darmac", "deDE")
if L then
	L.next_mount = "Aufsitzen bald!"

	L.custom_off_pinned_marker = "Festnageln markieren"
	L.custom_off_pinned_marker_desc = "Markiert die festnagelnden Speere mit {rt8}{rt7}{rt6}{rt5}{rt4}, ben�tigt Leiter oder Assistent.\n|cFFFF0000Um Konflikte beim Markieren zu vermeiden, sollte lediglich 1 Person im Raid diese Option aktivieren.|r\n|cFFADFF2FTIPP: Wenn Du diese Option aktivierst, ist die schnellste Methode zum Markieren das z�gige Bewegen des Mauszeigers �ber die Speere.|r"

	L.custom_off_conflag_marker = "Gro�brand markieren"
	L.custom_off_conflag_marker_desc = "Markiert die Ziele von Gro�brand mit {rt1}{rt2}{rt3}, ben�tigt Leiter oder Assistent.\n|cFFFF0000Um Konflikte beim Markieren zu vermeiden, sollte lediglich 1 Person im Raid diese Option aktivieren.|r"
end

L = BigWigs:NewBossLocale("Operator Thogar", "deDE")
if L then
	L.cauterizing_bolt_message = "Dein Fokusziel wirkt Kauterisierender Blitz!"

	L.trains = "Zugwarnungen"
	L.trains_desc = "Zeigt Timer und Warnungen f�r die auf den Gleisen ankommenden Z�ge an. Die Gleise sind vom Boss zum Eingang folgenderma�en durchnummeriert: Boss 1 2 3 4 Eingang."

	L.lane = "Gleis %s: %s"
	L.train = "Zug"
	L.adds_train = "Zug mit Adds"
	L.big_add_train = "Zug mit gro�em Add"
	L.cannon_train = "Kanonen-Zug"
	L.random = "Zuf�llige Z�ge"
end

L = BigWigs:NewBossLocale("The Iron Maidens", "deDE")
if L then
	L.ship_trigger = "bereitet sich darauf vor, die Hauptkanone des Schlachtschiffs zu bemannen!"

	L.ship = "Springe aufs Schiff: %s"

	L.custom_off_heartseeker_marker = "Bluttriefender Herzsucher markieren"
	L.custom_off_heartseeker_marker_desc = "Markiert die Ziele von Bluttriefender Herzsucher mit {rt1}{rt2}{rt3}, ben�tigt Leiter oder Assistent."

	L.power_message = "%d Eiserne Wut!"
end

L = BigWigs:NewBossLocale("Blackhand", "deDE")
if L then
	L.custom_off_markedfordeath_marker = "Todesurteil markieren"
	L.custom_off_markedfordeath_marker_desc = "Markiert die Ziele von Todesurteil mit {rt1}{rt2}, ben�tigt Leiter oder Assistent."
end

