-- Ritual descriptions, the [en] half (SPEC T495, V210).
--
-- descRitual.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [en] only, descRitual_pt.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descRitual_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Ritual descriptions for the Vampire tab (SPEC I21). One entry per canonical picker
-- value, keyed in ENGLISH because that is what the sheet saves (SPEC V24); `pt` is a
-- translation of the same three blocks, source line for source line.
--
-- SPEC I24 / T479-T481: this table used to be an upvalue inside the <script> of HH.14.lfm.
-- The <script> CDATA is copied raw into constructNew_*(), so every open sheet parsed and
-- kept its own copy. As a module it is parsed once and cached in package.loaded, and the
-- require that pulls it lives INSIDE ritualText (SPEC V198).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24). The generator
-- markers migrated verbatim, so research/rebuild_ritual_desc.sh and the .tsv maps still aim
-- at the same region - only the path of the target changed.

return {
				-- >>> RITUAL_DESC_BEGIN (generated - SPEC T446)
				["1. Ambrus Kelemen’s Aegis"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 303


1. Ambrus Kelemen’s Aegis


This ritual was a primary source of protection against the Tzimisce during the nascent clan’s ascension. The ritualist crafts a bauble, a piece of jewelry, and wears it until expended. The bauble contains charges equal to the vampire’s Thaumaturgy rating. Charges can be expended for additional dice added to any roll to detect surprise, or to any soak dice pool against bashing or lethal damage. A character may only have one Aegis enchanted at a time, but may give it to another character.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["1. Armor of Diamond Serenity"] = {
					en = [==[Rites of Blood, p. 166


1. Armor of Diamond Serenity


System: For the rest of the night, the sadhu is immune to frenzy of all types, reduces the difficulty of all Willpower rolls by -2, and treats his Willpower as if it were two higher against effects which use his Willpower (temporary or permanent) as the target number. However, while the effect lasts, the sadhu loses the ability to spend blood to increase Physical Attributes.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["1. Bind the Accusing Tongue"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 230


1. Bind the Accusing Tongue


System: The caster must have a picture or other image or effigy of the ritual’s target, a lock of the target’s hair, and a black silken cord. The caster winds the cord around the hair and image while intoning the ritual’s vocal component. Once the ritual is complete, the target must score more successes on a Willpower roll (difficulty of the caster’s Thaumaturgy rating + 3) than the caster scored in order to say anything negative about the caster. The ritual lasts until the target succeeds at this roll or the silk cord is unwound, at which point the image and the lock of hair crumble to dust.]==],
				},
				["1. Blood Mastery"] = {
					en = [==[Rites of Blood, p. 145


1. Blood Mastery


System: The thaumaturge must mix a tiny quantity of her own vitae (a negligible amount, less than a point) with that of her victim, and then slowly burn it in a fire or boil the blood slowly over an open flame. The caster speaks the phrases of symmetry as she finishes. Once complete, the thaumaturge gains a limited magical mastery over the victim until dawn. In the next test that the caster initiatives against the victim, the caster automatically succeeds in the attempt.
If the task would require a roll, the caster garners one success automatically, but no more (and cannot roll or spend Willpower to improve the roll). This means that the caster is guaranteed a marginal success against his opponent, though it may not be in a fashion that the thaumaturge desires. For example, one success alone is not enough to completely mesmerize an enemy, but it might influence him briefly with Dominate. Similarly, if the victim takes some action first, Blood Mastery is of no help if the caster could not normally make a countering roll. For example, the caster would still be subject to an opponent’s use of Presence, because he may not normally make a roll to resist. If the victim uses some Discipline that would require the caster to resist, though, then the thaumaturge automatically counters it and thus ends the power of the ritual.
Blood Mastery can only guarantee success in one limited endeavor — a thaumaturge cannot burn multiple points of blood to gain additional successes or success on multiple consecutive actions. Once the ritual is in place, it must be discharged before it can be invoked again against the same subject. Blood Mastery expires if its effects remain unused by sunrise.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Blood Rush"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 230


1. Blood Rush


System: Performance of the ritual results in the Beast being kept in check automatically. Blood Rush allows the vampire to resist hunger-based frenzy for up to one hour, at which point the Cainite feels hungry again (assuming he did before). This ritual takes only one turn to enact.]==],
				},
				["1. Blood into Water"] = {
					en = [==[Rites of Blood, p. 145


1. Blood into Water


System: The thaumaturge pours a cup of purified water through the fingers of her outstretched hand while chanting. The ritual transmutes all spilled blood within a radius of five feet/two meters per success on the activation roll. Blood in containers and in living things will not be affected — only spilled blood.
This power has no effect on blood used to create active or passive Discipline effects. Blood into Water could not be used to remove a ritual such as Ward Versus Ghouls (V20, p. 234) due to the magic properties of the ritual having transformed the blood, though it could be used to clean up a drawn blood circle used to bind a demon, so long as that binding is done and over with.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Brand"] = {
					en = [==[Rites of Blood, p. 23


1. Brand


System: This painful process burns an aggravated level of damage to the area of skin branded. This tattoo may be placed anywhere on the subject’s body. Once the damage has healed, the tattoo remains upon the skin, unblemished. Due to the pain, the Storyteller may force the target to make a Self-Control roll to hold still during the procedure.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. CCTV"] = {
					en = [==[Rites of Blood, p. 67


1. CCTV


System: The ritual lasts for one night per success, and it can be renewed for the same interval indefinitely so long as the vampire can feed additional points of blood to the lens. While the ritual lasts, the thaumaturge can treat the video feed from the camera as if she were experiencing it directly for purposes of targeting people or places with either paths or rituals. If the camera takes the form of a spy camera that is smuggled into an enemy’s haven, this can allow for devastating effects. However, the ritual is not without risk. So long as the ritual is active, any other blood magician who obtains the enchanted camera can use it as a sympathetic link back to the thaumaturge as if it were a sample of his own vitae. Even after the ritual ends, a lesser sympathetic link persists (equivalent to a personal possession of the thaumaturge) until the camera is destroyed.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Call of the Hungry Dead"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 177


1. Call of the Hungry Dead


Call of the Hungry Dead takes only 10 minutes to cast and requires a hair from the target’s head. The ritual climaxes with the burning of that hair in the flame of a black candle, after which the victim becomes able to hear snatches of conversation from across the Shroud. If the target is not prepared, the voices come as a confusing welter of howls and unearthly demands; he is unable to make out anything intelligible, and may go briefly mad.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["1. Calling Card"] = {
					en = [==[Rites of Blood, p. 65


1. Calling Card


System: The graffiti message will last until it is removed and its true meaning will be visible to any intended target for that time. To trigger the secondary effect, the sorcerer (and any allies he brings) must actually vandalize the area and then leave a message taunting some figure of authority. This message may or may not have a hidden meaning in it, but it must somehow identify the sorcerer, either by his commonly used identity or by a regularly used alias which is known to whichever local authority figures might be expected to visit the scene. For one hour per success, the difficulty of all rituals and path effects executed by the sorcerer within sight of the graffiti is reduced by 1 if the graffiti incorporates an alias or by 2 if it reveals a name by which the sorcerer is personally known by the authorities.
Some punk sorcerers leave hidden messages visible only to specific vampires like the Sheriff or Prince, and then use the benefits provided by Calling Card to cast delayed action rituals as traps triggered whenever he reads the hidden message. The BFU ritual, for example, is designed explicitly for this purpose.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Chime of Unseen Spirits"] = {
					en = [==[Rites of Blood, p. 23


1. Chime of Unseen Spirits


System: Once the chime has been enchanted, it will ring once every time an unseen spirit, ghost, or devil is within thirty feet/ten meters of its physical presence. Otherwise, the chime has been charmed to not ring, even in heavy wind or by manual manipulation. Some powers may block the ability of the chime to detect a specific entity, per the discretion of the Storyteller.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Communicate with Kindred Sire"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 230


1. Communicate with Kindred Sire


System: The caster must meditate for 30 minutes to create the connection. Conversation may be maintained for 10 minutes per success on the activation roll.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Death’s Communion"] = {
					en = [==[Lore of the Clans, p. 108


1. Death’s Communion


System: The caster of this ritual is usually not the beneficiary. If the caster and the subject are the same, the caster suffers a +1 difficulty to her casting roll. Death’s Communion takes one hour to complete. The subject of the ritual gains a bonus of +2 dice to all Necromancy rolls for one night per success achieved on the casting roll.
Necromantic ritual casting (V20, p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["1. Defense of the Sacred Haven"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 230


1. Defense of the Sacred Haven


System: This ritual requires one hour to perform, during which the caster recites incantations and inscribes glyphs. One blood point is required for this ritual to work.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Deflection of Wooden Doom"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 231


1. Deflection of Wooden Doom


System: The caster must surround herself with a circle of wood for a full hour. Any wood will work: furniture, sawdust, raw timber, 2’ x 4’s, whatever. The circle must remain unbroken, however. At the end of the hour, the vampire places a wooden splinter under her tongue. If this splinter is removed, the ritual is nullified. This ritual lasts until the following dawn or dusk.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Devil’s Touch"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 231


1. Devil’s Touch


System: The effects of this ritual last one night, disappearing as the sun rises. The mortal (it doesn’t work on vampires) must be present when the ritual is invoked, and a penny must be placed somewhere on his person (in a pocket, shoe, etc.).
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Domino of Life"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 231


1. Domino of Life


System: Using this ritual adds one die to the caster’s dice pools when attempting to pass as human. Unless onlookers are especially wary, the Domino of Life should fool them into thinking the caster is mortal — not that they should have any reason to suspect otherwise.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Drinking Death"] = {
					en = [==[Dark Ages Tome of Secrets, p. 48


1. Drinking Death


System: Upon completion of the rite, the koldun is subsequently capable of drinking blood from the earth of a gravesite. The koldun must lay prostrate on the ground, face in the soil, and take the earth in his mouth. Only one blood point can be gained this way from each grave, and one such grave in the immediate area can be affected per success in the casting. The rite’s effects are permanent until one of the graves is consecrated by an individual with True Faith.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["1. Eldritch Beacon"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 177


1. Eldritch Beacon


Eldritch Beacon takes 15 minutes to cast. The material component is a green candle, the melted wax from which must be collected and molded into a half-inch (1.5 cm) sphere. Whoever carries this sphere, whether in his hand or in a pocket, is highlighted in the Shadowlands with a sickly-glowing green-white aura. All ghostly powers affect this individual with greater ease and severity. The sphere retains its power for one hour per success on the casting roll.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["1. Encrypt Missive"] = {
					en = [==[Rites of Blood, p. 145


1. Encrypt Missive


System: The thaumaturge writes the message in blood over the course of a night and speaks the name of the person or group that she wishes to read it. Only the writer and the target to which the letter is addressed can read the document. To any others who observe the letter, the writing appears to be gibberish. Obviously, this ritual may only be used for written communication. Encrypt Missive only works with the original document. If someone else tries to scan or copy the document, the magic holds and the message remains scrambled.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Engaging the Vessel of Transference"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 231


1. Engaging the Vessel of Transference


System: This ritual takes three hours to enact (reduced by 15 minutes for each success on the casting roll) and requires one blood point (although not necessarily the caster’s blood), which is sealed inside the container. The ritual only switches blood between itself and a subject if it is touched with bare skin — even thin cotton gloves keep it from activating.
Individuals with at least four dots in Occult recognize the Hermetic sigil with two successes on an Intelligence + Occult roll (difficulty 8).
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Eyes of the Abyss"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 271


1. Eyes of the Abyss


System: The vampire crushes a small flame (e.g. a lit candle) in her bare hand, taking a level of aggravated damage. She then makes a Rötschreck check, difficulty 4. If she succeeds, roll Intelligence + Occult, difficulty 6. A botch results in an additional level of aggravated damage. On a success, a tiny Abyss elemental is summoned and consumes the extinguished flame.
Talon of the Abyss (p. 272): The Abyss Elemental looks the part of an amorphous blob of inky shadow. It can temporarily take whatever shape it’d like, up to the size of a human child.
Attributes: Strength 2, Dexterity 5, Stamina 1, Charisma 1, Manipulation 3, Appearance 0, Perception 3, Intelligence 2, Wits 3
Abilities: Alertness 3, Athletics 3, Brawl 3, Intimidation 2, Stealth 5 (+1 while in shadows)
Disciplines: Obtenebration 3
Willpower: 5
Health: OK x 3, Faded (-2) x2, Destroyed
The creature remains a number of nights equal to the successes rolled. The elemental will respond to and obey all commands given by the caster. It cannot affect the material world, though it can communicate mentally by entering a person’s shadow. Any non-mystic who communicates with an Abyss elemental in such a fashion must make a Courage check, difficulty 6. Failure results in a temporary Derangement that lasts the remainder of the evening. On a botch, the Derangement is permanent and can only be cured through repeated use of Willpower.
The elemental is always in shadow form (as Tenebrous Avatar, see p. 230), can fly 30 yards/meters per turn, and is instantly destroyed by fire or sunlight. A level 2 version of this ritual, Talons of the Abyss, can summon shadow elementals that are corporeal and can even attack enemies.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["1. Final Sight"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 292


1. Final Sight


There are two schools of thought on how to conduct the ritual of Final Sight. Adherents of the first school of thought conduct the ritual by dripping a few drops of blood on a dead man’s eye and saying a brief prayer for his soul. Others conduct the ritual by slowly and reverentially eating one of the dead man’s eyes. Most necromancers have a strong preference for one method. Regardless of which method the necromancer uses, this ritual must be used on a corpse with at least one intact eye, and it takes approximately five minutes.
The number of successes on the ritual roll determines the clarity of her results.
1 success — A basic sense of the subject’s death
2 successes — A clear image of the subject’s death and the seconds preceding it
3 successes — A clear image, with sound, of several minutes preceding the subject’s death
4 successes — A clear image, with sound, of the half-hour before the subject’s death
5 successes — Full sensory perception of the hour leading up to the subject’s death
If the player botches, her character is assaulted with vague and confusing visions of her own Final Death, which will immediately provoke a Rötschreck check (see p. 357).
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["1. Flatline"] = {
					en = [==[Rites of Blood, p. 158


1. Flatline


System: The effect lasts until the next morning and can only be used on one target per month. The dead animal must be placed in the target’s real home. The ritual won’t work if it is left in a hotel room or somewhere she is house-sitting or squatting. The power will not affect any supernatural being. This ritual is most often used by Punk Sorcerers who either want to terrorize a mortal or embarrass some Camarilla Lick by causing one of his blood dolls to think she’s become a vampire and cause a scene.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Foxfire"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 292


1. Foxfire


The celebrant must burn a small green candle down to the bottom (which takes about fifteen minutes) and form the remaining ash and wax into a small sphere. The sphere is then placed somewhere on the intended target’s person.
Anyone who carries the sphere appears to be normal by any observer in the living world, but to anyone in the Underworld, the target appears to be illuminated with a sickly green glow. Ghosts find it trivially easy to affect the target with their dark magic, and receive a -1 difficulty on all magic-related rolls directed at the target. The sphere remains for one hour per success on the casting roll.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["1. Horoscope"] = {
					en = [==[Rites of Blood, p. 162


1. Horoscope


System: Each success allows the ashipu to discover one secret about the target of the horoscope, chosen from the following: Nature, primary aptitudes (i.e. Traits rated at 3 or higher), Flaws, or major tragedies from her life (or unlife). Alternatively, the ashipu may use the horoscope in conjunction with an effigy to improve the efficacy of sympathetic magic, with the successes on the ritual roll reducing the difficulty penalty applied to such rolls. However, the ashipu may not use a horoscope to reduce the dice penalty by more than his Dur-An-Ki rating, nor may he use it to reduce the penalty to less than zero.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["1. Illuminate the Trail of Prey"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 231


1. Illuminate the Trail of Prey


System: The thaumaturge must have a mental picture of or know the name of her prey. The individual’s wake glows with a level of brightness dependent on how long it has been since he passed that way — old tracks burn less brightly, while fresh tracks blaze.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Impressive Visage"] = {
					en = [==[Rites of Blood, p. 146


1. Impressive Visage


System: The caster gains two dice on all Appearance-related rolls for the duration of this ritual. This ritual lasts for a number of hours equal to the successes scored on the activation roll.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Incantation of the Shepherd"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 232


1. Incantation of the Shepherd


System: This ritual gives the character the location (relative to him) of every member of his Herd. If he does not have the Herd Background, Incantation of the Shepherd locates the closest three mortals from whom the caster has fed at least three times each. This ritual has a maximum range of 10 miles or 15 kilometers times the character’s Herd Background, or five miles (eight kilometers) if he has no points in that Background.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Insight"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 177


1. Insight


This ritual allows a necromancer to stare into the eyes of a corpse and see reflected there the last thing the dead man witnessed. The vision appears only in the eyes of the cadaver and is visible to no one except the necromancer using Insight. The player rolls as normal as the vampire stares into the target’s eyes for five minutes. The number of successes on the roll determines the clarity of the vision. A botch shows the necromancer his own Final Death, which can provoke a Rötschreck roll (see p. 299).
This power cannot be used on the corpses of vampires who have reached Golconda, or on bodies in which both eyes are missing or advanced decomposition has already occurred.
1 success — A basic sense of the subject’s death
2 successes — A clear image of the subject’s death and the seconds preceding it
3 successes — A clear image, with sound, of the minutes preceding death
4 successes — A clear image, with sound, of the half-hour before the subject’s demise
5 successes — Full sensory perception of the hour leading up to the target’s death
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["1. Knowing Stone"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 177


1. Knowing Stone


By use of her own blood and the proper rituals, a necromancer can mark a person’s spirit, allowing the vampire to see where her subject is at any time, even after he has died. In this fashion many of the spirit-haunted vampires keep tabs on their close kin and their enemies.
The necromancer cuts her skin or otherwise bleeds herself, and then uses the vitae to paint the name of the target on a consecrated stone. If the ritual is successful, she can afterward learn the target’s current whereabouts by dancing around the stone in a trance state until one of the spirits whispers the desired information into her ear. The stone loses its powers on the night of All Saints Day unless the vampire spends a blood point.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["1. Learning the Mind Enslumbered"] = {
					en = [==[Rites of Blood, p. 146


1. Learning the Mind Enslumbered


System: This ritual requires a half hour to cast, at the end of which the thaumaturge hears a ghostly message from the victim naming who she believes torpored or killed her. This is not a divination ritual, and therefore the information may not be accurate. If the culprit was disguised or hidden, the spirit of the victim will do her best to answer the question. This power has no effect on creatures other than Kindred.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Light within Shadow"] = {
					en = [==[Lore of the Clans, p. 126


1. Light within Shadow


System: Upon successful casting this ritual, the Lasombra summons into her hand a sphere of pure shadow. As she stares into the sphere, she makes a Perception + Occult (difficulty 8) roll. If the roll is successful, she permanently gains the Controllable Night Sight Merit (see p. 122). If they fail, they may try again the next night, but if they botch they permanently gain the Uncontrollable Night Sight Flaw (p. 123).
Side Effect: Whenever the vampire uses her new vision, her eyes become disturbing inky black pits of shadow. If she has no control over her sight, her eyes will always look like this.
Abyss Mysticism (p. 125): Abyss Mysticism is difficult and time consuming to learn, and comes at a cost. Its rituals often have side effects that create Flaws the character cannot remove that provide no bonus points. To learn the power, a vampire must have at least one dot in both Obtenebration and Occult. She may not learn any Abyss rituals higher than the lowest of her Obtenebration or Occult ratings, and each ritual costs a number of experience points equal to three times the ritual’s level. Abyss rituals are cast using a Wits + Occult roll. The difficulty is 3 + the level of the ritual being cast. Only one success is required to cast the ritual, but the Storyteller is encouraged to make the penalties for failure especially horrifying.]==],
				},
				["1. Locating the Oubliette"] = {
					en = [==[Dark Ages Tome of Secrets, p. 35


1. Locating the Oubliette


System: The Cainite must cut herself and expend at least one blood point. On a successful Perception + Occult roll (difficulty 5); the vampire is able to see a line one kilometer (2/3 of a mile) long (with an additional kilometer per success), leading to the nearest Oubliette if one exists. This line remains visible to the Abyss Mystic for one night per blood point spent. On a failure, nothing happens; a botch leads the Cainite to the nearest location bearing True Faith, regardless of distance.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["1. Master of the Domain"] = {
					en = [==[Dark Ages Tome of Secrets, p. 49


1. Master of the Domain


System: Once the rite’s complete, the koldun gains a permanent additional two dice to attempts at Intimidation against both mortal and Cainite subjects within her domain. Master of the Domain also prevents the victims of such bullying from spending temporary Willpower to overcome its effects. The rite can be undone by the koldun’s subjects seeing the Cainite bested in any form of contest.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["1. Memento Mori"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 293


1. Memento Mori


This ritual harrows a target with terrifying visions of his own demise. To conduct the ritual, a necromancer takes a small personal token from a target. This might be a sample of bodily fluid, a hair, or even a well-used possession. The celebrant must dig a grave at least six feet/two meters deep and no less than three feet/one meter wide. She may use supernatural means to aid her such as Potence or Protean, but she must do the work directly and not with any other aid. When she has finished burying the token, the ritual begins to take effect.
The target suffers intermittent, terrifying visions of his own death for a period of one week. Every time a target is subjected to a vision, he must roll his Courage (difficulty 7). If he fails, he can take no action other than cowering in terror until the vision passes.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["1. Minestra di Morte"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 177


1. Minestra di Morte


The necromancer obtains a piece of a dead body and simmers it in a pot with half a quart (or half a liter) of vampiric vitae. To this stew, the necromancer adds rosemary (for remembrance), basil (the funerary herb), and salt (the alchemic principle of clarification). After bringing the concoction to a full boil, the necromancer eats it.
If the roll to activate this ritual is successful, the character discovers whether the subject of the grisly rite became a wraith or Spectre after death, or if indeed she became either. Unfortunately, this information can be learned only about the person from whose body the “stew meat” was taken.
The blood component is spent progressively through the ritual: If the Necromancer takes the blood from another Kindred, she doesn’t become partially bound from drinking it, nor does she add a point to her blood pool. Similarly, if she uses her own blood, her pool decreases by a point but does not increase when she consumes the soup.
Necromantic vampires without the Eat Food Merit (see p. 480) can’t keep the soup down, but can still use the ritual and gain the information.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["1. Pierce the Veil"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 271


1. Pierce the Veil


System: Using Shadow Play, the mystic forms a ball of shadows in her hand and gazes into its depths. The player rolls Perception + Occult, difficulty 8. A success results in the character permanently gaining the Merit Darksight. Failure simply means that the ritual does not succeed and must be tried another night, while a botch results in Darksight being acquired as a Flaw.
When a character uses Darksight gained through use of this ritual, her eyes become completely black, without reflection — windows into the Abyss itself. This effect is permanent for characters who obtained Darksight as a result of a botched ritual.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["1. Preserve Corpse"] = {
					en = [==[Rites of Blood, p. 103


1. Preserve Corpse


Level One Necromancy Ritual. This ritual enables the user to create an elixir that keeps dead flesh from rotting. The ritual requires the caster to physically coat the dead flesh with a liquid composed of grave dirt, defiled holy water, and rare herbs. Once the liquid dries, the flesh is indefinitely preserved — some have been known to last for hundreds of years. The ritual produces enough elixir to coat one adult human corpse.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["1. Purify Blood"] = {
					en = [==[Rites of Blood, p. 147


1. Purify Blood


System: Purify Blood functions on up to one point of blood. Because of the volume limitations, Purify Blood can cleanse only one blood point at a time. Poisons, diseases, and other mixtures disappear, while foreign substances bubble to the top and can be skimmed off. However, the ritual does not in any way change the potency of the blood; vitae can still cause a blood bond, and blood rendered acidic or caustic by a Discipline (like Quietus or Vicissitude) cannot be cleansed. This ritual cannot counter the Vaulderie (nor is it stealthy enough to perform unnoticed in the midst of such a rite). Rotten, solidified, or excessively befouled blood also vanishes if subjected to the ritual (at Storyteller discretion), so a vampire needn’t fear gagging on old, dead blood.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Purity of Flesh"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 232


1. Purity of Flesh


System: The player spends one blood point before rolling. Purity of Flesh removes all physical items from the caster’s body, but does not remove enchantments, mind control, or diseases of the blood.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Reawakening the Dead Water"] = {
					en = [==[Rites of Blood, p. 157


1. Reawakening the Dead Water


System: If the ritual is successfully performed (with at least one success), the koldun regains a point of spent Willpower. This cannot raise his Willpower above its normal maximum. This ritual can only be performed once per night.
Koldunic Sorcery dice mechanics (p. 156): the roll to activate a Koldunic Sorcery ritual is Intelligence + Occult with a difficulty equal to 3 + the ritual rating. The school’s metaphysical connections to Kupala and to the lands permeated by that spirit increase the difficulty by +1 on all Koldunic Sorcery rolls made on behalf of kolduns who work their magic outside the territories of Eastern Europe.]==],
				},
				["1. Rite of Introduction"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 311


1. Rite of Introduction


Tremere Ritual. The Tremere use this ritual as the formal method of presentation for arrivals in a new city, though it is also possible to use this ritual to request aid. The caster boils a handful of ground tamarisk root and a drop of galangal oil in a pot of rainwater, and then recites a short incantation into the vapors that form over the pot. She then speaks a brief thirty-second message, which is telepathically communicated first to the regent and then to the other clan members in the city, according to their place in the hierarchy. The ritual allows the regent to reply telepathically and engage in a five-minute conversation with the caster, if he so desires.
Clan rituals (p. 302): Clan rituals are jealously guarded secrets that are never shared with those not belonging to the clan or bloodline harboring its mysteries.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["1. Rite of Reclamation"] = {
					en = [==[Rites of Blood, p. 76


1. Rite of Reclamation


System: The effects of the ritual last until a number of sunrises pass equal to the number of successes rolled during the casting. When the Sorcerer reaches Final Death, all of his blood seeps out through his pores and is claimed by the earth, mystically transporting it to Alamut. If the moment of Final Death comes as the result of being diablerized, the would-be diablerist feels all of the blood gained from the Assamite clawing its way out of her, causing a number of lethal damage equal to the successes rolled in the casting of the ritual. It seeps through her pores and is sucked into the ground. The diablerie is still considered successful, but no blood is gained from the act, which could provoke a hunger frenzy check.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["1. Ritual of Return"] = {
					en = [==[Dark Ages Tome of Secrets, p. 42


1. Ritual of Return


Only Assamites hold the necessary knowledge to locate Alamut, stored deep within the Blood of Alamut itself. When a vizier needs to send an Assamite to or from Alamut, or summon him to the Holy City, the sorcerer casting this ritual uses one of three variations. When the Ritual of Return is invoked, unless specified, the affected Assamite enters the Trance of Return described on p. 40 as soon as he sets out to journey for Alamut. Pragmatically, if an Assamite had taken refuge in a Prince’s court, this would take affect once he left the Prince’s demesne.
If all participants are in Alamut, then the sorcerer needs only to spit in dirt or dust to make mud before marking each heel of the Cainite being sent forth. Once the vizier speaks the name of the place, the Assamite immediately enters the Trance of Return. She travels to her destination as quickly as possible, and forgets her journey, only stopping to eat, take refuge from the sun, and at the clan’s Watchtowers on her way out.
If all participants are in the same place and that place is not Alamut, the sorcerer casting the spell must set a traveler’s hood upon the Assamite and instruct him to return home. The vizier then asks him if he has served Haqim faithfully (to which the Assamite is expected to answer yes). The sorcerer takes the vial of blood kept on the vizier’s person and draws a circle around the traveler using the vial as a tool to mark the ground. When the vizier speaks the name of Alamut, the Assamite repeats it and immediately enters the Trance of Return.
If the vizier and sorcerer are in Alamut, but the Assamite being summoned home is not, then the ritual is more complicated. The sorcerer invokes the Blood of Alamut to call home the wandering member of the clan. This requires that the caster be a member of the Keepers of the Pool (as described on p. 41). The Keeper must draw a circle around the vizier, who speaks the name of the summoned Assamite three times while having blood from the pool poured over her head. The clan member feels irrevocably drawn, but may spend the night settling affairs before he begins his journey home the next night, at which point he enters the Trance of Return immediately. The use of this ritual is generally limited to times when an Assamite is nowhere near a major city where viziers and sorcerers would be able to use the second method of invoking the Ritual of Return.
Assamite Sorcery ritual casting: the Tome of Secrets states no roll of its own for these rituals; Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["1. Ritual of the Smoking Mirror"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 178


1. Ritual of the Smoking Mirror


This ritual allows the necromancer to use an obsidian mirror to see as ghosts do. By gazing into the mirror’s ebony depths, the vampire may discover an object’s flaws, assess the general health of mortals, or even read a being’s aura.
At the start of the ritual, the Kindred decides which of the ritual’s two aspects she will use — she may not use both at the same time. With Lifesight, the necromancer may read auras as if she had the level two Auspex power Aura Perception. Deathsight, on the other hand, grants the necromancer the ability to see ghosts and the Shadowlands. It also shows the stain of oblivion on the living, as per Eyes of the Dead (p. 174). At the Storyteller’s discretion, the Kindred may make a similar study of an inanimate object’s flaws and how to repair them, if that object has a strong link to either life- or death-energies (such as a murderer’s knife or a window box used to grow healing herbs).
To perform the ritual, the necromancer grasps an obsidian mirror that has had its edge sharpened so that it cuts the flesh of whoever takes hold of it. As the vitae flows onto the mirror’s surface, it allows the mirror’s reflective power to bridge the worlds of the living and the dead, much as it allows the necromancer herself to do. The player then rolls to activate the ritual as normal. If successful, the Necromancer may view the world as a ghost does via the reflective surface of the mirror, for one scene. On a botch, the vampire may well invoke the ire of the spirits upon whom she calls.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["1. Sanctify the Temple"] = {
					en = [==[Rites of Blood, p. 62


1. Sanctify the Temple


System: The ritual lasts for one lunar month but it can be renewed indefinitely. While the ritual is active, the difficulty of all rolls to activate Old Skool paths or rituals performed within the temple space is reduced by -1. The number of successes determines the maximum size of the space which can be sanctified.
1 success — a five-by-five foot/two-by-two meter area, such as a large walk-in closet, a secret room, or a tiny grove
3 successes — a twenty-by-twenty foot/six-by-six meter area, such as the sanctuary of a small church or a large grove
5 successes — an area of 100 square feet/30 square meters or so, such as a medium-sized church or a small wood
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Sanguineous Phial"] = {
					en = [==[Rites of Blood, p. 147


1. Sanguineous Phial


System: To prepare for this ritual, the thaumaturge buries a covered earthenware container for two nights and then unearths it. The following evening, she crumbles dried ash leaf into the empty canister and then whispers the proper incantation. Afterwards, she may pour blood into the vessel and then seal it closed with tallow melted from a candle. The blood will remain fresh until the seal is broken. After the container is opened, the blood begins to spoil at a normal rate. If the vessel is broken, the blood immediately deteriorates to the state it would have attained had it not been preserved at all. The vessel may be used more than once, but the ritual must be recast or the blood will go bad.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Sense the Mystical"] = {
					en = [==[Rites of Blood, p. 147


1. Sense the Mystical


System: The effect of this ritual lasts for a number of hours equal to the successes scored on the activation roll. Sense the Mystical can detect Thaumaturgy, Necromancy, and similar blood magic if used within the radius of the candle light. This power does not distinguish between the different types of blood magic, nor does it pick up normal Disciplines. This ability lasts for one hour.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Servitor’s Perception"] = {
					en = [==[Dark Ages Tome of Secrets, p. 50


1. Servitor’s Perception


System: Upon completion of the rite, the koldun imbues any animal with as many points as she has in Genius Loci. The koldun will require a way of commanding or possessing the animal if she wishes to have any influence on what the animal looks for, or reports back. This rite is broken if the animal is slain.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["1. Shew-Stone"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 293


1. Shew-Stone


This Impundulu ritual creates a magical stone, which can be used to keep track of a necromancer’s friends or enemies, living or dead. To create a Shew-Stone, a necromancer must paint a person’s name in a bird’s blood (Germanic traditions insist on using the blood of a hoopoe) on a consecrated, polished stone. The necromancer must appease the spirits by performing a ritual such as a dance, a prayer, or an offering. Ghostly spirits will then appear in the Shew-Stone and whisper the target’s whereabouts in the necromancer’s ear.
The stone loses its powers after a month unless the necromancer spends a blood point to renew the magic.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["1. Sigil of Authority"] = {
					en = [==[Rites of Blood, p. 24


1. Sigil of Authority


System: The thaumaturge methodically cuts a design into the flesh of the willing subject with a silver-tipped blade. This sigil must be at least three inches in diameter and may be placed anywhere on the body of the subject. The design should metaphorically present the authority of the office represented and the meaning easily understood by those that see it. For example, the sigil of a domain’s Sheriff might be a star shaped badge or police shield.
The thaumaturge must spend an evening in the willing presence of the Sigil Investor (the vampire that holds the office from which the authority arrives) and the Sigil Bearer (the vampire that will carry the voice of said office) to attune the sigil to the resonance of the office. At the end of the evening, the Sigil Bearer must swear an oath to the office. Once activated, everyone present instinctively knows that the Sigil Bearer lawfully represents the office of the Sigil Investor.
The Sigil Bearer must expose the sigil and expend a temporary point of Willpower to project the weight of authority of the Sigil Investor. Any vampire in her presence must make a Self-Control roll (difficulty 8) or be down three dice on all Social rolls against the Sigil Bearer for the next fifteen minutes.
The Sigil of Authority lasts one year per success on the activation roll, and the Bearer is aware of when it fades. This ritual may be renewed by the Sigil Bearer re-swearing the oath of office.
The authority of the sigil may be revoked immediately if the Sigil Investor expends a point of Willpower. Should this happen, the Sigil Bearer learns this immediately as the symbol cut into her flesh is burned until the symbol is no longer visible. This rejection is painful, and burns an aggravated level of damage into the former Sigil Bearer’s flesh.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Strength of Haqim"] = {
					en = [==[Dark Ages Tome of Secrets, p. 42


1. Strength of Haqim


One of the first rituals a new Assamite sorcerer can learn is this protective spell meant to allow her to draw on the power of all Assamites, past and present, to resist domination or blood addiction. By carrying with her an amulet bathed in the Blood of Alamut and reciting a brief incantation, an Assamite may gain additional dice equal to her dots in Thaumaturgy to resist the affect of mind-altering spells or Disciplines. The vampire’s defense to these same effects is reduced by one after every failed casting. If the effect does not allow for a defense, this applies as a penalty to the activation.
Assamite Sorcery ritual casting: the Tome of Secrets states no roll of its own for these rituals; Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["1. Tame the Maddening Flame"] = {
					en = [==[Dark Ages Companion, p. 116


1. Tame the Maddening Flame


Note: This is a Haven Ritual (see Dedicate the Haven, V20 Dark Ages, p. 310)
Fire lights the Dark Medieval and, though Cainites fear it, they can usually control their response in the face of a tamed campfire, hearth, or torch. This ritual protects them when fire might spread unpredictably, such as on a battlefield or when it’s otherwise used as a weapon.
The Tremere pollutes a jug of water with a trivial amount of his blood, and uses it to wet the perimeter of a room or outdoor location. An enclosed space of almost any size can be protected, but an outdoor area is limited to a 150 foot (roughly 50 meter) radius. New or existing fire in the protected area takes on a greenish hue and its smoke smells sweet. It can no longer provoke Rötschreck. Furthermore, reduce the damage of all injuries inflicted by fire within the area by one Health Level. This lasts for as long as the caster is present.
Haven Ritual (V20 Dark Ages, p. 310): Once dedicated by Dedicate the Haven, a haven is open to more defenses; any Haven Ritual cast upon it is rendered permanent and has its casting difficulty decreased by three.
Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["1. The Abyss Knows"] = {
					en = [==[Dark Ages Tome of Secrets, p. 35


1. The Abyss Knows


System: The Cainite must possess the Abyss Mysticism ritual Pierce the Veil (see V20 Dark Ages p. 271) and have the Darksight Merit. By spending one blood point and rolling Perception + Awareness (standard difficulty versus an opposed Conscience/Conviction roll, if resisted), success indicates whether the target is a true servant of the Abyss or an impostor. Failure has no effect; a botch means the Abyss Mystic misreads the result.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["1. The Word of the Dark God"] = {
					en = [==[Rites of Blood, p. 83


1. The Word of the Dark God


System: This is purely a narrative device for the Storyteller to take advantage of, with no other mechanical benefit. As an optional rule, Storytellers could employ the tasks set by practicing this ritual as tests to complete before being granted access to higher levels of Setite Sorcery. Otherwise, the favor of Set can manifest itself in any way the Storyteller desires.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["1. Treasured Ornaments"] = {
					en = [==[Dark Ages Tome of Secrets, p. 49


1. Treasured Ornaments


System: Upon completion of the rite, the koldun can converse with important ornaments in her haven. The effects are permanent, though leaving the spirits in situ tends to aggravate them over time. An ornament of importance is one with a history — perhaps a gifted weapon, or the cot of a deceased child. The rite is dismissed when an uninvited guest touches the ornaments.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["1. Truth in Water"] = {
					en = [==[Dark Ages Tome of Secrets, p. 50


1. Truth in Water


System: Success of the rite converts water into a form of lie detector. The rite only affects enough water to fill a barrel, but this water remains pure until it’s spilled on the ground. Once boiling, it deals one level of lethal damage to mortals who lie while in contact with it, and one level of bashing damage per turn to Cainites.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["1. Typhon’s Brew"] = {
					en = [==[Rites of Blood, p. 84


1. Typhon’s Brew


System: Brewing the Typhon’s Brew takes a full lunar month, beginning and ending at the dark of the moon. For every gallon brewed, the alchemist includes one blood point’s worth of his own vitae. The brewing process multiplies the vitae, so that a ghoul can gain one blood point per quart of the magic beer. Vampires, however, gain only one blood point per gallon consumed — the same rate as in brewing the beer. For vampires, the beer’s magic is limited to the fact that they can drink it at all without heaving it up seconds later. They can even get drunk on it (and may suffer a hangover later).
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["1. Unnatural Decay"] = {
					en = [==[Dark Ages Tome of Secrets, p. 48


1. Unnatural Decay


System: Upon completion of the rite, all crops within one kilometer (2/3 of a mile) of the rite’s completion become mildly poisonous to humans, causing those who consume the toxic produce to lose one dot of Stamina a week. The rite is undone through a mortal’s bloodletting on the cursed earth. This only technically requires the loss of about three blood points, but often means the mortal’s death in practice.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["1. Wake with Evening’s Freshness"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 232


1. Wake with Evening’s Freshness


System: This ritual must be performed immediately before the vampire goes to sleep for the day. Any interruption to the ceremonial casting renders the ritual ineffective. If danger arises, the caster awakens and may ignore the Humanity/Path dice pool limit rule for the first two turns of consciousness. Thereafter, the penalty takes effect, but the thaumaturge will have already risen and will be able to address problematic situations.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Water Walking"] = {
					en = [==[Rites of Blood, p. 63


1. Water Walking


System: In combat, the successes determine how many turns the New Ager can continue to move without sinking or falling. Out of combat, the effects of the ritual last for as long as the ritualist remains in motion or until the end of the scene.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Weight of Shadows"] = {
					en = [==[Rites of Blood, p. 38


1. Weight of Shadows


System: This ritual only allows the caster to control natural shadows, not shadows created by Obtenebration. Shadows controlled by the caster can gain or lose a small amount of size (thus a woman’s shadow could be made look like a man’s, but a dog’s shadow could not). Only one such shadow may be controlled at a time. The Storyteller is the arbiter of what kinds of shadows are simply too large for this power to affect (such as the shadow of a skyscraper). The effects of this ritual last until the next sunrise.
Side Effect: Shadows are drawn toward the caster, and when not controlled, will attempt to move toward her, even to the point of bending against the light. The caster gains the Flaw Eerie Presence (with the above descriptor) for the duration of this ritual’s effects. (V20, p. 495).
Abyssal Rituals (p. 37): The following rituals do not adhere to the same rules as other forms of magic, in large part because they build on a Discipline that is not truly a form of sorcery. To learn Abyss Mysticism, a Cainite must have at least one dot in both Obtenebration and one dot in Occult. Such a character may not learn Abyss rituals rated higher than her Obtenebration or Occult score (whichever is lower). Casting Abyss rituals requires a successful Wits + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to succeed. Unlike normal rituals, each Abyss Mysticism ritual costs 3 times the ritual level in experience points to learn. All rituals of Abyss Mysticism also have permanent side effects; under no circumstances do Flaws obtained from these side effects reward the vampire with bonus or experience points, nor can they be bought off.]==],
				},
				["1. Widow’s Spite"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 232


1. Widow’s Spite


System: The ceremonial doll must resemble, however rudely, the victim of the ritual. It produces no mechanical effect, other than a simple physical stimulus. The caster may determine where on the subject’s body the pain or itch appears.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["1. Word of Insight"] = {
					en = [==[Rites of Blood, p. 93


1. Word of Insight


System: Upon successfully casting the ritual, smoke billows from the incense burner and a myriad of ghostly faces can be seen within. Each face mutters or whispers a word or phrase, each one overlapping, making a cacophonous din. The vision and the voices fade after a few seconds.
The future is a wide, changing sea of possibilities, so at the outset, the Necromancer must specify a particular subject that she is enquiring about (closing a successful deal, obtaining a particular item, overcoming a certain problem, etc.). The Necromancer doesn’t necessarily find the voices coherent or understandable, but when the ritual comes to fruition, she experiences a moment of clarity and knows what the message meant.
Mechanically, this insight allows the Necromancer to reroll one failed action later on in the same night the ritual was cast, as long as it is in direct pursuit of the future she divined. She foresaw this failure, and potentially knew how to avoid it. If she fails the second roll, she still fails, realizing the insight just a moment too late.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. Abyssal Blade"] = {
					en = [==[Dark Ages Tome of Secrets, p. 35


2. Abyssal Blade


System: The Abyss Mystic must immerse the blade of her weapon in the blood of any living creature, holding the weapon’s handle as she dedicates her future kills to the Abyss. She rolls Strength + Occult (difficulty 7), with success imbuing the weapon with an unholy power allowing a weapon to bypass armor — not Fortitude — and inflict aggravated damage on mortals. Each success results in the weapon remaining imbued for a night. Once the power runs out, the weapon corrodes and becomes useless. The ritual can be enacted more than once on the same weapon, prior to corrosion. Failure leads to no result; a botch causes the weapon to corrode immediately, and prevents the ritual from being incanted again that night.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["2. Antonius’s Denial"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 293


2. Antonius’s Denial


A prodigy of Augustus Giovani’s blood, called Antonius Giovani, crafted this wicked rite early in the bloodline’s studies. It denies death to a victim, albeit temporarily. It does not, however, deny pain. The ritual requires the vampire temporarily sacrifice a dot (not a point) of Willpower, which only returns the night after he chooses to end the effects. Upon casting this ritual, the victim gains a number of phantom Incapacitated Health Levels equal to the casting successes. The character cannot be Incapacitated, only Crippled, no matter the damage he takes. The victim cannot heal these phantom Health levels under any circumstance, and if the ritual ends, any wounds in those boxes are added as aggravated damage to his normal Health track.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["2. Ascension of the Blood"] = {
					en = [==[Lore of the Clans, p. 221


2. Ascension of the Blood


System: The ritualist prepares a special chalice into which she puts as much of her blood as she requires. With at least one success, the blood in the chalice can no longer create a blood bond and is safe for anyone else to drink. Of course, the blood still looks the same whether the ritual is a success or the Tremere is simply lying.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Autumn’s Armor"] = {
					en = [==[Dark Ages Tome of Secrets, p. 50


2. Autumn’s Armor


System: Upon conclusion of the rite, the koldun emerges from the land bearing earthen armor with a permanent rating of 2 against all forms of damage. The armor increases the difficulty of Social actions by 2. The rite concludes if the koldun is struck by a stone-tipped weapon.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["2. Banning Rituals"] = {
					en = [==[Dark Ages Companion, p. 116


2. Banning Rituals


• Infernal Powers: Demonic powers, Infernal magic of all kinds.
• The Kindly Ones: Powers of the Fae
• Sorcery: Mortal magic as learned by Path or Pillar
• Spiritual Malice: Lupine and spirit Gifts.
• Wrath of the Dead: Ghostly Arcanoi
• Wisdom of the Curse: Cainite Disciplines.
If the power does not possess a dot rating, use the highest Trait rating involved in its operation. Powers within the category cannot affect a banned object, or cross the threshold of a banned space in either direction, but may still be used within it. For instance, a mortal magus might read a Tremere’s mind while both stand in a haven Banned against Sorcery, but not while one stands outside and the other inside.
Similar to wards, bans may be resisted with an extended Willpower roll with a difficulty of 4 + ban level, accumulating successes equal to the ban caster’s Thaumaturgy rating. The character challenging the ban must be able to see or touch the object or threshold, however. Success destroys the ban, and no matter the caster’s location, she hears a sharp cracking sound when it falls.
Bans last for a number of weeks equal to the successes scored on the casting roll.
Haven Ritual (V20 Dark Ages, p. 310): Once dedicated by Dedicate the Haven, a haven is open to more defenses; any Haven Ritual cast upon it is rendered permanent and has its casting difficulty decreased by three.
Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["2. Beat Your Way to Glory"] = {
					en = [==[Rites of Blood, p. 65


2. Beat Your Way to Glory


System: Each success causes the vampire to gain one Appearance-related characteristic of the mortal victim, chosen from hair color, hair style, facial hair, tattoos, piercings, or clothing. When the vampire awakens the next night, he will have those traits (and if appropriate, will awaken wearing a copy of the mortal’s clothes sized perfectly to fit him). The ritual will not change overall appearance — the vampire still looks basically the way he did before, and only superficial traits are changed. Piercings and tattoos appear on the vampire’s body in roughly the same location as they were on the mortal’s body but adjusted where necessary due to differences in size and build. Clothing will last until destroyed, but all other acquired characteristics become part of the vampire’s default appearance.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Blade of Smoke and Shadow"] = {
					en = [==[Rites of Blood, p. 77


2. Blade of Smoke and Shadow


Ever since the nights of the Second City, the Assamites have fought against demonic forces. Mundane physical weapons normally have no effect upon such ephemeral beings, but Assamite Sorcerers have long-known the secret of enchanting a blade so that it can strike demons.
The Sorcerer first obtains an obsidian dagger with an iron handle. This may be prepared by the Sorcerer or otherwise obtained — the significance is in the composition of the weapon rather than the method in which it is created. Next, she prepares a chamber where no light can naturally enter. This ritual must be cast in complete darkness, or it automatically fails.
The following must be present in the chamber, but can be real or depicted in any way the Sorcerer chooses: a collection of water, representing the primordial ocean, and a block of hardened clay, representing the Sumerian Tablet of Destinies.
The Sorcerer invokes the name of the Sumerian hero Marduk in any way she desires, as long as she is calling upon his aid to strike at the forces of Tiamat, the forces of chaos and darkness. While chanting, the Sorcerer lets the blade taste her blood.
After ten minutes of invocation, if the roll is successful (which also incurs one lethal damage from the bloodletting), the ritual is complete. The obsidian blade becomes completely insubstantial, leaving only the handle solid. The blade now appears as a slowly swirling column of smoke extending from the handle but generally retaining its former shape. It remains in this fashion until a number of sunrises pass equal to the number of successes rolled. Afterward, the smoke dissipates and the obsidian blade is gone forever (thus requiring a new blade to be obtained for a new casting).
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. Blood Calls to Blood"] = {
					en = [==[Dark Ages Tome of Secrets, p. 43


2. Blood Calls to Blood


A vizier often needs to contact a member of the clan who is roving the world, in a court in Europe, or infiltrating a coterie to judge one of its members. By invoking the name of the Cainite he wishes to contact, the vizier can direct a sorcerer to reach out to the clan member in question as long as he faces that clan member’s general direction. If the vizier requesting the conversation is of lower generation than his target, the connection begins immediately and he may then speak into the clan member’s mind, hear sent thoughts, and even see through the eyes and hear through the ears of his fellow Assamite. If the requester is of a higher generation, the traveler gains full knowledge of who he and his sire are, where they are, and their general state of mind, and may accept or reject the communication.
The sorcerer merely acts as a conduit enabling the communication, and cannot take part nor hear any part of the exchange. She must spend a point of blood for every five minutes the connection stays open, rounded up. An Assamite of lower generation can use any Clan Disciplines that normally require physical proximity while communicating in this way.
Assamite Sorcery ritual casting: the Tome of Secrets states no roll of its own for these rituals; Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["2. Blood Crystal"] = {
					en = [==[Rites of Blood, p. 63


2. Blood Crystal


System: The number of successes determines the maximum number of blood points that can be stored in a single crystal. The sorcerer can withdraw any or all of his own vitae from a crystal at will. Any other character who handles the crystal and meditates upon it will magically withdraw one point of vitae from it into her own body if she obtains even one success on a Willpower roll (difficulty 7). This includes mortals or even supernatural beings such as Lupines or mages. If the meditating character has suffered any injuries, the blood heals her as if she were a ghoul who had consciously spent blood for healing. A character who meditates on a crystal successfully on three occasions will become blood bound to the crystal’s creator (assuming it contained enough vitae). However, while the crystal still contains vitae, it carries a sympathetic link to its creator equivalent to a point of his vitae when in the hands of a rival blood magician.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Blood Walk"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 232


2. Blood Walk


System: This ritual requires three hours to cast, reduced by 15 minutes for each success on the roll. It requires one blood point from the subject. Each success allows the caster to “see back” one Generation (to a limit of the Fourth Generation — the Third Generation do not give up their secrets so easily), giving the caster both the true name of the ancestor and an image of his face. The caster also learns the Generation and Clan or bloodline from which the subject is descended. With three successes, the caster also learns the identities of all parties with whom the subject shares a blood bond, either as regnant or thrall.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Borne by Wind"] = {
					en = [==[Dark Ages Tome of Secrets, p. 50


2. Borne by Wind


System: Once the rite is completed, the koldun is capable of swooping into an area if a wind is present and he can see his destination. With one turn’s focus, he disappears from his original location, traveling at the speed of the wind, and reappears at his intended destination. This rite cannot be used if being attacked, as the Cainite cannot focus in such an occasion. It allows him to make a surprise attack on an unsuspecting foe, however. This rite is neutralized if the koldun utilizes it to launch an attack, and misses his first blow.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["2. Burning Blade"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 232


2. Burning Blade


System: This ritual can only be cast on melee weapons. The caster must cut the palm of her weapon hand during the ritual — with the weapon if it is edged, otherwise with a sharp stone. This inflicts a single health level of lethal damage, which cannot be soaked but may be healed normally. The player spends three blood points, which are absorbed by the weapon. Once the ritual is cast, the weapon inflicts aggravated damage on all supernatural creatures for the next few successful attacks, one per success rolled. Multiple castings of Burning Blade cannot be “stacked” for longer durations.
Furthermore, the wielder of the weapon cannot choose to do normal damage and “save up” aggravated strikes — each successful attack uses one aggravated strike until there are none left, at which point the weapon reverts to inflicting normal damage.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Comforting Darkness"] = {
					en = [==[Lore of the Clans, p. 126


2. Comforting Darkness


System: Once this ritual is cast, the vampire makes a Stamina + Occult roll (difficulty 8). If she botches, the darkness burns her, and she takes an aggravated level of damage. If she succeeds, she may then spend one blood point for each success, regardless of Generational limits. For each blood point she spends in this way, she may heal three levels of bashing or lethal damage.
Unfortunately there is an additional cost before the darkness inside is sated. All blood the vampire consumes feeds the dark inside, not even entering her own system. This goes on until twice as much blood has been consumed as was originally spent. Until this cost is paid, the Cainite cannot use this ritual again. It can also only be used once each night.
Side Effect: The taint of darkness never leaves the caster’s blood, turning it a dark ruddy hue, almost black, forever.
Abyss Mysticism (p. 125): Abyss Mysticism is difficult and time consuming to learn, and comes at a cost. Its rituals often have side effects that create Flaws the character cannot remove that provide no bonus points. To learn the power, a vampire must have at least one dot in both Obtenebration and Occult. She may not learn any Abyss rituals higher than the lowest of her Obtenebration or Occult ratings, and each ritual costs a number of experience points equal to three times the ritual’s level. Abyss rituals are cast using a Wits + Occult roll. The difficulty is 3 + the level of the ritual being cast. Only one success is required to cast the ritual, but the Storyteller is encouraged to make the penalties for failure especially horrifying.]==],
				},
				["2. Commune with Cainite"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 304


2. Commune with Cainite


By enacting this ritual, a caster may join minds with another Cainite, speaking telepathically with her over any distance. The caster must meditate for ten minutes over a physical token once owned by the other Cainite to create the connection. The communication may be maintained for one scene, or until either party ends the conversation.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["2. Concentrated Vitae"] = {
					en = [==[Dark Ages Tome of Secrets, p. 50


2. Concentrated Vitae


System: Upon completion of the rite, blood consumed when mixed with the chosen water conveys double the number of blood points as normal. The rite only concludes if the water is befouled with another substance.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["2. Craft Bloodstone"] = {
					en = [==[Rites of Blood, p. 147


2. Craft Bloodstone


System: A thaumaturge may create a number of Bloodstones up to her permanent Willpower rating. She instinctively knows the precise direction and general distance from the caster. If a Bloodstone is obfuscated or mystically hidden, the caster may follow the trail until she reaches the general location. Once there, the connection becomes blurred and she can no longer quite feel the Bloodstone. A Bloodstone that is destroyed severs its connection to the thaumaturge immediately, often with some form of painful backlash (which is distracting, but not damaging).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Craft Gris-Gris"] = {
					en = [==[Rites of Blood, p. 166


2. Craft Gris-Gris


System: While under the effects of the gris-gris curse, the target suffers a -1 penalty on all dice pools due to a constant, throbbing headache. This effect is permanent against mortals unless the bag is found and removed. Against Kindred, it lasts for one night per success but ends early if the bag is removed. In the hands of another wangateur with a higher Wanga rating, the bag has a sympathetic connection to its creator equal to a point of the creator’s blood.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. Donning the Mask of Shadows"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 233


2. Donning the Mask of Shadows


System: This ritual may be simultaneously cast on a number of subjects equal to the caster’s Occult rating; each individual past the first adds five minutes to the base casting time. Individuals under the Mask of Shadows can only be detected if the observer possesses a power (such as Auspex) sufficient to penetrate Obfuscate 3. The Mask of Shadows lasts a number of hours equal to the number of successes rolled when it is cast or until the caster voluntarily lowers it.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Draining the Well of Life"] = {
					en = [==[Rites of Blood, p. 93


2. Draining the Well of Life


System: Upon successfully casting the rite, the Necromancer gains all the blood he would normally obtain from the act of feeding from the victim, and each of his ghostly companions may replenish each of their Passion Pools by the same amount (ignoring any excess — see V20, p. 385). This is ultimately an act of murder and should therefore prompt a Humanity check. As such, this ritual is therefore practiced more often by those on a Path of Enlightenment (such as the Path of the Bones) that would not object to such an act being committed.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. Extinguish"] = {
					en = [==[Rites of Blood, p. 148


2. Extinguish


System: Casting the ritual requires that the thaumaturge recite an incantation and then pinch out a candle’s flame while spitting on the floor. Once completed, for the rest of the night, the thaumaturge may speak a single magical syllable to automatically extinguish a single fire up to the size of a bonfire. This power may be used a number of times equal to the number of successes on the activation roll for the ritual. The casting of this ritual may trigger a Rötschreck check (see V20, p. 299).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Eyes of Babel"] = {
					en = [==[Rites of Blood, p. 24


2. Eyes of Babel


System: The duration of the ritual is one week per success on the activation roll. This is a horrific ritual that will permanently maim a mortal (and isn’t too pleasant for Kindred, either), and all but the most inhumane Kindred are likely to have to make a Degeneration roll for attempting this ritual.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Eyes of the Dead"] = {
					en = [==[Dark Ages Tome of Secrets, p. 50


2. Eyes of the Dead


System: As per Servitor’s Perception, with the same restrictions and method of neutralization, but on spirits.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["2. Eyes of the Grave"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 179


2. Eyes of the Grave


This ritual, which takes two hours to cast, causes the target to experience intermittent visions of her death over the period of a week. The visions come without warning and can last up to a minute. The caster of the ritual has no idea what the visions contain, as only the victim sees them. Each time a vision manifests, the target must roll Courage (difficulty 7) or be reduced to quivering panic. The visions, which come randomly, can also interfere with activities such as driving, studying, shooting, and so on.
Eyes of the Grave requires a pinch of soil from a fresh grave.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. Eyes of the Night Hawk"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 233


2. Eyes of the Night Hawk


System: The vampire is able to mentally control where the bird travels for the duration of the ritual. The bird will not necessarily perform any other action than flight — the caster cannot command it to fight, pick up and return an object, or scratch a target. The bird returns to the vampire after finishing its flight. If the vampire does not put out the bird’s eyes, she suffers a three-night period of blindness. This ritual ceases effect at sunrise.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Feed the Darkness"] = {
					en = [==[Rites of Blood, p. 38


2. Feed the Darkness


System: The caster must spend fifteen minutes in contemplation at the beginning of the evening, chanting in Abyssal tongues and calling upon the spirits of the Abyss. The effects of this ritual last until the next sunrise.
Side Effect: While the caster’s body contains any vitae gained through the use of this ritual, her blood is a dark, blackish color. This causes notable dark streaks where her veins and arteries are near the surface of her flesh.
Abyssal Rituals (p. 37): The following rituals do not adhere to the same rules as other forms of magic, in large part because they build on a Discipline that is not truly a form of sorcery. To learn Abyss Mysticism, a Cainite must have at least one dot in both Obtenebration and one dot in Occult. Such a character may not learn Abyss rituals rated higher than her Obtenebration or Occult score (whichever is lower). Casting Abyss rituals requires a successful Wits + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to succeed. Unlike normal rituals, each Abyss Mysticism ritual costs 3 times the ritual level in experience points to learn. All rituals of Abyss Mysticism also have permanent side effects; under no circumstances do Flaws obtained from these side effects reward the vampire with bonus or experience points, nor can they be bought off.]==],
				},
				["2. Flaming Weapon"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 304


2. Flaming Weapon


This ritual affects only weapons usable by humans; it does not affect boulders or siege weaponry. The caster must cut the palm of her hand using the weapon (or a sharp object if the weapon has no edge) inflicting one level of unsoakable lethal damage; the player spends three blood points. If the ritual succeeds, the weapon is sheathed in a green, heatless flame that does not provoke Rötschreck. The flame can be obscured by covering it, and will not ignite other objects. The weapon inflicts aggravated damage for a number of strikes equal to the successes rolled. A wielder cannot choose whether a strike inflicts normal or aggravated damage, though the weapon must hit an object to deplete one of its charges. If a charged wooden melee weapon stakes a vampire, he suffers one level of aggravated damage per number of remaining successes left in the weapon, thus draining it of all charges. Enchanted missiles retain their magic for only one attack; each success scored in casting adds one extra die to the weapon’s damage. Only one casting of Flaming Weapon can be active on any given weapon; the charges on the weapon must be depleted before the ritual can be cast on the weapon again.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["2. Generation of the Acheron Vortex"] = {
					en = [==[Lore of the Bloodlines, p. 49


2. Generation of the Acheron Vortex


Harbingers of Skulls who taste the blood of Lasombra find their link to the Styx reawakened. Under the new moon, the necromancer must spill blood comprising Harbinger and Lasombra vitae into any body of water (from a puddle, to an ocean) and listen to voices from across the Shroud with a ritual such as Call of the Hungry Dead (V20, p. 177). A vortex forms, with each point of blood spilt making the whirlpool last an additional turn. Stepping into the vortex takes the vampire to the Shadowlands equivalent of the body of water, and a single person (mortal or vampire) can follow for each turn the vortex is still active. The ritual works in reverse, but requires the expenditure of two blood points from each individual following the necromancer from the Shadowlands to the Skinlands, and can only take place on a night under the full moon.
Necromantic ritual casting (V20, p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. Haruspicy"] = {
					en = [==[Rites of Blood, p. 62


2. Haruspicy


System: Each success allows the haruspex to ask one question about the subject’s past or present, while two successes may be spent to ask one question about the subject’s future. Using a larger sacrifice reduces the difficulty by 1. Using a human sacrifice reduces it by 3. These benefits stack with the -1 difficulty reduction from using a sanctified temple.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Haunting Breeze"] = {
					en = [==[Rites of Blood, p. 103


2. Haunting Breeze


Level Two Necromancy Ritual. The vampire can summon a light supernatural wind which serves to frighten and confuse all those within a small area or single building no larger than 100 feet/30 meters in diameter. Until the next sunrise (or until willfully dispelled by the caster), the wind in this location is filled with the soft echoes of whispers, warnings, curses, and the laughter of the dead. These terrifying sounds distract and disquiet, increasing the difficulty of Perception rolls by 2 and all other rolls by 1 for all those who remain within the area. In addition, all mortals must make a Courage roll (difficulty 4) or be spooked badly, leaving the area. Such individuals are unwilling to return under any circumstances for at least one hour.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. Hidden Haven"] = {
					en = [==[Rites of Blood, p. 101


2. Hidden Haven


System: The caster must surround the building, and mark all corners, doorways, and windowsills with chalk made of owl-feather ash. The ritual takes a full night to cast, and requires the caster to sacrifice a permanent point of Willpower. Those who wish to find the building without knowing the proper physical key must approach within 100 yards/meters of the structure’s location and make a successful Intelligence + Occult roll (difficulty 9) each time they wish to see through this ritual’s protection. Hidden Haven’s effects last for one year.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Illusion of Peaceful Death"] = {
					en = [==[Rites of Blood, p. 148


2. Illusion of Peaceful Death


System: The caster must have a pristine feather soaked in the blood of a good man that died peacefully. She must carefully dust the corpse with it while chanting the phrase “It must have been Frank’s time to go. At least he went out in his sleep.” This ritual does not add blood to a corpse, but it does reduce the chance that anyone will notice how much is gone. The body must still have at least half its original blood for this ritual to succeed. This increases the difficulty of any investigation powers or abilities used on the corpse by one per success on the ritual.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Implant the Bezoar"] = {
					en = [==[Dark Ages Tome of Secrets, p. 35


2. Implant the Bezoar


System: The Abyss Mystic must have access to an Oubliette, or stand in a lake during the new moon, and cut off a finger to produce a blood point. An Infantile Bezoar heads for the vitae, and attempts to enter the Abyss Mystic, unless she is prepared with an existing bowl of separate blood. The Bezoar will remain in the bowl for a night as it drinks its fill, during which time the Mystic can exit the Oubliette — if she knows the way out — carrying the bowl and the feeding parasite. The Bezoar will continue to feed until dawn, at which point it will travel to the nearest sleeping Cainite and crawl inside its mouth to avoid the daytime. The Infantile Bezoar’s statistics are stated on p. 33. It dissolves into a puddle of shadow after exiting its victim.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["2. Infusion of Kalif"] = {
					en = [==[Rites of Blood, p. 162


2. Infusion of Kalif


System: The sorcerer must obtain a quantity of hashish and soak it in a quantity of his own blood. The ratio is fairly high — twenty ounces of hashish is soaked in one point of blood, and the process (which takes three full nights) yields only one ounce of kalif per success. The “quality” of the kalif is determined by the Generation of the vampire whose blood was used in the ritual (which need not be that of the sorcerer). Each dot of Generation increases the quality by +1, so kalif successfully infused with the vitae of a Ninth Generation vampire would have a quality of four.
To properly use the kalif as part of a Dur-An-Ki ritual, one ounce of it must be placed into a hookah along with specially prepared rosewater. After smoking for at least half an hour, the player of the imbibing character must roll Stamina + Fortitude (difficulty 6, with a dice penalty equal to the quality of the kalif used in the ritual). There is something of a “sweet spot” that the sorcerer must reach. If sorcerer fails or botches, he becomes too intoxicated to do anything more than continue to enjoy the kalif (and for many Kindred, that’s enough). On the other hand, if the player rolls more successes than the character’s Dur-An-Ki rating, the character doesn’t get high at all and must continue smoking for another half hour interval before rolling again.
Only a number of successes greater than zero but equal to or less than the character’s Dur-An-Ki rating allow for him to reach the ecstatic state required to properly use kalif in further rituals. If the proper number of successes are rolled, the character enters a state of heightened awareness in which Dur-An-Ki is easier to perform. For the rest of the scene, the difficulty of any roll related to Dur-An-Ki paths or rituals is reduced by an amount equal to half the quality of the kalif.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. Invoke the Lesser Sign of Power"] = {
					en = [==[Rites of Blood, p. 157


2. Invoke the Lesser Sign of Power


System: For one hour per success, the koldun gains a -2 difficulty reduction on all Intimidation or Leadership rolls made against mortals, provided that she can make eye contact with them.
Koldunic Sorcery dice mechanics (p. 156): the roll to activate a Koldunic Sorcery ritual is Intelligence + Occult with a difficulty equal to 3 + the ritual rating. The school’s metaphysical connections to Kupala and to the lands permeated by that spirit increase the difficulty by +1 on all Koldunic Sorcery rolls made on behalf of kolduns who work their magic outside the territories of Eastern Europe.]==],
				},
				["2. Iron Body"] = {
					en = [==[Rites of Blood, p. 158


2. Iron Body


System: The ritual lasts for one hour per success and does not allow the recipient any additional soak. It just extends his normal soak to include fire and sunlight.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Machine Blitz"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 233


2. Machine Blitz


System: This ritual only stops machines; it does not grant any control over them. The effects of this ritual are invisible and appear to be coincidental.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Occhio d’Uomo Morto"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 179


2. Occhio d’Uomo Morto


To cast this ritual, the necromancer needs an eye from a corpse whose absent soul became a ghost or Spectre. The eye is ritually prepared in a process involving incense, the new moon, and a period of midnight chanting. The chanting climaxes when the necromancer removes one of her own eyes and replaces it with the one from the corpse (fresher is better). Kindred healing takes over at that point, sealing the eye within the socket.
If the ritual succeeds, the Necromancer permanently gains the Shroudsight ability (see p. 163). This ability is always active and does not require a roll.
Furthermore, if it was a Spectre’s corpse, the vampire can hear the vague murmuring of any Spectres in the area. This ability isn’t very precise; rather than mind reading, it’s more like trying to overhear a low-voiced conversation in the next room. With a Perception + Occult roll, the Necromancer can glean a very vague impression of what nearby Spectres are up to. Botching this roll may well earn the necromancer a new derangement (at the Storyteller’s discretion), as the whispers creep into the caster’s subconscious.
This ritual has some major drawbacks, the first being that its proper result is hideously ugly. Unless the vampire wears sunglasses or finds some other way to conceal her eye, her Appearance is reduced by one dot.
Also, dead or rotted tissue is not the best for normal perception. Any mundane visual Perception rolls are at +1 difficulty (possibly more if the corpse had bad eyesight in life). On the other hand, since the eye offers a window into a different soul than the necromancer, it offers some protection against powers requiring eye contact. These Disciplines are used against the dead-eyed necromancer at +1 difficulty.
Most importantly, however, the ghost whose body was desecrated knows it, and very likely hates it. The ghost can find the necromancer possessing his eye anywhere, and all ghostly powers used against the necromancer by that particular ghost are at –1 difficulty.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. Oinos of Dionysus"] = {
					en = [==[Rites of Blood, p. 148


2. Oinos of Dionysus


System: The caster must mix at least one point of his blood with the wine and spices. Once completed, the oinos must be ingested to take effect. After imbibing the oinos, a mortal must make a successful Willpower roll (difficulty 8) to take any action, as she is overcome by an artificially induced lethargy. This effect lasts a number of hours equal to the number of successes achieved on the activation roll. Subjects may resist this effect by scoring at least three successes on a Stamina roll (difficulty 8). Vampires and other supernatural creatures are unaffected by the Oinos of Dionysus, as their blood is too potent to be overpowered by this concoction.
Vampires that feed from a mortal under the effects of the Oinos of Dionysus feel a similar effect, but not one that overpowers them or impairs them. They feel an artificially inflated sense of happiness and remember nights when they were a mortal. In an emergency, the vampire under these effects can expend a blood point to flush the toxin from her system.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Parting the Veil"] = {
					en = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, p. 176


2. Parting the Veil


System: To successfully cast the rite, the necromancer will first need to find the Shadowlands reflection of a location of spiritual resonance, such as a temple, graveyard, or murder site, or a place where passions run highly, such as a sports stadium, drug den, or adolescent’s bedroom.
After lighting flames in the Shadowlands version of this location and exposing the flesh of her wrists to them (typically one either side of the caster), the necromancer will need to make a Courage roll to resist Rötschreck with a difficulty of 7. If Fortitude is used to mitigate the damage dealt by the fire (V20, p. 297), the ritual fails.
The caster must expend two blood points in order to douse the flames (more points must be spent if the flames are larger than those of torches). The Gauntlet is weakened for hours equal to the caster’s number of points in her highest Necromancy Path, and allows a translucent view into the mortal world.
A number of mortals equal to the number of blood points spent can pass through between the flames used in the rite, becoming trapped in the Shadowlands. The veil closes after either the requisite number of mortals passes through, or the hours run out.
Necromantic ritual casting (V20, p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. Prepare the Vessel"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 293


2. Prepare the Vessel


This ritual works well as a method of facilitating mediumship, a bargaining chip for ghosts who long to walk in the Skinlands, or as a rather unique form of psychological torture. Prepare the Vessel renders a subject (willing or unwilling) a fitting receptacle for spiritual possession. The target must have a hood (such as one used for hanged men) placed over his head for one hour. Until the next sunrise (regardless of whether the hood remains in place), any ghost or spirit attempting to possess the target gains two automatic successes when doing so. For more on ghostly possession, see p. 403.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["2. Preserve"] = {
					en = [==[Rites of Blood, p. 24


2. Preserve


System: Preserve allows the thaumaturge to mystically shield an item from the effects of time and usage. The thaumaturge must lightly coat the item with a point of her blood over the course of a night while chanting the proper incantations. Each success of the activation roll mystically preserves the item for an additional decade. The preserved item remains protected until the ritual expires. This ritual does not create a sympathetic link to the thaumaturge, as the blood used to power the ritual is absorbed completely by the object.
This ritual was designed primarily to preserve documents and texts, but a clever thaumaturge can utilize it for almost any item that can be held in the hand. The targeted item must be made of worked minerals and other natural materials, as artificial compounds (such as plastic) disrupt the ritual. Items that can be preserved include, but are not limited to, artwork, ancient weapons, jewelry, or clothing. This ritual does not make the targeted item invulnerable or even resistant to someone purposely harming it. For example, an ancient roman gladius will remain sharp and in good condition, but will still shatter if used improperly or if someone of sufficient strength attempts to snap the blade.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Principal Focus of Vitae Infusion"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 234


2. Principal Focus of Vitae Infusion


System: An object may store only one blood point of vitae. If a Kindred wishes to make an infused focus for an ally, she may do so, but the blood contained within must be her own. (If the ally then drinks the blood, he is one step closer to the blood bond). The ally must be present at the creation of the focus.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Puppet"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 179


2. Puppet


Used primarily to facilitate conversations with the recently departed, though also applied as a method of psychological torture, Puppet prepares a subject (willing or unwilling) as a suitable receptacle for ghostly possession. Over the course of one hour, the necromancer smears grave soil across the subject’s eyes, lips, and forehead. For the remainder of the night, any wraith attempting to take control of the subject gains two automatic successes. The ritual’s effects remain even if the soil is washed off.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. Recure of the Homeland"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 234


2. Recure of the Homeland


System: The Cainite must mix the earth with two points of her own blood to make a healing paste. One handful will heal one aggravated wound, and only one handful can be used per night. This ritual can only be used on the vampire who knows it.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Seal Egress"] = {
					en = [==[Rites of Blood, p. 25


2. Seal Egress


System: To cast Seal Egress, the thaumaturge must spread a point of her blood upon the four walls of the room she wishes to seal and then chant the proper incantation (which can be done outside the room). This ritual is a lengthy process requiring an hour to cast. Each success achieved on the activation roll extends the duration of the ritual by a decade. Seal Egress mystically seals every entrance to the room. Materials from the surrounding walls physically close over any openings into or out of the room, creating a perfect air-tight seal. Trespassers with mystical rituals such as Incorporeal Passage (V20, p. 236) or Disciplines such as Spectral Body (V20, p. 202) find that this room is mystically protected against their abilities. However, this ritual does not strengthen or protect the walls of said room, and thus it is possible for someone of sufficient strength to simply break through the walls of the room. Ghosts, spirits, and other creatures naturally immaterial may enter the room at will. (To bar such creatures, warding circles are required. See V20, p. 234)
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Self-Executing File"] = {
					en = [==[Rites of Blood, p. 68


2. Self-Executing File


System: To use Self-Executing File, the thaumaturge must first prepare the Technomancy ritual she wishes to disseminate into a computer file format. The Hacktivists and the Tremere technomancers alike use a special programming code that integrates a mixture of defunct computer languages and dead written languages. Using this language, the thaumaturge codes a complete description of the ritual to be transmitted and then reduces it to a .zip file. She then emails the file to the intended recipient. When the recipient clicks on the file to open it, a text box appears that informs the recipient that he has sixty seconds to activate the program by smearing some of his blood onto his right thumb and then placing it over the white box below the text. If the recipient does so before time runs out, the blood dissipates harmlessly, and the program automatically opens and downloads itself into the computer’s hard drive. An icon for the associated program appears on the desktop that is visible only to the recipient, and the program itself is an invisible file that cannot be detected on the hard drive by any means other than Technomancy. Every success after the first allows for one additional recipient, should the thaumaturge wish to send out more than one copy of the file.
Sample Programs (p. 68): Fangbook modifies the user’s computer, smartphone, or tablet so that any messages, pictures, or videos she uploads to Facebook, Twitter, or any other equivalent social networking site appear to be innocuous posts such as birthday greetings to random strangers or widely-shared photos or video memes of the day when viewed by non-vampires. Bloodspot, similarly, is a shareware blogging platform that can only be perceived as such by Kindred; when a Bloodspot page is viewed by one of the kine, she sees only a “Server Not Found” message or some comparable error message. FangChat is a chat messenger program that is capable of finding any Kindred who is online and opening a chat window on their computer which, according to the program’s creators, is completely untraceable; the message deletes itself after a couple of minutes, leaving no trace.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Subsume the Darkness"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 272


2. Subsume the Darkness


System: The vampire spends a full turn meditating on the Abyss, then spends one point of Willpower and rolls Stamina + Occult (difficulty 8), with a botch resulting in one level of aggravated damage. Each success allows the vampire to spend one blood point to heal two levels of lethal damage or four levels of bashing damage, ignoring generation limits for such an expenditure.
However, once the Mystic casts this ritual, the Abyss consumes all blood gained from feeding until it receives a number of blood points equal to the blood spent to heal. A Mystic may not use this ritual more than once per night, and may not use it until her debt to the Abyss has been paid in full. Furthermore, use of this ritual stains the Mystic’s soul. After use of this ritual, the Mystic’s blood becomes black and absorbs all light. This effect clearly marks the Mystic as something terrifyingly alien. Any mortal who sees the Mystic bleed (or cry) must pass a Courage check of 6 or roll one less die for all rolls for the remainder of the scene.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["2. Summon Guardian Spirit"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 305


2. Summon Guardian Spirit


The caster summons a spirit for the express purpose of guarding him. The spirit serves the caster for 24 hours and aids in no other way except to alert the caster to danger. Though the spirit cannot speak, the caster is often jarred (and awakened if at rest) by a sudden and strong intuitive sense when something is amiss. The spirit is only visible to the caster or those capable of seeing it through supernatural perception, such as Auspex. The spirit only appears during times of danger, staring at the caster while pointing in the threat’s direction.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["2. Thanatos’ Caress"] = {
					en = [==[Rites of Blood, p. 90


2. Thanatos’ Caress


System: Until the next sunrise, the Necromancer may perform a single use of “Putrefaction” upon a target (V20, p. 471), using the same systems as outlined for the original power.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. The Hand of Glory"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 179


2. The Hand of Glory


The Hand of Glory is a mummified hand used by the necromancer to anesthetize a home’s residents and, thereby, allow him free rein to do what he will in the residence. To create one, the necromancer wraps the severed hand of a condemned murderer in a shroud, draws it tight to squeeze out any remaining blood, and preserves the hand in an earthenware jar with salt, saltpeter, and long peppers. After a fortnight, the vampire removes the hand and dries it in an oven with vervain and fern. At the end of this process, if the roll to activate the ritual garners any successes, the creation is viable.
To use the Hand of Glory, the vampire first coats the fingertips of the mummified hand with a flammable substance derived from the fat of a hanged man and sets the fingers alight. The necromancer then recites the phrase, “Let all those who are asleep be asleep, and let those who are awake be awake.” All mortals within a household who are affected fall into a deep sleep and cannot be roused (the hand has no effect on supernatural creatures). For each unaffected occupant of a home, one finger of the hand will refuse to light. Botches may result in all of the fingers being lit but no one in the home being asleep. The hand may be extinguished at any time by the necromancer who created it. Anyone else wishing to douse the hand must use milk to do so — nothing else works. Once made, the Hand of Glory may be reused indefinitely. Effects last for one scene.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. The Jinx"] = {
					en = [==[Rites of Blood, p. 148


2. The Jinx


System: The thaumaturge must concentrate his anger toward the victim while burning an object that has a psychic resonance with the intended target as per the Principle of Identity (pp. 132-133). Each success gained on the activation roll for the casting of this ritual causes an automatic failure for the next roll the jinxed character makes, regardless of the outcome. If the caster achieves four successes on the activation roll, then the next four rolls for the jinxed character fail regardless of the outcome. The Jinx does not cause a botch, just a simple failure. If the Jinx is applied to a contested or extended action, the roll simply yields no successes for the current turn until the number of pending failures is expended.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. The Ritual of Pochtli"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 180


2. The Ritual of Pochtli


This ritual cannot be cast by itself, but only in conjunction with another Necromantic ritual, or with the heavily ritualized use of a Necromantic path. The action of the ritual is this: Two or more Kindred necromancers restrain a mortal vessel and inflict incisions in the shape of blasphemous symbols (typically subverted Egyptian hieroglyphs or Aztec symbols). They then drink from these injuries. Each participating Necromancer must make his own cut and drink from no other cut. Thereafter, the Necromantic power the Kindred seek to employ gains the benefit of all the participants’ knowledge. This ritual makes it possible for Necromancers to create truly fearsome feats of death magic.
The player rolls to activate this ritual as normal. If the roll succeeds, the Kindred who have participated in the ritual may work together on the path or ritual the Ritual of Pochtli is intended to assist, and players share successes. Note that the primary application of Necromancy requires its own roll, and that successes (and failures) garnered by the group are pooled. All Kindred participating in the ritual must know the Ritual of Pochtli as well as the ritual or path power the group seeks to enact.
The downside of this power is that a single player’s botch negates the successes of the entire group, resulting in a horrific failure for all the ritual workers.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. To Lace with Hidden Nectar"] = {
					en = [==[Rites of Blood, p. 84


2. To Lace with Hidden Nectar


System: This ritual relies on the Sorcerer being able to brew Typhon’s Brew to begin with. The Sorcerer brews a batch of the drink as per normal for the ritual, and casts To Lace with Hidden Nectar on the last night of the full month of the process. She then invests again the same amount of blood in the mixture as at the start of the process, and spends an equal amount of Willpower points. Any vampire who drinks a gallon of the brew loses the same amount of Willpower points (spread evenly over the following hour) as he becomes rapidly intoxicated. This has proven to be a remarkably useful tool for manipulating inebriated Kindred.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["2. Totenpass"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 294


2. Totenpass


The Impundulu necromancer ceremonially “kills” a mortal, laying him out on a bier and placing either two coins over his eyes or an inscribed tablet on his chest. The mortal may then leave his body and travel into the Underworld. He is not completely separated from this body – ghosts and other entities using Lifesight or Aura Perception will see a silver cord trailing from his soul to his still-living body. He can perceive the Underworld and speak to ghosts, but he cannot affect the Underworld physically.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["2. Two Centimes"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 180


2. Two Centimes


The necromancer ceremonially “kills” a mortal, laying him out on a pallet and putting pennies on his eyes. The mortal’s soul journeys to the Underworld, which he perceives, initially at least, as a way-station. The mortal can interact with the souls of the dead and travel elsewhere in the Underworld, while also retaining the power to speak to the vampire and describe what he’s experiencing. While in the Underworld, however, the subject’s soul cannot affect the environment. Although he may talk to other spirits, he may not physically interact with them or their surroundings — he is a “ghost among ghosts,” as it were. Minions may voluntarily undergo the ritual to assist necromancers, or the vampire may use Two Centimes to terrify unwilling victims.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["2. Ward"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 305


2. Ward


By invoking this ritual, the caster creates a ward that prevents unwanted trespassers from entering a location or handling an item. Wards can be cast on objects or enclosed spaces, such as a hallway or a portcullis arch, but only one ward may be cast on a particular object or space at any given time. The caster spends an hour ceremonially preparing the area or object to be warded, followed by plucking a hair from her head and snapping it in half. With a successful casting roll, a warded object or space cannot be moved or breached even slightly by a subject who does not meet the minimum requirement as set by the caster. All wards are tied to a single Attribute chosen by the caster when she enacts the ritual. In order to pick up a warded object or cross into a warded room, a subject must possess dots in the particular Attribute equal to or higher than the level of the Ward. Trait ratings for Wards begin at 2, as a level two ritual. Casting a ritual Ward at a higher level increases the trait rating proportionate to the level of the ritual cast. For example, a level three Ward has a minimum trait rating of 3 tied to a particular Attribute chosen by the caster when enacted. No one possessing a trait rating lower than 3 in the Attribute tied to the Ward may enter the premises or pick up the object the ward has been cast on. If she so desires, the caster may designate a password that, when mentally intoned while touching the Ward, allows others to bypass its minimum Attribute requirement. Wards last for a number of weeks equal to the amount of successes scored on the casting roll.
At the cost of one Willpower point per attempt, a subject prevented from interacting with a warded object or space may roll Willpower as an extended action (difficulty equal to 4 + the level of the ward), requiring an amount of successes equal to the caster’s Thaumaturgy rating to break an individual ward. A broken ward is accompanied by the sound of shattered glass, which the caster can hear regardless of her location. Thereafter, the ward is completely nullified and any may interact freely with the object or within the space.
This is a Haven Ritual (see Dedicate the Haven on p. 310).
Haven Ritual (p. 310): Once dedicated by Dedicate the Haven, a haven is open to more defenses; any Haven Ritual cast upon it is rendered permanent and has its casting difficulty decreased by three.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["2. Ward Versus Ghouls"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 234


2. Ward Versus Ghouls


System: Ghouls who touch warded objects suffer three dice of lethal damage. This damage occurs again if the ghoul touches the object further; indeed, a ghoul who consciously wishes to touch a warded object must spend a point of Willpower to do so.
This ritual wards only one object — if inscribed on the side of a car, the ward affects only that door or fender, not the whole car. Wards may be placed on weapons, even bullets, though this usually works best on small-caliber weapons. Bullets often warp upon firing, however, and for a ward to remain intact on a fired round, the player needs five successes on the Firearms roll.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Warding Circle versus Ghouls"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 234


2. Warding Circle versus Ghouls


System: The ritual requires three blood points of mortal blood. The caster determines the size of the warding circle when it is cast; the default radius is 10 feet/3 meters, and every 10-foot/3-meter increase raises the difficulty by one, to a maximum of 9 (one additional success is required for every increase past the number necessary to raise the difficulty to 9). The player spends one blood point for every 10 feet/3 meters of radius and rolls. The ritual takes the normal casting time if it is to be short-term (lasting for the rest of the night) or one night if it is to be long-term (lasting a year and a day).
Once the warding circle is established, any ghoul who attempts to cross its boundary feels a tingle on his skin and a slight breeze on his face — a successful Intelligence + Occult roll (difficulty 8) identifies this as a warding circle. If the ghoul attempts to press on, he must roll more successes on a Willpower roll (difficulty of the caster’s Thaumaturgy rating + 3) than the caster rolled when establishing the ward. Failure indicates that the ward blocks his passage and inflicts three dice of bashing damage, and his next roll to attempt to enter the circle is at +1 difficulty. If the ghoul leaves the circle and attempts to enter it again, he must repeat the roll. Attempts to leave the circle are not blocked.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Whispers of the Ghost"] = {
					en = [==[Rites of Blood, p. 149


2. Whispers of the Ghost


System: The caster must meditate for fifteen minutes in complete silence. Then she must sever the ear of a still-living creature and hold said ear in her left hand before using Astral Projection (V20, pp. 138-139 — the thaumaturge must possess Astral Projection in order to use this ritual). The thaumaturge may speak to the physical world in a ghostly whisper. If she wishes to be seen, she must spend a point of Willpower to manifest as normal, but that cancels the ritual. Should the “donor” of the ear die, the ritual immediately ends. Loss of morality may apply if the donation was not voluntary.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["2. Witch Eye"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 293


2. Witch Eye


By implanting an enchanted eye from the corpse of a restless soul in her own eye socket, the necromancer can permanently gain the Deathsight ability (see p. 403). The ritual is complex and takes an entire evening to perform. At midnight, the celebrant cuts out her own eye and the eye of the corpse. She then places the corpse’s eye in her own eye socket, and places her eye in the corpse. Vampiric healing takes place instantaneously, sealing the dead man’s eye into her eye socket. The eye itself does not heal, however. It remains unmoving and rotten in the necromancer’s face, causing her Appearance to decrease by 1 when the eye is visible. Even a freshly-harvested eye will cloud over and decay in a matter of hours. This increases the difficulty of Perception rolls involving mundane eyesight by 1. As the eye is no longer a proper window into the necromancer’s soul, however, the Witch Eye increases the difficulty of all Disciplines that require eye contact by 1.
The Witch Eye may also complicate a vampire’s life on a supernatural level. Any ghost whose body is being desecrated by the ritual knows immediately, and will likely be displeased by the necromancer’s actions. Even if the necromancer completes the ritual successfully, the ghost maintains a supernatural connection to the Witch Eye, causing all magical rolls he makes against the necromancer to be made at a -1 difficulty.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["2. Witness of Whispers"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 304


2. Witness of Whispers


This ritual creates a scrying device which can be used to either observe enemies and events from a position of relative safety or hear sounds over a great distance. The ritual requires a three-inch pin, a length of thread, the claw of a raven, three points of the caster’s vitae, a container, and one healthy human ear or eye (one or the other, but not both). The caster sews the eye or ear to the claw, and then seals the device in a container of her vitae. After a week has passed, the device animates and can now be placed in any location the caster wishes to survey from a distance. The claw allows the Witness of Whispers limited mobility and the ability to secure to any surface. To see or hear through the device, the user concentrates for five minutes and spends one blood point. Once a connection has been established, the caster may mentally move the device one foot per turn at will. For as long as the caster wishes, the device takes over her visual or auditory perceptions (depending on if she used an eye or an ear to create the device); instead of what stands before her, she sees or hears what the device sees or hears, but uses her own Perception. A Witness of Whispers has one health level and one dot in each Physical Attribute. The caster may deactivate the Witness of Whispers at will and may reactivate it anytime through following the above steps. It remains potent until destroyed,
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. A Shield of Mirror"] = {
					en = [==[Dark Ages Tome of Secrets, p. 43


3. A Shield of Mirror


With a dance performed in the light of the moon and the proper incantation, an Assamite may protect herself or another from a diablerist external to the clan. If performed correctly, this ritual will grant the recipient a blessing against diablerie. If any vampire attempts Amaranth against him within the same month, he instead takes all her blood into himself – this does not cause a blood bond.
Assamite Sorcery ritual casting: the Tome of Secrets states no roll of its own for these rituals; Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. A Touch of Nightshade"] = {
					en = [==[Rites of Blood, p. 149


3. A Touch of Nightshade


System: This ritual creates a skin-contact poison that may only be used once before it turns inert. If the poison is not used by the end of the evening, the power fizzles and the poison is rendered useless.
The thaumaturge must apply the mystical poison to her own skin (which is immune to the poison) and then touch her intended target. The Storyteller may require a Dexterity roll or a Manipulation roll to touch the victim, depending upon the circumstances. Once per night, until the potency of the poison fades, the victim must make a Stamina + Fortitude (difficulty 8) check to resist the effects of the poison. With three or more successes, the target resists the toxic effects of the poison, but still suffers from minor headaches and feels that something is wrong. Otherwise, the victim suffers an extreme reaction to the poison, causing sweating, blurred vision, and convulsions. The difficulty for all rolls for the remainder of the evening is increased by one. (Remember that Kindred sweat blood! This can be a real problem for Kindred trying to preserve the Masquerade.)
The numbers of successes on the activation roll for the ritual determines the potency of the poison. Each success adds an additional night of effectiveness for the poison.
The effects of this mystical poison may be countered by the ritual Purity of the Flesh (V20, p. 232).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Abyssal Threads"] = {
					en = [==[Rites of Blood, p. 38


3. Abyssal Threads


System: The individual or item to which the thread is being affixed must be present while the ritual is cast. This ritual takes thirty minutes of casting, during which time the Abyss Mystic draws forth a point of his blood and mixes it with the preternatural essence of the Abyss. By spinning this combined matter upon a skein, the caster forms the Abyssal Thread, and may then attach it as desired. The effects of this ritual last until the next sunrise.
Side Effect: While this ritual is in effect, the cold air of the Abyss circulates around the caster, and may draw unwanted attention. The caster effectively gains the Flaw Cold Breeze for the duration of this ritual’s effects. (V20, p.494).
Abyssal Rituals (p. 37): The following rituals do not adhere to the same rules as other forms of magic, in large part because they build on a Discipline that is not truly a form of sorcery. To learn Abyss Mysticism, a Cainite must have at least one dot in both Obtenebration and one dot in Occult. Such a character may not learn Abyss rituals rated higher than her Obtenebration or Occult score (whichever is lower). Casting Abyss rituals requires a successful Wits + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to succeed. Unlike normal rituals, each Abyss Mysticism ritual costs 3 times the ritual level in experience points to learn. All rituals of Abyss Mysticism also have permanent side effects; under no circumstances do Flaws obtained from these side effects reward the vampire with bonus or experience points, nor can they be bought off.]==],
				},
				["3. Amulet of Mnemosyne"] = {
					en = [==[Rites of Blood, p. 25


3. Amulet of Mnemosyne


System: The thaumaturge creates an amulet forged from brass and soaked in a pool of her blood. Next, she must recite the proper incantations over the amulet while it is resting on an object that symbolizes the truth to the thaumaturge. Finally, the subject (who does not need to be the thaumaturge) must prick her lips, kiss the amulet, and then whisper her secret.
Once activated, this secret is completely removed from the mind of the subject until she reverses the ritual by again kissing the amulet. Memories are completely rewritten to account for the missing information. These new memories are generated by the power of the magic; neither the thaumaturge nor the subject has any control over the specific details.
Should the amulet be destroyed, the secret will return to the mind of the owner.
If a rival thaumaturge discovers the amulet, and knows or researches this ritual, he may attempt to learn the secret it contains. Holding the amulet to his ear, the rival thaumaturge engages the original caster in a contested Willpower roll. Should the rival thaumaturge win, the secret is implanted in his mind. The caster will feel uneasy as though something is wrong, but will not know the root cause as she has forgotten the secret.
The downside of this ritual is that the subject has no idea that the secret exists or that she has hidden it within the amulet. She will act as per her typical personality would suggest, which could cause a number of complications. Ironically, by hiding the secret, the subject leaves herself vulnerable. For example, if the subject murdered the Prince’s childe, she won’t know to be careful at court or to be watchful that others might have learned her secret.
A crafty thaumaturge will ensure that the amulet is placed in her hands after the danger in passed by mailing it to herself or hiding it away with a trusted retainer with a note written in her own hands. Because of this, any thaumaturge who knows the ritual will flinch anytime she finds an Amulet of Mnemosyne, dreading the secret she might unlock.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Angra Mainyu Consumes Spenta Mainyu"] = {
					en = [==[Dark Ages Tome of Secrets, p. 37


3. Angra Mainyu Consumes Spenta Mainyu


System: The Abyss Mystic must drink a goblet of hot tar, succeeding on a Stamina-based roll (difficulty 9) to avoid throwing it up immediately. Consuming the tar deals two levels of aggravated damage, which may be soaked with Fortitude. This tar remains within the body of the Mystic for a number of nights equal to the successes rolled. At any point while bearing the tar, the Abyss Mystic may roll a Courage test (difficulty 6) to vomit the tar in a shower of unnatural darkness that filters through the air like inky bubbles, gravitating to any light. The tar wraps itself around any such light, and prevents it from relighting for the remainder of the night. The radius over which the tar will travel is equal to 10 meters (11 yards) per success on the Courage test. This does not protect from the sun.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["3. Animate Curios"] = {
					en = [==[Dark Ages Tome of Secrets, p. 50


3. Animate Curios


System: Once the rite is concluded, the combat and intimidation ability of anything animated is determined by Storyteller discretion. A mundane, traditionally non-violent tool or object bears an Intimidation pool no greater than 3, and a combat pool no greater than 4; a weapon or dangerous apparatus has an Intimidation pool no greater than 5, and a combat pool no greater than 7. The rite concludes if the koldun’s haven is put to the torch or the objects are destroyed.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["3. Animated Assistants"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 306


3. Animated Assistants


This ritual allows the intrepid caster to animate temporary servants. The caster slices open her arm and flicks one blood point while incanting for five minutes for every ten feet of space. The ritual lasts one night per success rolled, animating whatever items happen to be lying around, such as rocks, glass beakers, dissection tools, quill pens, or books. All of the animated objects are intuitively linked to the caster’s subconscious. Any tool the caster needs readies itself within reach of the caster or accomplishes minor tasks for her, like note taking, cleaning, sewing, grinding ingredients in a mortar and pestle, etc. However, these objects cannot physically attack or defend the caster.
This is a Haven Ritual (see Dedicate the Haven on p. 310).
Haven Ritual (p. 310): Once dedicated by Dedicate the Haven, a haven is open to more defenses; any Haven Ritual cast upon it is rendered permanent and has its casting difficulty decreased by three.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. BFU"] = {
					en = [==[Rites of Blood, p. 66


3. BFU


System: Once the target reads that message, she must immediately roll for rage frenzy at a +2 difficulty. Furthermore, the effects persist, and for the next several nights, she will find that all difficulties to resist rage frenzy are increased by 1. The message itself lasts for one night per success, and if it is not observed by the intended recipient, the ritual is wasted. If the recipient does see it, the increased frenzy difficulties persist for an additional one night per success, even if she sees the message on the last night that it could possibly affect her.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Balthazar’s Revelation"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 272


3. Balthazar’s Revelation


This strange expression of Abyss Mysticism comes from the Kiasyd bloodline. It peels back the veils that keep a stable mind safe from the dark truths of the world. The ritualist enchants a small object, usually a coin. Anyone holding the coin must make a Willpower roll, difficulty 9 minus their Obtenebration rating. Failure imposes a Derangement chosen when the object was enchanted, which lasts until the victim has spent Willpower equal to the ritualist’s Obtenebration rating. Additionally, the victim sees nightshades and other strange entities everywhere. This causes +2 difficulty to all Perception rolls, and +2 to all Courage difficulties so long as the Derangement persists.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["3. Bind the Familiar"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 306


3. Bind the Familiar


• It is immune to the Blood Oath, mental or social compulsion of a supernatural nature (such as Animalism), and may not be made into a ghoul.
• It gains one additional dot of Intelligence, possessing roughly the same intellectual capability as a 10-year-old child.
• It may verbally speak the native language of its master and communicate telepathically with him, regardless of the distance separating them.
• Pain (though not actual damage) is mutually felt by and shared between the caster and the familiar.
• The caster may spend one blood point to adopt the perceptions of the familiar at the expense of his own, allowing his consciousness to reside within its body and experiencing through its senses.
• All familiars are loyal as if bound by the Blood Oath, and so long as they are properly fed their normal diet, they never age and remain perfectly healthy. At Storyteller discretion, casters may increase the strength of a familiar as a Background through spending their own experience points to improve the creature’s statistics.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. Blood Dance"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 180


3. Blood Dance


The Blood Dance allows a ghost to communicate with a living relative. Necromancers sometimes perform this ritual for people in exchange for money or favors.
The vampire must dance and chant for two hours, calling forth the right spirit and entreating all other ghosts to leave the area. While dancing, the vampire pours colored sands and ocean salt on the ground in a precise pattern and then makes the link between the living person and the deceased. If successful, the ghost “appears” within the necromancer’s sand-sigil and the living person can communicate with her for one hour. Failure means the spirit could not be contacted.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["3. Blood and Bane"] = {
					en = [==[Rites of Blood, p. 37


3. Blood and Bane


System: The Al-Aziz must spend an hour in ecstatic dance, chant, and meditation. Using the birth name of her victim and a small token belonging to that individual – a lock of hair, or some item of personal significance – she targets her spell upon that person. The caster must make a Wits + Occult roll (difficulty 7). For each success, she reduces the target’s level of Thaumaturgy in their primary path by one dot. The effects of this ritual lasts until the next sunrise, or until the caster releases the spell or is destroyed.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["3. Bound by Oath"] = {
					en = [==[Rites of Blood, p. 77


3. Bound by Oath


System: When the participants make an attack in unison against the selected target, a number of them (equal to the successes achieved in the casting) can propel themselves up the initiative order to act one round before the target. For example, four Assamites are attacking a target. The target acts on initiative 10, but three of the Assamites roll initiatives of 9, 9 and 7 respectively. Two successes were achieved in the casting, allowing two of the three stragglers to act on initiative 11 instead. The third remains on their original initiative order. The ritual only grants its benefit if all of the participants (including the Sorcerer) actively engage their target at the beginning of the combat.
In addition, each participant in the combat has a bonus (equal to the successes in the casting) to any Alertness rolls for that scene. The effects of the ritual last until the following sunrise, or until the end of the first combat against their target, whichever comes first.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["3. Brotherhood of the Cup"] = {
					en = [==[Lore of the Clans, p. 221


3. Brotherhood of the Cup


System: While no Tremere would admit it, this ritual bears a concerning similarity to the Vaulderie. In addition to the ritualist, it requires at least four other Tremere (although tradition requires a total of seven) to put their blood into a chalice. Anyone who drinks from the cup becomes blood bound, but to Clan Tremere and what they perceive to be its goals. The effect lasts for one hour for each success gained on the roll. Once the ritual wears off, so do the effects. This does not count as having drunk once from any of the Tremere who conducted the ritual.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Bull of Heaven"] = {
					en = [==[Rites of Blood, p. 163


3. Bull of Heaven


System: The ashipu must drink from the animal while simultaneously feeding it blood. One point of blood is sufficient for any animal smaller than a man. Three points is required for any animal larger than man-sized, up to the size of a bull. Animals larger than cannot be used for this ritual. Upon receiving the blood, the animal immediately becomes a ghoul, gaining one dot of Potence and one dot of either Fortitude or any other Discipline possessed by the ashipu which does not require sapience (such as Dominate or Dur-An-Ki). For the remainder of the night, the ashipu can reflexively direct the animal at will and see through its senses while retaining his normal awareness of his surroundings.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["3. Calling the Hungry Shade"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 272


3. Calling the Hungry Shade


System: Beginning just after dusk, the Mystic paints a circle in his own blood. She spends hours in chants of evocation, completing the summoning just after moonset. Upon completion, the Mystic rolls Intelligence + Occult, difficulty 9. The difficulty may be lowered by 1 for each additional Mystic that assists in the ritual, with a maximum number of participants equal to the caster’s Occult rating. Failure means the ritual fails to produce a Shade, and a botch results in the Shade attacking the caster.
On a success, the Mystic summons a Hungry Shade. The Hungry Shade possesses Strength, Dexterity, and Stamina equal to the caster’s rating in Obtenebration, with a maximum value of 4. It is always in shadow form, as Talon of the Abyss.
Hungry Shade (p. 272): The following scores are equal to the caster’s rating in Obtenebration.
Attributes: Strength, Stamina, Dexterity
Abilities: Alertness, Athletics, Brawl, Intimidation, Melee, Stealth
It also possesses the following:
Disciplines: Assign a number of points to Disciplines equal to the caster’s rating in Obtenebration. The Hungry Shade may not possess Disciplines not known by the caster or assisting Mystics (if any).
Willpower: 6
Health: 12
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["3. Claiming the Dark"] = {
					en = [==[Lore of the Clans, p. 126


3. Claiming the Dark


System: When casting this ritual, the vampire cuts herself open with a knife and draws the surrounding shadows into her own body. The process takes an hour and is very painful, subtracting two dice from any rolls the Cainite makes for the duration. After this torment, the vampire makes a Manipulation + Occult roll (difficulty 8) to hold the power of the shadows inside her. If she fails, the shadows escape her, and if she botches, the shadows take a blood point for each 1 rolled as well.
If she succeeds, her skin turns dark and her eyes become black. All her physical attributes rise to the level of her Obtenebration if they are lower. Obtenebration powers up to level three are used at -2 difficulty, and the blood point cost for Arms of the Abyss is eliminated. This augmentation lasts for as long as the vampire desires.
Unfortunately, upon rising from slumber each night, the vampire in this condition must pay an additional blood point cost equal to their Obtenebration rating. Should she fail to do so, she returns to normal. In her augmented form, she is also more vulnerable to sunlight and takes triple damage from it. Her Appearance also drops by one point while empowered.
Side Effect: Should the vampire spend more consecutive days in this form than her highest Virtue, her skin begins to darken permanently, in a similar way to elder Assamites.
Abyss Mysticism (p. 125): Abyss Mysticism is difficult and time consuming to learn, and comes at a cost. Its rituals often have side effects that create Flaws the character cannot remove that provide no bonus points. To learn the power, a vampire must have at least one dot in both Obtenebration and Occult. She may not learn any Abyss rituals higher than the lowest of her Obtenebration or Occult ratings, and each ritual costs a number of experience points equal to three times the ritual’s level. Abyss rituals are cast using a Wits + Occult roll. The difficulty is 3 + the level of the ritual being cast. Only one success is required to cast the ritual, but the Storyteller is encouraged to make the penalties for failure especially horrifying.]==],
				},
				["3. Clinging of the Insect"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 235


3. Clinging of the Insect


System: The character may move at half her normal rate while climbing walls or ceilings. This power lasts for one scene, or until the vampire spits out the spider.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Cowing the Servant"] = {
					en = [==[Rites of Blood, p. 157


3. Cowing the Servant


System: For one week per success, the difficulty of any roll made for the koldun to manipulate the servant is reduced by -1.
Koldunic Sorcery dice mechanics (p. 156): the roll to activate a Koldunic Sorcery ritual is Intelligence + Occult with a difficulty equal to 3 + the ritual rating. The school’s metaphysical connections to Kupala and to the lands permeated by that spirit increase the difficulty by +1 on all Koldunic Sorcery rolls made on behalf of kolduns who work their magic outside the territories of Eastern Europe.]==],
				},
				["3. Craft Dream Catcher"] = {
					en = [==[Rites of Blood, p. 62


3. Craft Dream Catcher


System: Once created, the dream catcher lasts for one week per success. As long as the owner has the dream catcher on his person or within five feet/three meters, he gains the following benefits: First, the difficulty for all attacks made against him by spirits increases by 2. Second, the difficulty for all attempts to influence his mind or his dreams while he sleeps increases by 2. Finally, if the owner is a vampire, the difficulty for him to awaken during the day in response to potential danger decreases by 2.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Dante’s Urban Legend"] = {
					en = [==[Rites of Blood, p. 26


3. Dante’s Urban Legend


System: The caster must recreate the exact urban legend she wishes to propagate at the location. For example, she might need to steal some kidneys from a drunken mortal or kill a group of teenagers with a hook. Afterwards, she must sacrifice a point of blood to each entrance of the house or location.
Typically thaumaturges are careful to select an urban legend that does not remind others of vampires. Some will cast this ritual on the property of their rivals to make a point. Once the ritual is enacted, rumors will soon circulate among the mortals that the house is haunted or cursed, and therefore should be avoided by anyone with sense. Property values around the “haunted” house will plummet as neighbors move to avoid living next to the house that causes them nightmares.
These mortals rationally disbelieve in the supernatural, but they will feel disturbed by the thought of the location protected by the ritual and attempt to avoid it. Strong-willed mortals may feel curious enough to make a Willpower check (difficulty 8) to attempt to enter the building or area – failure means that they create some excuse to avoid entering. The duration of this ritual is one decade plus an additional year for every additional success achieved on the activation roll.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Death’s Head"] = {
					en = [==[Rites of Blood, p. 103


3. Death’s Head


Level Three Necromancy Ritual. Some necromancers of the Tal’Mahe’Ra collect fragments of hair, bone, ash, or flesh from their enemies as a reminder of a victory. Using Necromancy, they use these remains to create a paint-like residue with which they decorate porcelain masks known as Death’s Heads. Once activated, such a mask causes its wearer (who may be someone other than the Necromancer who made the mask) to appear as a wraith so long as she wears the mask. In the physical world, the wearer looks translucent and ghostlike (but is granted no special ability to pass through physical items or cross into the Shadowlands). In the Shadowlands, the wearer can pass as a wraith even among true wraiths. Note that the user’s aura becomes pale, like that of a wraith (and their creature type reads as a wraith), but this does not hide or alter any other patterns or colors (such as diablerie streaks).
A Death’s Head, once painted, is enchanted but inactive until used. Once activated (by putting the mask on), the mask crumbles into dust, leaving a faint pattern of bone-white marks across the user’s face. If the user wills the effect to end early; the soft patterns fade into nothingness and the user is returned to their normal physical appearance. A necromancer may create only one Death’s Head at a time; any already-existing masks are destroyed (or active uses cancelled) when a second is created. It takes one full night to create a Death’s Head.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["3. Din of the Damned"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 180


3. Din of the Damned


This ritual is similar to the Level One Ritual Call of the Hungry Dead (see p. 177) in that it makes the sounds of the Underworld audible in the physical realm. However, Din of the Damned is an area-effecting ritual used to ward a room against eavesdropping. Over the course of half an hour, the necromancer draws an unbroken line of ash from a crematorium along the room’s walls (this line may pass over doorframes to allow entrance and egress). For the rest of the night, any attempt to listen in on events inside the room, whether simple (such as a glass to the wall), electronic (like a laser microphone), or mystic (including powers such as Heightened Senses), requires the eavesdropper to score more successes in a Perception + Occult roll (difficulty 7) than the caster of the ritual scored. Failure to beat this mark gives the listener an earful of ghostly wailing and moaning and the sound of howling winds; a botch deafens him for the rest of the night.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["3. Displacement of the Pneuma"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 311


3. Displacement of the Pneuma


Follower of Set Ritual. This ritual takes twenty minutes to perform and requires a mortal victim restrained upright on a flat surface, as well as an animal (such as a goat or pig) tethered nearby. The witch cuts her wrist and ritually “slays” the prisoner by drawing a dull blade across his throat (doing no damage), while allowing the blood to gush from her wrist down the victim’s chest. The ritual only works if the victim is unaware of the trickery and momentarily believes his own throat has been slashed. At this moment, the witch shouts a word of power as loudly as she can into the victim’s ear. If successful, she shocks the victim’s soul out of his body and into that of the animal. The victim lives the rest of the animal’s lifespan trapped in its body; lacking in the animal’s instincts, he may be ill-equipped to survive. A semblance of the victim’s intellect, shorn of memory, desire or Willpower, remains in the human body. The soulless being is suggestible and follows the witch’s instructions, so long as they require no interpretation. Without volition, the thrall doesn’t seek its own basic survival and will perish of thirst if not ordered to drink.
Clan rituals (p. 302): Clan rituals are jealously guarded secrets that are never shared with those not belonging to the clan or bloodline harboring its mysteries.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. Divine Sign"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 180


3. Divine Sign


Upon learning a person’s birth date, the necromancer’s player may roll to activate this ritual. If successful, the Kindred may use this to predict the target’s next course of action, allowing him to deal with it accordingly. The effect on ghosts is quite different: Instead, the ritual imparts upon the necromancer so intimate an understanding of the wraith in question that it acts as a connection to the ghost, making it easier to invoke other Necromancy effects on that spirit. For story purposes, it’s the equivalent to holding one of that wraith’s fetters (see Ritual of the Unearthed Fetter, below).
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["3. Enfolding the Believers"] = {
					en = [==[Rites of Blood, p. 64


3. Enfolding the Believers


System: The effects last for one week per success. Each follower still retains his normal blood bound loyalty to the regnant, but he will also experience strong feelings of love and affection to every mortal who participates in the ritual with him, no matter how many that may be. Each participant will also feel a strong sense of loyalty and devotion to the ideals and dogmas of the cult. It is still possible for conflict to erupt if two or more followers express genuine disagreement about the cult’s beliefs or the regnant’s desires, but if the regnant herself is on hand, such squabbles can be easily resolved. In addition to any other benefits of group loyalty, this ritual can also indirectly benefit the sorcerer herself. For every five people who are under the effect of this ritual and who are present to assist the sorcerer in her other occult activities, the sorcerer gains a +1 die bonus on all rolls pertaining to paths or rituals. This ritual has no effect on Kindred.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Father’s Freedom"] = {
					en = [==[Rites of Blood, p. 101


3. Father’s Freedom


System: This ritual takes an hour to enact, and requires 10 points of blood be spent by the caster during the course of the casting. The target of the ritual must remain within the ritual circle (a maximum 100 square foot/10 square meter area) throughout the casting, although she may be restrained by physical force or supernatural means. If the ritual is successful, it immediately removes all effects of this diablerie (both good and bad) from the target, except that the ritual does not restore any morality loss incurred by diablerizing.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Flesh of Fiery Touch"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 235


3. Flesh of Fiery Touch


System: Flesh of Fiery Touch takes two hours to cast (reduced by 10 minutes per success). It requires a small piece of wood, coal, or other common fuel source, which ignites and is swallowed at the end of the ritual. The subject who swallows the red-hot ember receives a single aggravated health level of damage (difficulty 6 to soak with Fortitude). Until the next sunset, anyone who touches the subject’s flesh receives a burn that inflicts a single aggravated health level of damage (again, difficulty 6 to soak with Fortitude). The victim must voluntarily touch the subject; this damage is not inflicted if the victim is touched or accidentally comes in contact with the subject.
This ritual darkens the subject’s skin to that which would be obtained by long-term exposure to the sun in a mortal. The tone is slightly unnatural and metallic, and is clearly artificial to any observer who succeeds in a Perception + Medicine roll (difficulty 8).
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Hell’s Calling"] = {
					en = [==[Rites of Blood, p. 158


3. Hell’s Calling


System: Upon this ritual’s completion, the target must immediately roll for fear frenzy. The effect may be overcome by spending a Willpower point, but otherwise, a failed roll causes the target to enter frenzy and flee the area in terror. The character will also have no idea why she is suddenly overcome with terror, and once she thinks to ask herself what she is afraid of, the effect will end.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Incorporeal Passage"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 236


3. Incorporeal Passage


System: This ritual lasts a number of hours equal to the number of successes scored on a Wits + Survival roll (difficulty 6). The caster may prematurely end the ritual (and, thus, her incorporeality) by turning the mirror shard away so that it no longer reflects her image.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Inscription"] = {
					en = [==[Rites of Blood, p. 150


3. Inscription


System: A thaumaturge who knows the techniques of Inscription can write an abbreviated form of any first or second level ritual that she knows, at a cost of two blood points. Anyone who can read the language used may then recast the ritual later. Casting the ritual from the notes requires the use of the usual components and time, as well as an Intelligence + Occult roll, but the caster need not have any knowledge of Thaumaturgy. Once an inscription is complete, the power of the writer’s vitae is trapped in the object; her maximum blood pool is effectively reduced by one until the inscription is used. After use, the inscription dries into a fine, illegible ash, with all the power expelled from the ink. The scribe can use the inscription himself (which is rather pointless) or give it to someone else.
It is well known in magical circles that the blood powering Inscription can be used for links of Sympathy and Identity, and an incautious thaumaturge could find her blood in the hands of an enemy who can use it against him. To prevent an inscription from reaching the wrong subject, many scribes also use the Encrypt Missive on their enchanted notes to ensure that only the intended recipient may use this ritual.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Mirror of Second Sight"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 236


3. Mirror of Second Sight


System: The ritual requires one point of the vampire’s blood. Thereafter, the mirror reflects images of other supernatural creatures’ true forms — werewolves appear in their hulking man-wolf shapes, magi glow in a scintillating nimbus, ghosts become visible (in the mirror), and so on. Sometimes, the mirror also reveals those possessed of True Faith in clouds of golden light.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Nightmare Drums"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 180


3. Nightmare Drums


The necromancer using this ritual sends the dead to haunt the dreams of an enemy, using the ghosts to drive an opponent slowly insane. Once the ritual is cast, the vampire has no control over this power, except to stop it from continuing. The shape of the nightmares and the images that assault the target are not under the control of the necromancer; they are under the control of the ghosts who actually do the haunting.
The necromancer uses his own blood and a personal possession of the target’s in this ritual. Once the item has been coated with blood, the vampire must burn the item, sending a ghostly icon of it to the Shadowlands both as an identifying badge and as a reward to the ghosts who agree to haunt the target. While the item burns, the necromancer (and assistants, if available) pound out a relentless beat on gigantic drums of human skin. The drums are inaudible in this realm but thunderous in the home of the dead. To silence the deafening drums, the ghosts resignedly agree to negotiate with the necromancer. They promise to send nightmares to the victim for as long as the vampire demands, in return for a favor. Their request normally runs along the lines of passing a message to a living relative or exacting revenge against someone who slighted them.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["3. One with the Dark"] = {
					en = [==[Dark Ages Tome of Secrets, p. 36


3. One with the Dark


System: The Abyss Mystic must be in an Oubliette, or an enclosed space with no light on a night of the half moon. He must prepare his body with ritual tattoos designed by master Mystics, said to be in the language of the Abyss. Stripped naked and covered in pitch, the Cainite convulses and produces a minimum of three blood points from his orifices, requiring a Stamina + Occult roll (difficulty 6). Each success grants the Mystic a secret belonging to any of the Cainites named in the ritual — the secrets to be determined by the Storyteller — and makes the skin of the Abyss Mystic turn an unnatural, smoking black in color. The Abyss Mystic’s Appearance rises to four dots, or by one dot regardless of Generation limits — whichever would be higher — until the next half moon; if the Cainite is on any Road other than that of Sin or the Abyss, performing this ritual reduces the rating by one permanently. On a failure, the ritual does not succeed and his peers shun the Abyss Mystic for at least a month. On a botch, every Cainite in the local domain sees the Abyss Mystic’s secrets while they sleep.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["3. One with the Forest"] = {
					en = [==[Dark Ages Tome of Secrets, p. 51


3. One with the Forest


System: In the forest where the rite concluded, the koldun may step into any tree broader than him, and emerge from another in the same forest, of equal or greater breadth. The vampire cannot remain in the tree. This permanent effect is neutralized when a tree the Cainite has stepped into that night is felled.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["3. Pavis of Foul Presence"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 236


3. Pavis of Foul Presence


System: This ritual lasts against a number of effects equal to the successes rolled, or until the sunrise after it is enacted. Note that the Presence Discipline power must actually succeed before being reversed by the ritual. As such, only powers that specifically target the caster (and thus, require a roll to succeed) can be reversed — “passive” powers such as Majesty are not affected.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Rings Like Chains"] = {
					en = [==[Rites of Blood, p. 84


3. Rings Like Chains


System: As long as both the Sorcerer and recipient are wearing the items of jewelry, when the intended target next partakes of an addictive substance (drugs, alcohol, Vitae, etc.), the Sorcerer becomes aware of it and has the choice of making them both become automatically addicted to the substance in question. The effects of the ritual fade after this first instance, whether the Sorcerer activates it or not. This provides a Setite Sorcerer an immense amount of leverage over a given target, by creating a new vice for him to exploit.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["3. Ritual of The Unearthed Fetter"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 181


3. Ritual of The Unearthed Fetter


This ritual requires that a necromancer have a finger bone from the skeleton of the particular ghost he’s interested in. When the ritual is cast, the finger bone becomes attuned to something vitally important to the wraith, the possession of which by the necromancer makes the casting of Necromantic powers against that ghost much easier (see the Sepulchre Path, p. 160, for an example). Most necromancers take the attuned finger bone and suspend it from a thread, allowing it to act as a sort of supernatural compass and following it to the special item in question.
Ritual of the Unearthed Fetter takes three hours to cast properly. It requires both the name of the ghost targeted and the finger bone already mentioned, as well as a chip knocked off a gravestone or other marker (not necessarily the marker of the bone’s former owner). During the course of the ritual the stone crumbles to dust, which is then sprinkled over the finger bone.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["3. Rutor’s Hands"] = {
					en = [==[Rites of Blood, p. 150


3. Rutor’s Hands


System: The casting of this ritual requires that the thaumaturge cut off her hand and pluck out her eye at the conclusion of this ritual; this causes five-levels of unsoakable aggravated damage. Once this damage is healed, the Tremere regenerates her hand and eye, though the ghastly homunculus may still prowl. Completing this ritual may also require a Willpower roll at the Storyteller’s discretion, simply to carry out the painful finale. The animate hand has one health level of its own and moves about with the equivalent of two dots in each Physical Attribute and in Perception (see p. 108). The caster mentally directs the thing’s movement at will (so long as the thaumaturge remains conscious, of course). The Hand must have one point of blood each week, or else it crumbles to dust. Likewise, if the hand is exposed to sunlight or fire, it vanishes with a squeal, leaving behind a putrid stench.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Samira’s Kihanah"] = {
					en = [==[Dark Ages Tome of Secrets, p. 117


3. Samira’s Kihanah


Samira’s Kihanah allows the caster to know that which is truly unknown. To use this ritual, she takes a small, metal, hand-crafted object, no larger than her forearm, and smears it with three blood points over six hours, under the blood moon. The object absorbs the blood, and it takes a reddish hue. Once the ritual is cast, it summons forth a djinn. The caster, or indeed anyone else who holds the object, may ask a question lost to time. This is to say, a question to which no living (or Cainite) person knows the answer. Otherwise, the question remains unanswered. The djinn spreads its consciousness throughout space and time, and returns instantaneously with the answer. However, the djinn will always try to phrase the answer in such a way that the curious questioner will find massive trouble, despite its truth. With each answered question, the red fades slightly, until the third question, at which time the djinn flees the world of flesh. The object remains enchanted until fully depleted. Unanswered questions do not deplete the object.
Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. Sanguine Assistant"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 236


3. Sanguine Assistant


System: The player spends five blood points and rolls. The servant created by the ritual stands a foot (30 cm) high and appears as a roughly humanoid shape composed of whatever the ritual sucked in for its own use. It lasts for one night per success rolled. At the end of the last night, the assistant crawls into the bowl used for its creation and falls apart. The assistant can be reanimated through another application of this ritual; if the caster so desires, it re-forms from the same materials with the same memories and personality.
A Sanguine Assistant has Strength and Stamina of 1, and Dexterity and Mental Attributes equal to those of the caster. It begins with no Social Attributes to speak of, but gains one dot per night in Charisma and Manipulation until its ratings are equal to those of the caster. It has all of the caster’s Abilities at one dot lower than his own. A Sanguine Assistant is a naturally timid creature and flees if attacked, though it will try to defend its master’s life at the cost of its own. It has no Disciplines of its own, but has a full understanding of all of its master’s Thaumaturgical knowledge and can instruct others if so commanded. A Sanguine Assistant is impervious to any mind-controlling Disciplines or magic, so completely is it bound to its creator’s will.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Sanguine Trail"] = {
					en = [==[Lore of the Clans, p. 221


3. Sanguine Trail


System: If the ritual is successful, the caster can see a connection between the target and anyone he is blood bound to. If multiple bonds are in place, the power user can see one for each success she makes. If she achieves five successes, she can also see which direction each bond goes, revealing who is bound to whom.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Scorpion Sending"] = {
					en = [==[Rites of Blood, p. 166


3. Scorpion Sending


System: The scorpion has the normal traits for an animal of its size, but if it strikes the target successfully, he is poisoned. The poison inflicts one level of lethal damage every fifteen minutes. The damage ends if the target successfully rolls Stamina (difficulty 7) with one roll every fifteen minutes. The venom attacks mortals and supernaturals alike. The scorpion is small and therefore difficult to see (Perception + Alertness, difficulty 7).
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["3. Scry the Hearthstone"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 307


3. Scry the Hearthstone


With this ritual, the caster or a subject whom she casts it on becomes linked with a haven (up to the size of a small castle). The subject may detect intruders of any sort, even if they are out of sight or under the veil of Obfuscate or similar powers. The ritual takes an entire night to complete and involves continuous incantation in conjunction with marking the subject’s vitae at the cardinal boundaries of the haven, followed by the caster expending a point of Willpower to activate the effects. When completed, the subject gains an innate sense of the location and approximate size and physical condition of all living or unliving beings within the structure. To pinpoint an individual’s location, the player rolls Perception + Awareness (difficulty 6); if the target is attempting to hide, she contests with a Wits + Stealth roll (difficulty 6), and whoever achieves the most successes is the victor. Regardless of the subject’s success or failure on the roll, she knows there is someone present, even if she cannot see the individual in question. To detect intruders employing magical or supernatural abilities of concealment such as Obfuscate, the subject must possess and have supernatural perception (such as Auspex) of her own activated at the time (see “Seeing the Unseen” sidebar on p. 195). Scry the Hearthstone lasts for a number of weeks equal to the successes scored on the initial casting roll and is only tied to the location associated with the casting.
This is both a Gargoyle and a Haven Ritual (see Enchant Talisman on p. 309 and Dedicate the Haven on p. 310).
Haven Ritual (p. 310): Once dedicated by Dedicate the Haven, a haven is open to more defenses; any Haven Ritual cast upon it is rendered permanent and has its casting difficulty decreased by three.
Gargoyle Rituals (p. 309): Tremere thaumaturges may cast Enchant Talisman onto a Gargoyle to permanently enchant it with a specific ritual she knows. To accomplish this feat requires six hours per night, and one week per level of the ritual. Once successfully cast, a ritual permanently enchanted onto a Gargoyle becomes inherent to him, like a Discipline, and may be activated, deactivated, and reactivated at will by the Gargoyle spending one blood point. If the ritual is tied to a specific item, it is instead tied to the Gargoyle itself. A Gargoyle invoking Scry the Hearthstone may utilize the effects of the ritual on any dwelling by directly touching it and spending a point of Willpower. Rituals activated by a Gargoyle require no roll to cast and last a scene or until dismissed.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. Shaft of Belated Quiescence"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 237


3. Shaft of Belated Quiescence


System: The ritual takes five hours to enact, minus 30 minutes per success. The stake must be carved of rowan wood, coated with three blood points of the caster’s blood, and blackened in an oak-wood fire. When the ritual is complete, the stake is enchanted to act as described above.
An attack with a Shaft of Belated Quiescence is performed as with a normal stake: a Dexterity + Melee roll (difficulty 6, modified as per the normal combat rules; the attack does not need to specifically target the heart) with a lethal damage rating of Strength + 1. If at least one health level of damage is inflicted after the target rolls to soak, the tip of the stake breaks off and begins burrowing. If not, the stake may be used to make subsequent attacks until it strikes deep enough to activate.
Once the tip of the stake is in the victim’s body, the Storyteller begins an extended roll of the caster’s Thaumaturgy rating (difficulty 9), rolling once per hour of game time. Successes on this roll are added to the successes scored in the initial attack. This represents the tip’s progress toward the victim’s heart. A botch indicates that the tip has struck a bone and all accumulated successes are lost (including those from the initial attack roll). Removing the part of the body where the tip impacted (such as a Tzimisce turning into blood or a vampire cutting off their arm) may stop the tip’s progress, depending on the number of successes acquired and the Storyteller’s discretion. When the shaft accumulates a total of 15 successes, it reaches the victim’s heart. This paralyzes Kindred and is instantly fatal to mortals and ghouls.
Attempts to surgically remove the tip of the shaft can be made with an extended Dexterity + Medicine roll made once per hour (difficulty 7 for Kindred and 8 for mortals). The surgeon must accumulate a number of successes equal to those currently held by the shaft in order to remove the tip. Once surgery begins, however, the shaft begins actively evading the surgeon’s probes, and its rolls are made once every 30 minutes for the duration of the surgery attempt. Each individual surgery roll that scores less than three successes inflicts an additional unsoakable level of lethal damage on the patient.
Shaft of Belated Quiescence may be performed on other wooden impaling weapons, such as spears, arrows, practice swords, and pool cues, provided that they are made of rowan wood. It may not, however, create a Bullet of Belated Quiescence.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Soul of the Homunculus"] = {
					en = [==[Rites of Blood, p. 151


3. Soul of the Homunculus


System: A homunculus (see p. 107) has two health levels and two dots in each Physical Attribute. It works much like a limb of the creator, as the homunculus only moves or acts if the caster so wills it. Homunculi are damaged by sunlight and fire like Kindred. A homunculus, though created from the caster’s flesh, is a separate physical entity, and thus does not count as an arcane connection, nor do its bodily fluids count as its creator’s blood.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Strength in Wisdom"] = {
					en = [==[Dark Ages Tome of Secrets, p. 43


3. Strength in Wisdom


A sorcerer who witnesses an immoral act that serves as evidence of a Cainite’s unworthiness may instill protections upon the warrior or warriors sent to apprehend him. This ritual grants bonus dice equal to the successes rolled. These dice can be divided however the sorcerer wishes among any physical or mental defenses against the target. Any roll using these bonus dice benefit from -1 difficulty.
Assamite Sorcery ritual casting: the Tome of Secrets states no roll of its own for these rituals; Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["3. Summoning the Blatherskites"] = {
					en = [==[Dark Ages Tome of Secrets, p. 36


3. Summoning the Blatherskites


System: The Cainite incanting this ritual must have familiarity with the domain in which she wishes the blatherskites to emerge, having already succeeded on a Perception + Survival roll (difficulty 6) on a night prior to the summoning, in order to identify the darkest cracks. From these, the blatherskites birth. The Abyss Mystic must submerge herself in a body of water and make an extended test of Manipulation + Occult (difficulty 7) with a target of 10, 15, or 20 successes. Over the course of that night, for each target number hit, a blatherskite emerges in the chosen domain and attacks at random whomever it comes across. You do not choose a target; another blatherskite emerges at each benchmark. It can only be harmed by aggravated damage and it melts when the sun rises. On a botched extended test, a blatherskite emerges from the body of water in which the Cainite performs the rite, and attacks its summoner. The blatherskite’s statistics are stated on p. 33.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["3. Telecommunication"] = {
					en = [==[Rites of Blood, p. 68


3. Telecommunication


System: The successes rolled create a dice pool which the thaumaturge can use to either observe through or control the screen at any point over the next seven nights. The player must roll this dice pool either to see and hear through the screen (difficulty 4) or to control what the screen plays for others (difficulty 7). A botch on either of those rolls ends the ritual’s effect immediately.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Tempest Prison"] = {
					en = [==[Rites of Blood, p. 94


3. Tempest Prison


System: Upon completion of the rite, the ground shudders for a moment to indicate its success. Digging up the glass container, it is now full of a swirling purple and black mist, in which can be seen occasional flecks of light, like miniature lighting. When the Necromancer opens the bottle, any wraith in line of sight of the container must make a Strength test (using their Strength stat as it is when in the Shadowlands) against a Difficulty of 6 plus the number of successes gained upon on the casting of the Ritual. This test is repeated each round until the wraith is out of sight of the container, or it fails and is sucked immediately into the vortex (which does not leave the container).
The Tempest Prison can hold a number of wraiths equal to five times the number of successes rolled in its activation. It also lasts for a number of nights equal to five times successes rolled, after which time, the vortex subsides and the wraiths are released. This may also be ended prematurely by simply smashing the container (which may lead to suddenly dealing with a storm of angry wraiths).
The Tempest Prison does not necessarily need to be wielded by a Necromancer after it has been created. It requires a Necromancer to create it, but not to use it. Indeed, many Giovanni who are called upon to rid an area of ghostly interference lend their employers such a container to collect the troublesome ghosts. They then “dispose” of the ghosts elsewhere. In these cases, both sides of the deal get what they want.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["3. Tempesta Scudo"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 181


3. Tempesta Scudo


Unlike most rituals, Tempesta Scudo can be cast speedily. The necromancer performs a short and awkward dance that ends with her biting through her own lip and spitting the blood in a circle around her. All ghosts’ actions within the circle of blood are made at +2 difficulty.
To cast this ritual successfully, the necromancer must spend one combat turn performing the dance. At the end of the turn, she makes a Dexterity + Performance roll against difficulty 7 (if done outside of combat, the difficulty is only 6). During the next combat turn, she bites through her own lips (taking a level of bashing damage) and spits (spending one blood point). Then the normal ritual roll is made to see whether the power takes effect.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["3. The Bottled Voice"] = {
					en = [==[Rites of Blood, p. 150


3. The Bottled Voice


System: To cast the ritual, the thaumaturge must immobilize the victim. This can be done via staking or binding the target. The caster must have unfettered access to the victim while he attempts to draw forth the voice. Each point of Willpower the victim currently possesses extends the required casting time by fifteen minutes. Once the ritual is complete, the crystal bottle contains the essence of the victim’s voice, and she may not speak nor make any verbal sound until the seal or the crystal bottle has been broken. The death of the thaumaturge does not break this curse.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. The Floating Dead"] = {
					en = [==[Dark Ages Tome of Secrets, p. 51


3. The Floating Dead


System: When the rite is concluded, the Cainite gains the ability to cross rivers, lakes, and even seas without sinking beneath the waves. This permanent power is nullified if the Cainite is ever submerged in water, by choice or force.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["3. The Third Eye of Rickard Argentis"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 273


3. The Third Eye of Rickard Argentis


This ritual summons forth a mysterious third eye, forged from abyssal energies, which rests upon the caster’s forehead and protects him from harm. The ritual takes ten minutes to cast as close to dusk as he is able, at which time the caster chooses how much blood to invest in the eye. At any time the caster would be ambushed or surprised, the eye will expend one of the blood so invested. When this happens, the caster automatically succeeds on the roll to react to surprise, and the eye reflexively summons forth one Arm of Ahriman (see p. 229) against his attacker, which can act immediately. If the player chooses to expend further blood points, additional Arms can be summoned against other attackers, but no more than one per attacker.
Once the blood is fully expended, the eye vanishes until recast.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["3. Translocation of the Vessel"] = {
					en = [==[Rites of Blood, p. 27


3. Translocation of the Vessel


System: Translocation of the Vessel requires that the thaumaturge select a vessel to attune to her vitae. This item must be small enough that she can easily lift it with one hand. Examples might include a scalpel, a walking stick, a handbag, a pouch, or a wand. Next, she must soak the vessel in a point of her blood over the course of an evening. The object will slowly absorb the vitae, creating a sympathetic bond between the vessel and the thaumaturge. The caster may sever the link at any time by spending a point of Willpower or if the vessel is broken.
When the caster wishes to have the vessel ready for translocation, she draws a circle of protection onto the ground with purified salt and a point of her blood. This circle must be large enough to completely surround the vessel. Once the vessel is placed into the circle of protection, it can be summoned to the thaumaturge by name, anywhere in the world. The caster must extend her hand, chant the incantation involving the name of the object, and it appears in her hand.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Transubstantiation of Seven"] = {
					en = [==[Rites of Blood, p. 151


3. Transubstantiation of Seven


System: The caster of the Transubstantiation must sacrifice a point of her own blood. The blood placed in the chalice remains unchanged until after it’s imbibed and then spread throughout the subject’s system, at which point it takes on the properties of the Council of Seven.
This causes one step toward a blood bond to the whole council, but guarantees that the councilors’ vitae cannot be stolen. Because the blood is already in the subject’s system, it counts as his own vitae if it is later drained out.
In truth, there is no physical requirement that this rite be used on a new neonate. A rare few Tremere neonates escape the process. Theoretically, the rite could also be used to generate a stronger bond in older Tremere or even in ghouls or Kindred of other Clans. Kindred of the 14th or 15th generations, ghouls, and revenants cannot use this rite — their blood is not sufficiently strong enough to channel the councilors’ power.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Ward of the Winged Sepulcher"] = {
					en = [==[Lore of the Bloodlines, p. 37


3. Ward of the Winged Sepulcher


System: The caster must prepare a small cube, half an inch in diameter, carefully cut from a tombstone marking an empty grave in a graveyard. Spending a blood point, he dabs each side of the cube with a drop of blood, whispering an incantation. The caster ingests the cube and the ritual lies dormant until the creature’s skin is touched by sunlight, at which point wings unfurl to protect the caster. The wing hardens to a stone-like substance and it is able to protect one person inside its space. If the caster does not already possess wings, the ward does one level of aggravated damage if only protecting the caster, two if protecting the caster and one other subject.
Gargoyle rituals (p. 37): Enchanting a Gargoyle with a ritual requires casting the ritual for six hours a night, for one week per level of the ritual to be applied, but otherwise uses the same rules as Enchant Talisman. Rituals activated by a Gargoyle require no roll to cast, and last a scene or until dismissed. A Gargoyle enchanted in this matter can spend its own blood or Willpower as if it were the caster of the ritual enchanted into its blood. If no cost is normally required for the ritual, however, the Gargoyle must still spend at least one blood to activate it. If the ritual requires a specific item, the Gargoyle herself is considered to be the “item” for purposes of the ritual.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Ward versus Lupines"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 237


3. Ward versus Lupines


System: Ward versus Lupines behaves exactly as does Ward versus Ghouls, but it affects werewolves rather than ghouls. The ritual requires a handful of silver dust rather than a blood point.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Warding Circle versus Lupines"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 234


3. Warding Circle versus Lupines


System: As Warding Circle versus Ghouls (p. 234), but the circle affects werewolves. The ritual requires the same material component as Ward versus Lupines — silver dust — but in a larger amount. The caster determines the size of the warding circle when it is cast; the default radius is 10 feet/3 meters, and every 10-foot/3-meter increase raises the difficulty by one, to a maximum of 9. The ritual takes the normal casting time if it is to be short-term (lasting for the rest of the night) or one night if it is to be long-term (lasting a year and a day).
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["3. Wield the Spear of Damnation"] = {
					en = [==[Dark Ages Companion, p. 116


3. Wield the Spear of Damnation


This ritual recalls the legend of Caine itself, dedicating a weapon to satisfy a vampire’s nature just as the Dark Father cursed himself, when he raised a sharp stone against his brother. The Tremere writes Genesis 4:10 (“And he said, ‘What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.’”) upon an edged weapon in purported angelic script, during a meditative trance. This requires one hour. From that moment forward, half the lethal damage inflicted by the weapon (rounded up) converts to blood points, filling the wielder’s pool. This persists until the weapon has harvested the caster’s Thaumaturgy rating + ritual successes in blood points. Blood so harvested doesn’t inflict extra damage (it comes straight from blood shed by the wound), but is of the target’s type. Lupine blood remains doubly potent, and other blood types have their signature effects.
Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["4. Animated Weapon"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 307


4. Animated Weapon


• The weapon has an effective life of five combat turns per success rolled on its creation.
• The weapon’s attack dice pool is equal to the caster’s Wits + Occult, and its damage dice pool equal to the caster’s Thaumaturgy rating. The weapon always aims for the heart (difficulty 9). If the weapon is wooden, use the staking rules (p. 348) to judge its success. Three successes on a Dexterity roll (difficulty 8) are required to remove animated wooden splinters from a victim’s heart without leaving behind any shards.
• The weapon’s maximum movement rate is 30 yards/meters per turn, and it may only perform actions to attack or move toward its target. The weapon cannot dodge or split its dice pool to perform multiple attacks.
• The weapon has three health levels, and the difficulty of attacks directed against it are increased by three due to its spastic movement patterns.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["4. Baleful Doll"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 181


4. Baleful Doll


A baleful doll is a powerful figure that is linked directly to the spirit of the target. This doll must be handcrafted, and is only finished when it has been painted with the blood of the necromancer and dressed in some article of clothing from the victim (which should be unwashed for a better connection). Once the doll has been cursed, the vampire can use it to cause physical damage to the target. If the doll is injured (often with pins or other items), the victim takes six dice of bashing damage. If the doll is destroyed, the target suffers six dice of lethal damage.
The necromancer must craft the doll, using ritual chants throughout the process. This normally takes four to five hours. The player rolls Stamina + Crafts (difficulty 8) to succeed in this part of the ritual — a doll that does not resemble its victim is useless for the purposes of this ritual, though some necromancers sell failures as “authentic voodoo dolls” to tourists.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["4. Baron Zaraguin’s Sting"] = {
					en = [==[Rites of Blood, p. 66


4. Baron Zaraguin’s Sting


System: For every two successes (rounded up) rolled on the ritual, the vampire takes one level of lethal damage from scorpion stings. This damage is unsoakable but can be healed normally. In exchange for submitting to the scorpions’ stings, however, the vampire also gains Baron Zaraquin’s blessing for one night per success. During that time the difficulty on all rolls to supernaturally influence the sorcerer (such as Dominate or Majesty) or to read her aura or her mind increases to 9. Furthermore, any character who attempts to use such powers against the sorcerer suffers one unsoakable point of psychic bashing damage for every 1 rolled on the attempt. If such a roll actually botches, the damage is lethal and the character also has a brief vision of a giant spiritual scorpion, a manifestation of Baron Zaraguin, as its tail strikes her in the forehead for the affront.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Bastone Diabolico"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 181


4. Bastone Diabolico


Casting this ritual is tricky because it requires the removal of a leg bone from a living person. The donor must survive the removal, at least for a little while. The bone is then submerged in molten lead. Once it cools, the thin lead coating is inscribed with various runes. The necromancer then uses this metal-shod bone to beat its donor to death while repeating a droning Greek chant.
With a successful roll, this ritual produces a bastone diabolico or “devil stick.” The stick can be activated by anyone who holds it and expends a point of Willpower. Activation lasts for a scene, and during that time any ghost hit with the devil stick loses a point from its Passion pool (see p. 385). In addition to its normal effects, this club does an additional die of damage when used against the walking dead (not vampires), and such damage is aggravated.
Unfortunately for the necromancer, ghosts can sense that the bastone diabolico is bad news, even if they don’t know exactly what the thing does. They tend to stay away from anybody carrying one, which means that all rolls for such a character to use powers that summon or attract ghosts occur at +1 difficulty.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["4. Bone of Lies"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 237


4. Bone of Lies


System: The bone imbued with this magical power must be at least 200 years old and must absorb 10 blood points on the night that the ritual is cast. Each lie the holder wishes to tell consumes one of these blood points, and the holder must speak the truth immediately thereafter. When all 10 blood points have been consumed, the bone’s magic ceases to work.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Boukephos’ Gateway"] = {
					en = [==[Dark Ages Tome of Secrets, p. 37


4. Boukephos’ Gateway


System: The Abyss Mystic spends one whole night staring into a mirror, only darkness reflected back. As the night proceeds, the Mystic must spend three Willpower points, and then succeed on a Conviction roll (difficulty 8) on which no Willpower can be spent. The vampire remains in place, staring at the mirror, even after the sun comes up. Another three Willpower points must be spent, and another Conviction roll must be made (difficulty 9) on which no temporary Willpower points can be spent. Come the following night, the vampire turns from the mirror having gazed into the Abyss and her own, empty soul. If successful, the Cainite bears a broad grin and is now on the Road of the Abyss. In addition, he spends one fewer blood point on Obtenebration powers forevermore. On a failure, the vampire can never move on to the Road of the Abyss, but can attempt the ritual again for the Obtenebration benefit. A botch results in the vampire falling directly into torpor, from which only the vitae of a Lasombra of lower Generation can rouse her. She may never attempt the ritual again, and gains a Derangement.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["4. Cadaver’s Touch"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 182


4. Cadaver’s Touch


By chanting for three hours and melting a wax doll in the shape of the target, the necromancer turns a mortal target into a corpselike ruin. As the doll loses the last of its form, the target becomes cold and clammy. His pulse becomes weak and thready, and his flesh pale and chalky. For all intents and purposes, he becomes a reasonable facsimile of the walking dead. This can have some adverse effects in social situations (+2 difficulty on all Social rolls). The effects of the ritual wear off only when the wax of the doll is permitted to solidify. If the wax is allowed to boil off, the spell is broken.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["4. Candle of Haunting"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 308


4. Candle of Haunting


On a Friday night, the caster creates a black candle incorporating the brains and bones of a dead man with nine pinches of cemetery dirt. By burning the candle for 20 minutes each night while clutching and concentrating on an item that once belonged to the target, the caster plagues the victim with poltergeist-like activity such as thrown objects or furniture that moves to trip her. The candle is large enough to burn for a number of 20-minute periods equal to the caster’s successes on the casting roll. Each 20-minute increment costs the caster one blood point. A single success will set the poltergeist against the victim for 24 hours. The poltergeist has an Intimidation and a Fright rating of 4 each (each Fright point adds one die to attempts to scare), Strength 2, and a dice pool of 4 for its pranks and attacks. In order to scare the target, the poltergeist must make a contested roll using its Fright rating + Intimidation against the victim’s Self-Control or Instinct + Courage. With five or more successes, the target’s hair turns white and if mortal, she may very well have a heart attack. The poltergeist tries to cause serious harm at least once every night that it harasses the target, using whatever props it finds on hand. If the ghostly force shoves the target while she walks down a steep flight of stairs or throws something while she rides a horse or steers a carriage, the target is likely to be seriously injured.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["4. Directing Ahriman’s Lance"] = {
					en = [==[Rites of Blood, p. 163


4. Directing Ahriman’s Lance


System: To determine how long the ritual lasts, the ashipu must first use the Horoscope ritual against the target or, if the birth date and death date of the target is unknown, he may cast a horoscope for the assassin who will wield the talisman. In the latter case, only that assassin may benefit from the talisman’s properties, but in the former case, anyone can use the talisman. When Horoscope is used in conjunction with this ritual, the talisman will function for a number of nights equal to the successes rolled for the Horoscope. During that time, any roll made by the bearer of the talisman which bring him closer to killing the target benefit from a difficulty reduction equal to the successes rolled for this ritual.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["4. Dismemberment of Osiris"] = {
					en = [==[Rites of Blood, p. 167


4. Dismemberment of Osiris


System: The results are largely a matter of Storyteller discretion, influenced by the success of the ritual. As a general rule, assume that each success on the roll results in a cumulative 10% reduction in the size and resources of the targeted group.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["4. Evoke the Storm"] = {
					en = [==[Dark Ages Tome of Secrets, p. 52


4. Evoke the Storm


System: To activate the powers imbued by this rite, the Cainite must stand somewhere elevated and open, where the full horizon can be viewed without obstruction, such as a cliff or grand castle. From this point, the koldun can summon forth gales and storms anywhere he can see, stopping just short of hurricanes. The effects of this power are to be determined by the player, with agreement by the Storyteller. This permanent rite is waived if the practitioner is ever awake past the dawn.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["4. Firewalker"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 238


4. Firewalker


System: Cutting off one’s finger does not do any health levels of damage, but it hurts like hell and requires a Willpower roll to perform. This ritual may be cast on other vampires (at the expense of the caster’s fingertips...). If the subject has no Fortitude, he may soak fire with his Stamina for the duration of this ritual. If the vampire has Fortitude, he may soak fire with his Stamina + Fortitude for the duration of the ritual. This ritual lasts one hour.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Heart of Stone"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 238


4. Heart of Stone


System: This ritual requires nine hours (reduced by one hour for every success). It can only be cast on oneself. The caster lies naked on a flat stone surface and places a bare candle over his heart. The candle burns down to nothing over the course of the ritual, causing one aggravated health level of damage (difficulty 5 to soak with Fortitude).
At the end of the ritual, the caster’s heart hardens to stone. The caster gains a number of additional dice equal to twice his Thaumaturgy rating to soak any attack that aims for his heart and is completely impervious to the effects of a Shaft of Belated Quiescence (see p. 237). Additionally, the difficulty to use all Presence or other emotionally manipulative powers on him is increased by three due to his emotional isolation. The drawbacks are as follows: the caster’s Conscience/Conviction and Empathy scores drop to 1 (or to 0 if they already were at 1) and all dice pools for Social rolls except those involving Intimidation are halved (including those required to use Disciplines). All Merits that the character has pertaining to positive social interaction are neutralized. Heart of Stone lasts as long as the caster wishes it to.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Houngan’s Doll"] = {
					en = [==[Rites of Blood, p. 62


4. Houngan’s Doll


System: The requirements for constructing a Houngan’s Doll are identical to those for the Baleful Doll. However, the Baleful Doll is an instant-use item — the creator fashions the doll, enacts the ritual, and inflicts what damage she can. The Houngan’s Doll, on the other hand, lasts until it is destroyed (which has no effect on the target). Once per week, the Anarch may cast the ritual, which begins when he lights a votive candle and sets it afloat in a cup containing one point of his vitae. If the ritual succeeds, then until the fire blows out (usually 30 minutes unless the ritual is disrupted somehow), any physical sensation imposed on the doll is sympathetically experienced by the target. For that duration, the sorcerer sees and hears only what the target does, so he must be careful to leave any tools or implements where they can be found by touch. The sorcerer is blind and deaf to his own surroundings while the ritual lasts.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Impregnable Soul"] = {
					en = [==[Rites of Blood, p. 104


4. Impregnable Soul


Level Four Necromancy Ritual. Believed to be stolen from a mortal mage by the name of Eochar, this ritual shields the user against possession by ghosts, infernal entities, or other spiritual powers. Rumors are that Eochar used this magic to protect himself and his students from the machinations of the dead. While this ritual is active, the necromancer’s body cannot be taken over, nor can his soul be pulled out of his flesh. Powers that command the mind (such as Dominate) are still effective. This ritual may be cast on others, but if done against their permission (such as to keep an enemy from activating Psychic Projection, Subsume the Spirit, or Possession), the ritualist must have a bit of the target’s hair, spend a Willpower, and make a successful Manipulation + Occult, while the subject rolls his Willpower in a resisted action (difficulty 7 for each). Once activated, Impregnable Soul remains until cancelled by the user, or until the next sunrise.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["4. Infirm Inert"] = {
					en = [==[Rites of Blood, p. 152


4. Infirm Inert


System: Infirm Inert creates a skin-contact poison that may only be used once before it turns inert. If the poison is not used by the end of the evening, the power of the ritual fizzles and the poison is rendered useless. The thaumaturge must apply the mystical poison to her own skin (she is immune) and then touch her intended target. The Storyteller may require a roll to touch the victim, depending upon the circumstances.
Upon skin contact, Infirm Inert temporarily cancels the victim’s ability to heal, though she may not be aware of this until she actively attempts to use her blood to do so. Victims may spend a point of Willpower to ignore this effect for one turn. When this ritual expires, all wounds may be healed according to the type of damage suffered, as normal. Each success on the activation roll for the ritual adds an additional night of effectiveness for the poison. The effects of this mystical poison may be countered by the ritual Purity of the Flesh (V20, p. 232).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Innocence of the Child’s Heart"] = {
					en = [==[Rites of Blood, p. 152


4. Innocence of the Child’s Heart


System: Innocence of the Child’s Heart requires the ritualistic sacrifice of a mortal child and the harvesting of her heart. The thaumaturge must dip a beloved toy that once belonged to the child in the heart’s blood. The toy will quickly absorb all of the blood until it appears to be clean again. As long as the caster carries the toy, her aura will be pure white untainted by any signs of vampirism. The duration of the effect is one week, plus an additional week per success on the activation roll. This horrific ritual imposes an extreme cost on the caster’s Humanity.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Invisible Chains of Binding"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 308


4. Invisible Chains of Binding


This ritual allows the caster to create a supernatural force that holds a target immobile with invisible and intangible chains. The caster must make bold hand gestures, but no material component is required, and the caster may perform the ritual instantaneously. The target may try to move, but the chains require the target score two successes in one turn on a Strength (plus Potence, if any) roll (difficulty 8) to break. A number of targets equal to the caster’s Occult rating may be chained through the ritual.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["4. Lord Aludian’s Orifices"] = {
					en = [==[Dark Ages Tome of Secrets, p. 37


4. Lord Aludian’s Orifices


System: The Cainite must for an hour seclude herself in an Oubliette, or a subterranean cave on a night of the full moon. During this time, she must force vitae into each of her orifices, until they swell and blush with life, at a cost of two blood points. The vampire must then make a Stamina + Medicine roll (difficulty 6); a success results in the blood turning black and forming small gateways into the Abyss. Failure produces no effect, while a botch causes the vampire two levels of aggravated damage, which can be soaked with Fortitude. Any being who enters anything inside one of the orifices — while having sex, for instance — loses one blood point a turn. A reflexive Perception + Awareness roll will notice this, requiring five successes minus the blood lost (to a minimum of one). Attempting to extract the penetrative party causes one level of aggravated damage a turn for as long as the Abyss Mystic successfully grapples her prey. It is possible to utterly consume a victim this way, devouring his weakened body via an Abyss-linked orifice.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["4. Maw of Ahriman"] = {
					en = [==[Rites of Blood, p. 38


4. Maw of Ahriman


System: The caster may consume anything she can fit into her mouth, eradicating the item (or creature, or part of a creature) utterly by absorbing it into the Abyss. Biting an opponent deals aggravated damage as per a standard bite, but also removes one Willpower dot from the opponent’s total Willpower. Willpower lost in this manner may not be regained for one lunar month. The effects of this ritual last until the next sunrise, or the caster may end the ritual at any time.
Side Effect: The caster cannot speak or otherwise use her vocal cords, mouth, tongue, or fangs for the duration of this ritual’s effects.
Abyssal Rituals (p. 37): The following rituals do not adhere to the same rules as other forms of magic, in large part because they build on a Discipline that is not truly a form of sorcery. To learn Abyss Mysticism, a Cainite must have at least one dot in both Obtenebration and one dot in Occult. Such a character may not learn Abyss rituals rated higher than her Obtenebration or Occult score (whichever is lower). Casting Abyss rituals requires a successful Wits + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to succeed. Unlike normal rituals, each Abyss Mysticism ritual costs 3 times the ritual level in experience points to learn. All rituals of Abyss Mysticism also have permanent side effects; under no circumstances do Flaws obtained from these side effects reward the vampire with bonus or experience points, nor can they be bought off.]==],
				},
				["4. Mirror Walk"] = {
					en = [==[Rites of Blood, p. 152


4. Mirror Walk


System: The thaumaturge must create two identical mirrors of the appropriate size made with silver. She must soak both mirrors in two points of her own blood and chant over her creation for three nights to create a special resonance link between the two objects. Once completed, the thaumaturge may stand before either mirror and recite the mystical password to open a magical gate between the two mirrors. Such powerful magic cannot be done swiftly, as it requires three turns for the portal to open. The glass ripples and shimmers when ready, and then the caster may step through. She may take one passenger with her on this trip, but she must act swiftly, as the gateway closes after 2 turns. If the thaumaturge or her passenger is delayed, they may become trapped between locations and lost in another realm.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Non-Disclosure Clause"] = {
					en = [==[Rites of Blood, p. 69


4. Non-Disclosure Clause


System: One success is sufficient to prepare the information to be downloaded by the recipient. Three successes are needed to prepare backup misinformation that the recipient will believe to be true once she is captured and the failsafe is triggered.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Peek Past the Shroud"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 182


4. Peek Past the Shroud


This hour-long ritual enchants a handful of ergot fungi mold to act as a catalyst for second sight. By eating a pinch of the mold, a subject gains the benefits of Shroudsight (p. 163) for a number of hours equal to the necromancer’s Stamina score. Three doses of the enchanted ergot are created for every success on the roll. Ergot is normally poisonous to some degree; this ritual removes its toxic properties. However, a botch renders the ergot highly and instantaneously toxic, inflicting eight dice of lethal damage on any subject who ingests it — including vampires.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["4. Point of the Needle"] = {
					en = [==[Rites of Blood, p. 90


4. Point of the Needle


System: Until the next sunrise, the Necromancer may perform a single use of “Withering” upon a target (V20, p. 472), using the same systems as outlined for the original power, but with a prick from the needle replacing a touch attack.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["4. Preservation of the Sanguine Heart"] = {
					en = [==[Rites of Blood, p. 27


4. Preservation of the Sanguine Heart


System: The thaumaturge must anoint the forehead of the target with a point of the caster’s vitae and then pass to her a prepared chalice with a drop of mercury. She must drink the metal and suffer one aggravated wound to her internal organs as the mercury covers her insides with a mystical barrier. Afterward, the target is magically protected against being blood bound or the effects of the Vaulderie (including getting the Mark of the Betrayer for some Tremere antitribu) for one day per success achieved on the activation roll. This protection comes at a steep price. In addition to the aggravated wound, the target may not receive sustenance from blood without the target willingly canceling the ritual.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Rebirth in the Light of Haqim"] = {
					en = [==[Dark Ages Tome of Secrets, p. 43


4. Rebirth in the Light of Haqim


Each Assamite is initiated to the clan after Embrace with blood from the collective pool. Her head is anointed with the blood and her true purpose calls to her. It is only at this point that she is fully welcomed as a warrior, sorcerer, or vizier, as the blood of the entire clan decides her fate. Many consider this to be the will of Haqim.
This rebirth breaks any existing blood bonds. It can also effectively change the character’s Clan Disciplines; any Disciplines that become out-of-clan accrue an “experience debt” that must be paid off with incoming experience points. Newly in-clan Disciplines are purchased at in-clan costs.
Assamite Sorcery ritual casting: the Tome of Secrets states no roll of its own for these rituals; Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["4. Reflections of Hollow Revelation"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 273


4. Reflections of Hollow Revelation


System: The caster summons a Nocturne (see p. 228) and bends its shape to her will, forcing it to contract into a sphere that can be held in both hands. To attempt this, the caster rolls Perception + Occult, difficulty 7. A botch leaves the character drained by the attempt – she rolls two less dice on all rolls for the remainder of the scene. On a failure, the Nocturne expands and acts as it normally would. On a success, the Nocturne becomes a fixed window upon any object, place, or person that the caster has previously personally witnessed. This window remains open for the remainder of the scene, or until the target leaves the vicinity of the window. Maintaining the window requires concentration, however; the caster loses two dice from Alertness dice pools as long as the window is active.
Any character with Obtenebration or with abilities that supernaturally augment senses, such as Auspex, may roll Perception + Occult (difficulty 8) to detect the watchful gaze of the shadows around them.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["4. Return of the Heart"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 310


4. Return of the Heart


Assamite Ritual. Cainites targeted by this ritual have the portion of their soul that has been slowly dying returned to them. Invoking this power requires a quantity of the target’s blood and takes five minutes to cast. If successful, the target becomes temporarily governed by the Hierarchy of Sins for the Road of Humanity as if she had a Road rating of 9, forcing the Cainite to perform Degeneration tests and be overwhelmed with guilt for the most minor of deeds. This does not actually impart a Road of Humanity rating of 9 to the target; the subject still has the Road rating that she normally would have, but is no longer inured to the cruelties of the world. This power lasts for one hour per success on the ritual roll.
Clan rituals (p. 302): Clan rituals are jealously guarded secrets that are never shared with those not belonging to the clan or bloodline harboring its mysteries.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["4. Ritual of Xipe Totec"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 182


4. Ritual of Xipe Totec


To perform the ritual, the Kindred removes his victim’s top layer of skin with an obsidian dagger, taking care to damage the skin as little as possible in the process. The victim must survive this process (though she may well die of blood loss shortly after the ritual if not seen to properly). He then drains the victim’s blood into a large ceremonial golden bowl. There the blood is mixed with octli, amaranth flower, and other ingredients. When imbibed by the necromancer, this mixture causes him to sweat a glistening sheen of blood (equal to one blood point). The Kindred then dons the skin of his victim, which on a successful roll absorbs the Kindred vitae and begins to heal, forming a second skin over the vampire’s own. The victim needs to be of similar stature — otherwise, the features become distorted and the disguise is rendered useless. This power also has no effect on supernatural creatures (although it can affect ghouls).
Under normal visual scrutiny, the ruse is flawless. Of course, it imparts none of the victim’s knowledge or mannerisms (and does nothing to mask the Kindred’s own undead nature). Therefore, it works best for situations in which contact with friends and family may be minimized. To preserve the skin’s condition, the Kindred must bathe it in a blood point’s worth of vitae nightly. When the necromancer removes the skin (which causes one level of unsoakable lethal damage to the user and must be done with the same knife used to flay the victim in the first place), it is ruined in the process.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["4. Scry"] = {
					en = [==[Rites of Blood, p. 153


4. Scry


System: Once the bowl and water is prepared according to the specifications, the thaumaturge must concentrate for a minute before attempting to scry her target. This ritual lasts for a number of hours equal to the successes for the activation roll. The thaumaturge only has to concentrate during this duration to view scenes through the water. If a location is the center of the Scry, this location cannot be changed throughout the duration of the ritual. The caster cannot use Auspex powers, Thaumaturgy, or similar mental Disciplines through the Scry.
If the caster is attempting to scry an item or place, she must be familiar enough with it to have formed a psychic attachment with it. If the caster intends to scry upon a person, she might have in her possession an object with a psychic resonance with the target (p. 133).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Scrying Pool"] = {
					en = [==[Dark Ages Tome of Secrets, p. 51


4. Scrying Pool


System: By stating the name of someone she knows, the koldun can immediately see what that individual is doing by peering into water. The ability to activate the rite’s powers is only terminated if the subject of a scrying is informed someone is spying upon them. This accusation can be unrelated to the koldun.
Learning and practicing kraina (p. 48): All kraina rites must be taught by a Cainite, spirit mentor, or demon. The vampire learning rites requires the same level in Koldunism, and the affiliated kraina. To learn kraina rites, the player must roll Intelligence + Occult (the difficulty is the rite’s level + 4), and sacrifice the blood and Willpower points stated below. Kraina rites must be practiced in a location predominantly possessed of the rite’s focus, such as a forest or river; these locations cannot be left once the rite has commenced, and if the rite is interrupted, the extended roll requirements reset. Practicing kraina rites requires the rite leader to roll dice equal to her Occult rating and the Attribute designated by the rite. The difficulty is the rite’s level + 4, with each murder committed at the ritual site reducing the difficulty by 1 to a minimum difficulty of 3. Each additional Cainite partaking in the ritual contributes dice equal to his Occult rating, and is subject to the rite’s blood and Willpower sacrifice requirements. Removing two dice from the pool reduces the number of successes required by one, to a minimum of one; these dice remain out of the pool for future rolls on the extended task. Each time a roll of dice is made by the rite leader, each participant loses one blood point in addition to the number committed to the rite’s practice. If the rite is aborted or failed, the initial blood and Willpower cost is deducted in full from the rite leader on top of anything already lost.
Level 1 — cost to learn 1b + 1W — cost to practice 3b + 2W — 5 successes required
Level 2 — cost to learn 2b + 2W — cost to practice 6b + 4W — 10 successes required
Level 3 — cost to learn 3b + 3W — cost to practice 9b + 6W — 15 successes required
Level 4 — cost to learn 4b + 4W — cost to practice 12b + 8W — 20 successes required
Level 5 — cost to learn 5b + 5W — cost to practice 15b + 10W — 25 successes required
b = Blood points. W = Willpower points]==],
				},
				["4. Splinter Servant"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 238


4. Splinter Servant


System: The ritual requires 12 hours to cast, minus one per success, and the servant must be created as described above. When the binding is torn off, the character who holds it must point the servant at its target and verbally command it to attack during the same turn. If this command is not given, the servant attacks the closest living or unliving being, usually the unfortunate individual who currently carries it.
A Splinter Servant always aims for the heart. It has an attack dice pool of the caster’s Wits + Occult, a damage dice pool of the caster’s Thaumaturgy rating, and a maximum movement rate of 30 yards or meters per turn. Note that these values are those of the caster who created the servant, not the individual who activates it. A Splinter Servant cannot fly, but can leap its full movement rating every turn. Every action it takes is to attack or move toward its target; it cannot dodge or split its dice pool to perform multiple attacks. The servant makes normal stake attacks that aim for the heart (difficulty 9), and its success is judged as per the rules for a normal staking (see p. 280). A Splinter Servant has three health levels, and attacks directed against it are made at +3 difficulty due to its small size and erratic movement patterns.
A Splinter Servant has an effective life of five combat turns per success rolled in its creation. If it has not impaled its victim by the last turn of its life, the servant collapses into a pile of ordinary, inanimate splinters. Three successes on a Dexterity roll (difficulty 8) are required to remove a Splinter Servant from a victim’s heart without leaving behind shards of the stake.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Stolen Kisses"] = {
					en = [==[Rites of Blood, p. 153


4. Stolen Kisses


System: The thaumaturge must first make a small incision on his body where she intends to make physical contact with a vessel. Once the ritual is cast, the wound knits itself closed and then opens to create a lip-and-mouth mystical orifice that when pressed against a vessel’s flesh will drink one blood point every other turn from the victim as long as contact persists. After the second point of vitae is consumed, a vessel is likely to feel woozy, while taking five blood points can cause the victim to black out from the substantial lack of blood in her body. Stolen Kisses remains active for one night. Note that the thaumaturge does not cause ecstasy or rapture when taking blood in this manner, as he would if he fed on a vessel normally.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Summon Ethereal Horde"] = {
					en = [==[Rites of Blood, p. 89


4. Summon Ethereal Horde


System: At the end of the chant, if the ritual is successful, the number of successes rolled determines how many drones (mindless ghosts, rather than full-blown wraiths) the Necromancer can summon. These ghosts appear as ethereal images of warriors long dead. Although they can not materialize fully in the physical world, they can use their own powers to hurl objects or frighten away attackers, in defense of the Necromancer. The ghosts return to their rest at the next sunrise.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["4. Summon the Blood Imp"] = {
					en = [==[Rites of Blood, p. 27


4. Summon the Blood Imp


System: Summon the Blood Imp requires that the thaumaturge stitch together fresh (within three days) corpses of animals and humans into a frightening humanoid creation. The blood imp has an animal cunning and empathic link to its master that allows it to innately understand the needs and desires of its master. Next, the caster must add six points of Tremere blood into the mix and allow it to simmer over the course of three nights.
Such devoted service is not without a cost. The blood imp requires a certain amount of attention lest it turn spiteful. Nothing is more frustrating than an angry blood imp disrupting important rituals or breaking priceless artifacts in a temper tantrum. Blood imps must be fed regularly with vitae and flesh.
A blood imp can fight, but not with tremendous effectiveness; it will nevertheless destroy itself if necessary to protect its creator. It can also push or carry small objects, and makes an effective spy (though it detests being away from its master for long periods of time). Blood imps are damaged by sunlight and fire like Kindred, and can also be destroyed utterly by immersion in sanctified water.
More information on the capabilities of a blood imp can be found on p. 108.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. The Curse Belated"] = {
					en = [==[Rites of Blood, p. 151


4. The Curse Belated


System: The thaumaturge must first prepare a brand with her sigil. She must feed her ghoul a point of blood while chanting the incantation, and then seal the covenant by branding her sigil onto the body of her thrall. The thaumaturge loses access to one permanent point from her blood pool until this ritual is triggered. The moment that the ghoul’s heart stops beating, the stored vitae inside her body activates and resurrects her as a full-fledged vampire. Once “Embraced,” the sigil disappears and the empty spot in the caster’s blood pool unlocks, allowing her to once again spend that blood point. The caster is immediately aware that the ritual has been triggered and that her former ghoul is now dead and might be her new childer. (Though she can sense the ritual’s activation, the thaumaturge may have no way to know whether the former ghoul managed to survive the process.)
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Ties That Bind"] = {
					en = [==[Rites of Blood, p. 158


4. Ties That Bind


System: For one night per success, the koldun reduces the difficulty for all rolls pertaining to Koldunic Sorcery by -1. This ritual cannot be performed more than once per week.
Koldunic Sorcery dice mechanics (p. 156): the roll to activate a Koldunic Sorcery ritual is Intelligence + Occult with a difficulty equal to 3 + the ritual rating. The school’s metaphysical connections to Kupala and to the lands permeated by that spirit increase the difficulty by +1 on all Koldunic Sorcery rolls made on behalf of kolduns who work their magic outside the territories of Eastern Europe.]==],
				},
				["4. Track Transgressor"] = {
					en = [==[Rites of Blood, p. 152


4. Track Transgressor


System: To cast the ritual, the thaumaturge must locate a site where Thaumaturgy has been cast within the past twenty-four hours. She must then spill her blood (spending a blood point) upon the ground while reciting the proper incantation. Bloody footprints that are only visible to the caster appear on the ground and lead away to the transgressor. After casting this ritual, the Tremere is able to flawlessly track down the transgressor until dawn. This tracking follows the exact path that the magus took after leaving the area where the magic was used. This ritual may track down only Thaumaturgy and related rituals, not Necromancy or other types of magic.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Transcending Barriers Through Love"] = {
					en = [==[Rites of Blood, p. 64


4. Transcending Barriers Through Love


System: For each success rolled, the sorcerer may cause one of his followers who is a valid target for this ritual to lose two points of blood, with the sorcerer regaining one point of blood for every two points lost. Alternatively, for every three successes rolled, the sorcerer may cause a valid target to lose two points of Willpower, with the sorcerer recovering one Willpower for every two lost. There is a downside to this latter application, as it immediately causes anyone who loses Willpower in this manner to be freed of the effects of Enfolding the Believers and, worse, free of the effects of the blood bond itself. The ritual can target multiple cultists, but cannot target a single cultist more than once per use. Once a sorcerer has used this ritual, he may not use it again until he has successfully cast Enfolding the Believers on his cult again or until one week has passed, whichever is longer.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Unweave Ritual"] = {
					en = [==[Rites of Blood, p. 154


4. Unweave Ritual


System: First, the caster must figure out what ritual currently afflicts her. If she possesses the ritual, this is automatic. Otherwise, this may require some research via an Intelligence + Occult roll with a difficulty base of 4, plus 1 for every level rating of the ritual. Next, the caster must secure a component that would be used in the casting of the offending ritual, then destroy it in some fashion. Her successes subtract from the successes scored by the original caster; if she manages to wipe away all of the successes, the offending ritual immediately ends, with all concomitant effects. Thus, a quick end to Bind the Accusing Tongue (V20, p. 230) would allow the victim to speak ill of her enemies again, but a premature end to a Blood Contract (V20, p. 239) would painfully shove her into torpor.
Only rituals that have a duration can be unwoven. For instance, a thaumaturge who has thrown off a blood bond through Abandon the Fetters (below) is not constantly under the effects of that ritual. Once the ritual is complete, the bond is gone and the ritual is done. However, a thaumaturge suffering from The Bottled Voice (p. 150) would be considered to be under the duration of the ritual as long as the crystal bottle remained sealed, so it could be unwoven. Note that a thaumaturge can only unweave a ritual on herself, not one on someone else. A thaumaturge suffering from multiple rituals must unweave each one separately. Multiple unweavings can be accumulated against a ritual so long as the appropriate time and components can be acquired.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Vigil of the Stone Guardian"] = {
					en = [==[Rites of Blood, p. 29


4. Vigil of the Stone Guardian


System: To create a Stone Guardian, the thaumaturge must find or create an appropriate door-knocker (with both eyes and a mouth) and then soak it in her blood over the course of three nights. She must then hang it upon the door or gate that will become the new home for the guardian and enact the ritual. If successful, the stone guardian bonds with the door or gate and cannot be removed without being destroyed.
The thaumaturge may remotely possess the guardian by expending a point of blood. Once it is possessed, the caster can observe what is happening through the guardian’s eye and speak through its mouth. By expending a point of Willpower, the thaumaturge may attempt (if she possesses the ability) to utilize the first two levels of Dominate, Presence, or Dementation to chase away intruders. The stone guardian may not physically attack or block entry to trespassers otherwise, but it can open the door or gate upon command from the thaumaturge.
Such protection comes at a cost to the thaumaturge. The Stone Guardian requires a point of blood per night to continue its vigilance. If the stone guardian is not fed, it will sleep until reactivated by the thaumaturge with a point of blood.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Vision of Shadow"] = {
					en = [==[Lore of the Clans, p. 126


4. Vision of Shadow


System: The vampire makes a casting roll to call up a ball of shadow that she will use to scry on a target. If the caster fails the roll, nothing happens, but a botch leaves her confused and disoriented, suffering –2 to all dice pools for the rest of the scene.
The Cainite then concentrates on a person or location she has previously seen. As she does so, the shadow ball will become clear to reveal a vision of that place or person at that very moment, complete with sound. There must be shadows near the target, and the vision will come from the most optimal position in these shadows. The vision can be anywhere within a radius of the caster’s Obtenebration + Occult in miles, or 1.5 times that number in kilometers.
The vision lasts for a scene, or until the target leaves the area. If the target has the ability to sense such scrying (such as with Auspex or a similar power), he can attempt a Perception + Occult roll (difficulty 8) to know he is being watched.
Side Effect: Looking too far into the distance makes the Cainite less aware of what is happening right under her nose. For the rest of the night after successfully casting this ritual, she suffers -2 to all Alertness checks to notice nearby events.
Abyss Mysticism (p. 125): Abyss Mysticism is difficult and time consuming to learn, and comes at a cost. Its rituals often have side effects that create Flaws the character cannot remove that provide no bonus points. To learn the power, a vampire must have at least one dot in both Obtenebration and Occult. She may not learn any Abyss rituals higher than the lowest of her Obtenebration or Occult ratings, and each ritual costs a number of experience points equal to three times the ritual’s level. Abyss rituals are cast using a Wits + Occult roll. The difficulty is 3 + the level of the ritual being cast. Only one success is required to cast the ritual, but the Storyteller is encouraged to make the penalties for failure especially horrifying.]==],
				},
				["4. Vision of St. Anthony"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 294


4. Vision of St. Anthony


With this ritual, the necromancer can grant others Shroudsight (as described on p. 288) for a number of hours equal to her Stamina score. She enchants a handful of wheat infected with ergot (a common type of toxic fungus) with an hour-long ritual. For every success on her ritual roll, she creates three doses. The enchantment removes any toxicity from the ergot, but if she botches, she creates three doses of highly-toxic wheat that will inflict eight dice of lethal damage on anyone who ingests it, mortal and vampire alike.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["4. Ward versus Kindred"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 239


4. Ward versus Kindred


System: Ward versus Kindred behaves exactly as does Ward versus Ghouls, but it affects vampires rather than ghouls. The ritual requires a blood point of the caster’s own blood and does not affect the caster.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Ward versus Vitae"] = {
					en = [==[Rites of Blood, p. 158


4. Ward versus Vitae


System: Kindred below the caster’s Generation who touch the ward suffer two dice of lethal damage each time they do so. After the first touch, however, a Kindred who wishes to proceed again must roll Willpower (difficulty 7) or spend a Willpower point. Each use of this ritual costs one point of blood and can only ward one discrete object: a single window, a door, a book, or one door of an automobile. Larger objects can be warded but only if the ritual is cast multiple times.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["4. Warding Circle versus Kindred"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 234


4. Warding Circle versus Kindred


System: As Warding Circle versus Ghouls (p. 234), but the circle affects vampires. The ritual requires the same material component as Ward versus Kindred — the caster’s own blood — but in a larger amount, and it does not affect the caster. The caster determines the size of the warding circle when it is cast; the default radius is 10 feet/3 meters, and every 10-foot/3-meter increase raises the difficulty by one, to a maximum of 9. The ritual takes the normal casting time if it is to be short-term (lasting for the rest of the night) or one night if it is to be long-term (lasting a year and a day).
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Abandon the Fetters"] = {
					en = [==[Rites of Blood, p. 154


5. Abandon the Fetters


System: The thaumaturge must have one point of blood each from himself, the thrall, and the subject’s master. (If the caster happens to be the subject or regnant, no additional blood is needed.) The excoriation causes three levels of unsoakable aggravated damage to the subject as flesh is flayed or burned away. The final venomous steam inflicts an additional level of unsoakable aggravated damage on both the caster and the subject. The subject loses a permanent point of Willpower, but if the ritual succeeds, the blood bond dissipates immediately. However, this offers no protection against the formation of another, later bond. Abandon the Fetters may not be used to break the vinculum of a Vaulderie or the effects of the Transubstantiation of Seven ritual (p. 151).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Ahriman’s Wight"] = {
					en = [==[Rites of Blood, p. 38


5. Ahriman’s Wight


System: After casting this ritual, the character gains a number of additional “Shadow” wound levels at the “Wounded” health level, equal to his dots in Obtenebration. However, if the character takes an injury that crosses off one of these Shadow health levels, he loses a commensurate number of dots of Obtenebration as well. Dots of Obtenebration lost in this way return after one week.
Side Effect: While this ritual is in effect, all failed rolls using the caster’s Conscience/Conviction are considered to be botches.
Abyssal Rituals (p. 37): The following rituals do not adhere to the same rules as other forms of magic, in large part because they build on a Discipline that is not truly a form of sorcery. To learn Abyss Mysticism, a Cainite must have at least one dot in both Obtenebration and one dot in Occult. Such a character may not learn Abyss rituals rated higher than her Obtenebration or Occult score (whichever is lower). Casting Abyss rituals requires a successful Wits + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to succeed. Unlike normal rituals, each Abyss Mysticism ritual costs 3 times the ritual level in experience points to learn. All rituals of Abyss Mysticism also have permanent side effects; under no circumstances do Flaws obtained from these side effects reward the vampire with bonus or experience points, nor can they be bought off.]==],
				},
				["5. Asymmetrical Reproduction"] = {
					en = [==[Rites of Blood, p. 109


5. Asymmetrical Reproduction


System: This ritual takes three nights to complete, and the caster must possess some amount of the target’s genetic material (such as skin cells or a hair), which is destroyed in the casting. The clone created by this ritual is a perfect, but living, duplicate of its target in every way, including all appropriate Merits, Disciplines, and personality traits, but only possesses the most rudimentary memories of the individual it is replicating. Over the course of the next seven days, the clone’s psychology becomes more and more psychotic, and its Disciplines or other powers (as appropriate) become wildly unstable, until it becomes almost entirely unrecognizable from their original state. If allowed to survive, at some point after the seventh night, the clone will go on a violent murder spree — ending only in its death, preferably after the death of the individual it was created to replicate.
Although the clone is a living creature (and must eat, sleep, and breathe), if it is a replication of a vampire, it appears to be a vampire to all ordinary and supernatural means of detection.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. At Our Command It Breathes"] = {
					en = [==[Rites of Blood, p. 106


5. At Our Command It Breathes


System: The blood cost of this ritual is 5 points for each Cainite used in the Gargoyle’s manufacture. After three months of casting, on the final night of the ritual, the thaumaturge must make a roll as the fetal sac is cut open. The roll is Intelligence + Occult (difficulty 9, but the roll requires three successes). Subtract one die for every night the thaumaturge did not perform her incantations. A single success allows the creation of a Gargoyle (if this is a player character, it must be built according to the standard character creation rules). Attempted use of this ritual, whether successful or not, removes a single point of morality from the user’s morality total. No matter what path a character espouses, this ritual (and the activities required to perform it) is deeply and utterly abhorrent. Gargoyles created with this ritual are infertile, and cannot Embrace.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Beckon the Ingurgitant"] = {
					en = [==[Dark Ages Tome of Secrets, p. 37


5. Beckon the Ingurgitant


System: The vampire must paint a spiral of vitae on the target area, spending two blood points per meter (1 yard) in intended vortex dimensions. The blood then soaks into whatever surface it’s painted on, leaving no stain. The Cainite must then chant and pray to the Abyss for an hour, within sight of the target area, spending two temporary points of Willpower. Finally, she must roll Manipulation + Occult (difficulty 6), with each success allowing the ingurgitant vortex to remain for two turns. Failure results in nothing happening; a botch prevents the Abyss Mystic from summoning any entities of the Abyss for seven nights. When any creature stands in close proximity to the painted sigil, the Abyss Mystic senses its presence and whether it’s a mortal or vampire. By spending a blood point, the vampire forces the ingurgitant vortex to form in the surface and attack whatever’s close by, strangling and chewing any victims, before dragging them to the Abyss. Those taken to the Abyss remain there for a number of nights equal to the Abyss Mystic’s Obtenebration rating, where they suffer the effects listed under Evocation of the Oubliette (see V20 Dark Ages p. 274). The vortex’s statistics are stated on p. 34.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["5. Blood Contract"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 239


5. Blood Contract


System: This ritual is best handled by the Storyteller, who may bring those who sign the blood contract into compliance by whatever means necessary (it is not unknown for demons to materialize and enforce adherence to certain blood contracts). The only way to terminate the ritual is to complete the terms of the contract or to burn the document itself — attempts to add a clause forbidding burning the contract have resulted in the contract spontaneously combusting upon completion of the ritual. One blood point is consumed in the creation of the document, and an additional blood point is consumed by those who sign it.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Bloody Mary"] = {
					en = [==[Rites of Blood, p. 67


5. Bloody Mary


System: If the ritual succeeds, then Bloody Mary will possess the mortal’s body and be bound to serve the summoner for one lunar month. The successes on the roll determine how loyal Bloody Mary is during the length of possession, for she is a spirit of violence and murder and will seize nearly any opportunity to kill while wearing a human host. With one success, she will grudgingly obey any direct commands and will refrain from attempting to harm the summoner in any way, but she will have no real loyalty. With five successes, her instinct is to obey every command without question and to refrain from any activities which might cause problems for the summoner later. If there is any conflict between Bloody Mary’s instinct to maim and kill and the needs of the summoner, roll the vampire’s successes on the summoning roll. If there are any successes, the player decides what Mary will do.
While Bloody Mary is riding the mortal vessel, she gains the equivalent of Potence 2 and Fortitude 2. She knows everything he knew, and she can impersonate him effortlessly. However, animals are instinctively afraid of any mortal ridden by Bloody Mary, and characters who succeed on a Perception + Empathy roll (difficulty 7) find him frightening and off-putting. For children, the difficulty is only 5. Statements from anyone close to the mortal indicating love or affection to him require the player to roll a number of dice equal to the summoning successes (difficulty 7). Failure means that Bloody Mary will frenzy and attack the loved one. When the month of servitude ends, Blood Mary departs, leaving behind a mortal who is irretrievably insane. As noted, this is a dark ritual, and any sorcerer who performs it must make a Conscience roll if his Humanity is two or higher.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Cheat the Scale of Hades"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 311


5. Cheat the Scale of Hades


Follower of Set Ritual. This ritual allows a witch to remove the heart (as well other vital organs) from his body entirely and wraps his flesh in a protective cocoon. This ritual takes three hours to complete and can only be performed on oneself in the dark of the night, either after the moon has set, before it has risen, or during the new moon. The player makes an extended Dexterity + Medicine roll (difficulty 7). Each roll represents an hour of activity, and the ritual ends in failure if the moon or sun rises before the player achieves the necessary successes (five to remove a heart, twelve to achieve the mummified form). Any vampire who witnesses the process is subject to Rötschreck (difficulty 6). Once the witch has removed his heart, liver, and brain, he falls into a sort of torpor. His vitae and undead flesh combine to wrap him in a dry, scaly shroud that leaves a small opening around his mouth, but is otherwise nearly impenetrable. A witch so preserved may remain in stasis indefinitely, and the enshrouded vampire is virtually impervious to harm as if under the effects of Stone Slumber (p. 310). However, the extracted organs are extremely vulnerable, especially the heart. Destroying an organ causes an unsoakable level of aggravated damage to the vampire, while exposing the heart to sunlight or burning it instantly destroys the vampire in a terrible immolation. Only feeding the witch his removed organs can awaken him. After ingesting his organs, it takes one minute for the cocoon around him to crumble to dust and an hour for him to rise.
It is possible to undertake this ritual only partially, stopping with the removal of the heart. Indeed, it is also possible to perform the first part of this ritual upon another Cainite. A vampire is perfectly able to move about without a heart, and as an added benefit, she becomes immune to standard staking or diablerie. Due to the heart being the seat of emotion, the difficulty of all rolls to resist frenzy are two lower. However, if an enemy gains possession of her heart (or if the heart is removed by the witch) the vampire is in dire straits. Not only does it provide a powerful ritual connection to the vampire, but a simple flame or glint of sunlight upon the heart destroys the Cainite outright. In addition, driving a stake through the heart forces her into torpor, and any Cainite drinking more than two blood points from it passes straight to the heart’s blood, reducing the difficulty for diablerie to 7.
Clan rituals (p. 302): Clan rituals are jealously guarded secrets that are never shared with those not belonging to the clan or bloodline harboring its mysteries.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["5. Chill of Oblivion"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 183


5. Chill of Oblivion


Performed over the course of 12 hours (reduced by one hour per success on the casting roll), this ritual infuses the necromancer or a willing subject with the chill of the grave. The ritual’s material component is a one-foot (half-meter) cube of ice, which is slowly melted on the subject’s chest (inflicting three health levels of bashing damage on mortal subjects). The subject must lie naked on bare earth for the entire duration of the ritual. Once the ritual is completed, its effects remain for a number of nights equal to the caster’s Occult rating.
An individual affected by Chill of Oblivion treats aggravated damage from fire and high temperatures as if it were lethal damage. Furthermore, he may attempt to extinguish any fire by rolling Willpower (difficulty 9); each success reduces the fire’s soak difficulty (see p. 297) by 1, and a fire with a soak difficulty of 2 dwindles to glowing embers.
However, this ritual has several drawbacks. First and foremost, the subject’s aura is laced with writhing black veins that resemble those left by diablerie, and may well be mistaken for such by any observer who is not familiar with this ritual. The subject also radiates a palpable aura of cold that extends to about arm’s length from him; this can be extremely disconcerting to mortals, though it causes no damage, and its game effects mirror those of the Flaws Touch of Frost (p. 494) and Eerie Presence (p. 495). Finally, the mystical nimbus of the ritual draws hostile ghosts to the subject, who may plague him with unwholesome acts.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["5. Cobra’s Favor"] = {
					en = [==[Rites of Blood, p. 154


5. Cobra’s Favor


System: By spilling one point of blood into a prepared container and combining it with the necessary herbs and poison, the thaumaturge recites an incantation, willing her magic into the concoction until it turns jet black. The caster must ingest the elixir for the ritual to take effect, suffering one level of unsoakable aggravated damage in the process. Afterwards, for the next week, anything that consumes the blood of the caster suffers a level of aggravated damage per point ingested. Each additional success on the activation roll extends the duration of the ritual by an additional week.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Commune with the Abyss"] = {
					en = [==[Lore of the Clans, p. 127


5. Commune with the Abyss


System: By casting this ritual, the vampire draws into herself the surrounding shadows and darkness. Once they are gone, the vampire falls into a deep torpor-like sleep from which she cannot awaken. The character may then ask one question, which may be as mundane or as complicated as she desires. The Storyteller gives this question a rating based on how obscure or difficult it might be to answer, from one to ten. The rating may even be higher than ten if the question is truly momentous.
Each night the vampire remains in their torpid slumber, she rolls Intelligence + Occult (difficulty 9) and keeps a note of her cumulative successes. Once the amount of successes equals the rating of the question, the vampire awakes suddenly knowing the answer. This answer will be true and complete, and not hidden in a riddle. The Abyss only hides the truth; it does not confuse it or guard it jealously.
Should the vampire fail to gain any successes on one of the rolls, the interval between making rolls moves from days to weeks. Continued failure moves this interval from weeks to months, to years, millennia, and even further. It is said that ancient mystics have lain for centuries contemplating the ultimate questions of the universe. There may even be Gehenna cults that await their awakening.
Abyss Mysticism (p. 125): Abyss Mysticism is difficult and time consuming to learn, and comes at a cost. Its rituals often have side effects that create Flaws the character cannot remove that provide no bonus points. To learn the power, a vampire must have at least one dot in both Obtenebration and Occult. She may not learn any Abyss rituals higher than the lowest of her Obtenebration or Occult ratings, and each ritual costs a number of experience points equal to three times the ritual’s level. Abyss rituals are cast using a Wits + Occult roll. The difficulty is 3 + the level of the ritual being cast. Only one success is required to cast the ritual, but the Storyteller is encouraged to make the penalties for failure especially horrifying.]==],
				},
				["5. Court of Hallowed Truth"] = {
					en = [==[Rites of Blood, p. 155


5. Court of Hallowed Truth


System: Once the ritual is complete, all who enter the room are bound to abide by the truth-telling edict it enforces. No falsehood may be spoken, and direct questions from the presiding judge or power are answered candidly with no omissions or deceit. The magic persists within the room for the length of one week. Each additional success on the activation roll extends the duration of the ritual by an additional week.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Creation of the Shabti"] = {
					en = [==[Rites of Blood, p. 109


5. Creation of the Shabti


System: The statue must be of at least human size (though it may be up to three times as large, and it may be shaped like a biped or like an Egyptian animal), and must be made with at least Crafts 4 (and be commensurably expensive). The thaumaturge’s player rolls Charisma + Occult (difficulty 8). Once a shabti is created, the spirit remains until the next time its caster wakes up (whether that is the next sunset, or after a hundred years of torpor). At that time, the statue crumbles to dust and the funerary spirit is freed.
Regardless of its size or shape, a shabti has four health levels, four Willpower, six dots in each Physical Attribute, and two dots in all other attributes. These constructs may spend a point of Willpower to move at a walking pace for one turn; otherwise, they are stationary. They cannot be targeted by mental and social powers, with the exception of powers that remove the spirit (such as soul stealing), which immediately destroy a shabti.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["5. Dead Man’s Hand"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 183


5. Dead Man’s Hand


The necromancer takes a rag stained in the blood, sweat, or tears of the intended victim. She takes a freshly severed human hand (which can come either from a corpse or a living “donor”) and closes it around the rag. As the hand decomposes, so does the victim. His flesh bloats, turns gray and then green, then starts to slough off. The victim’s brain remains fresh until the very end, so he can see the maggots writhe in the putrescent rack of meat that once was his healthy body.
The necromancer makes the standard roll and spends two blood points for each point of Stamina (and Fortitude) possessed by the victim. The victim loses health levels according to the timetable below. Only the removal of the rag from the hand can stop the process. If this happens, health levels return, also according to the chart below.
Bruised — 12 hours until next loss
Hurt — 12 hours until next loss
Injured — Six hours until next loss
Wounded — Three hours until next loss
Mauled — One hour until next loss
Crippled — 30 minutes until next loss
Incapacitated — 12 hours until next loss
Mortal characters who suffer more than 12 hours of incapacitation die, while Kindred who remain Incapacitated for more than 12 hours succumb to torpor.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["5. Dedicate the Haven"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 310


5. Dedicate the Haven


The havens of thaumaturges often house arcane documents, special resources, and other major assets. To defend them, thaumaturges frequently cast Wards over a site. Dedicate the Haven cements this process. The caster must take a minimum of one hour to walk a counterclockwise circle around the entire haven grounds while carrying a smoking thurible that contains a burning mixture of her blood, frankincense, and sage. Once complete, the thaumaturge must return to the rough center of her haven and douse herself with the remainder of the blood. A dedication covers a single building, and a complex of homes or an estate and grounds may require several castings to ensure proper protection. Once dedicated, a haven is open to more defenses; any Haven Ritual (specified as such in the description of individual rituals) cast upon it is rendered permanent and has its casting difficulty decreased by three.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["5. Enchant Talisman"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 239


5. Enchant Talisman


System: This ritual requires six hours per night for one complete cycle of the moon, beginning and ending on the new moon. Over this time, the vampire carefully prepares her talisman, carving it with Hermetic runes that signify her true name and the sum total of her thaumaturgical knowledge. The player spends one blood point per night and makes an extended roll of Intelligence + Occult (difficulty 8), one roll per week. If a night’s work is missed or if the four rolls do not accumulate at least 20 net successes, the talisman is ruined and the process must be begun again.
A completed talisman gives the caster several advantages. When the character is holding the talisman, the difficulty of all magic that targets her is increased by one. The player receives two extra dice when rolling for uses of the character’s primary path and one extra die when rolling for the character’s ritual castings. If the talisman is used as a weapon, it gives the player an additional die to roll to hit. If the thaumaturge is separated from her talisman, a successful Perception + Occult roll (difficulty 7) gives her its location.
If a talisman is in the possession of another individual, it gives that individual three additional dice to roll when using any form of magic against the talisman’s owner. At the Storyteller’s discretion, rituals that target the caster and use her talisman as a physical component may have greatly increased effects.
A thaumaturge may only have one talisman at a time. Ownership of a talisman may not be transferred — each individual must create her own.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Enochian Passage"] = {
					en = [==[Rites of Blood, p. 104


5. Enochian Passage


Level Five Necromancy Ritual. The vampire can physically pass into the Shadowlands, appearing in the fields before the mystical city of Enoch. This requires that the vampire symbolically “kill” herself by plunging a silver dagger into her heart (doing at least two lethal wound levels) and falling into a body of water deep enough to cover her body. Members of the Tal’Mahe’Ra use this ritual to go to Enoch, and thus rabidly protect it from falling into anyone else’s hands.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["5. Escape to a True Friend"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 239


5. Escape to a True Friend


System: This ritual takes six hours a night for six nights to cast, reduced by one night for every two successes. Each night requires the sacrifice of three of the caster’s own blood points, which are poured into the circle. Once the circle is complete, the transport may be attempted at any time. The caster may take one other individual with her when she travels, or a maximum amount of “cargo” equal to her own weight.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Esilio"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 183


5. Esilio


Like Tempesta Scudo, Esilio is a quick and dirty ritual. The necromancer simply speaks five syllables. No one can identify the casting language, but according to the ritual’s oblique history, the language is what God gave humankind before the confusion of Babel. The legend further states that while the particular meaning of the words is lost, they are what Caine’s father said to him while exiling him to Nod.
Regardless of the truth of the matter, the Words of Exile are not spoken lightly. When the ritual is cast successfully, it opens a hole within reality itself — a rip between the lands of the living and the darkest depths of the Underworld. This tear is invisible to normal vision, but to Witness of Death or Shroudsight it looks like a black vortex opening within the vampire’s own body (the very few unfortunate enough to look into the gap with high levels of Auspex are generally unwilling or unable to discuss it). Any ghost clutched to the Kindred’s chest is instantly torn to shreds. Grabbing a ghost in this fashion requires a Clinch or Tackle maneuver. Destroyed spirits don’t come back for at least a month, if ever. A wraith destroyed in this fashion tends to return as a Spectre, if it returns at all.
The necromancer may clutch and destroy a number of spirits equal to the number of successes she rolled. After that, the vortex closes. It closes at the end of the scene if it hasn’t already.
Of course, using one’s body as a portal between our world and what some people might call Hell is neither simple nor healthy. For starters, it costs a blood point and a point of Willpower (which does not give an automatic success on the ritual roll). More importantly, each success rolled inflicts a level of unsoakable lethal damage on the necromancer. Most significantly, every use of Esilio permanently reduces the necromancer’s Humanity by one point if he follows that morality, and may impact other Paths at the Storyteller’s discretion.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["5. From Marduk’s Throat"] = {
					en = [==[Lore of the Clans, p. 31


5. From Marduk’s Throat


New Dur-An-Ki Ritual. This ritual is the means by which Assamites can continue to reduce their Generation despite the limitations imposed by the Tremere Curse. It is also the mechanism by which the sorcerer caste maintains some influence and control over the Clan despite their small numbers, as the ritual’s difficulty means that only very experienced sorcerers can use it. The sorcerer creates an alchemical substitute for vampiric blood, allowing an Assamite who drinks enough to decrease her Generation. The ingredients include a wide variety of chemicals, herbs, and other exotic materials, but the most important ingredient is Kindred blood.
To reduce the drinker’s Generation by one level, the potion must incorporate a number of blood points from vampires of lower Generation than the drinker equal to four times the maximum blood point value of the desired Generation. For example, an Assamite who sought to reduce her Generation from Eighth to Seventh would need to procure twenty-eight points of blood from Kindred whose own Generation was Seventh or lower. Regardless of how much vitae that is, the result of the alchemical process will evaporate down into a thick sludgy material that the imbiber must consume in a single attempt.
The potion is foul, and requires the imbiber to successfully roll Willpower (difficulty 9). If that roll succeeds, the Assamite must then successfully assimilate the blood into her body. This requires an extended Willpower roll (difficulty 9), seeking 15 successes for a new Generation. Failures don’t stop the process, but they do deal six dice of lethal damage apiece (soaked normally). Assimilation is so painful and distracting that any attacks made against her during this time face a difficulty of only 2.
Assamite Sorcery ritual casting: Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9).]==],
				},
				["5. Ghost in the System"] = {
					en = [==[Rites of Blood, p. 69


5. Ghost in the System


System: The ritual requires an extended Intelligence + Occult roll, with each roll representing one full night spent reshaping the Internet and doing nothing else except devoting an hour or two to feeding. The Storyteller determines how many successes are needed based on the number of “Internet facts” that must be changed in order to achieve the desired results. Changing a single mortal’s medical diagnosis or reporting all her credit cards as stolen might require only one or two successes, while creating an entirely new identity for a vampire on the run might require five to ten, depending on how complicated and important the new identity is. Particularly successful uses of this ritual may lead to dots in the Alternate Identity Background (V20, p. 111).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Grasp the Ghostly"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 184


5. Grasp the Ghostly


Requiring a full six hours of chanting, this ritual allows a necromancer to bring an object from the Underworld into the real world. It’s not simple, however — a wraith may object to having his possessions stolen and fight back. Furthermore, the object taken must be replaced by a material item of roughly equal mass, otherwise the target of the ritual snaps back to its previous, ghostly existence.
Objects taken from the Underworld tend to fade away after about a year. Only items recently destroyed in the real world (called “relics” by ghosts) may be recaptured in this manner. Artifacts created by wraiths themselves were never meant to exist outside the Underworld, and vanish on contact with the living world.
Necromantic ritual casting (p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["5. Mirror Prison"] = {
					en = [==[Rites of Blood, p. 29


5. Mirror Prison


System: The thaumaturge must polish a silver mirror with a point of her blood and the tears of an innocent child. The thaumaturge must expend a point of Willpower that is permanently absorbed by the mirror.
Once created, the thaumaturge may open a portal through the glass by touching it with a point of her blood. The opening to the mirror prison lasts as long as desired by the caster. Incapacitated prisoners may be passed through with no difficulty, but an unwilling target requires an opposed Strength roll to force the victim through the portal.
Escaping the mirror requires the prisoner to defeat the caster in an opposed Willpower roll with a difficulty of 8. A prisoner may only attempt to escape in this fashion once every thirty days. The cell can comfortably contain up to three individuals. A person inside may not be scried for or be the target of Clairvoyance (or similar powers, at Storyteller discretion). The prisoner needs neither sustenance nor sleep, as she remains untouched by the passage of time.
Should the mirror be destroyed or the thaumaturge wish to cancel the ritual, the stored Willpower point will return to her and any prisoners will instantly be released.
If the caster spends a point of blood and touches the mirror, she can increase or decrease the opaqueness of the glass, allowing the prisoner to see outside of her prison as she wills. If the mirror is clear, the prisoner can appear in the mirror as a floating head to communicate.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Mirror of Blood"] = {
					en = [==[Rites of Blood, p. 107


5. Mirror of Blood


System: The blood cost of this ritual is 3 points for each child to be transformed into a Blood Brother. After three months of casting, on the final night of the ritual, the thaumaturge must make ten rolls — one for each child involved in the ritual. These rolls are made with Intelligence + Occult (difficulty 9). If the thaumaturge achieves at least one success on a roll, that child survives. If two or fewer children survive the process, the entire ritual is a failure, and all of the children die. If three or more of the original ten children survive, the ritual is a success. The number of children who survive are the numbers of Blood Brothers in the new, unified pack.
Attempted use of this ritual, whether successful or not, removes a single point of morality from the user’s morality total if they are on Humanity. Other paths (particularly those which eschew killing) may require a similar (or greater) morality loss. Blood Brothers created with this ritual are infertile, and cannot Embrace.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Nectar of the Bitter Rose"] = {
					en = [==[Rites of Blood, p. 155


5. Nectar of the Bitter Rose


System: The thaumaturge must restrain the victim in some fashion while casting this hour-long ritual over him. She must chant the proper incantations while her coterie of would-be diablerists taunt the victim over his impending doom. While distracted, the caster mystically identifies different aspects of the soul and symbolically separates them from the whole by draining the target of vitae in small batches.
At the ritual’s completion, the caster and up to five vampires may attempt to gain the benefits of diablerizing the subject. Each would-be diablerist must make a separate challenge to claim the dark prize. Nectar of the Bitter Rose does not allow a vampire to gain benefits from diablerizing a victim of weaker or lesser generation — it simply lets multiple people share in a diablerie.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Occlude the Western Road"] = {
					en = [==[Dark Ages Tome of Secrets, p. 43


5. Occlude the Western Road


The sorcerer enacts the ritual that Haqim himself first created to keep the Holy City of Alamut hidden from the rest of the world. While wearing a traveling cloak and sandals, she must request the blessing of the Eldest in her task. The Eldest recites the teachings of Haqim, and instructs the sorcerer to keep safe the ways to Alamut. The sorcerer then meditates for an hour. Within an hour of sunrise, the sorcerer must take a vial with blood from the pool at the center of Alamut and mix it with dust from the Western Road while speaking the name of Alamut in the language of the First City under slowly brightening skies. She draws a circle around herself with the blood and implores the sun to erase all signs of travel to and from her location when it rises. The Cainite then anoints her own head with the blood and lays down flat, facing up with arms outstretched. After another incantation, a steady wind rises, at which point the sorcerer must hurry to shelter before the sun crests the horizon. When she sleeps, she is drained of blood, save for one point when she wakes. The sorcerer’s ritual erases all evidence of paths to and from her location. Anyone coming within a half mile radius of the location will travel around if reasonably possible, or will pass by without noticing her or the location she wishes to protect.
This effect lasts one month. Used within Alamut, it affects the whole of Alamut.
Assamite Sorcery ritual casting: the Tome of Secrets states no roll of its own for these rituals; Assamite Sorcery is mechanically identical to Thaumaturgy (V20, p. 440). Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["5. Orphic Sojourn"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 296


5. Orphic Sojourn


Orphic Sojourn allows a necromancer to project her soul from her body and effectively exist as a ghost for the duration of the ritual.
Orphic Sojourn requires that the vampire dress herself in funerary garb and surround herself with grave goods. She lies down and meditates from dusk until midnight. After midnight, she is freed from her body. She may wander the Underworld and interact with the objects and creatures as if she were a ghost for a number of hours equal to her successes on her ritual roll. When the ritual expires, she immediately returns to her body. Orphic Sojourn may not be used to retrieve objects from the Underworld.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["5. Paper Flesh"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 240


5. Paper Flesh


System: This ritual causes the subject’s Stamina and Fortitude (if any) to drop to 1 each. For every Generation below Eighth, the subject retains one extra point of Stamina or Fortitude (keeping Fortitude first, though she may not exceed her original scores). For example, a vampire of the Fourth Generation with Fortitude targeted by Paper Flesh would drop to a Stamina + Fortitude score of 6 (assuming the score was 6 or more to begin with). This ritual lasts one night.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Ravening Walls of Ceoris"] = {
					en = [==[Dark Ages Companion, p. 117


5. Ravening Walls of Ceoris


Note: This is a Haven Ritual (see Dedicate the Haven, V20 Dark Ages, p. 310)
This ritual is named for the fortress it was first used to protect. The caster sheds one blood point per 50 feet of a stone wall’s length (and spends 15 minutes per section) while invoking the names of earth spirits stolen from the lore of the Tzimisce. For the rest of the night, anyone touching or climbing the wall for the first time is drained of one blood point.
Immune to the ritual’s effects, the caster may touch the wall and harvest the stolen blood at a rate equal to her Generation-based expenditure limit, as an instant action. Each section of wall can hold as many blood points as the caster’s Thaumaturgy rating at any one time. The wall keeps draining excess blood, but sheds it in the form of a foul black ooze that cannot be used for sustenance.
For every dot of the caster’s Thaumaturgy above 5, she can designate one additional Cainite as immune to the wall’s blood-draining effects, and able to harvest blood from it.
Haven Ritual (V20 Dark Ages, p. 310): Once dedicated by Dedicate the Haven, a haven is open to more defenses; any Haven Ritual cast upon it is rendered permanent and has its casting difficulty decreased by three.
Thaumaturgical ritual casting (V20 Dark Ages, p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["5. Rickard Argentis’s Homunculus"] = {
					en = [==[Dark Ages Tome of Secrets, p. 116


5. Rickard Argentis’s Homunculus


This odd ritual allows the caster to take the personality of a slain mortal, and invest it into a shadow entity. The ritual must be completed with a human sacrifice. The ritual creates a single Arm of Ahriman, which is statistically normal as if created by the caster, except that it can listen, speak, and act of its own will. It also gains Mental Attributes and Charisma and Manipulation equal to the slain mortal’s. The shadow becomes, for all intents and purposes, a copy of the mortal’s personality, but under a full blood bond to the caster. It persists until slain, but requires a blood point per week to survive.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				["5. Rite of Marduk Slain and Risen"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 310


5. Rite of Marduk Slain and Risen


Assamite Ritual. The sorcerer makes contact with a vizier, who names a victim that a warrior intends to diablerize. The sorcerer then takes part in a one-hour group ceremony with three other participants who know the ritual. All don robes and masks to ceremonially re-enact the myth of Marduk; taking the parts of Marduk, Ea, Sarpanitu, and the chaos dragon, Tiamat. If successful, and the beneficiary diablerizes his specified target before the next sunrise, the victim’s sire, all of the sire’s and the victim’s childer, and any vampire holding a Blood Oath with the victim share her final sensations as she perishes. Each affected subject loses one blood point and three Willpower points, which go to the diablerist (this cannot exceed Trait maximums). If the diablerist’s blood pool and Willpower are full, the remainder goes to the vizier, and following that, to the sorcerer. Furthermore, all of these collateral targets lose one point of Willpower for every ten minutes they spend in the presence of the diablerist, the vizier, or the sorcerer due to suffering flashbacks of the original victim’s demise. This effect lasts for 13 nights.
Clan rituals (p. 302): Clan rituals are jealously guarded secrets that are never shared with those not belonging to the clan or bloodline harboring its mysteries.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["5. Sanctuary"] = {
					en = [==[Rites of Blood, p. 29


5. Sanctuary


System: To complete this ritual, the thaumaturge must invest a permanent point of Willpower into the consecration of the targeted building at the end of the three-night ritual. Once completed, the shroud of sanctuary completely envelops the boundaries of the targeted building. All souls, living or otherwise, that are not specifically invited by the caster cannot enter the building. Further, those inside the building are protected against all uses of Animalism, Auspex, Dominate, Dementation, and Presence (and related Disciplines, at Storyteller discretion).
However, this protection does not come without a price. The shroud of sanctuary only lasts as long as the grounds remain consecrated. Any acts of violence committed within the building will immediately taint it, making it impossible to benefit again from Sanctuary. Should the ritual be broken, the caster will immediately become aware of this, as the Willpower point invested into the building reverts back to her.
If the building remains consecrated, the magic of this ritual continues for one year per success from the activation roll. Afterward, the caster must either reinvest the Willpower point or allow the sanctuary to dissipate.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Seeing With the Sky’s Eyes"] = {
					en = [==[Rites of Blood, p. 163


5. Seeing With the Sky’s Eyes


System: Each success allows the player to ask one question about the target’s current location and activities.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["5. Severed Hand"] = {
					en = [==[Rites of Blood, p. 155


5. Severed Hand


System: This ritual takes an entire night to perform, during which time the wound is treated with different alchemical compounds to prevent the regeneration process. Although the health levels can heal in the normal way, the severed body part is unable to be restored to its former condition without magical healing (such as Obeah, V20, p. 457).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Shackles of Blood"] = {
					en = [==[Rites of Blood, p. 167


5. Shackles of Blood


System: The false bond lasts for a number of nights equal to the successes. At the end of that, the effect ceases, but if the wangateur successfully blood bonds the target for real during that time, it acts like any normal blood bond. While this ritual would seem to be needlessly overcomplicated compared to blood bonding through conventional means, it has a potent advantage — if the potion is fed to a mortal, any vampire who feeds on that mortal within the next 24 hours is affected as if he had drunk it directly. In this way, a devious wangateur can gain power over a vampire who does not even know she exists.
Blood magic dice mechanics (p. 130): for the purposes of this book every school of blood magic works the same way — Willpower rolls for path powers and Intelligence + Occult rolls for all rituals, at a difficulty of 3 + the ritual’s level. Storytellers who prefer the dice pools listed in V20 or in prior supplements may use those instead.]==],
				},
				["5. Skinwalker’s Belt"] = {
					en = [==[Rites of Blood, p. 63


5. Skinwalker’s Belt


System: Each success means that the artifact will last for one week before degrading. It can be maintained for another equivalent duration by smearing it with a quantity of the ritualist’s blood equal to that used in the ritual that created it.
After the ritual is complete, the player of the ritualist must roll Intelligence + Craft to fashion the pelt into a wearable item of clothing. A failure can be rerolled, but a botch destroys the pelt. However, only one success is needed to complete the process. More successes simply mean that the artifact is more aesthetically pleasing. To use the Skinwalker’s Belt, the ritualist must remove all other clothing (including jewelry) before donning the artifact and mutter a brief incantation, whereupon he instantly transforms into a perfect copy of the animal used in the ritual. He cannot use Disciplines in this form (not even physical Disciplines such as Potence or Fortitude), and he cannot speak except to those who have the supernatural ability to speak to animals. He retains his human intelligence and is still subject to frenzy.
The effects of the magic last until he wills it to end or until daybreak. In either case, he instantly reverts to his true form, which can be very bad if he was in a small space wearing the size of a mouse or he is out in the open when he reverts back to a nude male who takes aggravated damage from sunlight. The artifact counts as the equivalent of a lock of hair or a fingernail if it falls into the hands of another blood magician (see Principle of Sympathy on pp. 133-135).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Stone Slumber"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 310


5. Stone Slumber


This ritual protects the caster by turning him into solid stone. The caster must begin this ritual exactly one hour before sunrise and swallow a pint of small rocks while remaining completely still in an open area facing east. When the first rays of the rising sun strike him, the caster’s body turns to unbreakable magical stone. If successful, the caster is completely protected from all physical damage, including flame and heat. While in this form, the caster’s mind is dormant; he is completely oblivious to his surroundings and cannot wake up – Telepathy and other mental Disciplines are useless. The ritual lasts until 10 minutes after the following sunset, and waking the following evening costs the caster an additional blood point.
This is a Gargoyle Ritual (see Enchant Talisman on p. 309).
Gargoyle Rituals (p. 309): Tremere thaumaturges may cast Enchant Talisman onto a Gargoyle to permanently enchant it with a specific ritual she knows. To accomplish this feat requires six hours per night, and one week per level of the ritual. Once successfully cast, a ritual permanently enchanted onto a Gargoyle becomes inherent to him, like a Discipline, and may be activated, deactivated, and reactivated at will by the Gargoyle spending one blood point. If the ritual is tied to a specific item, it is instead tied to the Gargoyle itself. Rituals activated by a Gargoyle require no roll to cast and last a scene or until dismissed.
Thaumaturgical ritual casting (p. 302): Unless otherwise noted, casting rituals requires the expenditure of one blood point, five minutes per level to cast, and a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Rituals sometimes require special ingredients or reagents to work, which are stated in each ritual’s description. Only a single success is required for a ritual to work, though certain spells may require further successes or have variable effects based on the caster’s roll.]==],
				},
				["5. Stone of the True Form"] = {
					en = [==[Rites of Blood, p. 156


5. Stone of the True Form


System: Over the course of one night, the thaumaturge must cast this ritual on a small round stone such as a marble. Afterwards, the cast may use this stone as a trigger to engage her target in a contested Willpower roll (difficulty of each other’s Stamina). If the caster wins by even one success, the subject will immediately shift to her natural form for a single turn. Every success above and beyond the first success extends the number of turns a target is unable to assume a shape other than her original form. If the stone is shattered, the victim is now free to change shape no matter how many turns left remain on her term in her original form.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. The Ferryman’s Recall"] = {
					en = [==[Lore of the Clans, p. 109


5. The Ferryman’s Recall


System: The caster must have access to the corpse as well as one of the subject’s fetters, perhaps obtained using Ritual of the Unearthed Fetter (V20, p. 181). The Ferryman’s Recall takes 8 hours (reduced by one hour per success on the casting roll) to perform.
The corpse must be relatively intact for the ritual to work, and the subject must have been a ghoul before death. If the necromancer performing the ritual was not the domitor, they must have a blood point worth of the domitor’s Vitae. The Generation of the Kindred giving the Embrace (usually, but not always, the necromancer performing the ritual) determines how much time may have passed since the subject’s death, as more powerful vitae has a more potent effect.
Thirteenth Generation — 12 hours dead
Twelfth Generation — 1 day dead
Eleventh Generation — 2 days dead
Tenth Generation — 3 days dead
Ninth Generation — 4 days dead
Eighth Generation — 5 days dead
Seventh Generation — 1 week dead
Sixth Generation — 2 weeks dead
First, the subject’s body must be cleaned and prepared, drained entirely of blood or embalming fluid. Then the necromancer paints a series of sigils onto the body, intended as place markers for the subject’s spirit to relearn how to use his body. At the climax of the ritual, the Kindred performing the Embrace pours her vitae into the subject’s mouth, and the Embrace continues as normal. Any wounds suffered before the ritual (including the cause of the subject’s death and any decomposition) close, but do not entirely heal, leaving scars on the newly Embraced Kindred’s body. In addition, the subject’s time across the sudario leaves its mark on him; giving him the ashen complexion of the Harbingers of Skulls, as well as endowing him with an improved facility for necromantic magic (see the Mortuario Merit on p. 106 for more information).
Necromantic ritual casting (V20, p. 177): Casting times for necromantic rituals vary widely; see the description for particulars. The player rolls Intelligence + Occult (difficulty 3 + the level of the ritual, maximum 9). Success indicates the ritual proceeds smoothly, failure produces no effect, and a botch indicates something has gone horribly wrong.]==],
				},
				["5. The Inmost Tug"] = {
					en = [==[Rites of Blood, p. 158


5. The Inmost Tug


System: Each success represents one scene in which the thrall is compelled to feel an emotion of the koldun’s choice toward him.
Koldunic Sorcery dice mechanics (p. 156): the roll to activate a Koldunic Sorcery ritual is Intelligence + Occult with a difficulty equal to 3 + the ritual rating. The school’s metaphysical connections to Kupala and to the lands permeated by that spirit increase the difficulty by +1 on all Koldunic Sorcery rolls made on behalf of kolduns who work their magic outside the territories of Eastern Europe.]==],
				},
				["5. The Pursuit of Apotheosis"] = {
					en = [==[Rites of Blood, p. 64


5. The Pursuit of Apotheosis


System: The ritual either works or it does not — additional successes do not provide any further reward. For every mortal worshiper who dies as part of the ritual, the player must roll one die against a difficulty of 7. Every success gives the player one experience point that can be used to purchase new or improved traits as per normal experience costs. From the character’s perspective, these new Attributes, Abilities, and Disciplines are the result of a momentary glimpse of godhood paid for by the deaths of loyal followers. According to some rumors, a sufficient number of successful sacrifices can also be expended to permanently reduce a vampire’s Generation. The truth of those rumors and the number of successes needed to achieve such a feat are left to the Storyteller’s discretion. Regardless, however, any sorcerer who uses this ritual finds that her aura becomes streaked with black marks that are indistinguishable from those resulting from diablerie.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Treasures of Hades"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 296


5. Treasures of Hades


This complex and lengthy ritual allows a necromancer to retrieve Relics from the Underworld. The ritual requires that the necromancer chant for six hours while burning a replica of the Relic (which needn’t be well-crafted or convincing). At the conclusion of the ritual, the Relic will appear in the ashes of the replica. In order to summon a Relic, the celebrant must have seen it before. This ritual cannot be used to retrieve non-relic objects in the Underworld, such as the soul-cutting blades of the ghost kings.
It is unlikely that a useful Relic can be taken away without anyone noticing, however. Relics are precious, jealously guarded commodities in the Underworld, and ghosts have an uncanny way of tracking down meddling necromancers who plunder their treasuries.
Objects taken from the Underworld will remain in the living world until All Hallows’ Eve, at which point they return to the sunless lands. A necromancer can only summon a particular Relic once every one hundred years.
Necromantic ritual casting (p. 292): To perform a ritual correctly, a player must succeed at an Intelligence + Occult roll with a difficulty equal to 3 + the level of the ritual, maximum 9. Failure produces no effect, but a botch may produce disastrous results.]==],
				},
				["5. Ward versus Spirits"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 240


5. Ward versus Spirits


System: Ward versus Spirits behaves exactly as does Ward versus Ghouls, but it affects spirits (including those summoned or given physical form by Thaumaturgy Paths such as Elemental Mastery). The material component for Ward versus Spirits is a handful of pure sea salt.
The other versions of this ward, also Level Five rituals, are Ward versus Ghosts and Ward versus Demons. Each of these three Level Five wards affects its respective target on both the physical and spiritual planes. Ward versus Ghosts requires a handful of powdered marble from a tombstone, while Ward versus Demons requires a vial of holy water.
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Warding Circle versus Technology"] = {
					en = [==[Rites of Blood, p. 102


5. Warding Circle versus Technology


System: The ritual requires three points of mortal blood from individuals with at least an intelligence of 3. The caster determines the size of the warding circle when it is cast; the default radius is 10 feet/3 meters, and every 10-foot/3-meter increase raises the difficulty by one (one additional success is required for every increase past the number necessary to raise the difficulty to 9). The player spends one blood point for every 10 feet/3 meters of radius, and rolls. The ritual takes the normal casting time if it is to be short-term (lasting for the rest of the night) or one night if it is to be long-term (lasting a year and a day).
Once the warding circle is established, it glows a faint coppery-orange, too faint to be seen in normal light, but notable in dim lighting conditions or natural darkness. A successful Intelligence + Occult roll (difficulty 8) identifies this as a warding circle. If technology crosses into the circle, the possessor of that technology must roll more successes on a Willpower roll (difficulty equal to the caster’s Thaumaturgy rating + 3) than the caster rolled when establishing the ward. Failure indicates that the ward causes all such technology on the individual to be irrevocably destroyed; data cannot be retrieved at a later date, and all parts of the item shatter. If the technology leaves the circle and later enters it again, the possessor must repeat this roll.
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Warding Circles versus Spirits, Ghosts, and Demons"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 234


5. Warding Circles versus Spirits, Ghosts, and Demons


System: As Warding Circle versus Ghouls (p. 234), but the circle affects spirits, ghosts or demons, according to which of the three circles is cast. The material components are those of the corresponding Level Five ward, in larger amounts: pure sea salt for spirits, powdered marble from a tombstone for ghosts, and holy water for demons. The caster determines the size of the warding circle when it is cast; the default radius is 10 feet/3 meters, and every 10-foot/3-meter increase raises the difficulty by one, to a maximum of 9. The ritual takes the normal casting time if it is to be short-term (lasting for the rest of the night) or one night if it is to be long-term (lasting a year and a day).
Thaumaturgical ritual casting (p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Way of the Wendigo"] = {
					en = [==[Rites of Blood, p. 30


5. Way of the Wendigo


System: The thaumaturge seeks out a victim that she believes is an example of a virtue that she admires, such as intelligence, purity, or reverence. She must anoint the sacrifice with oil, sage, and ash during an hour long ritual. At the climax of the ritual, the caster murders the victim with the thigh bone of a hanged man and then consumes his flesh.
Consumption of the flesh allows the thaumaturge to absorb the victim’s essence to replenish the needs of her undead body and will. She will feel a rush of drowsiness and will be at -1 to all dice pools for the next hour. However, every ten minutes that the thaumaturge rests, she will regain a point of Willpower and one health level. At the end of the night, if the thaumaturge does not possess the merit Eat Food (V20, p. 480), she is forced to vomit up the excess flesh.
This is a horrific ritual where the sacrifice must knowingly endure the knowledge that he is going to die and then be consumed. Such a heinous action takes a toll on the humanity of the thaumaturge, as her mind is flooded with flashes of the victim’s life and experiences the agony of her death. The use of this ritual automatically strips a minimum of one Humanity dot from the character’s Humanity rating (to a minimum of 2). Additionally, the Storyteller might require a Conscience roll (difficulty 8). Failure means the loss of an additional Humanity point (which can fall below 2), while a botch could well mean the loss of even more.
The use of this ritual requires a Self-Control roll (difficulty 8). Failure means that the thaumaturge has gained the permanent Flaw Addiction: Human Flesh (V20, p. 482).
Thaumaturgical ritual casting (V20, p. 228): Unless stated otherwise, a ritual requires five minutes per level to cast. Casting rituals requires a successful Intelligence + Occult roll, for which the difficulty equals 3 + the level of the ritual (maximum 9). Only one success is required for a ritual to work, though certain spells may require more successes or have variable effects based on how well the caster’s roll goes.]==],
				},
				["5. Whispers in the Dark"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 273


5. Whispers in the Dark


System: The caster summons and contracts a Nocturne, as with Reflections of Hollow Revelation, until it can fit in the palm of her hand. The caster focuses her thoughts on a single question, which the Storyteller assigns a rating from 1 to 10 based on the importance or complexity of the answer, with 1 as trivial knowledge and 10 as truly revelatory.
When ready, the caster swallows the Nocturne. Once this is done, the vampire falls into torpor as her consciousness is catapulted into the Abyss. For each night spent in torpor, the player rolls Intelligence + Occult with a difficulty of 8. Successes are accumulated over successive nights until the player has successes equal to the question’s rating.
Of course, attempting to commune with the alien thoughts of the Abyss can be dangerous. If the Mystic accumulates no successes on her roll for one night, the interval between rolls increases from one night to several nights to weeks, and so on. Even successful use of this ritual leaves the mystic forever altered as she can never entirely dislodge the alien hunger of the Abyss from her soul. After using this ritual, when dealing with non-mystics vampires permanently reduce the difficulty of all Intimidate rolls by one, and increase the difficulty of all Social rolls by one (two when dealing with humans). This drawback is not cumulative.
Legend has it that the reason for Lasombra’s carefully guarded slumber in the Castle of Shadows is that he lies dreaming of a way to destroy creation itself.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["6. Into the Chasm"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 273


6. Into the Chasm


System: In preparation, the Mystic spends one hour and three points of her own blood painting a doorway with glyphs of the Abyss. When finished, they roll Intelligence + Occult, difficulty 7. On a botch, a portal to the Abyss opens in the doorway, but only long enough to discharge a number of Hungry Shades equal to the number of 1s rolled. A failure causes the glyphs to flare and disappear with no result. Success results in an open and stable portal with no backlash that remains open for as many turns as successes rolled.
Once a character steps through the portal, she speaks her destination to the Abyss and roll Wits + Obtenebration to open a portal out of the Abyss, difficulty 6. Each failed attempt increases the difficulty, to maximum of 10. Additionally, the Mystic takes a level of lethal damage that cannot be healed while within the portal. Botched attempts additionally attract a Hungry Shade.
Non-Mystics may enter an open portal into the Abyss by spending Willpower. The Mystic may choose to guide them by remaining in physical contact. Otherwise, her difficulty to exit the Abyss is 8. Non-Mystics cannot understand the formless chaos of the Abyss and see only total blackness. A Non-Mystic who attempts to use supernatural means of enhancing her senses while in the Abyss must make a Willpower roll or immediately gain a Derangement, as the horrible nothingness of the Abyss is often too much for non-Mystics to deal with.
Each time a vampire traverses the Abyss, they risk permanent contamination. Upon leaving the Abyss, each character must roll her Willpower against a difficulty equal to the number of rolls needed to exit the Abyss. A failure causes them to gain the Flaw Animate Shadow (see p. 427).
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["7. Evocation of the Oubliette"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 274


7. Evocation of the Oubliette


With this ability, the Mystic causes nearby shadows to erupt and devour a victim, sending them into the Abyss.
Abyss: The Mystic spends a full turn in concentration before spending three blood points and rolling Perception + Occult (difficulty 6) against a target that must be within line of sight. This attack may not be parried, but may be dodged. A successful attack results in the victim being dragged into the Abyss, where they remain for a number of nights equal to the caster’s Obtenebration rating - though the Mystic may spend a blood point to summon them back sooner.
The Abyss is a harrowing experience for those not initiated in its mysteries. Any character without levels of Abyss Mysticism gains a Derangement after her experience that can only be cured through repeated use of Willpower. A botched casting of this ritual results in the ritual backfiring and dragging the caster herself into the Abyss for a number of hours equal to her rating in Obtenebration. If the caster’s Willpower is lower than her rating in Obtenebration, she gains a Derangement as if she was a non-Mystic subject to this power.
A level 8 version of this ritual exists, known as Summoning of the Abyss. With this ritual, the Mystic speaks the name of a person they wish brought to them. That person is pulled into the Abyss, as above, and is immediately disgorged in the Mystic’s location, suffering all effects as above for traveling through the Abyss.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["8. Cry That Slays the Light"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 274


8. Cry That Slays the Light


System: In order to learn the Cry That Slays the Light, the vampire spends a week of nights in complete and utter silence, devoting every waking moment to meditation on her hatred of light and material existence. If at any point her silence is broken, they must begin again. Once the week has passed, roll Intelligence + Occult, difficulty 8. On a botch, the character is pulled into the Abyss for a period of one century per every 1 rolled. She remains alert and aware, never falling into torpor from blood starvation, and gains a number of Derangements equal to the number of 1s rolled.
On a success, the Mystic divines the shape of the word that encapsulates the Abyss. This word becomes part of the Mystic and cannot be discerned by another character through Telepathy or any other supernatural means. The Mystic may hold back this word as long as she chooses — days, years, decades - before she releases it and the Abyss darkens the sky for one hour. During this hour, all vampires are immune to Rötschreck and need not worry about sunlight, even at midday. Once the hour is over, the word fades from the Mystic’s mind and must be re-learned.
Even when successful, allowing oneself to be a direct conduit for the Abyss comes with dire risk. After using this power, roll a number of dice equal to the Mystic’s Road rating, difficulty 4. Each success allows the Mystic to retain two dots of her Road rating for Mystics on the Road of the Abyss, one dot for Mystics not on the Road of the Abyss. If the Mystic’s Road is reduced to 0 in this fashion, the Abyss utterly annihilates her existence.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["8. Lord Aludian’s Claim"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 274


8. Lord Aludian’s Claim


With most Abyss Mysticism rituals, a vampire pokes a subtle hole through reality, temporarily letting a primal, dark unknown through that portal. This phenomenal expression of tenebrous mastery tears down the boundaries between the realms of flesh and shadow on an almost permanent basis. This curses an area to become a hub of shadowy nightmares indefinitely.
This ritual requires an extended Manipulation + Occult roll, difficulty 8. Each roll represents one hour, and you can make rolls equal to your character’s Willpower dots. Five successes are required to claim a five meter diameter, and which can allow through one shade (see p. 272). Additional successes can be spent to add an additional five meters to the diameter, or allow one additional shade to cross. These shades can leave the portal’s vicinity. However, the portal can only support a total number of intruders as determined by the initial roll. Whenever a shade dies, it returns at dusk. The shades are completely subservient to the caster.
The portal only closes when voluntarily closed, exposed to sunlight, or to True Faith. A character may only have one such portal open at a time.
Abyss Mysticism ritual learning (p. 271): Abyss Mystic rituals are different from other forms of blood sorcery rituals, as they are based on use of a Discipline and not magic. Characters looking to learn Abyss Mysticism rituals must possess an Occult rating of 3. Characters may not learn a ritual with a level higher than her Obenebration or Occult rating. Furthermore, characters must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn. Many Abyss Mystic rituals have side effects that confer Flaws; characters can never receive experience or bonus points for Flaws gained as a side effect of Abyss Mystic rituals.]==],
				},
				["9. Boukephos’ Chosen Oubliette"] = {
					en = [==[Dark Ages Tome of Secrets, p. 38


9. Boukephos’ Chosen Oubliette


System: The Abyss Mystic must paint a circle of pitch around the perimeter of an aboveground community — whether a hamlet, village, town, or city. This circle is broken if crossed by a child, or a believer with True Faith. Once the circle is in place, the Abyss Mystic must draw her own blood in its center, under the night’s sky, spending three blood points as she pools her vitae on the earth. The vampire must then spend one Willpower point, and succeed on an extended test of Intelligence + Occult (difficulty 8) with a target number of 8 successes for a small community, 15 for a large community, and 22 for a huge population center. These successes must be accumulated in the course of one night, and the practitioner cannot be disturbed, otherwise the ritual will fail. Upon the final success, the pitch circle surrounding the community ripples, and forms tall waves that crash into whatever lies within it. An aboveground Oubliette forms, and everything within it shifts to the Abyss. Once the night has passed and the Oubliette dissipates, only those within the Oubliette who achieved successes on a Willpower test (difficulty 9) remain, with a Derangement. Everyone else is taken to the Abyss, and will remain there for a number of nights equal to the Abyss Mystic’s Obtenebration rating, suffering the effects listed under the Oubliette Background. Botching the ritual results in the Abyss Mystic disappearing into the heart of the Abyss forever. The practitioner is not recoverable.
Abyss Mysticism rituals (p. 35): Abyss Mystics hoard their secrets. Members of other groups may not access their Rituals without first dedicating their existences to the Abyss.
Abyss Mysticism ritual learning (V20 Dark Ages, p. 271): Abyss Mystic rituals are based on the use of a Discipline and not magic, and each ritual states the roll of its own. Characters must possess an Occult rating of 3, may not learn a ritual with a level higher than their Obtenebration or Occult rating, and must have an Occult specialization in Abyss Mysticism or add 1 to the difficulty of each ritual. Each ritual costs 3 experience points per level to learn.]==],
				},
				-- <<< RITUAL_DESC_END
};
