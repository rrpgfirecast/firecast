-- Numina descriptions, the [en] half (SPEC T495, V210).
--
-- descNumina.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [en] only, descNumina_pt.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descNumina_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Numina descriptions, transcribed from M20 Sorcerer (chapter 1 pp. 18-51, chapter 2
-- pp. 54-77): intro prose + the System block / dot levels. Sample rituals, recipes,
-- creations and sidebars are deliberately out (SPEC C, T62).
--
-- Keyed by the canonical ENGLISH picker value, because that is what the sheet saves
-- (SPEC V24). `pt` is a translation of the same text, paragraph for paragraph.
-- This table is NOT part of the HH.6 `PT` map on purpose (SPEC V28 / V31): the block
-- is re-rendered from here on every language change instead of being translated
-- in place, so the English original can never be lost.
--
-- SPEC I24 / T478: this table used to be an upvalue inside the <script> of HH.7.lfm.
-- The <script> CDATA is copied raw into constructNew_frmHH_7(), so every open sheet
-- parsed and kept its own 380 KB copy. As a module it is parsed once and cached in
-- package.loaded, and the require that pulls it lives INSIDE numinaText (SPEC V198).
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).

return {
				-- >>> DESC_BEGIN (generated - SPEC T62)
				["Alchemy"] = { en = [==[M20 Sorcerer, p. 18


Alchemy


System

Modifiers: Once the magician successfully follows a recipe three times, the difficulty is reduced by one.

Time: Alchemy takes longer to obtain results than most Paths. Recipes require one day per level to prepare, but this can be shortened if the Path Ability exceeds the recipe level. Each dot of the Ability higher than the ritual level reduces the total time spent by one day. If this would reduce preparation time below one day, instead assume several hours of work.

Duration: Effects last for a single scene unless otherwise noted.

Effects: Alchemy doesn’t have Aspects; instead, each dot increases the practitioner’s power and control. Except for the most potent recipes, they only require a single success to make. Additional successes are split between providing additional doses and keeping those doses potent for one day per success spent.

• Distillations at this level do not appear magical in any way. These recipes are simply more advanced versions of extant chemicals and concoctions, producing more potent painkillers, poisons, glues, solvents, etc., and increasing the Toxin Rating of the chemical by one (as per Mage 20 p. 442). Higher Path levels can further alter the Toxin Rating, increasing or decreasing the rating by one per dot.
•• Now the substances created let the imbiber exceed their usual physical limits. Any one Attribute can be increased by one dot, up to a maximum of five, for the scene. Special preparations can expand one’s mystical awareness, mostly through induced dreams or hallucinations. These visions are left to the Storyteller’s discretion and should remain cryptic and uncertain. Visions attained at this level lack the power of a system benefit and are included as a narrative device.
••• Not only can the alchemist now enhance their targets beyond the normal capabilities of humans, but they can also grant low-level psychic abilities (see Chapter Two) for an hour at a time. These psychic abilities begin at a single dot, but every additional two successes provides an additional dot, to a maximum of the alchemist’s Path rating.
•••• Alchemists can bring about truly potent improvements to living beings. They can increase a single Attribute or Ability by two or two Attributes or Abilities each by one, and the normal human limit of five no longer applies.
••••• The alchemist can now craft recipes that reproduce up to three dots worth of supernatural powers. Each dot reproduced this way mimics a single effect — chosen when the recipe is crafted — even if the replicated power offers multiple effects. These are some of the hardest potions to produce and require exotic components, such as pieces of the supernatural being in question.

Price of Failure: Working with volatile compounds is dangerous in and of itself. Even mere failure results in broken equipment and ruined reagents, requiring expensive replacements. In the best-case scenario with an actual botch, the alchemical product explodes, potentially damaging the magician (as well as their neighbors). More commonly, though, the botched recipe appears to come together perfectly, but produces undesirable, and possibly harmful, effects. Even an unexpected but benign effect can be catastrophic at the wrong time.]==] },
				["Conjuration"] = { en = [==[M20 Sorcerer, p. 20


Conjuration


System

Modifiers: For any application that can be played off as — or described similarly enough to — stage magic, keep one success that would’ve otherwise been removed by witnesses. Even rational consensus is primed by pop culture to believe conjuring an elephant from nowhere is possible with clever visual trickery. Note that actions causing obvious physical harm can’t be explained in this manner.

Using Conjuration on an object in the grasp of someone actively resisting incurs a +1 difficulty. Attempting Conjuration to move a resisting target incurs a +2 difficulty. Apply a –1 difficulty for an object well-known to the sorcerer (see also Object Permanence below).

Aspects: Conjuration uses the Aspects of Distance, Number of Targets, and Weight. Conjuration notably doesn’t use Speed. The summoned target appears instantaneously on the successful completion of a spell or ritual. The sorcerer may also choose to buy the following effects with additional successes:

• 1 success to be able to use Conjuration to clumsily attack without touching the weapon (–1 die penalty to attack).
• 2 successes to attack as above but without penalty, or to give fine motor control to any object conjured, such as using a set of lock picks from a distance.
• 1 success for each additional round the sorcerer wishes to maintain the effect. The Sorcerer can’t drastically change the effect, such as throwing a puppet to strike someone after making the puppet dance, without rolling Conjuration again.

Price of Failure: While simple failure means no item is transported, a Conjuration botch runs the gamut from highly inconvenient to gruesome. A sorcerer might send an object to the wrong place, such as sending an item further out of reach or conjuring a prepared weapon directly to their own hand. Sometimes the sorcerer summons the wrong object entirely. Alternatively, a sorcerer might only conjure part of the intended item, and one only needs to imagine the horror of botching the Conjuration of a living being.]==] },
				["Conveyance"] = { en = [==[M20 Sorcerer, p. 22


Conveyance


System

Modifiers: +2 difficulty for each unwilling target, –1 difficulty for well-known locations

Aspects: In addition to the Aspects of Distance, Travel Speed, and Passengers, the following each increase the number of successes needed:

• 1 success to travel to a location the magician has never been to.
• 2 successes to teleport, even if not instantaneous This is required to attempt to use Conveyance offensively.
• Each barrier crossed costs one success. Barriers must be possible to bypass. This Path can’t penetrate hermetically sealed chambers.

Price of Failure: Mishaps with the Path of Conveyance can be extremely dangerous. Failures are innocuous enough, as simply nothing happens. Botches, however, tend to be specific to the method of transportation used and tend to impact the conjurer (pun intended) part way through the trip. Flying broomsticks fall out of the sky, seven-league boots leave you stranded leagues from your destination, and entire bodies of science-fiction discuss what happens when teleportation goes badly.]==] },
				["Curses"] = { en = [==[The Hunters Hunted II, p. 72


Curses


System

Roll: Manipulation + Intimidation (difficulty 7)

Modifiers: N/A

Cost: 1 Willpower

Duration: Varies (see below)

Path of Curses Levels

• The victim suffers brief inconveniences, such as dropping an object, saying something foolish, or having a motorcycle run over her foot. Mechanically, this is represented by the Storyteller adding a +1 difficulty to dice pools appropriate to the specified situation for the duration of the curse. For example, the injured foot might increase Athletics difficulties by 1, while saying something foolish might cause Etiquette difficulties to increase thus.
•• The victim suffers from a string of errors and bad luck that result in lasting injury or embarrassment, such as stepping on a nail, breaking an heirloom, or catching a minor disease. Mechanically, this is represented by the Storyteller increasing the difficulty of rolls appropriate to the curse by 2 for the duration of the curse.
••• The victim suffers severe accidents and misfortune. Typical effects might be broken bones, loss of income, or grievous illness. Mechanically, this is represented by the Storyteller increasing the difficulty of rolls appropriate to the curse by 3 for the duration of the curse.
•••• The victim suffers from major catastrophes and chronic illnesses. Mechanically, this is represented by the Storyteller increasing the difficulty of rolls appropriate to the curse by 3 for the duration of the curse. In addition, the victim subtracts one from associated dice pools during appropriate moments in the story.
••••• Curses inflicted at this level are nigh upon Biblical in scope. Nothing goes right for the victim for the duration of the curse. Her life is an exercise in misery, and may well be accompanied by plagues of locusts, being stricken barren, or causing despair in those she meets. Mechanically, this is represented by the Storyteller increasing the difficulty of rolls appropriate to the curse by 4 for the duration of the curse. In addition, the victim subtracts two from associated dice pools during appropriate moments in the story. Invoking a curse of this magnitude requires a Humanity roll for those Hedge Magicians of Humanity 4 or greater.

Curse Duration

The duration of a specific curse is determined by the number of successes achieved during the activation roll.

One success — The next action
Two successes — One scene
Three successes — One day
Four successes — One week
Five successes — One month
Six+ successes — Up to one year, decided upon the activation of the curse]==] },
				["Divination"] = { en = [==[M20 Sorcerer, p. 23


Divination


System

Modifiers: +1 difficulty if using Extraordinary Science, but this Practice gives more precise probabilities.

–1 difficulty when under the influence of mind-altering substances. Visions and signs may come easier and more vibrant in altered states but remain up to interpretation.

Aspects: Divination uses the following:

Time Period

• one day

•• one week

••• one month

•••• one year

••••• 10 years

Accuracy

• Visions and signs are incredibly vague and difficult to interpret with any certainty

•• Typically accurate but deeply buried in symbolism

••• Accurate but vague and open to misinterpretation

•••• The truth’s there under layers of symbolism, but not terribly difficult to interpret

••••• Accurate and often easy to understand, though still subject to human error

Query

• A simple question that could be answered yes or no if you were talking to a person rather than stars or entrails

•• A specific question that can be answered with a short and simple explanation. For example, “Which road ahead is safest?” but not “What’s our enemy’s plan?”

••• The question could be researched and answered with public source knowledge if only you had the hours to put in.

•••• The question may be detailed and require hidden information, but the information could be uncovered given enough time and know-how.

••••• A very detailed query that would normally require lost, destroyed, or deliberately hidden information to answer.

Price of Failure: In the best-case scenario, the sorcerer simply receives no visions or intuition due to failure. A botch, however, can give patently false or dangerously misleading readings. The hedge magician may divine that there’s no security at the location their coven is planning on breaking into, when the place uses enough security to rival Fort Knox. Alternatively, the sorcerer might correctly divine that a door’s lock is broken but fail to understand that the owner knows this and placed armed guards to watch it. The Storyteller should vary approaches to Divination botches lest they become predictable in and out of character.]==] },
				["Ephemera"] = { en = [==[M20 Sorcerer, p. 25


Ephemera


System

Modifiers: –2 to +2 difficulty depending on the spirit’s opinion of the magician.

Aspects: Metaphysical Weight and Spiritual Reach.

Spiritual Reach

• The magician can sense spirits and get their attention but can do little else.

•• The magician is restricted to calling upon a general type of spirit

••• Now specific spirits can be called through tailor-made rituals, and almost always show up unless the magician has offended them in some way.

•••• Spirits begin to approach the magician unprompted. The magician can see into the Penumbra, which increases the numbers and types of spirit they can interact with. The magician can also fight back against spirits if they need to, though most try to avoid it.

••••• The magician can now go to the spirits instead of needing them to come to the physical world. Though physical travel into the Umbra is still impossible, the magician can astrally project there, using Wits for Dexterity, Manipulation for Strength, Intelligence as Stamina, and Willpower as Health Levels. They are connected to their body by a silver thread, and if they run out of Willpower, it snaps, severing their connection and leaving them stranded.

Price of Failure: Dealings with spirits can be dangerous, especially at the early stages when all a magician can do is get the attention of whatever is nearby. Even at the higher levels, the most dangerous thing possible on a botch is to call the wrong spirit, with banes being particularly common.]==] },
				["Enchantment"] = { en = [==[M20 Sorcerer, p. 26


Enchantment


System

Modifiers: Once a magician creates a Talisman three times, the difficulty is reduced by 1.

Time: Crafting time for the object, plus 1-3 days per level of the enchantment

Effects: Enchantment doesn’t have Aspects, instead it has the following Effects:

• The Enchanter can create minor items that are rarely noticeably magical to those who aren’t already aware of their powers. This can add one (or, for restricted circumstances, two) dice to an Attribute or Ability roll or decrease the difficulty by 1 for an attack or skill. Other small boons are also possible.

•• More powerful versions of already possible Artifacts offer two additional dice or a –2 difficulty on a task. Some of the objects created at this level can change reality in a subtle way, being more magical than previously possible.

••• Obviously magical items are now possible, though they’ll still seem merely “very weird” to the magically unaware. These include items that offer two additional dice on up to three different Attribute or Ability rolls, and those that confer supernatural perceptions to the user by replicating supernatural powers of no greater than a single dot.

•••• Objects of truly superhuman power. These can raise Attributes above 5, duplicate powers (up to the second dot) of other supernatural beings, and otherwise warp reality in significant ways.

••••• Extremely powerful items often bordering on the mythic. Minor miracles are possible, and often these powers are quite blatant. Items created at this level can reproduce up to three dots worth of supernatural powers. Each dot reproduced this way mimics a single effect — chosen when the item is crafted — even if the replicated power offers multiple effects.

Price of Failure: Failure usually means the magician has wasted days or weeks of their time, possibly ruining the item they were trying to enchant, but nothing worse. Botches tend to be more varied. They can result in explosions that destroy the workshop. Worse, though, they can result in objects that seem to work, but have some sort of unanticipated side effect. These cursed items tend to be hard to destroy or get rid of, often lingering long after the Enchanter is gone and even finding their way into Sleeper hands.]==] },
				["Fascination"] = { en = [==[M20 Sorcerer, p. 29


Fascination


System

Modifiers: +1 difficulty for being disliked by the target, +2 difficulty for being hated by the target

Aspects: In addition to the Aspects of Number of Targets, Range, and Sympathetic Connection, Fascination uses the Allure and Willbending Aspects:

Allure

• Add 1 die to social die pools
•• Add 2 dice to social die pools
••• Add 3 dice to social die pools
•••• Add 4 dice to social die pools
••••• Add 5 dice to social die pools

Willbending

• Intriguing: You draw attention even in a crowd, and individuals find you interesting in one-on-one conversation. You may make mild suggestions that align with the target’s personality and situation such as getting another drunk if they are at a bar.
•• Alluring: Almost everyone at the gathering knows you were there, and individuals will try to find a way to see you again. You may make strong suggestions that align with the target’s personality and situation, such as heading home with the hedge wizard after a fun night.
••• Beguiling: Everyone assumes that you had a hand in setting up the party, and individuals around you will vie for your attention. You may make suggestions that don’t necessarily align with the target’s personality and situation, such as suggesting they break up with their long-term partner to give the caster of the spell a one-off chance.
•••• Entrancing: Invitations or not, the party is held for you by everyone’s estimation. Individuals no longer just want your attention, they crave your approval, possibly making fools of themselves in the process. You may make strong suggestions that don’t align with the target’s personality or interests, such as suggesting that the target fight another to defend the magician’s honor.
••••• Enthralling: If you started throwing things, this place would become a full-scale riot; those present find themselves hard-pressed to resist your requests, doing almost anything you might request. Hell, they may even kill for you or put their life on the line for you if you ask the right way. You may make strong suggestions that wildly defy the target’s character and circumstances, such as suggesting that the spell’s victim burns down a bar for daring to announce last call.

Price of Failure: The consequences of failure when manipulating hearts and minds tend to be based on the context of the situation. A simple failure at a party may go largely unnoticed after a moment of minor embarrassment, such as a spilled drink during an attempt at a grand flourish or stepping on others’ toes while making tracks across the dance floor. A botch, however, inevitably leads to humiliation, or worse. This can be represented by reversing any bonus into a penalty for the duration. The target of enchantment becomes a sworn enemy instead of a paramour or may lose the ability to feel emotions at all. The subject of the latter effect becomes numb to all forms of empathy and sympathy and requires great lengths or the passage of time to return to normal. The converse may see the victim become unhinged, transforming into a violently jealous abuser that will harm anyone they perceive as encroaching upon their claim.]==] },
				["Fortune"] = { en = [==[M20 Sorcerer, p. 30


Fortune


System

Modifiers: –1 difficulty with a weak sympathetic connection (object owned by the target), –2 difficulty for a strong sympathetic connection (prized possession of target, piece of the target such as hair or nail clippings)

Aspects: Fortune uses the Duration Aspect, but treats all durations as one higher, with Duration 5 consisting of spells lasting for several years. Additionally, it uses the Number of Targets Aspect, but all targets must be related (members of a family, the population of a small town, etc.). The Fortune Path also uses an Aspect called Severity, as follows:

Severity

• A minor blessing or curse, generally something simple, such as a Freudian slip or managing to just barely catch a bus the target needs.
•• A lasting but non-permanent inconvenience, injury, or small benefit. Sprains, non-life-threatening illness, and broken objects are standard bad luck, whereas good luck might be as simple as avoiding the flu for a season, a minor combat advantage, or the resolution of a minor obstacle.
••• A major setback or bonus. Temporary but grave illnesses and serious social faux pas are the most common curses, while finding helpful bureaucrats, success with gambling or relationships, or an additional die to combat pools are the most common blessings.
•••• Now the blessings and curses can have serious and permanent effects. Debilitating injuries, bankruptcy, a social tragedy that leaves the target a pariah, winning the lottery, surviving almost certain death, or just a chance encounter that changes the target’s social standing are all possible.
••••• Curses at this level almost always result in a painful and unusual death. Targets get decapitated, suffer incurable wasting illnesses, experience horrific car accidents, and more. Blessings are similarly dramatic, such as being rescued from state execution by a call from the governor. Other last-minute saves from certain death are possible, but also victories far rarer than one in a million: An enemy in combat may trip and break their neck, the beneficiary might find a lost tome in a used bookstore bargain bin, or they could win political office with no name recognition.

Price of Failure: Some failed Fortune spells are undetectable. The target is either lucky or unlucky naturally, resulting in the appearance of a success. Botches are a more serious matter. A twisted blessing or curse still results. Blessings first appear beneficial but every time it helps the target there are horrible consequences. Curses likewise appear to be harmful but turn out to benefit the target of the magician’s ire. This is especially dangerous for a magician who attempts to use the Path of Fortune on themself. Instead of twisted blessings, the full force of a more powerful curse, often the most powerful the magician can cause, targets them. Worst of all, the magician cannot unweave the spell they botched on themself, though they can on others.]==] },
				["Healing"] = { en = [==[M20 Sorcerer, p. 32


Healing


System

Modifiers: Fast casting may only be used to stabilize lethal or aggravated damage or reduce wound penalties. All other uses must use regular spells, extended roll spells, or rituals.

• 1 additional success to fix a badly healed wound
• +1 difficulty to heal an uncooperative patient

Aspects: This path uses the Damage/Healing Aspect. Bashing damage can be healed with one success per damage level. Additionally, each success can reduce a toxin, disease, or wound penalty (caused by pain rather than a missing limb, for example) by one level. See Mage 20 p. 406 for information on wound penalties and p. 442 for the toxin and disease chart.

Price of Failure: A failure simply means the magic didn’t work; the damage was beyond the sorcerer’s ability to heal. A botch can turn horrific quickly. A Healer might make the person more susceptible to the toxin they’re trying to fight off, increasing the effective Toxin Rating. They might outright cause damage or heal something incorrectly, such as fusing eyelids shut or setting a bone crooked, so that it needs to be re-broken later. The healer might also infect themself with the disease they were trying to heal.]==] },
				["Hellfire"] = { en = [==[M20 Sorcerer, p. 33


Hellfire


System

Aspects: Damage, Range, Area, and the following Special Effects can be added:

• Decay: Instead of damaging living targets, the spell breaks down anything they are wearing or carrying. For each point of damage it would inflict, it can turn three pounds of material to junk.
• Dust Storm: The spell summons a storm of dust, scouring the area (which must have at least three dots) and, in addition to damage, causing blindness in the area for one turn per health level inflicted.
• Sleet: A stream of ice and freezing water causes brief blindness and leaves the ground slippery. This cannot be made aggravated.
• Smoke: The caster emits a cloud of poisonous smoke that envelops the area (which must be at least three dots in the Area Aspect). Everyone within the cloud takes one level of damage per turn unless protected. A normal gas mask provides two turns of protection before becoming useless. Beings that do not need to breathe are immune to this damage. Vision, even if enhanced, is completely obscured while in the cloud.
•• Earthquake: the spell causes the ground to split open and engulf, then crush, the target. They can roll Strength at difficulty 6 to try to dig free. They need as many successes as health levels of damage they suffered. This cannot be made aggravated.
•• Lightning: Instead of fire, the spell fires a bolt of electricity. Anyone in contact with the target through a conductive material takes the same damage as the target.
•• Tanglewood: Plants flail and attack the target, throwing thorns, splinters, and other bits of wood at it. With extreme luck (at least three successes beyond the spell’s requirement) this can stake a vampire, but a magician who counts on it will likely be badly disappointed. If the target is standing in dense undergrowth, they are captured by the plants. A creature restrained in this fashion cannot move until they accumulate as many successes on a Strength roll (difficulty 7) as damage dealt by the spell. This cannot be made aggravated.
•••• Drowning Tide: This requires an Olympic sized swimming pool or larger body of water. The target is pulled underwater by a sudden wave or undertow, causing them to start drowning (see M20 page 440-441). Escape from the water requires an extended Strength roll, difficulty 8, with at least two successes necessary, often more. This only does drowning damage.

The Special Effects above must be purchased with Freebie or Experience Points at a cost of the dot rating + 1.

Price of Failure: When you play with fire sometimes you get burned. Botching when using the Path of Hellfire typically results in the spell rebounding on the caster. They take whatever damage they were attempting to inflict on their target.]==] },
				["Illusion"] = { en = [==[M20 Sorcerer, p. 35


Illusion


System

Modifiers: –1 to –3 difficulty if using a base similar to the goal (making a table appear differently is easier than making a table appear from nothing)

Aspects: Duration, Number of Targets, and the following:

Senses

• Affects one sense
•• Affects two senses
••• Affects three senses
•••• Affects four senses
••••• Full sensory range

Realism

• Completely immobile and fixed; if visual, flat
•• Changes with perspective so the viewer moving doesn’t disrupt it immediately
••• Illusions can have moving parts, but only large ones
•••• Smaller motions and variations are possible, but there are still subtle tells
••••• Fully immersive, this level completely fools all targeted senses

Price of Failure: Naive magicians think botching an illusion must be no big deal. The spell did nothing real, so nothing real should happen when it goes awry. On the contrary, the caster’s perceptions are altered. Worse, most of the alterations are subtle and easily missed. For larger spells, though, there will eventually be a substantial change, likely when most dangerous for the caster to be caught unaware.]==] },
				["Maelstroms"] = { en = [==[M20 Sorcerer, p. 37


Maelstroms


System

Aspects: Area, Duration, and Intensity

Intensity

• Drawing a breeze and fog from the underworld into the world of the living pacifies the local Shadowlands. Ghosts in the area are calmed. They’ll defend themselves, but otherwise they won’t attack anyone in the area for the duration without succeeding on a Willpower roll (difficulty 6).
•• A rainstorm is summoned, and it drains so much energy from the underworld that ghosts are frozen in place unless they make a Willpower roll (difficulty 7). They’re made just corporeal enough that the magician can physically move them. Usually, they remove the ghosts from an area where they are unwelcome.
••• Calling a full-scale thunderstorm does even more to quiet the Shadowlands. This drains the power of Oblivion from the area. Ghosts are sedated as in the first rank, but those under control of their Shadows are restored to reason. Results vary with spectres, but legends exist of hedge magicians with this Path pulling a spectre away from Oblivion.
•••• Powerful storms in the world of the living, with gale-force winds, hail, and plenty of property damage can truly sap the power of Oblivion in the Shadowlands. Spectres and other deeply malicious ghosts who fail a Willpower roll (difficulty 8) disappear within the barrage of wind and hail. No hedge magician knows for sure what happens to these spirits, but they are never seen in the location where the power was evoked for a year and a day.
••••• A massive storm draining all energy from the corresponding region of the Shadowlands. Both the area and its reflection in the Shadowlands becomes utterly uninhabitable for ghosts. The Restless Dead must flee the area, or else suffer five dice of damage per round until they do so.

Price of Failure: The magician’s control over these storms is tenuous at best. On a failure, the Willpower is still expended but nothing happens. Botches, however, result in storms that go out of control, both in the world of the living and the Shadowlands. When a hedge magician loses control of the energies of this Path, they call forth a piece of the Tempest. This causes normal ghosts to become disoriented and have difficulty moving around. Spectres, on the other hand, thrive in this environment. These most malicious of spirits ride the Tempest directly up to the Shadowlands and have an easier time manifesting in the area for the duration the spell would have had.]==] },
				["Necromancy"] = { en = [==[M20 Sorcerer, p. 39


Necromancy


System

Aspects: Duration along with Ghost Binding:

Ghost Binding

• The caster can see, hear, and speak to ghosts in their vicinity, whichever side of the Shroud they are on.
•• The magician can now terrify the restless dead. Filling themself with the necrotic energy of the Shadowlands, the dead can see them as alive but infused with the power of death. This results in a –2 difficulty on all Intimidation and Subterfuge rolls against the dead.
••• The caster forces a ghost to take on a corporeal form, whether they could do so on their own or not. For the duration, the ghost is for all intents and purposes a living person again, including the usual seven Health levels. If killed, however, they don’t simply return to being a ghost. Instead, the experience transforms the ghost into a spectre, a ghost consumed by and subservient to the powers of Oblivion. And this spectre has a grudge against the caster.
•••• Any ghost can be summoned to the caster at this level. All the magician needs is the ghost’s True Name and to win a contested Willpower roll. If the necromancer is successful, the ghost must then immediately arrive. Keep in mind that most dead people do not become ghosts, and most ghosts do not appreciate being summoned.
••••• Masters of Necromancy can compel obedience from the dead. In addition to the Path roll, they must win a contested Willpower roll. If they do so, they can demand the ghost perform one simple task or answer one simple question to the best of their ability. For tasks, the Duration Aspect covers how long the ghost must attempt to accomplish it.

Price of Failure: Failure for most Paths simply results in nothing happening. For Necromancy, the despair of generations overwhelms them, resulting in a derangement, usually severe depression, for an hour. If they have less than three temporary Willpower points, then the derangement instead lasts a week. Botches are truly dangerous, with not only the derangements lasting longer (a full month) and the near certainty of very angry ghosts, but the magician runs the risk of being pulled out of his body, leaving it apparently comatose while their mind spends the month “living” as one of the restless dead.]==] },
				["Necronics"] = { en = [==[M20 Sorcerer, p. 40


Necronics


System

Aspects: Area, Duration, and Impedance:

Impedance

• The magician floods the local underworld with electrical energy, shutting down all active ghostly powers. Ghosts may ignore this, continuing as they were, if they succeed on a Willpower roll (difficulty 8).
•• At this level, instead of merely stopping a haunting, the magician can increase the Shroud rating. This costs one success per rank increased, with the first rank included in the base cost of the spell (so in addition to the regular requirements, 2 successes are needed to increase the Shroud from 6 to 9).
••• Places can be defended from haunting by the simple technique of tricking the ghost into haunting somewhere else. At this rank, the magician can create a trap, a fake realm the ghost can haunt instead of the real location. A ghost can realize they’ve been tricked with a Wits + Enigmas roll (difficulty 8) and can escape with another one.
•••• At this level, the magician may directly use their bioelectricity as an attack against a ghost. When using this rank of Necronics, the Area and Duration Aspects are replaced by Damage and Range.
••••• Masters of this Path are capable of devastating a region of the Shadowlands and its inhabitants. They call it “creating a zero,” and they “format” the space to a default pattern. When successful, there’s nothing left. For the duration of the spell, the region becomes uninhabitable to ghosts, causing the Restless Dead to lose Corpus at a rate of 3 per turn until they can escape the area. If they fail to escape before running out of Corpus levels, they disappear. Magicians generally believe these ghosts have been destroyed completely, rather than the usual consequences of running out of Corpus. As no Necronics expert has ever seen one that survived being “zeroed out,” this seems to be the best guess.

Price of Failure: Because the Necronics magician uses their own bioelectricity to interact with the dead, botches are particularly risky. They aren’t just extending mystical senses, but rather a very real and physical part of themself. On a botch, the intended effect doesn’t happen. Instead, all ghosts in the area gain Pathos and Angst equal to the level of the spell or ritual being performed. They also become acutely aware of the magician trying to control or banish them and can affect the magician directly with their powers as though they were a ghost, rather than having to work through the Shroud or specific powers allowing them to touch the living.]==] },
				["Oneiromancy"] = { en = [==[M20 Sorcerer, p. 42


Oneiromancy


System

Aspects: The Path of Oneiromancy has two Aspects: Sympathetic Connection and Dreamwalking

Dreamwalking

• Basic Oneiromancy allows the magician to touch the dreams of others, seeing flashes of imagery that could be interpreted to get insights into their target’s nature and history.
•• The oneiromancer can now enter the dreams of others, not merely see them. They become a part of the dream, forced to take on a role appropriate to the dream itself. Once in the dream, changes can be made. The magnitude of the changes determines the difficulty of an additional Oneiromancy roll, with creating small items being difficulty 6 but violating the theme of the dream being difficulty 8, perhaps with a Threshold.
••• Dreamwalkers can now watch dreams from the outside, seeing them clearly but not being pulled into them. They can now truly transform the dreams they encounter. With this rank, they can create terrors mimicking the Nightmares Flaw or soothe a dream to the point of helping the dreamer regain an additional point of temporary Willpower.
•••• Dream Sendings become available to the caster at this level. They can craft specific and detailed dream sequences for their target that repeat once per success. If they repeat more than once or twice per night, the target can become suspicious that their dreams are being manipulated.
••••• Masters of Oneiromancy can create shared dreams, bringing one person into the dream for each success on the casting roll. The environment begins as a mixture of their subconscious influences, but the oneiromancer can manipulate it further using lower levels of the Path.

Price of Failure: Botching on Oneiromancy tends to be psychologically harmful. Many oneiromancers get tossed into a Nightmare Realm, which torments them in a way similar to the Paradox Realms (Mage 20 p. 102-103) feared by mages. At best, they lose control of any dream they’re interacting with. Of course, even if they succeed, interacting with the dreams of someone with the Nightmares Flaw can be its own sort of hell.]==] },
				["Quintessence Manipulation"] = { en = [==[M20 Sorcerer, p. 43


Quintessence Manipulation


System

Modifiers: –1 to –3 difficulty based on distractions in the surrounding area, with –1 representing a loud sound system playing in the same room and –3 representing Time Square at midnight on New Years.

Aspects: Area and Duration as well as Flow listed below:

Flow

• Sense Surroundings: Sensing the energies of the area becomes a routine task. With a moment of meditation or invocation, a sorcerer determines if an area or item is charged with power (whether Quintessence, vampire blood, Gnosis, or another mystic source). With three successes, the sorcerer identifies the Resonance of said energy.

•• Focused Awareness: The ability to sense the ebb and flow of energy transcends local surroundings and the inanimate and crosses into the realm of individuals. Now the sorcerer can perceive another individual using subtle magics and allow them to see obstructed meridians or occluded energy flows. This reveals curses left on individuals or blocked Quintessence flow through the body imposed by malicious disruptions. The ability to gauge magical potential in a subject also becomes available. While especially useful in identifying potential threats, the amount of information gleaned in this way lacks detailed nuance to fully define if the subject is a supernatural creature or a normal human with a certain aptitude.

••• Disrupt: No longer held to observing, now the skilled sorcerer can begin to affect the Quintessence around them. Still unable to bend and gracefully manipulate the energy, the practitioner of this path is at least versed enough to cause disruptions to the flow around them. With their invocation or focus, the sorcerer can quell the flow in the local area, causing a Quintessence source to become dormant for a time. Disruption also can mean diverting. A flow of Quintessence may be turned aside and sent along a new path in much the same way. Alternatively, with some effort a practitioner can trap a mote of Quintessence in a simple object for a limited amount of time.

•••• Control: Mere brute force gives way to nuanced control of the flow of Quintessence within themselves, the world around them, and within the pattern of others. The flows of energy through themselves are now flowing rivers with metered channels and locks allowing the practitioner to harness the Quintessence in a place of power. Each success on an effort of this type allows the sorcerer to channel one point of Quintessence per success, up to the limit of that area’s power. Quintessence drawn this way dissipates unless used within the next turn.

An enemy’s flow of energy is now a viable target for disruption at this level of understanding. Stripping the energy from another’s pool destroys one Quintessence for every success rolled. More alien energies of other supernatural creatures are still accessible, but doing so is more taxing. The energy of other supernatural creatures is disrupted by one point for every two successes.

The flow of energy through an individual’s pattern is essential to their health. A sorcerer with this knowledge can cause great harm or provide great help, albeit over an extended period through something akin to a curse or boon. Altering the flow of another’s life energy can promote or deteriorate their health but takes a great deal of time to become evident. They become ill more often, finding it difficult to fight off a mere cold, and take longer to recover from simple injury. If left unchecked they will inevitably fall victim to an environmental carcinogen or a malady that runs in their family history. On the other hand, benefitting the flow of Quintessence in an individual will see the recipient barely ever falling ill for more than a day, bouncing back from any injury as though it were a mere inconvenience and living to a ripe old age. Through this function the hedge wizard can grant physical Merits or inflict physical Flaws, by spending 2 successes per point of the Merit or Flaw.

••••• Rule: Masters of Quintessence Manipulation have attained a level of understanding that puts the flow of energy at their beck and call, impressing even the Awakened. Now, stored Quintessence can be directly infused into countermagic, adding dice to countermagic pools. Sensing Quintessence being directed, the sorcerer can interrupt the flow of energy, preventing another sorcerer from using Quintessence of their own. Each success blocks a point of Quintessence or Tass from empowering an effect.]==] },
				["Shadows"] = { en = [==[M20 Sorcerer, p. 45


Shadows


System

Aspects: The Aspects of Area, Distance, Duration, and Number of Targets, as well as Shadowgrip listed below:

Shadowgrip

The severity and persistence of the controlled shadows is gauged by one’s Shadowgrip. When a target attempts to resist the Path of Shadows, they make a Willpower test with a difficulty determined by the selected Aspect. Any success ends the effect on the following turn or after one minute.

• Deepening: Bringing shadows deeper into our vision can create a distracting and intimidating atmosphere. Within an area the overall lighting itself may not change per se, but the shadows deepen, and even sounds become slightly smothered at the edges. These shadows can also be cast upon others to confer the Path’s benefits, such as a bonus to Stealth tests in shadowy conditions.

•• Shaping: Taking further mastery of the dark material that comprises shadow, the sorcerer now crafts pattern and intent behind their shadow weaving. Upon a successful casting, the sorcerer adds two dice to any pools involving Intimidation or Stealth as well as any Subterfuge test to hide their identity. Conversely, the shadows can surround an individual and cast doubt and confusion upon the victim’s senses. At this level of mastery, they are strong enough to cause the target to hesitate or reconsider their actions due to the unidentifiable unease. This causes the target a –1 penalty to rolls made to dodge or that rely on quick reaction time. A Willpower test at difficulty 6 allows the victim to shake the shadows from their eyes and focus on their task at hand.

••• Entrenching: Not content with merely strengthening shadows, the sorcerer now animates the shadowstuff itself, letting it shift and roil about them. Should they take their deepening skills further, light now withers in the target location, and color will desaturate before the shadows. Affecting another is now far more effective. Shadows shift and distort in their eyes, and unsettling whispers can be heard when the victim gets too close to a pool of gathered shade. Being harried in such a way causes a –1 difficulty on all tests. The effect can be broken with a Willpower test at difficulty 7. Finally, the caster can cause shadows to flutter or shake creating visual diversions and increasing the difficulty of all ranged attacks made against the beneficiary by one.

•••• Commanding: The shadow’s “willingness” to act has become outright eagerness. The torment the shadowstuff visits upon the sorcerer’s foes is maddening and now causes a –2 difficulty on all tests made by the target. Any attempt to shake free calls for a Willpower test at difficulty 8 and may send some enemies into a frenzy or rage if they fail. Wreathing a target in benevolent shadows gives a +4 on all Intimidation and Stealth dice pools and any Subterfuge dice pool that is used to mask one’s identity.

••••• Ruling: Shadows know who their master is and immediately act with abandon at the sorcerer’s call. Enemies may be reduced to a gibbering heap on the floor from the horrific maleficent shades. Opponents must succeed at a difficulty 9 Willpower test or be reduced to uselessness, crumpling to the ground. This test can be repeated on each of the target’s turns, but the target may only act normally on a turn in which they gain a success. If the target leaves the affected area, they regain the ability to act normally. The darkness that engulfs those who wish to remain unseen is nigh impenetrable from without and within, save for the sorcerer themselves, decreasing the difficulty of Stealth tests by one. This darkness carries a weight so palpable, it may damage recording equipment engulfed by its influence.]==] },
				["Shapeshifting"] = { en = [==[M20 Sorcerer, p. 47


Shapeshifting


System

Duration: Scene

Aspects: None of the standard Aspects apply to Shapeshifting. Instead, it uses:

Scale

• Cosmetic changes only, such as eye color or growing hair.

•• Small but noticeable changes, such as growing claws or scales.

••• The magician can change a single body part to that of some other creature.

•••• Half-Shift: the magician can either change half of their body to an animal’s or take a form halfway between human and animal.

••••• Full Shifting: The magician can change completely into an animal.

Subject

••• The magician can only affect themselves.

•••• The magician may transform another target.

••••• The magician may affect two subjects at once.

Disparity

••• Only a single animal feature.

•••• The magician can take on two unrelated shifts, such as the head of one animal and the body of another.

••••• Three unrelated shifts are possible.

Price of Failure: When a shapeshifter botches, the best-case scenario consists of an unexpected and unpleasant transformation. They can also lose themselves to their other form, functionally going feral. In a worst-case scenario, they can experience a rampage similar to the Berserker/Stress Atavism Flaw (Mage 20 p. 644).]==] },
				["Starlight"] = { en = [==[M20 Sorcerer, p. 48


Starlight


System

Modifiers: Decrease difficulty by –1 if carrying a personal item of the recently deceased

Aspects: The Aspects of Duration, Passengers, and Wending:

Wending

• The threshold is the first obstacle a navigator must master. With focus and will, any doorway can serve as a threshold into the Shadowlands. The door only remains open for the navigator and will allow them and their passengers to pass. Traveling companions benefit from the same life preserving effect as the caster so long as they remain within sight of their navigator. Anyone attempting to reopen the doorway once closed will find the mundane corresponding threshold. This door collapses after it has been reopened and closed again by the navigator during their return from the Shadowlands, or willfully collapsed by the navigator to close the way behind them. A different doorway in the Shadowlands can be used to re-enter the Skinlands, but another activation of Starlight must be performed to create the new threshold. There is a drawback to this technique; The destination in the Skinlands is difficult to know without more capabilities as a navigator.

•• The Shadowlands are more familiar to a navigator of this level. Confidence swells in their chest, and the realm of the dead seems far less frightening. While traveling in the Shadowlands, the navigator benefits from –1 difficulty on all Awareness, Leadership, Survival, and Occult rolls concerning this environment, as well as Willpower rolls to overcome fear and intimidation.

••• The navigator has found a point in the Shadowlands that is akin to their own personal North Star. No matter where they are in the Shadowlands, so long as they can see this star, the navigator has a general understanding of where they may exit into the Skinlands when opening a new threshold.

•••• The familiarity with the Shadowlands is now palpable to any traveling companions the navigator has brought along. Traveling companions of the navigator benefit from a –1 difficulty to Willpower rolls made to overcome fear and intimidation, as well as Awareness and Survival rolls made within the Shadowlands.

••••• The navigator’s guiding light within the Shadowlands is visible to them even with their eyes closed. No matter how deep they travel or how turned around they may get, the navigator will always be able to find their way to a door back to the Skinlands. Furthermore, they know exactly where their exit from the Shadowlands will lead.]==] },
				["Summoning, Binding, and Warding"] = { en = [==[M20 Sorcerer, p. 49


Summoning, Binding, and Warding


System

Aspects: The three distinct parts of the Path have separate Aspects. Warding has Duration and Strength, each level of which subtracts one die from all actions the summoned being takes against the magician. For three successes, Warding Strength allows the creation of a Warding Circle, which the being cannot cross without a Willpower roll (difficulty 6) where they achieve more successes than the magician.

Summoning has Duration as an Aspect. Additionally, it has Number of summoned beings (or swarms) and Metaphysical Weight for the summoned being. The summoned being is compelled to appear before the magician but must still transport themself there. Only the most powerful beings can truly travel instantaneously.

Binding similarly has the aspects of Duration and Metaphysical Weight, as well as Binding Intensity. A being may spend a point of Willpower to resist a binding, but the binding can be recast. Some beings, especially those with Metaphysical Weight 5, are powerful enough to require binding rituals with large thresholds in addition to the usual requirements — sometimes as high as 20 or more successes.

Binding Intensity

• The creature cannot directly act against the magician.

•• Any single question must be answered truthfully.

••• All questions for the duration must be answered truthfully, and the being may be compelled to perform one service, though they may interpret the command liberally so long as they literally satisfy it.

•••• A single task is performed as directed, following the orders closely.

••••• The magician may transfer limited control of the binding to another person. The being performs one task for them and answers any questions the summoner asks of it.

Price of Failure: The Path of Summoning, Binding, and Warding has no need for special failure or botch costs. Instead, the consequences of failures and botches are visited upon the magician by the being summoned. The biggest source of these problems is that, on a botch, the magician often ends up under the mistaken impression they have succeeded.]==] },
				["Via Geniorum"] = { en = [==[The Hunters Hunted II, p. 125


Via Geniorum


System

Roll: Varies (see below)

Modifiers: –2 difficulty if the Theurgist knows the spirit’s true name

Cost: 1 Willpower

Duration: Varies (see below)

Via Geniorum Levels

• Ritual of Revelation: The Theurgist does not peer into the spirit world so much as command nearby supernal beings to reveal themselves. On a successful Charisma + Occult roll (difficulty 8), the Theurgist can see all spirits in the immediate area (including those possessing physical bodies).
•• Ritual of Protection: On a successful Wits + Occult roll (difficulty 7), the Theurgist may draw protective sigils into handheld objects or in a small circle around her. Extended ritual rolls can make larger circles or more completely protected locations, with 10 successes being enough to protect a small house. Spirits cannot harass or enter a person or location, thus protected, without succeeding in a Willpower roll (difficulty 9). Protection lasts for one month or until the sigil is disturbed (a carved sigil is much harder to disrupt than one drawn in chalk).
••• Ritual of Dismissal: The Theurgist can send a spirit back to its native realm. This via requires a Charisma + Occult roll (difficulty 9). The number of success needed, in an extended ritual, vary widely based on the power of the spirit (and left to the Storyteller’s judgment).
•••• Ritual of Summoning: The Theurgist can now summon spirit entities. This via requires a Charisma + Occult roll (difficulty 9). The number of success needed, in an extended ritual, vary widely based on the power of the spirit (and left to the Storyteller’s judgment). A summoned spirit must remain in the Theurgist’s presence for a scene or until it has answered three questions (it cannot be made to reveal its true name in this manner). Further interaction relies on Social rolls, sacrifices, or other powers. A botched roll summons an enraged spirit who likely attacks the unlucky Theurgist.
••••• Ritual of Binding: The Theurgist can now force a spirit into servitude. This via requires a Manipulation + Occult roll (Difficulty 9). The number of success needed, in an extended ritual, vary widely based on the power of the spirit (and left to the Storyteller’s judgment). A bound spirit may be asked to do a specific action (“Attack that vampire!”) or an ongoing action (“Watch over me.”) lasting until the next sunrise or sunset.]==] },
				["Via Necromantiae"] = { en = [==[The Hunters Hunted II, p. 126


Via Necromantiae


System

Roll: Varies (see below)

Modifiers: –1 difficulty if Theurgist has an object important to the ghost in life

Cost: 1 Willpower

Duration: Varies (see below)

Via Necromantiae Levels

• Ritual of Wakening: The Theurgist may command a recently deceased cadaver to awaken. On a successful Charisma + Occult roll (difficulty 7), the corpse will sit up and answer the Theurgist’s questions, to the best of its ability, for one minute per success. Every twenty-four hours the cadaver has been dead adds one to the difficulty. A cadaver more than three days dead cannot be wakened.
•• Ritual of Warding: Theurgists may protect an area from ghostly intrusion. With a successful Wits + Occult roll (difficulty 7), the Theurgist may block ghosts from entering a room-sized area. Each success indicates one week of successful warding.
••• Ritual of Communication: Theurgists may contact the dead by making a Charisma + Occult roll (difficulty 10). That difficulty drops, cumulatively, if any of the following criteria are met: Theurgist possesses an object important to the ghost in life (–1), a person important to the ghost is present (–1), the ritual is conducted in the ghost’s former home (–1), the ritual is conducted in a place where the veil between the Underworld and the world of the living is thin (–2). Maintaining contact with the dead is difficult. Each success rolled allows the Theurgist one minute of communication. The time period can be doubled for another point of Willpower.
•••• Ritual of Expulsion: Theurgists may expel a haunting ghost. This requires a Charisma + Occult roll (difficulty of the ghost’s Willpower + 3, maximum of 9); this is a sustained roll, requiring a number of successes equal to twice the ghost’s Willpower. Simply initiating the banishing costs 1 Willpower, but no more Willpower is required for the remainder of the struggle.
••••• Ritual of Vivification: The Theurgist can now urge a cadaver to rise. This via requires a Manipulation + Occult roll (difficulty 8). Every success animates the corpse for one week, and that time can be doubled for another point of Willpower. Animated cadavers will not have much in the way of personality or intelligence, but can follow simple directions.]==] },
				["Weather Control"] = { en = [==[M20 Sorcerer, p. 50


Weather Control


System

Modifiers: Weather control uses no rituals. The large number of successes required to produce effects lends itself to extended rolls and teamwork.

• 1 or more additional successes required to stop a severe thunderstorm or worse once it’s started. Calm weather is easier to stir up than nasty weather is to allay.

• +1 difficulty to cause any effect indoors.

Aspects: Weather Control uses the Aspects Distance (treat the measurement on the chart as the radius of effect), Duration, and Intensity:

Intensity

• Small changes only. This includes warm or cold breezes, slight but noticeable changes in temperature, and causing fire to momentarily flicker and flare.

•• The weather worker can cause minor affects that do not cause direct damage. The sorcerer might call up a dense fog that imposes perception penalties (see Mage 20 p. 435), clear a cloudy sky, or create winds in the direction they desire.

••• A sorcerer may form and dispel simple rainstorms. Strong winds can impose a penalty on ranged attacks by blowing the projectile off course and causing difficulties aiming. The weather worker may also change the temperature up to 30 degrees Fahrenheit in either direction. Depending on the starting temperature, this may impose or remove penalties from heat illness or hypothermia. Flash floods can also be deadly.

•••• A weather worker’s storm strength increases. They can now command gale-force winds, lightning, hail, and other damaging weather effects. They may now target individuals to take the brunt of the storm, and damaging effects do 4 + successes damage. Lightning causes lethal damage while bashing damage results from hail. Other effects may also cause damage, within reason. Weather effects can cause moderate penalties to those caught in the storms.

••••• The sorcerer can cause extreme effects. Thunderstorms are well within the weather worker’s grasp. Destructive tornadoes and other powerful meteorological activity can tear through a city. The sorcerer may cause 6 + successes bashing or lethal every 15 minutes to those in the storm’s path. Anyone caught in the storm also suffers maximum environmental penalties.

Price of Failure: Even intentional weather control effects might have unintended consequences on the environment both near and far. Weather pattern disruptions are no small matter. A botch, however, unleashes terrible effects depending on the nature of the changes sought. Lightning might directly strike the sorcerer or their allies. An arid climate might be hit with a monsoon the ground can’t accommodate, leading to widespread flooding. The local climate and possibly the surrounding area suffers dramatic, perhaps long-lived, changes. This can cause a crisis for the local fauna, plant life, and people who had no time to prepare and may not know how to cope with the new climate. Death, even if not immediate, is unfortunately a common risk when sorcerers play with the weather.]==] },
				["Animal Psychics"] = { en = [==[M20 Sorcerer, p. 54


Animal Psychics


• Commune: A psychic may communicate with one animal the psychic can perceive through mundane senses (sight, hearing, etc). They may issue simple commands but cannot command an animal to attack. The psychic can, however, command an animal to stand down from an intended attack. Issuing a command an animal was inclined to do anyway requires no additional roll, but to command an animal to do something against its nature requires a roll of Charisma + Animal Ken with a difficulty of 9 minus the psychic's dots of Animal Psychics.

•• Mass Communication: As with Commune, but the Psychic may now communicate with multiple animals of the same species at once. Commands to animals may be more complex so long as the psychic can adequately describe it; however, animals won't typically attack for the psychic unless already inclined to do so. This level may alternatively target a single animal for expanded command capability.

••• Mind Link: A psychic may link minds with a single animal for instant two-way communication and the ability to sense what the animal senses. The psychic must initially sense the animal as per Commune, but the animal may travel outside of the psychic's perception range without breaking the link. This power ends when the psychic severs the link. The link can prove dangerous — any damage the linked animal takes results in psychic backlash, which causes an equal amount of soakable bashing damage to the psychic. If the animal dies while the link is active, the psychic must not only roll to soak the damage, but also roll current Willpower at difficulty 8. A failure renders the psychic stunned for 1 round. Botches can leave the psychic overwhelmed by the trauma of death for a scene and have lasting consequences, such as heightened startle responses, until the psychic regains one Willpower.

•••• Domination: A psychic may order any single animal to do anything within the animal's natural capabilities. The animal fights and dies for the psychic on demand without question. The psychic must adequately describe a command for the animal to understand what the psychic wants. Complex commands may still confuse an animal, though the animal does its best to interpret and carry out any command the psychic gives it. Once the psychic successfully activates this power, the animal follows the psychic's orders until either the psychic severs the connection, or the animal dies. Psychics using this power must also establish a Mind Link if they wish to continue issuing commands to the animal at range. This does not require additional rolls or Willpower expenditure, but it does open the psychic up to suffering damage when the animal is injured or killed as detailed above.

••••• Swarm: With mastery over this Phenomenon, a psychic may now use any lower ability on all animals the psychic can sense through mundane senses at once. The psychic's control is no longer limited to one species at a time. Using Mind Link in this way can quickly become dangerous, as every linked animal presents a risk of backlash damage if injured. The distraction of maintaining multiple mental links is overwhelming, inflicting a -3 dice penalty to all Attribute-based rolls until the Mind Link ends unless the psychic spends a point of Willpower when making the roll to temporarily push past the distraction.]==] },
				["Anti-Psychic"] = { en = [==[M20 Sorcerer, p. 55


Anti-Psychic


• 5-yard radius. Add +1 difficulty to psychic phenomenon activation within the radius and +1 difficulty to Mind Sphere rolls.

•• 10-yard radius. Add +2 difficulty to psychic phenomenon activation within the radius and +1 difficulty to Mind Sphere rolls.

••• 15-yard radius. Add +3 difficulty to psychic phenomenon activation within the radius and +2 difficulty to Mind Sphere rolls. Add +1 difficulty for use of any mental-based Night Folk powers.

•••• 25-yard radius. Add +4 difficulty to psychic phenomenon activation within the radius and +2 difficulty to Mind Sphere rolls. Add +2 difficulty for use of any mental-based Night Folk powers.

••••• 40-yard radius. Add +5 difficulty to psychic phenomenon activation within the radius and +3 difficulty to Mind Sphere rolls. Add +3 difficulty for use of any mental-based Night Folk powers.]==] },
				["Astral Projection"] = { en = [==[M20 Sorcerer, p. 56


Astral Projection


• Peek: The psychic may spend up to one minute per point of Stamina astral projecting and travel up to one mile away from their body. A psychic can only use sight at this level — their other senses do not function while projecting. A character may also travel into the Astral Penumbra for this amount of time.

•• Errand: The psychic gains the ability to hear while astral traveling. They may travel up to 100 miles away from their body with a limit of 10 minutes per point of Stamina.

••• Journey: The psychic can travel up to 1000 miles away from their body and may remain in astral form for 30 minutes per point of Stamina. A psychic may choose to manifest as a blurry, ghost-like image of their astral form for one turn by spending a point of Willpower but may not speak. They do not show up on recordings.

•••• Failsafe: Upon being stunned or knocked out, the psychic may roll Astral Projection activation as a reflexive action. The psychic may use this power to seek help for their prone body, or simply as a way to remain useful while otherwise out of commission. The psychic may manifest as Journey, and while manifested, the psychic can communicate at whisper volume. The psychic's voice and translucent form do not show up on recordings. The psychic may travel anywhere on Earth and remain projected for up to an hour per dot of Stamina they possess, though they may spend a point of Willpower every hour they wish to continue traveling beyond this limit. They may use all senses as normal. Though the psychic may return to their body at any time before their normal limit is up, returning will not wake them unless the cause of unconsciousness has resolved.

••••• Odyssey: The psychic's astral travel abilities are legendary. The psychic can travel anywhere on or in Earth, extending to at least the edge of the atmosphere. Attempting to go further requires a Willpower roll at difficulty 9. So long as the psychic's body lives, including aid with life support technology, the psychic may travel indefinitely. If manifested, the psychic may speak in normal volumes and may choose to either appear in an indistinct, translucent form or deceptively opaque and may stay manifested for up to an hour per point of Willpower spent. The psychic may choose to show up on recordings.]==] },
				["Biocontrol"] = { en = [==[M20 Sorcerer, p. 57


Biocontrol


• Mindfulness: The psychic concentrates on altering their biological processes in minor ways. They can stop small wounds from bleeding, raise or lower their core body temperature by up to two degrees, hold their breath for an extended time, ignore pain from minor wounds, including wound penalties of up to half their Biocontrol rating (rounded up), and consciously regulate their blood pressure and pulse within normal range. The effect ends if the psychic’s concentration breaks.

•• Healing Factor: The psychic forces their body to accelerate the metabolic processes responsible for healing and fighting infections far beyond the normal rate. The psychic must spend time resting and meditating, ideally while receiving medical care — the psychic’s still mortal, after all. For every activation success, the psychic reduces the time to heal the highest health level by one level, to a minimum of one hour for bashing damage and one day for lethal or aggravated damage. After the first level of damage heals, the psychic may roll activation again to repeat the process. If using Healing Factor, psychics can ignore the permanent impairment risk (see Mage 20 p. 408) so long as they have sufficient nutrition and rest.

••• Surge: The psychic floods their system with hormones at will. Psychics choose Physical, Social, or Mental and split their activation successes between attributes from the chosen category to raise dots (to a maximum of 5 in any attribute) for one scene. This can represent an adrenaline surge allowing for “hysterical strength” in an emergency, a surge of dopamine to improve mental function, or modulation of serotonin and pheromones to make themselves calmer or subconsciously attractive in social situations. Deliberately causing hormone spikes strains the body: When the effect wears off, the psychic must roll Stamina at difficulty 5 to soak activation successes as bashing damage.

•••• Toggle Nerves: A psychic with this level of control enhances or reduces sensitivity in their nerves for up to one scene per activation success. The most common usage is temporarily deadening pain. A psychic may ignore wound penalties caused by pain by up to activation success number of health levels — it doesn’t allow the psychic to ignore penalties due to non-functional or missing body parts. A psychic may instead choose to deaden senses to ignore other noxious stimuli, such as powerful scents, sudden lighting changes, or temperature extremes. The psychic may ignore up to activation successes in distraction penalties and may split the successes across multiple penalty types. Alternatively, a psychic may increase nerve sensitivity, lowering the difficulty of perception-based rolls by activation successes and may split the successes across senses. However, increasing nerve sensitivity comes at a risk. Every success spent toward lowering perception difficulty with a sense adds to the difficulty of resisting distractions using that sense while the power is active. If the psychic increases touch sensitivity and sustains damage, they suffer additional wound penalties equal to their activation senses devoted to touch.

••••• Biological Mastery: The psychic achieves complete control over their body. They can stop and restart their heart at will, regulate digestion, temporarily suspend the need for oxygen, and put themselves in hibernation to force more extreme feats of healing — including regrowing parts. They can accelerate or suspend regeneration at a cellular level and may nullify toxins with an activation roll. Each activation success reduces the Toxin Rating of the substance by one. If the remaining Toxin Rating is lower than the psychic’s Stamina, the psychic may direct the toxin to a specific part of their body to run its course, suffering an Impediment (as the flaw, see M20 Book of Secrets p. 39) for the duration of the toxin’s effect. If the Toxin Rating is higher than the psychic’s Stamina after using Biological Mastery, the psychic suffers the toxin normally at the lowered Toxin Rating. A psychic may spend a turn concentrating and roll activation to soak lethal and aggravated damage with Stamina for a scene.]==] },
				["Channeling"] = { en = [==[M20 Sorcerer, p. 58


Channeling


• The channeler can tap into the other side and draw forth a ghost’s Abilities, though they may only access a single Ability per use of this power. Successes on the activation roll become bonus dice for rolls utilizing the desired Talent, Skill, or Knowledge for the remainder of the scene. When gazing across the Shroud, the psychic can gather a vague idea of the wraiths present.

•• The psychic can now access two Abilities simultaneously, splitting successes between desired traits. The channeler also can now make out more of the Shadowlands when peering across the Shroud. The channeler can discern details of the landscape and identify specific ghosts that are present.

••• Further growth now allows a third Ability to be channeled, subject to the limitations above. The channeler can now verbally communicate with ghosts beyond the Shroud.

•••• The psychic can now access any Talent, Skill or Knowledge, maintaining multiple channeled traits as long as they gain sufficient successes on the activation roll to cover the desired trait levels. Communication is no longer hindered by a short window of accessibility, and gazing across the Shroud lasts a whole scene.

••••• With a psyche girded by many trials and tribulations, the psychic is fortified enough to now channel two separate personalities at once. Note that each wraith channeled still requires its own cost and power roll. Should the Ability channeled be the same on each use, the bonus dice from both uses are added to dice pools using the Talent, Skill, or Knowledge.

At the pinnacle of their skill, with one spirit channeled, the medium may open themselves to a wraith and gain all the Abilities of the visiting spirit. Successes rolled during the channeling roll are now available to any Talent, Skill, or Knowledge that wraith may have possessed in life. The extra costs of channeling with such lowered defenses can be high, however. The spirit may request a favor, a task to be completed, or even the right to freely control the channeler’s body for a period of time.]==] },
				["Clairvoyance"] = { en = [==[M20 Sorcerer, p. 59


Clairvoyance


• Experiencing remote locations is new to the psychic, and most observations are interpretive. This impression can be a physical sensation of cold steel for a knife, the smell of gunpowder for firearms, or a vision of a doghouse for guard dogs. In some cases, an actual image of the subject can be achieved, but this will be hazy at best. The one exception is hearing. Sounds come across the mental bridge garbled and unintelligible, if they can be heard at all. More successes grant more literal symbolic sensations, with five successes affording actual visual perception of the target, cloudy as it may be. Senses have a limited range for novices and reach to approximately one mile around the psychic. Retraining their focus requires another Willpower roll and another expenditure of Willpower to solidify their new remote subject.

•• Remote sight becomes more reliably achievable, albeit still shrouded in mild distortion or haze. Sound comes across far more frequently, with a chance of being clear enough to be understandable. Three successes on the Willpower test affords a near clear image of the subject with distorted sounds, while five successes grant crystal clarity and intelligible sounds that could convey the general subject and mood of conversations near the subject. The psychic can now push their senses further — out to ten miles away from their current location. The difficulty of the roll increases by one past 5 miles and by two at 8 miles.

••• Clarity is no longer an issue, and remote sensing brings sight and sound across the expanse without distortion. The clairvoyant unlocks a new avenue of clarified perception in the sense of touch. “Touching” a distant subject psychically returns muffled sensations, as though their hands were encased in heavy mittens. With clarity no longer a concern, successes now define the distance a clairsentient can reach, with each success representing ten miles of range. At this point, a new Willpower roll is still required to refocus but no longer costs more effort to perform.

•••• Sight, sound, and touch are all within the purview of the remote viewer. The clairvoyant also begins perceiving smells and tastes, with strong odors and flavors being detected when they are in abundance. Range now increases ten-fold, with each success equating to 100 miles of range.

••••• The clairsentient master can remotely view a location as though they are standing in the room. All five senses are received with exact definition, with no secret escaping their perception. Range increases ten-fold once more, with each success extending their reach by 1,000 miles. Finally, so long as the psychic is refocusing on an element that they can see within their current clairvoyant view, no new roll is required, as they forge new correspondences to subjects on the fly.]==] },
				["Cyberkinesis"] = { en = [==[M20 Sorcerer, p. 60


Cyberkinesis


• Switch: The cyberkinetic may turn electronics off and on without touching them. +2 difficulty to activation if the electronic requires a physical relay rather than an electronic one. The psychic must be able to sense the electronic device to use this power. This is an exception to the usual requirement to access the device’s display and applies to devices without displays such as light fixtures.

•• Remote: The psychic may control electronics with their mind without having to use an input device such as a keyboard. This does not give any login or override credentials, but if the psychic knows credentials, they may enter them. Any action more difficult than operating an office computer raises the activation difficulty. This power removes the need for haptic input devices if the psychic uses Augmented Reality (M20 Operative’s Dossier, p. 58).

Difficulty Modifier = Example
+1 = Controlling a small office’s server network or a home security system, using a 3-D printer with pre-loaded designs
+2 = Psychically driving an electric car at highway speeds
+3 = Using specialized equipment such as a 3-D printer with no pre-loaded designs
+4 = Directing a computer-controlled factory
+5 = Operating a space shuttle single-handedly

••• Glitch: The psychic directs their electromagnetic fields to scramble electronic processes by causing tiny internal shorts and power surges. They can cause computers to lock up or blue screen and recording equipment to pick up only static. The effect requires active concentration. Most electronics return to normal after the effect ends, but some older tech simply crashes. A psychic using AR may use this as an attack on Icons and other Digital Web objects, dealing bashing damage. Use activation to attack, and substitute dots in Cyberkinesis for the weapon modifier in the damage roll. If the psychic inflicts 3 or more damage in one attack, the target is stunned for a round.

•••• Spoof: The psychic tricks operating systems into letting them in without valid credentials. If the system would be able to perform the task, the psychic can force the system to do it. The psychic may plant fake documents, install malware, give themself admin privileges, or erase data.

••••• Overclock: The psychic overrides safety limiters in electronics to force them to exceed their normal capabilities. A computer processes faster or runs more intensive software than it should be able to, an electric car accelerates faster, or an office laser pointer becomes a weapon. Every activation success adds an automatic success to the psychic’s next use of the machine, but the exertion damages the machine. Rolls to operate the machine after this power is used suffer a dice penalty equal to the activation successes until the device is repaired. Acquiring 8 or more successes when activating this power completely fries the machine after the Overclock effect ends.]==] },
				["Cyberpathy"] = { en = [==[M20 Sorcerer, p. 61


Cyberpathy


• Map Structure: The Cyberpath can examine the directory of computers and storage devices. The Cyberpath can find the location and properties of all files stored but cannot access the files using this power. This can be useful for Cyberpath hackers looking for specific data. The psychic can use this level to identify a device by its Augmented Reality Object ID if it is web-capable.

•• Read-only Mode: As Map Structure, but the Cyberpath may also read files. Plain text and graphics files are simple to view, and the Cyberpath may divine the functions of executable files and applications. The Cyberpath is unable to decrypt encrypted files at this stage. The psychic may view the device’s associated ARO if it is Level 1 or below and may divine the ARO’s properties if it’s a higher level.

••• Download: The psychic can use their brain as storage media, copying and pasting files found using Cyberpathy. The Cyberpath may access stored text, graphics, and videos at any time from their mind, but cannot run applications. The psychic may store a maximum number of files equal to the total of their mental attributes (Example: Coleen has Perception 4, Intelligence 3, and Wits 3. She may store 10 files in her mind). Larger files and applications may use more than one storage slot, while a zipped folder may contain multiple small files in one slot, at the cost of the psychic being unable to read any of the files while stored in this manner. The Cyberpath may later write any files they saved this way to any media they can access with Cyberpathy, with the option to either copy the file to the media or transfer it from their mind. If the device has a connected display device, the psychic can combine Download with Cyberpathy to write and display a file to others in the same turn. Deleting files from the psychic’s mind is a free action, but the psychic may only delete one file at a time. Larger files that took more than one storage slot take a number of rounds equal to the number of slots the file occupies to finish deletion, but the psychic may perform other actions as normal during deletion. The character may download an ARO from a device to upload later to spoof the device’s identity.

•••• Remote Access: The Cyberpath may connect to any computer or device, such as external hard drives, on the same network as their local device. This power only allows the psychic to treat the remote device as if it were in front of them, and any other powers must be activated separately. The psychic may access multiple devices on the same network at a cost of 1 Willpower per device. If the device is capable of internet access, the psychic may use this ability to access the internet, including the Digital Web. The psychic may use advanced AR devices as their point of access with this power.

••••• Enigma: The Cyberpath becomes a living decryption algorithm, able to crack even heavily encrypted systems and files with ease. The psychic may activate this power to ignore difficulty increases for lower Cyberpathy powers and mundane access on secure and encrypted systems or files previously stored using Download. The psychic may alternatively use activation successes to increase Cyberpathy and hacking difficulty for others on a file or device, at +1 difficulty per activation success if the psychic possesses dots in Computers or Cyberkinesis.]==] },
				["Ectoplasmic Generation"] = { en = [==[M20 Sorcerer, p. 62


Ectoplasmic Generation


• When one first starts exploring their capabilities as a generator, it starts with rather juvenile seeming practices. Novice generators don’t find the act of creating ectoplasm difficult. The real difficulty lies in creating a substantial volume and force. This leads to the fledgling generator being unable to force the semi-liquid plasm from their orifices without assistance. Reaching into their mouth, nose, and ears to draw forth the substance by hand or by relying on peristalsis, the generator must work to bring it forth. Every success on the activation test generates a softball sized volume of the sticky substance. It only lasts a number of turns equal to the generator’s Willpower, but it can be applied as quickly as it is generated. Covering an object with a thin layer of ectoplasm takes no extra steps beyond generating it. The plasm sticks to all surfaces and does not wipe away easily. It will cling and string to anything touching it and only sublimates into nothingness when the duration expires.

Another novel approach users find early is the “smoking man” technique. When coaxed correctly, ectoplasm can also come forth as a mist like vapor. Lingering licks and tendrils of thick smoke seep from the mouth, nose, and tear ducts of the generator. Lasting for a number of turns equal to the psychic’s Willpower, this should be taken into account when dealing with social interactions. Using the technique can add a bonus die for situations such as a stage magician’s routine or intimidating an unsuspecting tough but incurs a -1 penalty to Abilities such as Expression or Leadership due to the disconcerting sight of this ectoplasmic cloud.

•• Once Ectoplasmic generators hit their stride, the degree of advance in control is astounding. With each success on the activation roll, a psychic generates a quart’s worth of the slimy fluid. With such an increased volume, assistance is not required to force the plasm out, as it simply pours from the nasal and esophageal orifices of the psychic. There is no discomfort in this, and more than a few generators take a sick glee in others’ revulsion to their practice. All plasm phenomena now last a number of minutes equal to the generator’s Willpower.

A mist generated now gains a measure of responsiveness to the creators will. The psychic can now push the mist outward into a cloud that moves and shifts at the generator’s mental command. The speed of the cloud is not impressive at 10 feet per round, but it can be used to obscure prying eyes, imposing a +2 difficulty to Perception tests. This mist cloud has a radius of 1 foot per Willpower of the psychic.

••• Plasm fluid generation is a child’s trick to the seasoned generator. Each success on the activation roll now summons forth a gallon of liquid in a steady flow. The force of the stream is not enough to cause an individual to lose a step, but it is enough for the generator to strike the corner of the ceiling in a standard room.

Ectoplasmic mists gain a degree of solidity. No longer just smoky wisps, the mist is now solid enough to feel like cotton candy to the living. This is in concert with increased volume of 5 feet of radius per dot of Willpower. Attempting to force past the thick semi-solid mist requires a Strength + Athletics roll (difficulty 6). Thick enough now that the mist is all but opaque, it also provides visual cover and increases the difficulty of seeing and attacking through it by +3, similar to a heavy smoke grenade.

•••• Fluid and mist are useful, but access to solid mass and crafted forms expand possibilities for creativity tenfold. The volume does not increase, but now the channeler’s output can result in solid matter the consistency of heavy lard. With greater structural stability, the ectoplasm can hold definite shapes that are only hindered by the generator’s creativity. These creations have a number of points equal to the Willpower of the psychic to be distributed between Strength, Dexterity, and Stamina. The creation has 3 health levels and suffers no wound penalties. While not capable of complex movements, the solid ephemeral creations can move through space at 30 feet per turn. The creations are psychically tethered to their creator and cannot leave their physical perception and retain movement. Finally, all plasmic creations are no longer hindered by a time limit and last as long as the generator concentrates.

••••• Full torso-ed, free floating, vaporous apparitions are at the pinnacle of the generator’s craft. Still puppets of the creator, shaped creations may now fully animate as appropriate to their complex forms. While unable to fool someone into thinking it’s the genuine article, the shapes can now roughly mimic people and creatures, even emitting groans as pockets of air escape within the gooey form. The forms are still limited by the volume generated on the roll, with an adult-sized being of ectoplasm taking three successes to fill out. The creations follow the same rules for Attribute distribution as detailed above but have 6 health levels and suffer no wound penalties. Ectoplasmic puppets can be possessed and controlled easily by ghosts in the area. The psychic spends 1 Willpower to hand the reins to a nearby, willing ghost. The ghost then has total control of the ectoplasmic construct, using it as though it were their own body. Once the psychic hands the body over in this fashion, it lasts for a number of rounds equal to the psychic’s Willpower score, after which the puppet’s ectoplasm dissipates. Other manifestations the psychic creates are not affected and remain extant as long as the psychic concentrates.]==] },
				["Mind Shields"] = { en = [==[M20 Sorcerer, p. 65


Mind Shields


• Defenses are thin, but present. The Psychic receives 2 dice to counter mental attack phenomena and 1 dice for mental attacks from other sources. At this point, Shields are always active and cannot discern friendly and hostile effects. The psychic can lower their Mind Shields to allow access to a friendly psychic, but this leaves them open to any other mental ability used before they are raised once again.

•• Layers of mental chaos or thicker walls of the mind are built. The psychic receives 4 dice to counter mental attack phenomena and 2 dice for mental attacks from other sources.

••• The psychic's mind is a confusing mess or a sturdy bunker to any invader. The psychic receives 6 dice to counter mental attack phenomena and 3 dice for mental attacks from other sources. The ability to modulate one's Mind Shields becomes clear at this level. Whenever presented with a mental ability that attempts to interact with the shielded psychic's mind, the target may decide whether to let this pass their shields or not. Note that this doesn't identify every ability used, merely that an attempt is underway to access the psychic's mind. It is up to the deductive reasoning of the target to work out who stands before their mental gates.

•••• A mental bulwark or a confounding mire of scattered thought greets intruders. The psychic receives 8 dice to counter mental attack phenomena and 4 dice for mental attacks from other sources.

••••• The psychic's mental fortress stands impenetrable or infinite maze unnavigable. The Psychic receives 10 dice to counter mental attack phenomena and 5 dice for mental attacks from other sources.]==] },
				["Precognition"] = { en = [==[M20 Sorcerer, p. 65


Precognition


• Intuition: The seer gains a knack for guessing correctly. For purely random events (lottery, dice rolls), the predictions can be rather accurate. The psychic can intuitively know the shortest route to a given destination and enjoys a higher likelihood for beneficial chance meetings. The psychic experiences no visions, they just “have a feeling” and guess very well. Even with five or more successes, predictions are unlikely to be entirely accurate.

•• Insight: The psychic experiences dreamlike visions during sleep and waking hours alike. Like dreams, they are rarely literal. Instead, the visions are steeped in metaphor. An enemy might appear as a fierce dragon or figures in clandestine robes, where a beloved mentor might appear as a long-dead parent. The imagery depends on the seer's paradigm, and while more successes offer detailed visions, they are always subject to interpretation.

••• Danger Sense: The seer's connection to the future becomes an early-warning system. The psychic perceives this as anything from a piercing temple headache, to cramps, to a creeping sense of dread. No matter the manifestation, it's always the same for the seer. This power is always “on,” though may be subverted with certain Sphere effects or the Anti-Psychic Phenomenon. When something unnoticed targets the psychic, the Storyteller rolls Danger Sense activation before rolling ambush. This power does not cost the psychic Willpower to activate.

Successes = Effect
Botch = The seer unwittingly puts themself in worse danger and loses their roll to spot the ambush.
Failure = The psychic gets no intuition about the situation.
1 = The seer senses they're in danger but gets no specifics. They get 1 bonus die to spot an ambush.
2 = The seer senses they're in danger and receives simple instruction on how to avoid it such as “duck,” or “run.” The psychic gets 2 bonus dice to spot the ambush and dodges normally if the attacker remains hidden.
3 = The seer knows they're in danger, how to avoid it, and the direction of the danger. The attacker doesn't roll ambush and the attack resolves normally.
4 = The seer knows the details of the attack and gets a turn of warning. The psychic gains a turn to prepare before the danger happens.
5 = The seer gets a turn of warning and a vision of those responsible. The psychic will be able to identify the person by sight and/or with psychic intuition should the psychic see or be in the presence of the person later. The psychic imprint also functions on recordings and creations, such as paintings or letters, made by the attacker.

•••• Clarity: The seer enjoys a near-perfect view of the immediate future. For every activation success, players and Storyteller announce their general future plans for one turn. If the psychic interferes with time — such as moving behind cover to foil an attack, the future changes, and the psychic must reactivate this power for updates.

••••• Roads of Time: A psychic sees more than only the most likely outcomes and their relative probabilities. As Insight, but the psychic sees time as diverging roads branching off at decisions. The seer identifies otherwise innocuous-seeming decision points before the choices are made. This also allows a psychic to see which future events are difficult to change and which events are most malleable.

Successes = Time Range
1 = 12 hours
2 = 24 hours
3 = 1 week
4 = 1 month
5 = 1 year
6+ = 1 additional year per success

Providing information about the far future can be difficult for the Storyteller. The Storyteller may instead grant one reroll for every precognition success for the story. This represents the psychic's ability to juggle relative future probabilities. A psychic may use as many of these rerolls on a single action as they wish.]==] },
				["Psychic Healing"] = { en = [==[M20 Sorcerer, p. 66


Psychic Healing


• Diagnosis: The healer instantly diagnoses disease or injury through sight or skin contact. The diagnosis terminology depends on the psychic's medical knowledge — one with little knowledge might describe lupus as “the body fighting itself.” A psychic may use Diagnosis successes in a complimentary roll (see Mage 20 p. 389) for Medicine rolls. If using teamwork, the psychic may contribute successes to the medical professional's roll up to the psychic's Medicine rating.

•• Restorative Slumber: With a touch, the healer focuses their patient's body's energies on healing. Treat successful activation as skilled medical treatment for bashing and lethal damage and as magickal stabilization for aggravated damage. The touch must last at least one minute, after which the patient falls into a deep sleep. At 3+ successes, the patient also regains one point of Willpower.

••• Urgent Care: The psychic's healing ability now facilitates the rapid resolution of mild injuries and poisons. A psychic touches the patient and may heal up to their activation successes in bashing damage at a rate of one per turn. Every two successes can reduce the Toxin Rating of a poison, drug, or illness by one, up to 3 levels of reduction.

•••• Intensive Care: The healer may now heal the gravely wounded. The psychic heals up to 1 lethal per activation success and can reduce the Toxin Rating of poisons, drugs, and illnesses by one level per success. Each level healed takes 10 minutes, during which time the psychic must maintain physical contact with the patient. The process is clearly supernatural to any witnesses, as wounds miraculously stitch themselves shut and harmful substances sweat out of the target's skin.

••••• Psychic Surgery: The psychic may now heal grievous wounds, cancers, and infections. The psychic heals up to 1 aggravated damage per success. Each level healed takes 10 minutes as the psychic closes their eyes and gestures as if reaching into flesh. Healers may also use this ability to harm, by reaching into a victim and physically removing healthy tissue — a horrific and bloody process. Outside of combat the psychic can use this power to inflict aggravated damage on a restrained target. Like healing, this application of the power takes 10 minutes per health level. Each success on the activation roll causes one health level of unsoakable aggravated damage. This use of psychic healing is sadistic and considered torture, but in combat, there's not enough time to use this power to its fullest extent. Psychic Surgery can only be used in combat to cause pain — it inflicts wound penalties as if the psychic had wounded the target but causes no damage. The victim may spend points of Willpower equal to the psychic's activation successes to “heal” the damage.]==] },
				["Psychic Hypnosis"] = { en = [==[M20 Sorcerer, p. 67


Psychic Hypnosis


• Trance State: The hypnotist puts a willing target in a calming trance state, though they cannot issue commands. In this state, the target can remember events and details more clearly and gains a difficulty reduction to any rolls involving memory recall equal to activation successes, to a minimum difficulty of 2. The target also regains one point of Willpower for every activation success, though they cannot benefit from this function again until they’ve rested normally. It takes five turns to place the target in the trance and the trance breaks if anyone disturbs the target. The hypnotist may also put themself in a trance.

•• Suggestion: The hypnotist commands a target to perform actions after placing them in a trance. The psychic may give one command per success, and the command can neither obviously result in the target’s death nor go against the target’s Nature. The psychic may force the target to ignore pain responses and forget commands given in the trance as additional commands if the psychic spends successes to do so. Only the psychic decides when the target comes out of the trance. The target ignores incompatible commands instead of breaking the trance.

••• Implanted Suggestion: A psychic implants suggestions that will activate outside of the trance. For each success, the psychic may implant a command or condition to activate an implanted command. This condition may be a time or sensory trigger. One of the commands may be to automatically enter a trance under a specified circumstance. As Suggestion, the attempt automatically fails if it would obviously result in the target’s death or conflicts with the target’s Nature. Commands aren’t recurring unless the hypnotist spends an extra success to add a recurring condition.

•••• Fast Trance: The psychic instantly puts willing subjects in a trance and may spend a point of Willpower to put an unwilling subject in a trance, though an unwilling subject may roll Willpower (difficulty 7) to resist, with each success negating one of the psychic’s activation successes. The number of net activation successes is the number of turns the target remains in the trance. The psychic may roll to activate additional powers starting on their next turn.

••••• Sleeper Agent: The psychic performs advanced levels of brainwashing and conditioning, the kind governments clamor for. The psychic implants commands for the target to do anything, even to the point of death, and the target consciously remembers nothing said during the trance. This power takes 10 minutes to put the subject in a trance, which cannot be shortened with Fast Trance. The target must clearly hear the psychic’s voice. Additional sounds and distractions make the use of this power impossible, so psychics with this ability often designate special rooms for the purpose. The psychic spends one point of Willpower to use this power on an unwilling subject. Each activation success allows one command to be implanted, and each command or condition takes one hour to implant.]==] },
				["Psychic Invisibility"] = { en = [==[M20 Sorcerer, p. 68


Psychic Invisibility


• Wallflower: So long as the psychic remains completely still and silent, they stay unnoticed. However, the psychic needn’t hold their breath — only heavy or loud breathing breaks the effect.

•• Slink: The psychic moves while invisible but can’t interact meaningfully with the world. The power breaks if the psychic does anything to draw attention to themself or interacts with the world, such as writing on a chalkboard or opening a door. A psychic may make a Wits + Stealth roll at difficulty 7 or higher to avoid accidentally breaking their power in unfavorable conditions like twig-covered forest floors or a room with a motion alarm.

••• Invisibility: The psychic may now perform any action while invisible, even if those actions would normally draw attention to the psychic. Beings with mundane senses may make a Perception + Awareness roll at difficulty 9 to see the psychic if the psychic attacks them or they are specifically searching for the psychic. The being searching must exceed the psychic’s activation successes. The psychic cannot vanish while someone directly observes them.

•••• Selective Invisibility: The psychic controls who they project the “don’t notice me” command to. For every activation success, the psychic may declare one person exempt from the effect. Anyone declared exempt perceives and interacts with the psychic normally, but everyone else is treated as if the psychic activated Invisibility. Note that others can still perceive anyone interacting with the psychic, and this may draw negative attention.

••••• I Was Never Here: At the highest expression of this Phenomenon, a psychic vanishes in front of witnesses and erases their presence from witness minds. The psychic rolls activation opposed to the witness with the highest Perception + Awareness pool. The witness rolls at difficulty 8. At one net success, the psychic vanishes from view, confusing and unnerving any witnesses. At three or more net successes, the witnesses also forget the psychic’s presence for one past turn per success. It’s possible that witnesses could forget ever seeing the psychic, if the observation was short.]==] },
				["Psychic Vampirism"] = { en = [==[M20 Sorcerer, p. 69


Psychic Vampirism


• Tap Energy: The vampire feeds on others’ strong emotions, both positive and negative. The vampire senses what the emotions are as they feed and may use this power to gauge an individual’s emotions over time. It only requires one success to taste the nuanced palate of a person’s emotions and give the vampire a pleasant high. At three successes, the vampire regains one lost Willpower, and regains an additional Willpower per success beyond the third. The vampire must be within 10 yards of the victim and be able to sense them. The victim is unnerved, and their emotions are muted — but not absent — until the end of the scene.

•• Invigorate: The psychic drains a victim’s vital energies to empower themself. Every success drains one temporary Willpower from the victim and adds it to the vampire’s pool, up to a maximum of 10 total. Every Willpower over the vampire’s normal maximum gives a euphoric high and fades at one point per hour. The range is 15 yards, and the vampire must sense the victim to target them with this power.

••• Leech Vitality: This extremely dangerous power allows a vampire to use another’s life force to heal themself and experience an indescribable high. The psychic must touch the victim for one turn per health level of damage healed, up to activation successes. Bashing heals first, then lethal, and then aggravated downgrades to lethal. Every excess success that doesn’t result in healing restores 2 Willpower points to the psychic, as Invigorate. Every success used deals one lethal damage to the victim. If contact is interrupted before finishing, the psychic does not heal and must make another attempt.

•••• Essence Feast: The psychic isn’t limited to one victim at a time. The psychic rolls activation to determine the maximum number of simultaneous targets, gaining one additional target per success. All targets must be within 40 yards of the vampire, but the vampire doesn’t have to be able to sense all of them. On success, the psychic may activate any lower power on the same turn, using the normal costs and activation roll associated with the lower power. The psychic is stunned for the next turn — the influx of multiple flavor profiles at once is as overwhelming as it is euphoric for the psychic. A botch can cause a “bad trip” as if the psychic ingested hallucinogens and leave them stunned for the remainder of the scene.

••••• Distant Drain: The vampire’s mastery over tapping vital energies allows them to re-tap a previous victim over a distance. The vampire must have used either Telepathy or another Psychic Vampirism power on the victim previously. The activation successes specify a maximum range at which the vampire may use a lower power on the victim.

Successes = Range
Botch = May not use Psychic Vampirism on this target for one month
Failure = Nothing happens
1 = 500 yards
2 = 1 miles
3 = 2 miles
4 = 5 miles
5 = 10 miles
6+ = +10 miles for every success above 5]==] },
				["Psychokinesis"] = { en = [==[M20 Sorcerer, p. 70


Psychokinesis


• With a mental Strength and Dexterity of 0, the psychic can only lift a maximum of 5 pounds. Objects take a sluggish and clumsy path through space when moved and have a maximum speed of 5+ Wits yards per round.

•• The psychic’s mental Strength and Dexterity rise to 1, and objects have a movement of 7+ Wits yards per round.

••• Growing power and understanding have provided the psychokinetic with a mental Strength and Dexterity of 2. Manipulated targets move at 9+ Wits yards per round.

Further unlocking their understanding of kinetic force as a tool of the mind bears fresh fruit. The psychic can now make one ranged attack with their action through sheer force. The psychokinetic force hits like a punch from a distance using the psychic’s mental Strength and their Brawl or Martial Arts as a dice pool to attack, with base damage equal to their mental Strength. This attack represents concentrated use of the Phenomenon and cannot be used while performing any other psychokinetic action. This application is also instant and requires the full cost of activating the Phenomenon every time.

•••• The psychic’s mental Strength and Dexterity are now 3, and they can move manipulated objects at 11+ Wits yards per round.

Yet another new application becomes available to the psychokinetic. The psychic has internalized their psychokinetic force and now may levitate themselves regardless of weight at a rate equivalent to their walking speed. This usage of the Phenomenon takes greater concentration than most and therefore cannot be used while lifting other targets.

••••• A psychokinetic master has a mental Strength and Dexterity of 4 and can move manipulated targets at a rate of 15+ Wits yards per round.

Both refined actions of the phenomenon receive upgrades at this level. Levitation is now second nature and can be performed while lifting other targets, and Psychokinetic assaults may now cause bashing or lethal damage.]==] },
				["Psychometry"] = { en = [==[M20 Sorcerer, p. 72


Psychometry


• Impression: The psychic can get dreamlike impressions of recent events involving the object or more distant events with strong associated emotions. The psychic at this stage mostly gets emotional readings and vague, figurative imagery. At 3+ successes, the psychic may also see an accurate image of the person most closely associated with the object.

•• Reveal Scar: The psychic gets impressions of the event with the strongest emotional resonance associated with the object. They get dreamlike and imprecise images of the event. With 3+ successes, they also determine the owner’s approximate age, personality cues, connection to the object, and what the owner felt at the time.

••• Replay: The psychic clearly experiences the event and may gather general impressions of what happened to the object’s owner the day of the incident. Alternatively, the psychic may replay the object’s last 24 hours, even if nothing emotionally significant happened.

•••• Tether: The psychic may use the object as a psychic tether to the object’s owner. Activating this level gives the psychic insight into the owner’s current location to track them. In addition to clearly seeing the event with the strongest emotional resonance associated with the object, they also read emotional impressions and visions of the other people at the event and their feelings.

••••• Catalog: The psychic may use Tether on any event the object was associated with, not only the ones with the strongest emotional impact.]==] },
				["Psychoportation"] = { en = [==[M20 Sorcerer, p. 73


Psychoportation


• Short Hop: Range up to 12 + Intelligence yards in a turn.

•• Simple Jump: Range up to 20 + (3 x Intelligence) yards.

••• Long Jump: Range up to 40 + (6 x Intelligence) yards. The psychic may spend a turn of concentration and roll activation at +1 difficulty to double this range.

•••• Leap: Range up to 80 + (12 x Intelligence) yards. The psychic may double, as per Long Jump.

••••• Leap of Faith: The psychic no longer needs to sense a stable location to psychoport to it. The psychic may spend a scene studying the location and successfully roll Perception + Alertness at difficulty 8 to commit it to memory.]==] },
				["Pyrokinesis"] = { en = [==[M20 Sorcerer, p. 74


Pyrokinesis


• Spark: The pyrokinetic can generate small sparks, usually from their fingertips. These sparks are typically only able to light highly flammable substances on fire, such as paper or gasoline, but with 3 or more successes, the psychic’s sparks can light materials on fire as a match could. The sparks can light anything within the pyrokinetic’s reach, though they don’t have to touch the target. Even with many successes, the sparks aren’t hot enough to directly light a person on fire, though the effect of a flame appearing can startle someone. After activation, treat the sparks as a thrown attack with a weapon dealing no damage. This can be dodged normally. If the attack succeeds, the target rolls Willpower at difficulty 6 to avoid being stunned for one turn. On a botch, the target panics. The target may instead spend one Willpower point to suppress a startle response.

•• Combustion: The psychic concentrates on an object within 10 yards, causing it to burst into flame. The psychic can reliably light flammable materials like gasoline, dry wood, charcoal, and vampires on fire. At 3 or more successes, the psychic can light anything combustible, such as people, on fire. The initial fire is as big as a torch and behaves and spreads normally. If the psychic targets a person or person’s clothing, the target may attempt to dodge as normal, treating activation successes as the targeting roll.

••• Sun’s Fury: The psychic can now turn small balls of air into plasma and flame, which readily lights nearly anything it touches on fire. This power causes bonfire-sized fires up to 10 yards away dealing two aggravated damage per turn from the intense heat. Targets may attempt to dodge as normal, treating activation successes as the targeting roll. If hit, the target must spend a Willpower point or roll Willpower at difficulty 6 to be able to avoid panic. If they remain calm, the target may immediately use their action to roll Dexterity + Athletics at difficulty 5, extinguishing themselves on a success.

•••• Pyrotechnics: The pyrokinetic gains control over flames, including those produced by lower levels of Pyrokinesis. The psychic can grow, shrink, direct, and shape flames within their line of sight at will. With one success, the psychic may control a torch-sized portion of flames. With three successes, the psychic wrestles control of a bonfire. At five or more successes, the psychic may command even an inferno. Targeting individuals with flame is a Wits + Athletics attack at difficulty 7, with +1 difficulty to avoid harming nearby bystanders in the process. This attack can be dodged. A psychic may extinguish a flame at will. A bonfire or smaller flame is extinguished instantly, but any larger flame takes an entire turn of concentration to extinguish.

••••• Inferno: The pyrokinetic now commands larger and faster-growing flames, which may appear anywhere in the psychic’s line of sight. The flames consume anything inside them with 3 aggravated damage per turn, though targets on the outer edges may dodge as Sun’s Fury. At one success, the starting flame is a small fire, but at three successes the flames fill a large room, to a maximum of Willpower times 3 square yards. If the psychic maintains concentration, the flames are resistant to being extinguished by mundane means, taking rounds equal to the successes gained on the activation roll to extinguish through smothering, water, or flame retardant chemicals. If the psychic breaks concentration, such as by sustaining damage or being knocked out, the flames lose all supernatural properties and may be extinguished normally.]==] },
				["Shadow"] = { en = [==[M20 Sorcerer, p. 74


Shadow


• Scattering the edges of cast shadows and disrupting sound is only sufficient to increase the effectiveness of concealment and demoralization. Shadows become slightly longer, reach somewhat further, while sounds are all unnervingly stifled. All Intimidation and Stealth rolls have their difficulty adjusted by −1. Targets distracted by darkening shadows and muffled sounds suffer a +1 difficulty to all rolls reliant on sight and hearing.

•• The shadows now grow and bend to the will of the psychic. Sounds now baffle and distort, having the quality of being played through a blown speaker. The psychic embodies the idiom of “to darken a doorstep,” as rooms lose light when they arrive. Intimidation and Stealth rolls are made at −2 difficulty.

••• Not only do shadows grow darker, but now the psychic’s efforts causes light sources to lose their power. Sound travels through a room in erratic warbles, and the words that are intelligible have a perceptible delay with the speaker. Attempts to see the concealed psychic suffer a +3 difficulty. The harrowed begin to feel a swelling anxiety and must make a Willpower roll (difficulty 7) to avoid panic, suffering a -1 penalty to all actions that don’t involve leaving the scene if they fail.

•••• Spreading their gift of dark refuge, the psychic can now cloak a small gathering of three or four people, possibly even a small coupe or sedan.

Victims of shadowy harassment must make a Willpower roll (difficulty 8) to avoid panicking and immediately leaving the scene to escape the darkness. Intimidation and Stealth have a −4 difficulty in conditions that are ripe for exploitation. An already dark warehouse, a shadowy forest in the night, or a poorly lit parking garage all beg to have their deep shadows emboldened by the psychic. This amount of shadow manipulation has an inverse effect in brighter setting, like midday in an open car park or standing on a school sports field with all the lights on. The darkness around the psychic draws more attention in the brightness of noon than it diverts.

••••• In settings where darkness already lives, the psychic is master. Standing in a location where conditions favor shadows gives the psychic the chance to smother all light around them out to 50 feet. The darkness is near impenetrable for those without mystic sight, as even high-powered handheld lights are swallowed by the inky black. All within are completely shrouded and invisible to the outside and others within, save the psychic. The darkness is their own after all.]==] },
				["Synergy"] = { en = [==[M20 Sorcerer, p. 75


Synergy


• Like Knows Like: The synergist can sense other psychics. This automatically succeeds if the psychic touches another, but the synergist can roll activation to scan for psychics in line of sight. With 3 or more successes, the synergist can sense the relative power of the other psychics.

•• Share Will: The synergist forms a weak psychic link to enhance the power of the participants. Each psychic can either spend a point of Willpower for an automatic success on another’s effect or allow the psychic to “borrow” the Willpower and temporarily add the point to their pool, up to a maximum of 10. If the Willpower isn’t spent, it can be traded multiple times between the psychics in the link. Any sensory Phenomena (Telepathy, Precognition, etc.) allow all the psychics in the link to share the results.

••• Share Powers: The synergist forms a stronger link, allowing all psychics to use their powers as a group. Each psychic may donate up to two powers, points of Willpower, or one of each. Only one activation roll is necessary for group powers.

•••• Power Gestalt: As Share Powers, but now psychics in the link may combine ability effects to form one shared power. For example, the group could combine Animal Psychics and Psychic Invisibility to be able to sneak past guard dogs unnoticed.

••••• Power Network: The synergist may link other psychics and remove the need for the psychics to touch, or even be in the same place. A psychic with this level of Synergy first links everyone as with lower abilities, spending 10 minutes on combined focus and meditation to cement the ties. Once the link forms, the networked psychics remain linked and able to use any of the lower abilities for a number of hours equal to activation successes. This link does not fade with distance, but if a psychic in the link takes their Stamina or more in damage from a single source, all psychics in the network must make a Willpower roll at difficulty 7 or be ejected from the network. If the psychic who formed the network is ejected, knocked unconscious, or killed, the network automatically collapses.]==] },
				["Telepathy"] = { en = [==[M20 Sorcerer, p. 76


Telepathy


• All telepaths begin by sensing the surface thoughts and emotions of a subject. Emotions include current mood, immediate desire, and mental wellbeing. Surface thoughts are songs stuck in their head, active recollection of things like a grocery list or a keycode as it’s punched in, or what they think that smell was that they just sniffed.

•• Inner thoughts open to the telepath. With every success on the activation roll, the telepath may ask a single question about the target’s subsurface ruminations. These responses are one sentence in length and as straightforward as possible. Inner thoughts include political leanings, favorite books or movies, or recent memories.

The beginnings of telepathic communication open at this level as well. For every success on the activation roll, the telepath can send or receive one sentence of mental communication. These communications happen at the speed of thought, and as such do not take up any time within a round or require any dice pool splitting for multiple actions.

••• Deeper thoughts are laid bare to the telepath. As with previous levels, every success on the activation roll allows for a single question that is answered by the target These responses can be more detailed when the subject of the question is not a closely guarded secret. Deeper thoughts include memories from the last 5 years, passwords to social media accounts and bank cards, and the names of everyone from their immediate to extended family.

Telepathic communication comes much easier at this stage. For every success on the activation roll, the telepath can send and receive several sentences (two or three) worth of communication. Again, these communications happen at the speed of thought and follow the same rules as above.

•••• Subconscious thoughts and the deepest recesses of the mind are within reach of the telepath. Every success on the activation roll allows for a single question that is answered by the Storyteller. Nothing within the mind is off limits at this point. Memories back to their childhood, forgotten codes to facilities they used to work at, and even thoughts they have that they deny to themselves about their loved ones are all fair game.

Conversations over telepathic connections are no longer held to sentences. Full conversations between two people happen in the blink of an eye. The more impressive improvement is that telepathic links can be widened to a net. Each success on the activation roll allows another mind to be added to the conversation. When multiple minds are added to the psychic’s link, the excess telepathic bandwidth slows down as the psychic’s mind is acting as a routing hub. Conversations like this happen in real time, as though everyone involved were speaking to each other around a table.

••••• Insidious as it may be, the telepath can now implant subversive thoughts into the minds of their targets. These thoughts can be of anything, but any train of thought that wasn’t already present in the mind of the target requires a Manipulation + Subterfuge roll (difficulty 7) to implant thoughts that complement the target’s personality and desires. Implanted thoughts that run contrary to the target’s personality and desires suffer a +2 difficulty to the roll. Should these thoughts take root, the target will begin to act on them at the nearest opportune time, convinced the thoughts are their own.]==] },
				-- True Faith is not one of the 43 above: it is the single Path of its own Numina
				-- and it has its own two-entry picker (SPEC T81/T82, R.16). Same shape as the
				-- rest so the renderer and the gate treat it identically.
				["True Faith"] = { en = [==[The Hunters Hunted II, p. 83


True Faith


• Each level of True Faith grants an extra point of Willpower.

• Each point of True Faith acts as a die of divine protection to resist the effects of Numina, vampire Disciplines, or other supernatural powers. When a character would be affected by a Kindred Discipline or other power, her player may spend a point of Willpower and roll the character’s True Faith rating as a dice pool against a difficulty of 7. Successes earned on this roll subtract successes from the activation roll of the power in question. This protection affects only powers that would directly affect the character, and only if a dice roll is required to determine their degree of success. It offers no protection against passive or indirect uses of powers such as Aura Perception or Fortitude.

The True Faith Numina, like any other, has a rating of 1 to 5. Exactly what protection is afforded to the individual depends on this rating, as described below. At their discretion, Storytellers may wish to amend or alter these benefits to reflect the intervention of higher powers as it illustrates the themes of their own chronicles.

True Faith Levels

• Any character with True Faith may attempt to repel vampires, ghosts, and other supernatural creatures by brandishing a holy symbol or uttering prayers. The player of the Faithful spends a Willpower point and rolls her character’s True Faith rating against a difficulty equal to the creature’s permanent Willpower.

The successes garnered indicate the number of turns that the creature must flee from the character while she invokes the protection of prayer or the holy symbol. If the activation roll yields no successes, a supernatural creature need not step back, but may not advance. A botch indicates that it may advance unhindered. If the religious symbol is placed against a vampire’s body, each success causes a level of aggravated damage, burning into the creature’s flesh.

•• The Faithful may sense the presence of a vampire. She need not consciously try to detect the vampire’s presence, but she must be in peaceful, quiet surroundings, perhaps alone in thought, praying, reading a religious book, meditating, etc. The Faithful will not sense the vampire if she is preoccupied (e.g., arguing) or in a crowded, noisy place (jostled by a mob, in the midst of a party, etc.). This ability doesn’t light up the vampire like a beacon; the Storyteller reveals the presence of the vampire only when the Faithful’s attention would indicate such. Note that the character doesn’t know exactly what she senses through her faith. All she knows is that something sinister is nearby.

••• The Faithful is immune to Chimerstry, Dementation, Dominate, Obfuscate, and other supernatural effects that confound the mind.

•••• The Faithful may not be turned into a ghoul. She is unaffected by Presence and other supernatural effects that manipulate emotions.

••••• The mere presence of the Faithful may fill a vampire or other supernatural creature with self-loathing, disgust, terror, or even physical pain. The player of any vampire who hears the Faithful pray or preach, or who is touched by the Faithful, must make a successful Rötschreck roll (difficulty 9) to resist having the Kindred flee immediately and for the duration of the scene. A vampire who is unable to flee is reduced to a gibbering wreck, flailing on the floor, screaming, sobbing, or begging for mercy.

Miracles of True Faith

A miracle is an instance of direct divine intervention. The Faithful often pray to the divine as a form of worship and meditation. On rare and inspiring occasions, the divine answers a prayer in the form of a miracle. Such miracles should be rare, never more than one in a story, and always dramatic.

The Storyteller should examine the motivation of the character invoking the miracle. The divine likely doesn’t care if the Faithful wants to drive a luxury car, win the lottery, or even survive an encounter with a random vampire. Every religion has martyrs, and death is sometimes in the divine plan. Prayers that are selfless and seek to help or inspire others have the best chance of being answered. No hard-and-fast system for invoking miracles exists — it’s simply a dramatic reminder that Faithful individuals bear a divine duty and can occasionally serve as conduits for their greater power’s will in the world.

Miracles are impossible to define mechanically, as they should be specifically tailored to the situation. Some examples include:

• Helping a barren woman be able to bear a child

• Curing a terrible and painful disease, such as cancer

• Helping someone trapped under a collapsed building

• Finding yourself at the side of a friend in desperate need]==] },
				-- The fifty-two SAMPLE RITUALS of the hedge Paths, "HEDGE MAGIC RITUALS" on the
				-- Numina tab (SPEC T928, I140i, I140l). They are keyed by the picker value, level
				-- prefix and all, because that is what the sheet saves and what mfOpen hands to
				-- descText - the box already passes the 'Numina' kind, so no code names them.
				-- The book prints these as prose with no System block, which is why every one of
				-- them is on the named V335c list (SPEC I104c).
				["1. Death Curse"] = { en = [==[M20 Sorcerer, p. 31


1. Death Curse


One of the most extreme rituals a magician can perform, the Death Curse always results in their death, and usually the destruction of their enemies. The magician spends all of their permanent Willpower, gaining a pool of successes equal to their value for the final spell. This ritual allows them to increase the level of Aspects to 2 higher than their Path rating, allowing relatively powerful magicians to sacrifice themselves for legendary curses (or, more rarely, blessings). Curses that resound for generations with fates worse than death for entire towns aren’t unheard of for the most powerful of magicians who find themselves willing to make the sacrifice. They make their Path roll at a difficulty determined by the Aspects as usual, but with that additional pool of automatic successes. Upon completing the ritual, the magician collapses, having spent their life in the casting; they’re often dead before they even hit the floor.]==] },
				["1. Deathsight"] = { en = [==[M20 Sorcerer, p. 40


1. Deathsight


Normally, a necromancer can only see the ghosts around them. They can’t see the environment the ghosts call home. This ritual changes that. With it, a magician not only sees the Restless Dead, but can actually peer into the Shadowlands. This effect lasts for one minute per success on the ritual. While under the influence of this ritual, the necromancer cannot perceive the normal world; only the Shadowlands are visible to them.]==] },
				["1. Eldritch Mark"] = { en = [==[M20 Sorcerer, p. 29


1. Eldritch Mark


By inscribing a symbol or mark onto an object or the forehead of a person, the magicians marks them as theirs. The mark is invisible to the naked eye, but obvious to anyone with magically enhanced perceptions of any sort. The mark informs anyone looking at it of the name of the magician who created the mark. This ritual takes five minutes to cast and has no Willpower cost. The mark lasts until the next new moon.]==] },
				["1. Face Theft"] = { en = [==[M20 Sorcerer, p. 47


1. Face Theft


The key ritual for Shapeshifting-based spycraft, Face Theft allows the magician to take on the precise form of another human being. They must have some piece of the person, such as strands of hair or nail clippings. The ritual requires one success for a person broadly similar to the caster, and an additional success each if the form differs in race, sex, or by more than 20 years of age.]==] },
				["1. Healing Slumber"] = { en = [==[M20 Sorcerer, p. 33


1. Healing Slumber


The healer treats a willing (or unconscious) patient and sends them into a deep, energizing sleep. On success, the patient remains asleep for 9 hours; when they awake, all bashing damage is healed, and the patient regains a point of Willpower. For every success above one, subtract one hour from the required sleep time. The healer cannot treat lethal or aggravated wounds in this way.]==] },
				["1. Lifting Shadows"] = { en = [==[M20 Sorcerer, p. 46


1. Lifting Shadows


Shadows and shades hide secrets for those who wish to hide them, but the learned sorcerer may reveal those secrets to those they trust. Smearing ink into a pair of contacts or funneling smoke into tight swimming goggles, the sorcerer brings the sight of the recipient into the realm of shadows. For the next eight hours, night may be as bright as day. Once blessed, the sorcerer or their ally may treat all darkness as daylight when making Alertness tests based on sight.]==] },
				["1. Sprint"] = { en = [==[M20 Sorcerer, p. 22


1. Sprint


Sometimes, a magician needs to travel a short distance quickly. Though preparations vary, mostly by practice and Ability, this ritual always concludes by lacing up a pair of blue sneakers. Once they are on, the magician can run faster than any mundane human, so long as no one sees them do so. Each success on the ritual doubles the running speed and grants one minute of running. At the end, the ritual leaves the magician exhausted, and they must rest for five minutes.]==] },
				["1. Symbol Interpretation"] = { en = [==[M20 Sorcerer, p. 43


1. Symbol Interpretation


In their rush to control the dreams of others, many oneiromancers forget even the meaning of the name of their Path. Though none forget that oneiros means dream, they think “mancy” simply refers to magic, rather than being derived from manteia, or divination. A growing movement among oneiromancers across Fellowships — spearheaded by Prof. Jeremiah Marquette, who specializes in using dreams to access blocked or forgotten memories — is reviving lost information by gathering aspects of the Path forgotten by many practitioners. He’s popularized a new ritual allowing an oneiromancer to find the answer to any one yes/no question the dreamer has ever known the answer to by reading the symbols of their dreams. The magician must have something of the target’s in their possession. They then must succeed at a Path roll and spend the night observing their target’s dreams with a specific yes or no question in mind. At the end, they must make an Intelligence + Enigmas or Intelligence + Esoterica (Dream Interpretation) roll. If they succeed, they find the answer to their question in the target’s dreams.]==] },
				["2. Bedtime Story"] = { en = [==[M20 Sorcerer, p. 43


2. Bedtime Story


The most dangerous moment for an oneiromancer is that first step into a dream. The narrative of the dream is in effect, and they are forcibly adapted to it, sometimes losing themselves to it. Enterprising oneiromancers developed a ritual to take control of the dream as it forms, mitigating the risk that they’ll lose control. This ritual must be completed as the subject goes to sleep and requires the oneiromancer be in the room with them. However, a single success allows the oneiromancer to direct the forming dream, broadly guiding its narrative and themes.]==] },
				["2. Cruel Whispers"] = { en = [==[M20 Sorcerer, p. 36


2. Cruel Whispers


Illusionists must often be masters of psychological warfare. They can’t create anything truly real, so they play on the fears and anxieties of their targets to control them. One of the key rituals for this is Cruel Whispers. A purely auditory illusion, Cruel Whispers follows its target around for twenty-four hours. Though the magician may never know what the whispers are saying, the victim hears voices, just barely audible, pointing out every flaw, every insecurity, and ever misstep they make during the day. This distracts them, giving them +1 difficulty on all rolls for the day, and whenever they botch they must make a Willpower roll (difficulty 6) or else suffer the effects of the Chronic Depression Flaw (BoS p. 51) for one week.]==] },
				["2. Enhance Craftsmanship"] = { en = [==[M20 Sorcerer, p. 29


2. Enhance Craftsmanship


Sometimes, instead of a magic item, what a magician needs is an otherwise normal but perfectly crafted object. This ritual creates unbreakable blades, sweaters that don’t unravel, and similar objects whose only enhancement is in the extreme quality of their crafting. These objects cannot be enchanted further, however. Enhanced items are not magical, but an Enchanter or Alchemist can roll Perception + Occult (difficulty 6) to recognize that they were created in this manner. This ritual must be cast during the creation of the object, or takes 15-20 minutes after the fact, and costs no Willpower.]==] },
				["2. Fire's Weal"] = { en = [==[M20 Sorcerer, p. 34


2. Fire's Weal


Fire is one of the most dangerous hazards in the World of Darkness; even natural flames can easily cause permanent damage to powerful supernatural beings. With this ritual, the magician can give protection against fire of all sorts. With two successes, the ritual allows the target to soak fire damage, even supernatural flame, as though it were bashing, regardless of what damage it causes. Successes in excess of two reduce the difficulty on soak rolls against fire (to a maximum modifier of –3), so four total successes result in soaking fire damage at –2 difficulty.]==] },
				["2. Hellblade"] = { en = [==[M20 Sorcerer, p. 34


2. Hellblade


A flashy ritual, Hellblade attunes a weapon, traditionally a sword, to the Path of Hellfire. Once attuned, the magician can spend one Willpower to engulf the weapon in flame. The flame causes the weapon to inflict two additional dice of damage and converts its damage to aggravated. This lasts for a scene, though the ritual ends if the weapon leaves the caster’s hand. This ritual requires a minimum of two successes.]==] },
				["2. Jolt"] = { en = [==[M20 Sorcerer, p. 33


2. Jolt


The sorcerer spends a point of Willpower and magically awakens a person who is sleeping, unconscious, or comatose. This normally requires one success but requires the toxin’s rating in successes to wake someone who is drugged, and four successes to wake the comatose.

Reversing a magickal effect requires successes equal to the original effect +1 to reverse it. This power doesn’t heal the underlying illness, injury, or poisoning, and the patient falls unconscious again at the end of the scene if the healer doesn’t resolve the underlying issue. This can be used to help identify the patient and gather information about who or what put them in that state.]==] },
				["2. Object Permanence"] = { en = [==[M20 Sorcerer, p. 21


2. Object Permanence


Hedge magicians naturally have an easier time summoning targets they have a strong connection to, such as a beloved pet or the ritual knife their mentor gifted them. With Object Permanence, the hedge magician forces a supernatural connection to objects for future summoning. This treats the target as “well-known to the sorcerer,” even if the sorcerer found it in a dumpster an hour ago. The sorcerer meditates within 10 feet of the target and spends a point of Willpower. Every success represents a day the target maintains the supernatural connection to the sorcerer. A hedge magician may have a maximum number of targets bound this way at once as they have dots in Conjuration.]==] },
				["2. Quintessence Infusion"] = { en = [==[M20 Sorcerer, p. 45


2. Quintessence Infusion


The ability to store and redirect Quintessence is useful on a near daily basis for the sorcerer on the go. Thinking in advance, a sorcerer prepares themselves for situations where they may begin to run dry of available quintessence by infusing drinks or snacks with their own reserves for later use. Classically, this was a potion of great power. In modern nights, the savvy sorcerer may decide the espresso in a can or a protein bar may be just as handy, serving as the perfect inconspicuous consumable. The one drawback to this task is the fueling and the resource of the ritual. For every Quintessence stored, another Quintessence must be channeled to infuse the receptacle.]==] },
				["2. Rest in Peace"] = { en = [==[M20 Sorcerer, p. 38


2. Rest in Peace


By summoning a thunderstorm from the underworld, the magician can place nearby ghosts into a state of Slumber. Slumber is similar in many ways to sleep for the living. It is restorative for the ghost’s ephemeral form and restful for their minds and personalities. While in Slumber, the ghost loses awareness of their surroundings, instead experiencing vivid dreams. Usually those dreams are lively and colorful, focused on the ghost’s passions, but with a darkness overlaying them due to the Shadow. The Slumber created by this ritual brings better, more peaceful dreams. The Shadow’s influence over them is diminished to nothing, and even Spectres find themselves having positive dreams for the first time since they fell to their Shadows. A single success always puts a willing target into Slumber, but unwilling targets (like most Spectres) roll Willpower (difficulty 6) and must achieve more successes than the ritual in order to stay awake.]==] },
				["2. Step on a Crack"] = { en = [==[M20 Sorcerer, p. 31


2. Step on a Crack


A common rhyme among children says, “If you step on a crack, you break your mother’s back.” It’s just a childish version of an ancient belief that touching cracks brings misfortune. This belief is made manifest in this ritual. Unlike most curses, the magician must inform their target of the curse for it to take effect, and the curse doesn’t automatically occur. Instead, the victim can attempt to evade the curse by not touching cracks. This, of course, inevitably proves to be impossible, triggering a curse bringing some non-life-threatening but potentially permanent harm to the victim or to their loved ones. If they can unweave (see p. 15) this curse before stepping on a crack, it is done at –2 difficulty. However, once the curse is triggered, any attempt to rid the victim of it is at +2 difficulty instead, as their actions were the direct cause of their misfortune, unfair as that may be.]==] },
				["2. Teleport Ward"] = { en = [==[M20 Sorcerer, p. 22


2. Teleport Ward


Hedge magicians studying the Path of Conveyance quickly learn to defend themselves from it. By marking out a room or building in an appropriate way — a chalk circle, sigils on the walls, or anti-teleportation field projectors, etc. — they can make it harder for other hedge magicians to use the Path to enter the area. After the ritual is set, each success must be overcome by a caster trying to enter the bounded area. This protection degrades at a rate of one success per month, but a single success on another ritual roll restores it.]==] },
				["3. Always Armed"] = { en = [==[M20 Sorcerer, p. 21


3. Always Armed


The sorcerer doesn’t have to appear armed to have a weapon at the ready. Due to the nature of this ritual, it’s nearly always hung before the sorcerer enters a potentially dangerous situation. If they need to access the weapon, the sorcerer completes the ritual by reaching into their trenchcoat or a convenient shadow to summon it. Traditionally, sorcerers used this ritual to conjure swords, but in modern times it’s most common for a sorcerer to summon a shotgun or rifle. The summoned weapon can’t be larger than a shotgun or long sword.]==] },
				["3. Bashert"] = { en = [==[M20 Sorcerer, p. 32


3. Bashert


Though this ritual existed in ancient times in one form or another, it has been popularized in its current form by Anne Richard and Judith Marquette. Fate may be fickle, but some matches are almost impossible to keep apart. With even a single success, the target of this ritual is nearly guaranteed to meet a perfect match, someone with the potential to be their True Love (as per the Merit on Book of Secrets p. 59), within the next year. Each additional success divides the time: two successes brings them together within six months, three decreases the wait to four months, and so on.]==] },
				["3. Belle/Beau/Bright of the Ball"] = { en = [==[M20 Sorcerer, p. 30


3. Belle/Beau/Bright of the Ball


With knowledge of an upcoming social event and proper preparation, a sorcerer can make themselves quite the sensation. With an invitation in hand, whether intended for them or not, the magician infuses their presence into the upcoming gathering. For the duration of the specified party, they receive VIP treatment from all attendees and hired staff. The organizers give their blessing and offer a hearty “have a great night” without second-guessing their guest list.]==] },
				["3. Calm Above, Hell Below"] = { en = [==[M20 Sorcerer, p. 39


3. Calm Above, Hell Below


Spells for the Path of Maelstroms generally bring Tempest energy from the Underworld into the physical world. This creates the storms above and calms the below. This ritual reverses that. It can only be performed during a storm, and when complete, any normal storm in the area dies down. Extreme weather events are largely unaffected and can be used to perform this ritual several times, even decreasing the difficulty by one. However, it is rarely a good idea to sit outside in a hurricane for several hours. The storm’s energy enrages the ghosts in the area. On a single success, they must make Willpower rolls (difficulty 6), or they begin lashing out, attacking each other and even the living if they have the power to do so. If the caster achieves five or more successes, this additionally creates a Maelstrom, causing most ghosts to attempt to flee the area, before being attacked by the spectres such disturbances inevitably attract.]==] },
				["3. Get Me the Heck Outta Here!"] = { en = [==[M20 Sorcerer, p. 22


3. Get Me the Heck Outta Here!


One of the most useful tools a magician can have in their pocket is an escape route for when things go badly. This ritual instantly brings the magician back to a pre-prepared home location within 50 miles of them. It requires at least four successes to cast, though additional successes 20 miles apiece to the ritual’s range. An additional roll when casting the ritual allows the magician to return to a secondary location if their dedicated home is too far away. This ritual is almost always cast as a hanging ritual.]==] },
				["3. Grip of Shades"] = { en = [==[M20 Sorcerer, p. 47


3. Grip of Shades


Within every crevasse hides a little shadow. Within every shadow hides an ally to a sorcerer of the Path of Shadowcasting. It is access to these allies that gives the sorcerer leverage in ways that many would never anticipate. By hardening the shadowstuff within the shadows on their person, the sorcerer may afford themselves a modicum of protection against impacts and benefits from an advantage in hand-to-hand combat. For 24 hours after bathing in coal-infused oils, the sorcerer has rating 2 armor when soaking bashing or lethal damage and adds two to all Brawl and Martial Arts dice pools that involve grappling.]==] },
				["3. Hard-Light Constructs"] = { en = [==[M20 Sorcerer, p. 37


3. Hard-Light Constructs


A popular ritual among technosorcerers, Hard-Light Constructs are illusions everyone involved knows are fake. This creates scenery, furniture, etc., that looks and feels real, though putting your weight onto it wouldn’t be the best idea. It’s often used to simulate visuals where every single detail isn’t needed, but which have moving parts. It creates the illusion for all onlookers, rather than a fixed set of targets. At least one Extraordinary Citizen has been reprimanded for using Hard-Light Constructs to run their World of Shadows game.]==] },
				["3. Invade Demesne"] = { en = [==[M20 Sorcerer, p. 43


3. Invade Demesne


Normally, the space created by the Demesne background is inviolate. Only powerful mages capable of finding them through astral travel can reach them. oneiromancers, however, have tricks few others can reproduce. This ritual lets the oneiromancer enter the Demesne of their target. Once there, they can try to seize control, though this requires a Path roll at difficulty 9, opposed by the Demesne’s owner rolling Wits + Demesne (difficulty 6). This is highly risky, and only the most well-prepared oneiromancers should try it.]==] },
				["3. Mike's Cure-All"] = { en = [==[M20 Sorcerer, p. 33


3. Mike's Cure-All


While similar rituals were performed for centuries, or longer, this version was first recorded in Chicago during Prohibition and was based on Victorian era Cure-Alls. The healer can force a patient’s body to purge all drugs and toxins through any, and sometimes all, possible exits. This includes vomiting, sweat, tears, diarrhea, etc. The process is incredibly unpleasant but can save a poisoning victim or someone who’s overdosed. The sorcerer must get at least as many successes as the Toxin Rating for the most potent toxin in the patient’s system. No damage is healed, but the patient suffers no further ill effects. This can purge magical potions as well.]==] },
				["3. Purification of the Inferno"] = { en = [==[M20 Sorcerer, p. 35


3. Purification of the Inferno


After an unfortunate encounter with a vampire, Charles Moran developed this ritual to protect himself in the future. Unfortunately, this ritual does not discriminate friend from foe, making it an extremely risky ritual to cast when the magician might be in close quarters with others, such as in an elevator. Purification of the Inferno acts as a defensive failsafe. The first person to touch the magician after the ritual immediately bursts into flames, suffering four dice of aggravated damage. The flames then become entirely mundane, dealing three lethal damage per turn, which can be soaked at difficulty 8 until they are put out. The ritual requires three successes on casting.]==] },
				["3. Shape Quintessence"] = { en = [==[M20 Sorcerer, p. 45


3. Shape Quintessence


Following elaborate diagrams or practices that align with their style, the sorcerer can manipulate the flow of Quintessence within an area. A gambling hall could be made luckier for the house, or a particularly well-respected ER could suffer higher mortality rates despite the best efforts of the staff simply by manipulating the ley lines beneath the surface. The energies will eventually return to their original pattern, as the ritual holds it in an elastic state for only so long. With proper maintenance and continued observation, a location could be made to take on the new aspects permanently.]==] },
				["3. Shitstorm"] = { en = [==[M20 Sorcerer, p. 21


3. Shitstorm


The hedge magician surrounds themself and companions within 25 feet of them with a swirling shell of small inanimate objects. This adds +1 difficulty to hit anyone covered by the effect with a ranged attack for every 2 activation successes. Additionally, anyone attempting close combat against those affected by the ritual must soak [activation successes] in damage. This is usually bashing, unless the sorcerer was in a room filled with broken glass, small knives, or other sharp objects, in which case the damage is lethal. The sorcerer doesn’t have to target any enemy in particular for this to occur. Anyone, friend or foe, who gets too close to the flying debris is hit and must soak the damage.]==] },
				["3. Shroud Bubble"] = { en = [==[M20 Sorcerer, p. 41


3. Shroud Bubble


Sometimes, when all else fails, the best thing a magician can do when faced with a troublesome haunting is to hide and wait it out. The problem being that ghosts have a nasty tendency to walk through walls and most other protective barriers. They also tend to be relentless, often obsessed when their minds are turned to a task. Desperate magicians being haunted by perseverant ghosts invented the concept of the Shroud Bubble to protect themselves, especially when waiting for backup to arrive to handle the ghost more directly. The ritual requires three successes but increases the Shroud to 10 near the magician. In fact, the Shroud rating increases in a sphere just large enough to contain them. The effect remains stationary, so the magician can’t leave the area without increasing their risk from ghosts and lasts for 8 hours.]==] },
				["3. Shut It Down"] = { en = [==[M20 Sorcerer, p. 41


3. Shut It Down


Hauntings can vary in scale. For ones confined to a room or two, it’s fairly simple to shut down the powers the ghosts are using to interact with the physical world. More often, though, there’s a whole building or larger area being haunted, and if the ghost is denied one room, they’ll just go to another. With Shut It Down, a much larger area than usual can be quieted, such that ghostly powers are impossible to use. The magician must mark the corners of the building or area, which can be as large as a full city block of empty land or a single building. The ritual requires at least 3 successes, and ghosts inside can only use their powers if they succeed on a Willpower roll at difficulty 8.]==] },
				["3. Wrapped in a Shroud"] = { en = [==[M20 Sorcerer, p. 40


3. Wrapped in a Shroud


The Shroud separates the world of the living from the world of the dead. It can be difficult to cross this barrier, a fact which protects the living and the dead both from each other. Usually, either a necromancer must reach across from the land of the living to the world of the dead, or a ghost must have crossed to accomplish something among the living, in order for them to interact. For one minute per success on this ritual, the necromancer manages to actually stand between worlds, able to interact directly with both without further magic. Both human beings and ghosts can interact freely with the magician, for better or for worse.]==] },
				["4. Doxxing"] = { en = [==[M20 Sorcerer, p. 42


4. Doxxing


By reading the currents generated by a ghost and its movements, the magician can glean information from it. Each piece of information comes with a cost and must be declared and paid for before the casting. Any resources spent in this way are not refunded if the ritual fails. No information is gained if the ritual fails to achieve the number of successes required for the information being sought out:

• Identifying a Passion — One success each. This identifies both the Passion and the emotion it is tied to.

• Nature, Demeanor, and Shadow Archetype — One success and one point of Willpower each.

• Identifying a Fetter — Much more difficult, this requires two successes and a point of Willpower.

• The True Name of the ghost — This requires five successes and two points of Willpower.]==] },
				["4. Dream Scream"] = { en = [==[M20 Sorcerer, p. 43


4. Dream Scream


While powerful oneiromancers can simply send dreams to people as spells, with this ritual, they can send a message to several people at once through their dreams. The magician chooses a message consisting of a single sentence, fixes it in their mind, and performs the ritual. At completion, they can send the message to one person per success within a 10-mile radius.]==] },
				["4. Extraction"] = { en = [==[M20 Sorcerer, p. 22


4. Extraction


Another ritual commonly hung “just in case”, Extraction allows the sorcerer to take fallen or overwhelmed companions out of battle and to safety. The sorcerer first moves out of range of combat, typically behind cover, and pulls their companions out of a shadow. There isn’t a difficulty increase or success penalty if the companions aren’t resisting and aren’t immediately being targeted — the chaos of combat can hide this ritual’s use. Once the sorcerer and their companions are out of range, they aren’t counted as being in combat unless a combatant finds them and attacks. This powerful ritual can work on up to 10 companions, who the sorcerer must define when initially performing the ritual.]==] },
				["4. Fix the True Form"] = { en = [==[M20 Sorcerer, p. 47


4. Fix the True Form


Shapeshifters often find themselves in conflict with one another. They also run into stranger things with multiple forms. Fix the True Form was developed by one who claimed descent from werewolves. It forces anyone targeted by it to take on their “true” form if they fail at a Willpower roll (difficulty 8). For magicians, they simply revert to their natural form, as do most other shapeshifters. Ironically, despite being created in part to force werewolves into their human or wolf forms, this ritual forces Garou and Fera to take on their mixed forms instead, often with terrible consequences for an overconfident hedge magician.]==] },
				["4. Forced Medium"] = { en = [==[M20 Sorcerer, p. 40


4. Forced Medium


Some people are naturally easier for ghosts to possess. These mediums may view this as a gift or a curse, but it marks them apart. These are the people who deal with the spirit worlds, and who ghosts will come to in order to either ask them to solve a problem or else take over their body to compel them do so. This ritual gives the target the merit Medium (BoS p. 69) for a week, along with a –2 difficulty on attempts by ghosts to possess them.]==] },
				["4. Freudian Slip"] = { en = [==[M20 Sorcerer, p. 32


4. Freudian Slip


Speaking your thoughts at the wrong time can be social suicide. It can end friendships, destroy careers, and create lifelong hatreds with other consequences down the line. Magicians who study the Path of Fortune have refined this this ritual to take advantage of this knowledge. Freudian Slip curses its victim to say the worst possible thing they actually believe at their next important social event or encounter. This can include political speeches, job interviews, dates, family events, and more. Whatever the context, the next time they are trying to conceal their true feelings in a situation where revealing them would cause significant and lasting harm, they must make a Willpower roll (difficulty 8) to avoid simply blurting them out. If they avoid significant social events for a year and a day, the curse dies off, leaving them safe.]==] },
				["4. Humor Alignment"] = { en = [==[M20 Sorcerer, p. 33


4. Humor Alignment


This is an old ritual for curing chronic and congenital conditions. It dates back to the Middle Ages when Humorism was in vogue. The healer bleeds the patient with leeches, a ritual knife, or another tool suited to their practice, which deals one level of lethal damage. The healer spends a point of Willpower and must roll at least 5 successes. The healer may perform this ritual as an extended action. The patient rests for three days, after which the lethal damage and the condition are healed. This rest needn’t be solely sleep. The patient may move minimally to perform basic bodily functions but otherwise should be laying down. If the patient is too active during the three days, the ritual fails automatically. The ritual will also fail if the patient suffers significant mental or emotional stress, such as trying to work from bed or having a heated argument.]==] },
				["4. Information Superhighway"] = { en = [==[M20 Sorcerer, p. 23


4. Information Superhighway


For technology-based magicians, there’s an unusual means of transportation often overlooked by mystics. It’s harder to access than others but can sometimes reach places Conveyance normally can’t. This ritual allows the caster to travel from any electrical outlet to any other, by converting the magician into electricity. The range is limited to 5 miles per success. This travel takes one minute per 5 miles. However, the archetypical sealed room Conveyance can’t access is usually not sealed off from electricity: If an outlet exists, then the magician can get to it.]==] },
				["4. Instant Feast"] = { en = [==[M20 Sorcerer, p. 37


4. Instant Feast


Illusory food is deceptively hard to create. Taste, smell, image, and texture all need to be just right to fool someone into thinking they’re eating a real meal. The target rolls Perception + Alertness (difficulty 7). On failure, they believe they are eating real food for the duration of the meal, whatever food the magician can imagine. However, they’re still hungry. This provides no sustenance (unless the illusion is covering up some other food), though if six or more successes are rolled on the casting, hunger cues are suppressed for a number of hours equal to the target’s Stamina, before they feel hungry again. This can’t alleviate the effects of starvation.]==] },
				["4. Love Potion Number 9"] = { en = [==[M20 Sorcerer, p. 30


4. Love Potion Number 9


Regardless of its classic and iconic nature, usage of the “love potion” has fallen out of fashion for obvious reasons. As societies have become more insistent on the importance of consent, sorcerers have had less call to take the time and resources required to perform this ritual. Those that are still willing to make the potent mixture of love and loyalty do so with hesitancy and charge a premium price.

A lock of hair, a dram of blood, or a sentimental personal effect is required to create the right connection to the heart in question. When performed for an individual other than the sorcerer themselves, some part of the client is usually required as well. The ritual takes the form of the traditional potion in some practices; in others it is a sort of ritualized binding with a knotted cord. In all cases, the victim is tied to the anchor point of the sorcerer or their client.

Once performed, the victim finds themselves uneasy and sick to their stomach. The lingering nausea vanishes when the anchor is near, or when they are performing a task that they know would please the anchor.]==] },
				["5. Generational Wealth"] = { en = [==[M20 Sorcerer, p. 32


5. Generational Wealth


There are only so many ways to become wealthy enough to last for generations. Other than simple luck, all of them require a substantial sacrifice. For most, this sacrifice is borne by others, through exploitative labor practices or criminal enterprise. In fact, due to the fickle nature of luck, exploitation has always been the easier and more reliable path to wealth. This ritual allows luck to be tamed and guaranteed. It still requires a sacrifice; after all, nothing comes for free. But rather than sacrificing others, taking advantage of their desperation, the parent who seeks security for their family voluntarily sacrifices themself. Though the sacrifice must be willing, few magicians are willing to perform this ritual. Those who are willing must perform the sacrifice in some way appropriate to their practice. The beneficiaries of the sacrifice find themselves suddenly extremely lucky, able to win enough money gambling so they, their children, and their children’s children, will never have to work another day in their lives. Even if they somehow manage to throw away this vast wealth, the next generation will be just as lucky and regain it. The blessing lasts for seven generations, after which the descendants are on their own.]==] },
				["5. Megafauna Transformation"] = { en = [==[M20 Sorcerer, p. 48


5. Megafauna Transformation


The Path of Shapeshifting allows the caster to assume animal forms, including partial transformations. But in the end, the caster can normally only fully transform into a normal animal. This ritual allows them to become a gigantic version of whatever animal they want to transform into. In most cases, this is a full throwback to an extinct version of the animal, such as the megatherium (giant sloth) of the Americas. This requires at least five successes.]==] },
				["5. Oubliette"] = { en = [==[M20 Sorcerer, p. 37


5. Oubliette


One of the most terrifying rituals of the Path of Illusion, Oubliette has broken some of the strongest people in the world. The magician must be within a few feet of their target for the entirety of a three-hour ritual, which requires at least 5 successes. If they can accomplish this, then the ritual removes all five senses from the victim. They are trapped in a world without any sensation until either the magician releases them or they accumulate 5 successes on Perception rolls at difficulty 9, making one every hour. The victim must start over on a botch. Often, the victims of this ritual are being punished for heinous crimes, and have it cast on them before they are thrown into a hole and forgotten, left to starve without even knowing they are starving.]==] },
				["5. Overwrite"] = { en = [==[M20 Sorcerer, p. 42


5. Overwrite


The ultimate expression of the Path of Necronics, the practitioner concludes that all ghosts are electromagnetic signals trapped in the matrix of a formerly living person’s personality. This explains why they’re so malleable, for good or ill. With this ritual, the magician can rewrite the nature of the ghost on a fundamental level. To do so, they must know the ghost’s True Name and possess one of the ghost’s Fetters. The ritual takes 12 hours and requires two Stamina rolls (at difficulty 6) to complete. For this entire time, the ghost must be held within the same room as the caster, roughly a 10-foot by 10-foot space. Upon completion of the ritual, significant changes can be made to the ghost, but each has a cost. They last for one lunar cycle by default but become permanent if the costs are doubled. Some of the possible changes are:

• 1 success and 1 Willpower point per level to change Passions, and an extra Willpower to change to a different emotion.

• 2 successes and 1 Health Level — not damage, the Health Level itself disappears for the duration — to add or remove a point of Angst.

• 5 successes and 5 Willpower to overwrite the ghost entirely with another specific personality.]==] },
				["5. Shelter for the Dead"] = { en = [==[M20 Sorcerer, p. 39


5. Shelter for the Dead


A powerful but only situationally useful ritual, Shelter for the Dead can only be performed with the largest storms from the Underworld: The Great Maelstroms. No one knows how or when it was developed, but it was first used to protect the ghosts of Constantinople during the Great Maelstrom caused by the Black Death. The ritual is passed down by those few who know it to their students, hoping that it will never be necessary but knowing how valuable it can be if the worst happens. At the cost of risking an extreme storm battering the lands of the living, Shelter for the Dead creates a region, no more than the size of a modern city block, where the Maelstrom cannot enter. Rather, if the pieces of the Great Maelstrom do enter, they immediately are transformed into brutal storms, with extreme wind, hailstones the size of fists, and other strange things, regardless of the usual weather in the area. The ritual requires ten successes, almost always necessitating a group, and lasts for one day, plus one for each additional success beyond the minimal ten.]==] },
				["5. Smoldering Ruin"] = { en = [==[M20 Sorcerer, p. 35


5. Smoldering Ruin


The most common target of the Hellfire Path is an individual enemy. It’s directly offensive magic, and magicians know it and use it as such. Sometimes, targeting individuals and even groups is too small scale. Sometimes a magician really wants to just cut loose, and hedge magic doesn’t offer very many outlets to do so. Masters of Hellfire, however, developed this ritual in order to do just that: cut loose and cause damage to their enemies all at once. Smoldering Ruin requires a full three hours to cast, and in all its forms a Stamina roll (difficulty 6) must be made just to complete the exhausting ritual. Once completed, the magician spends 3 points of Willpower and must achieve at least 5 successes. Despite the difficulty, success is worth the effort: The ritual lights a building on fire, burning it to the ground. No mundane efforts can extinguish this fire, fueled by the caster’s desire for destruction, though supernatural means are capable of doing so. It can even burn buildings made out of normally fire-resistant and fireproof materials. Notably, the caster must perform the ritual while inside the building, and then hope they can escape before becoming trapped inside.]==] },
				["5. Steal Life"] = { en = [==[M20 Sorcerer, p. 40


5. Steal Life


One of the darkest arts of Necromancy, masters of the Path can steal the life energy from another living person. The caster first fills themself with death energy but doesn’t shape it directly into a spell. Instead, before it can absorb their own life force, they push it into their victim. This transfer takes with it the most recent five health levels of damage the caster currently suffers from. The caster heals those injuries. Most versions of this ritual involve carving sigils into the victim (or piercing them with electrical wires, or any number of other techniques) causing additional harm. Needless to say, very few survive this process, and those who do often hunt the necromancer until the end of their days.]==] },
				["5. Teleportal"] = { en = [==[M20 Sorcerer, p. 23


5. Teleportal


Masters of the Path of Conveyance can do more than simply transport themselves and others from place to place. They can create stable gateways between two locations. First, the magician must prepare both sites for the portal to be created. This takes three days of preparation at each site using trappings and materials appropriate to the caster’s Path Ability. Once the appropriate preparations are complete, the magician makes an extended roll, with one roll per hour. It requires at least one success per 10 miles between the portals. Each extra success adds five uses of the portal or a condition at one or both ends, such as a restriction on who can use it or making the portal one way. Creating this portal costs one permanent Willpower point, which is not refunded if the portal dissipates. Teleportal is a complex ritual, best accomplished with assistants.]==] },
				-- The twenty-six AFFILIATIONS of the Affiliation picker on the Numina tab (SPEC
				-- T929, I140i, I140m). Same reason the hedge rituals above are here and not in a
				-- module of their own: the picker hands mfOpen the 'Numina' kind, so descText
				-- already requires THIS module for them. Twenty come out of M20 Sorcerer chapter
				-- three, Lone Practitioner off the page before it, four out of Sorcerer's
				-- Companion chapter two and the Society of Leopold out of The Hunters Hunted II.
				-- Prose with no System block, like the rituals - all twenty-six are on V335c.
				["Balamo’ob"] = { en = [==[M20 Sorcerer, p. 81


Balamo’ob


Favored Attributes: Stamina, Wits

Favored Paths: Alchemy, Healing, Shapeshifting, Summoning, Binding, and Warding

Within the jungles of Mesoamerica, the warrior-priests of the Mayans, the Balamo’ob still watch over their people. They pass down teachings that were ancient at the height of the Mayan empire, bonding with their wayob, a familiar animal and spirit-guide, and in turn, guiding their people to protect them from the dark spirits that come up from Xibalba, the Otherworld, or simply, the Umbra. Vision trances take the Balamo’ob into Xibalba, where the first spirit they contact becomes their wayob. The Wakah-Chan, the World Tree, separates the earth and sky but also connects our world to Xibalba, venerated in symbols of effigies made of rope and wood. The magic sap of the World Tree is found in the sap of sacred trees within the mundane world, as well as various natural liquid secretions of the human body. Bloodletting itself is a sacred act, most especially when offering one’s own blood, and while a few drops of blood are enough to enable smaller magics, the most spectacular or urgent spells require much more. This greater bloodletting is done by piercing the body with coils of rope and dancing about, streaming blood through the air in sacrifice. The dance is part and parcel of the Balamo’ob art. In some festivals, Balamo’ob take on the guise of the wayob, wearing cloaks, pelts, or costumes to emulate them in reenactments of the creation of the world. Those talented enough assume the form of the patron as the festival ends, rushing off into the night, a physical representation of their wayob but also the World Tree, uniting flesh and spirit, the celestial and mundane.

The Balamo’ob come from the local population of Mesoamerica, particularly the Mayan people now spread across the region. Few from afar — archaeologists, anthropologists, or occult seekers — have been initiated into their mysteries. The Balamo’ob have had to keep their knowledge secret from oppression across the centuries. The teachings are passed orally in Mestizo, a dialect of Spanish and Mayan. While the language itself is not sacred, some things might be lost in translation. Along with language studies, the initiate must learn Mayan cosmology and symbology in order to grasp Balamo’ob magic. After learning these things, when the elder thinks them ready, the initiate takes their first vision trance. This trance allows the aspirant to travel into Xibalba in dream-form. The great Vision Serpent guides them through the final secret rites, when the Balamo’ob meets their wayob, an animal spirit in the form of jaguar, snake, eagle, or other, even mythical, animals. From this day forward, their study is their own. The Balamo’ob gains wisdom through experience, learning from other elders, and traveling into Xibalba with their wayob.

The shamans, itzamna, of the Balamo’ob do not take on any formal organization, but settle within personal territories throughout Mesoamerica, for the spirits prefer to stay in places they know best. Relationships between the shamans are always personal, founding alliances to handle problems, rivalries where conflicts develop. There is no politicking between them. As each shaman has their own beliefs and interpretations, it is not for one to judge another, so long as they are continuing with their work. This openness allows for some Balamo’ob to bond with spirits of darker varieties, which can lead the shaman into rage-fueled raids against outsiders, profiteers, and desecrators. Others are drawn into political revolutions or seek a resurgence of the Mayan empire.]==] },
				["Followers of Set"] = { en = [==[Sorcerer’s Companion, p. 14


Followers of Set


Initiation

The Followers of Set are well known to treat themselves more as a religious sect than a clan, and so will often take on converts from other clans, mortals, and even other supernatural beings, so long as they’re willing to accept and follow the teachings of Set. Sorcerers, being more powerful than most mortals, and even more prone to feeling like outsiders in an uncertain world, are thus just as likely, if not more so, than any other to find their way into one of the Cults making up the Followers of Set, and the Setites are more than happy to draw them in.

There’s a difference, of course, between a dupe and one who knows what’s behind the curtain, having been fully inducted into the Setites’ philosophy and made a part of the Clan. The former are plentiful, but the latter are much rarer, even among Sorcerers, although some of the former may be taking advantage of the other worshippers in the same way that the Setites themselves do, or are perhaps simply caught up in the whirlwind of vice and experience provided to them.

Either way, the Setite Kindred themselves are generally more than happy to make use of the unique talents of these magic users, putting their spells and rituals to use gathering the resources and secrets they seek to offer upon the indoctrinated masses. The Sorcerers, in turn, are apt to put their new allies to use, and indeed more than one Child of Osiris (common enemies of these Sorcerers, as described in Sorcerer Revised, pg. 34) has found that a rival Setite Sorcerer has a few undead allies willing to help him out.

Organization and Style

Those dabblers that pay lip service to Setite Cults rarely get very far, and rarely follow any recognizable patterns in their magic beyond generally following a mythic, religious sort of bent. Those that find themselves fully indoctrinated into the Setites, meanwhile, find their foci and style matching the teachings of their cult and of the Clan as a whole. While specifics can vary between Cults and even individuals, this usually means “blasphemous” shrines, blood, sacrifices, prayer to or symbols and representations of Set and/or his masks, desecration of symbols of Gods opposing Set, and of course, serpents, either representations thereof or actual physical specimens.

While “dabblers” may find themselves acting as ghouls to the Setites, it’s actually very rare for adopted initiates to be fed Vitae, or at least no more common than it would be for one Setite to attempt to Blood Bond another.

Paths

Fascination, Illusion (pg. 31) and Shapeshifting, with others depending on the Cult the Sorcerer is part of. With Storyteller permission, Sorcerers that have purchased the Setite Initiate merit (Lore of the Clans, pg. 67) may, instead of purchasing Setite Disciplines directly, mirror Setite Sorcery appropriate to their Cult's style of Sorcery (Akhu, Sadhana, etc) as Sorcery Paths, replacing Vitae costs with Willpower, but purchasing them as if one level higher than normal (so, the first dot of that Sorcery is useless, and the second dot provides the first dot of the Path).]==] },
				["Forn Jafnaðr"] = { en = [==[M20 Sorcerer, p. 85


Forn Jafnaðr


Favored Attributes: Dexterity, Wits

Favored Paths: Divination, Enchantment, Hellfire, and Summoning, Binding and Warding

Since ancient times, people in Scandinavia primarily, but not always, practiced feminine witchcraft derived from forn seiðr, or “ancient customs” of the Norse. They worship deities from either or both of the Æsir and Vanir families.

Of note is Freyja, the Vanir goddess of fertility, love, war, and magic who taught sorcery to the Æsir. Odin is also notable as the male head of the Æsir, associated with sorcery, war, wisdom, and the runic alphabet, among other things. Historically, practitioners were highly valued for their powers but suffered under stigma and persecution after the region’s Christianization.

Despite opposition, the practice never fully died out. Many hid under the guise of the dominant religion to secretly maintain their faith. Nowadays, it’s more acceptable to openly practice heathen religions and magic, but they still experience prejudicial backlash in some locales. Practitioners are nominally drawn to the Verbena when they involve themselves in Ascension War politics, though many covens are content to keep to themselves and their communities. Forn Jafnaðr is a new and rapidly growing Affiliation that chose neither of those options.

In recent decades, neonazi groups (under whatever names lend them enough plausible deniability for their intentions) appropriated symbolism and other aspects from forn seiðr to justify their bigotry. One of those groups, Asatru Futhark, was a group of Nazi losers who couldn’t bother to fact check, lazily naming themselves after followers of the Æsir and the name of the runic alphabet. Astatru Futhark was a group of criminals who believed themselves racially superior to others, and though they were a group of wannabe-sorcerers, completely failed to understand that the practice they stole from was historically primarily a women’s craft and would’ve had nothing to do with Asatru Futhark’s patriarchal bullshit. The Asatru Futhark caused destruction and death under the pretense of religious belief until a group of Aeon Order sorcerers put an end to them. This prompted local forn seiðr sorcerers to rise up in direct opposition to those who appropriate their beliefs to promote inexcusable hate crimes and rhetoric.

Remaining members of Asatru Futhark attempted to resurrect the defunct faction several times, each time definitively quashed by Forn Jafnaðr. Forn Jafnaðr has their hands full in their fight against Nordic-appropriating neonazi groups, but thankfully they’re not without allies and those ready to join them. While they make it a personal mission to destroy Nordic-appropriating neonazi groups, they also don’t turn down aid offered, especially from other sorcerers. Forn Jafnaðr is now a decentralized Affiliation consisting of multiple covens who all practice some variation of forn seiðr. They’re primarily based in Scandinavia, but they’re spreading into other areas of Europe as the sentiment gains traction. In 2019, they founded the first Forn Jafnaðr coven in the United States.

More experienced sorcerers typically mentor promising interested members of their faith one-on-one to learn their magical practice. The apprentice learns at their teacher’s side and aids their teacher and coven’s ritual work, providing an extra set of hands. Aptitude for magic is secondary to passion and devotion to the cause when choosing initiates. The philosophy is that magic can always be taught to those who wish to learn, but passion for their ideals is imperative.

To the extent Forn Jafnaðr involve themselves in Ascension War politics, they’re most likely to form temporary working relationships with the Disparate Alliance or the Verbena. Normally, they’re too busy with their main goal to bother with combating the Technocracy, but being mystics, they sometimes get dragged into the conflict anyway. Beyond directly and indirectly combating fascism, individual covens are free to act autonomously to best tailor responses to their local communities. Some covens strive to live off the grid as their ancestors did, but others welcome modern technology in their lives if not their magical practices. It’s far easier, after all, to organize with allies over the internet than with handwritten letters.]==] },
				["Giovanni"] = { en = [==[Sorcerer’s Companion, p. 15


Giovanni


Initiation

The Giovanni were once mortal Necromancers, many say, and in fact Necromancy (the “Blood Magic” version) itself was based on the precepts of ancient mortal sorcery. While knowledge of such magic is usually kept away from the mortal members of the various families within the Clan, some that are granted a peek behind the curtain find ways to mimic its powers regardless, whether through an approximation of the Blood Sorcery they’re witnessing, a glimpse into necromantic resources from ages past, or perhaps the help of the spiriti bound by the family, for those that inherently have a sensitivity to them.

Still, the Giovanni are rarely very trusting of mortal magicians, and more hesitant still about the living members of their own family taking on such powers, unless they’re someone they’ve already been eying as a protégé for one reason or another. Generally speaking, when the anziana catch wind of a Sorcerer in the family, there’s two possibilities: the Proxy Kiss if you’re seen as worthwhile, or ending up six feet under if you’re not.

Organization and Style

Even if they’re allowed to continue their practice, the best that a Sorcerer in the Giovanni can hope for is the aforementioned Blood Bond, becoming a ghoul to a perhaps powerful member of the Family, but a ghoul nonetheless. Mortals simply won’t be allowed to progress the ranks at all; as far as the family’s concerned, they’re little more than a very useful tool. At least, up until they start being considered for the Embrace.

Depending on the form of Necromancy that they're most familiar with, as well as the tradition of the exact branch of the family they come from, the tools and practice may vary. Some may use Vodoun practices, others might instead follow the trappings of High Ritual, and others that pieced things together themselves may need to rely on what many Mages might call “gutter magic”.

Regardless, all their spells and rituals will usually follow the same precepts as those of the Undead Necromancers; they must incorporate an aspect of the Magic User's authority over the dead (or the wider world), the imprisonment that is death itself (so the spirits and dead know their place), and an item identifying the target or effect (in the case of Wraiths, this usually means incorporating a Fetter). The instruments and foci that represent these vary like the practice itself, and may involve language and invocation, circles and symbols, representations of other worlds, depictions of death, actual elements of death (like corpses), emotional states, sacrifices, or offerings, among other possibilities.

Paths

Divination, Shadowcasting, and Summoning/Binding/Warding (Necromantic or Material). Many Necromancy rituals can be duplicated as rituals of one of the aforementioned Paths, with ST permission (For example, Puppet might be turned into a Summoning/Binding/Warding ritual at level 2).]==] },
				["Lone Practitioner"] = { en = [==[M20 Sorcerer, p. 79


Lone Practitioner


Though many hedge wizards learn their arts through the structure of an Affiliation, it is nearly as common for hedge wizards to come to the practice on their own, as myriad avenues of study can ultimately lead to hedge magic. Many who learn hedge magic on their own prefer to remain free of entanglements with other magicians. They might form temporary alliances, friendships, and romantic bonds with other magicians, but when it comes to gathering knowledge and power, the lone practitioner prefers self-reliance. Some lone practitioners do not join covens or Affiliations for the simple fact that they are not aware of them. Many hedge wizards throughout the centuries lived and died without ever meeting another practitioner.

Psychics are even more prone to lone practice. Many psychics don’t know that there are others with similar abilities out in the world. They simply try to survive and gain control of their own power lest they prove to be a danger to everyone in their vicinity. A large portion of psychics shun the use of their powers, manifesting phenomena only when instinct or survival require it. The idea of seeking out others like themselves and joining a team of their fellow freaks has minimal appeal to such psychics.]==] },
				["Maison Liban"] = { en = [==[M20 Sorcerer, p. 87


Maison Liban


Favored Attributes: Intelligence, Manipulation

Favored Paths: Fortune, Shadow, Summoning, Binding, and Warding, Quintessence Manipulation

During the 11th Century Hermetic Schism that resulted in the birth of the Tremere vampire Clan, Mathieu de Calice focused his learning on protection and counter-magic, intent on staying safe as the Order began to tear itself apart. Fleeing to safer territory in Northern France, de Calice and his apprentices laid low beneath their arcane obfuscation while the Tremere were busy with local vampires. Separated from the Order of Hermes, fearing for his life from his former mentor and the newly empowered vampire-mages, Magus de Calice worked to hide the Hermetic House. He renamed the group “Liban” in the Visigoth tongue, meaning “live, leave, survive.” Starting with just de Calice’s apprentices, then French and Spanish refugees, the group worked to maintain secrecy and an appearance of normalcy. It would take 250 years for the end of the Order of Hermes’ purge of House Tremere, by which time the Maison Liban had become their own society.

After the formative years of living in secrecy, all students of the Maison Liban are directed to maintain a double life to separate their magical practice from respectable normal lives. They are not to reveal their Art to anyone they know unless they deem the person responsible enough to learn the ways of the Maison Liban. This doesn’t prevent the Liban from using protective magics on loved ones and friends. There are no great acts, no show of power for the Maison Liban, as they continue their study beneath their mundane masque. Students learn as initiates to a master until they know enough to teach others, at which point they are also named a master, a pater or mater. The most venerated of Maison Liban, in deference to their founding, use the honorific, Pontifex.

The Maison Liban originated as a Hermetic House. They maintain the use of seals, rings, and circles in their magic. While Latin is used predominantly, it is combined with the Gothic language from the society’s time in hiding. This blending of the Hermetic origins with the need to hide among the Visigoths during the Order of Hermes’ purge has given the Maison Liban a unique style of magic that is not readily copied by other Hermetic societies.]==] },
				["Mogen HaLev"] = { en = [==[M20 Sorcerer, p. 87


Mogen HaLev


Favored Attributes: Intelligence, Perception

Favored Paths: Divination, Ephemera (Ghosts), and Summoning, Binding and Warding (Angels) Female Auxiliary Favored Paths: Fortune, Healing, and Weather Control

In some forms of Jewish mysticism, there’s a belief that there exist 36 righteous people in each generation. These people are dispersed and could come from any background, but without at least 36 of them living at any given time, the world would end. It’s only through these 36’s essential goodness that the world is spared from certain doom. Complicating the matter, the 36 are so humble that they wouldn’t know they were truly one of the 36 righteous, let alone tell anyone.

The Mogen HaLev, Hebrew for “Shield of the 36,” is a loose affiliation of Orthodox Jewish mystic covens with a singular purpose of finding and protecting these 36 righteous individuals. They’re a group of male scholars ranging in age from 45 to nearly 100, though they allow initiates to start study as young as age 40. They believe to study the required magic before maturity invites disaster. Most members are in their 60’s. The oldest of the Mogen HaLev, called the Baal Shem Tov (“Master of the Good Name”), is recognized as a sort of leader throughout the Affiliation, though mostly in the sense of seeking guidance and making tie-breaking decisions. Once an initiate begins study, it’s an intensive process involving not only magic itself, but also philosophy and mundane skills of networking with useful individuals such as doctors and social workers. More frequently in recent years, Mogen HaLev work with sister covens of female Jewish mystics who use different skill sets and Paths to achieve their common goal. Though not official members of the faction, these sister covens focus on practical magics for protecting the 36, rather than the divination and spirit matters the men of Mogen HaLev specialize in.

The main coven (though they wouldn’t call themselves this) of Mogen HaLev meets in a brownstone in Brooklyn, New York City alongside a yeshiva. They maintain an occult and religious library large enough to loan texts to the Affiliation’s other covens as needed. They primarily focus on divination and protection magic, though also learn to speak with spirits for information gathering. All members strictly follow Orthodox Jewish traditions including dietary restrictions, beard and hair grooming, wearing a kippah, as well as charitable work and donations in addition to work within Mogen HaLev. Each coven cultivates connections to aid identifying and protecting the 36, ranging from homeless shelters to medical professionals.

The Mogen HaLev’s group motives begin and end at finding and protecting the 36. They have no time for any of this Ascension War nonsense except when it threatens one of the 36. They aren’t known for keeping lasting grudges and would prefer to keep to themselves and their purpose. They’re similarly unlikely to form even temporary alliances with other magical factions unless in an effort to protect the 36. If one of those they protect is in danger, they’ll go to great lengths to resolve that threat. The notable exception to avoiding magical grudges is with groups like Nebuu-Afef and other groups that explicitly attempt genocide on Jewish populations. The Mogen HaLev won’t hesitate to defend themselves and their communities if one of those groups comes to town.]==] },
				["Nebuu-Afef, The Order of The Golden Fly"] = { en = [==[M20 Sorcerer, p. 88


Nebuu-Afef, The Order of The Golden Fly


Favored Attributes: Strength, Stamina

Favored Paths: Conjuration, Hellfire, Shadowcasting, Shapeshifting

After the Exodus of the Israelites from Egypt in the days of Ramses the Great, the Nebuu-Afef was forged in the fires of hate, rage, and sorrow. After the loss of their firstborn children and suffering from plagues visited upon them for Egypt’s enslavement of the Hebrew people, a group of decorated Egyptian soldiers began their quest for revenge upon the fleeing refugees. Awarded a medal in the shape of a golden fly as a badge of honor, these warriors were already skilled with magic, but they desired more to focus their rage into destructive force. Naming themselves after this mark of distinction, the Order of the Golden Fly spent years in research and accumulation of resources. Their devotion finally bore fruit with the discovery of the secret names of the angel of death who had wrought the plagues upon Egypt — the very angel who had taken their firstborn children from them — and the means to summon and control that angel. Through profane ritual, the mystics summoned forth this angel, Mastema, and bound it to their control, demanding further knowledge and charms to bring plague or rain fire. The Order wanted these tools to punish the Israelites.

What the Order had not grasped in their hubris is that Mastema was never bound to them; it was neither contained, nor controlled. Mastema had fallen, corrupted by its destruction of Egypt, discovering a lust for the death and fear it had wrought across the country. As the Order demanded power from the angel, Mastema fed them only the darkest and most destructive magics. For all the Order thought it was in control, Mastema only gave them what it desired, feeding their anger and hate into destructive purpose. The original members of Nebuu-Afef never accomplished their designs against the Israelites, but the Order was founded and continued to plague Egypt for centuries to come. In the Coptic period, Pharoah Ikhnaton drove the small group from Egypt. The Order moved from region to region, kept small due to sharing power of one ‘bound’ angel to serve them all.

It was in Austria in World War II that the Order rose from obscurity to seek the carnage of their initial purpose. They reached out to members of the Nazi party, offering their assistance to the already occult-minded Hitler. This turned out to be the Order’s undoing, as shortly after this contact was made, the Order’s meeting house exploded, destroying most of their records and killing the sect’s senior members. The apprentice of the Order’s priest and a few initiates fled, escaping in the chaos.

The remnants of the Order now exist spread across the globe in small cells, connected by internet communications. Those who remain are utterly under Mastema’s control, though the captive creature still masquerades as a subservient tutor. The angel deftly guides the Order into recruiting those like the original founders — strong, fast, and tactically gifted warriors. Soldiers, police, nightclub bouncers, and sufficiently cautious serial killers are pursued and recruited to the Order’s ranks. Mastema teaches new students death, hate, and fear; the Order teaches their recruits that authority comes from power. A novice is tortured and humiliated, broken down and built back up into a killer.

Playing the Nebuu-Afef

The Nebuu-Afef are an antagonist Order and aren’t intended to be player characters. They are ‘sorcerers’ in name only, duped into believing they control an angel. If players are interested in playing villains such as these, have a discussion with the group as to the purpose of playing them. Is this an attempt to depict reform, rehabilitation, and reparation of those lost to their hate and anger, or just an attempt to be edgy? This should be a serious discussion for everyone at your table. If everyone is onboard, consult Book of the Fallen for further guidance on tools and cautions for incorporating pure evil into your game.

To mechanically depict the Nebuu-Afef’s reliance and the unreliable nature of Mastema’s help, the Storyteller should roll all Summoning, Binding, and Warding Path rolls in secret, and even if the roll is successful, Mastema has only been contacted but may not appear.

While the Order was founded by mystics who had developed rituals and practices of their own before summoning Mastema, the current Order’s magic relies on the angel’s teachings. Every student is taught binding spells intended to call and control Mastema, but these spells are useless against the angel. If the angel deigns to teach a Path to a student, it will be one focused on destruction and suffering. It teaches nothing of Binding or Command, for it will never reveal that every member of the Order is a plaything and tool for the angel.]==] },
				["Thal’hun"] = { en = [==[M20 Sorcerer, p. 92


Thal’hun


Favored Attributes: Intelligence, Wits

Favored Paths: Conjuration, Fortune, Hellfire, Quintessence Manipulation

The Thal’hun profess that the idea of magic as put forth by sorcerers is ridiculous, but a grain of truth hides amidst all the bluster and superstition. The Thal’hun are an order of scientists, engineers, and metaphysicians who have found the truth: All “magic” merely consists of tapping into the greatest power of the cosmos, called thal. Thal is the science of harmonics, and a Thal’hun is an engineer of these harmonics. The order claims that they were taught by an ancient race of aliens from the stars, the Hui:xa.

As the Thal’hun explain it, the Hui:xa had thousands of years of culture to develop sciences beyond human understanding, but thal is the crown jewel of their discoveries. It requires supreme intellect and will to harness this power and not harm those around the Thal’hun. While some of the Hui:xa had mastered the thal, there were other sciences they had yet to fully grasp, and a biological disaster led to the destruction of their homeworld, threatening to bring about their extinction. To prevent the total loss of their people, their most learned priest-scientists phased a portion of their great city, Zoraster, into another plane beyond time and space. 300 of the Hui:xa were selected to be Jeva, or Lightbearers, transformed into creatures of pure energy and sent to find a new home for what remains of their people.

A Jeva named Khuvon came to our world when Mesopotamia was on the rise. Intrigued by humanity, he assumed a mortal form and lived among the people for a time, but there was a limit to what he could do. Occasionally, he would rise and teach the arts of thal, creating a new generation of Thal’hun. These early lessons were not of science for that idea was beyond human understanding in those days, so thal was taught couched in the stories and myths of the time. Finally in 1961, as humanity first reached beyond the Earth, Khuvon began to teach again. This time to scientists, not mystics and philosophers. No myths and legends, but pure science of Thal. He spent 5 years with his 7 students, teaching them all he could, and then sent them among humanity to teach in his stead. Satisfied that Earth would be a new home to the Hui:xa, he sent the call out into space, calling to the other Jeva, calling them to him to return Zoraster to this plane. Now Khuvon rests in the core of the Earth, the Thal’hun instruct the next generation, and they wait for the arrival of the Jeva who have been spread across the stars for thousands of years.

New initiates of the Thal’hun come from across several fringe societies, scientifically minded questioners of the status quo, those who delve into pseudoscience, New Age crystal healers, UFO watchers, or ‘genius inventor’ types. The more mystically inclined, occultists, and philosophers are simply too ingrained into their beliefs to consider the truth of thal. These new initiates spend years learning to write and pronounce Luz’at characters, proper mediation, and the history of Khuvon’s activity on Earth before their mind is ready to properly understand the language itself. After this, the new initiate begins to use diadems, metal and crystal devices like rods, staves, tripods, and other antennae to amplify their harmonics and mental attunement to manipulate thal itself by ‘setting a resonance’ with those specific sounds. They assist others in constructing diadems and in their experiments with Thal and study Hui:xa culture, lore, astronomy, and the poems and histories left behind by Khuvon for his human “children.”

Finally, the recruit rests in a sensory deprivation tank for up to a week, starting with silence and then graduating to a series of frequencies generated by elder scientists to open the initiate’s mind. Within a trance state, the initiate meets Khuvon in his spirit form, who initiates and accepts the new disciple. After another hour of silence to come to grips with their experience, the initiate emerges as a new Thal’hun.]==] },
				["The Ancient Order of The Aeon Rites"] = { en = [==[M20 Sorcerer, p. 80


The Ancient Order of The Aeon Rites


Favored Attributes: Intelligence, Wits

Favored Paths: Conjuration, Divination, Enchantment, Summon, Binding, and Warding

Within the sacred tabernacles of the Ancient Order of the Aeon Rites, sorcerers study the journals and teachings of Master Johannes Agrippa, who founded the Order in 1873. Based upon even older works, millennia old and from cultures and societies around the globe, the Secret Watchers of the Order had secreted away scraps of Truth within the framework of all occult and mysticism for when humanity would be ready for that Truth. Master Agrippa’s visions from the Secret Watchers and his study of these ancient cultures led to the formation of the Aeon Rites, written in Enochian, the language of the angels. The sorcerers of the Ancient Order work their magic through careful study and precise rituals, couched in symbolism and correspondence that may be familiar to magicians of any other Practice. With ceremonial robes, prescribed motions, and calculated placement of meticulously crafted implements, sorcerers of the AOAR take a hermetic approach to magic, requiring study and execution over more emotional practices.

The Order’s masters act as benevolent teachers, seeing other societies as potential recruits who merely need to be set on the proper path to enlightenment. It is the Order’s belief that all sorcerers should use their abilities to guide humanity into a new golden era of prosperity. This might come across as self-aggrandizing if the AOAR did not match words with deeds, aiding other magicians in their search for enlightenment, founding charitable organizations, and doing other good works. The Order dedicates the first three grades of initiation to these mundane duties. The self-centered and selfish aren’t allowed to progress into the inner circles of the Order. Within the next circle, another 3 grades of the Order oversee the broader work of the society, developing political connections, maintaining their significant coffers, and training the newly initiated, all while pursuing greater truths and mastery of Paths of magic. The final 3 grades of the Order are those who truly devote themselves to study of the Aeon Rites, delving into the most esoteric mysteries.

It is said that in death, those of the AOAR who have proven themselves worthy are accepted by the Secret Watchers into their ranks. These Secret Watchers guide and advise the Order but are rarely seen. Master Agrippa has appeared in ghostly form to provide guidance to initiates and magisters alike, though such manifestations are rare. Rumor abounds that the Order is merely a tool of Master Agrippa, who still lives and pulls the strings of the Order from afar. Most members of the Order dismiss such speculation, as there seems to be no purpose for such deception. As a new generation of magisters begins to take their place within the upper ranks of the Order, they’ve begun to question this final step. Is an afterlife of continuing their work within the spiritual realm a reality, or is it a merely a ploy to prevent fully trained magisters from creating their own factions?]==] },
				["The Arcanum"] = { en = [==[M20 Sorcerer, p. 80


The Arcanum


Favored Attributes: Intelligence, Wits

Favored Paths: Alchemy, Conveyance, Enchantment, Summoning, Binding, and Warding

The Arcanum was born of the occult heyday of the late 1800s, when Victorian high society paid lip service to ritual and esoterica. Frustrated with the Hermetic Order of the Rising Day, a new society was born not to walk through the motions, but to seek knowledge and truth. Regardless of culture and source, the Arcanum investigates superstition, myth, pseudoscience, and strange occurrences. The Arcanum believe there is another world that borders our own, a place where the stories told by the ancients are real. Through study of the tales and legends of these ancients, they believe they can find the kernel of truth from which these stories grow. They do not judge this knowledge; they ascribe no morality to the supernatural, serving only as librarians and observers. While the Arcanum is voracious for knowledge and will use other contacts to help gather it, they jealously guard their secrets. The Arcanum only reveals information to outsiders under direction from the Executive Committee.

The Arcanum operates on a series of tiers, starting with the academic community at large, where the Arcanum also does its recruiting. Within those circles, the Arcanum is known simply as a scholarly society, supporting investigations into fringe research. The Arcanum is active in many publications, including traditional media like books and journals. Recently, they’ve begun vetting and supporting the works of individuals and groups across the internet who investigate and report through newer media like videos or podcasts. Arcanum membership is not secret, and they are often approached directly by curious academics about joining the Fellowship. The first tier of the Arcanum are these Associates, the junior scholars, researchers, or other investigators who work with the Arcanum but are not actually held to the rules nor granted the privileges of a full member. The Associates that begin to ask questions of the Arcanum, looking into the purpose of the society and who begin to seek enlightenment beyond just their personal focus, are invited in as Neophytes. These Neophytes study under a mentor, often an Elder Sibling who allows them access to the Arcanum’s literature and resources, as necessary. Neophytes are the “children” of the Arcanum, there to learn and study, but they do not contribute to the greater conversation of the society. With examination and ritual, a Neophyte graduates to a be a full member of the Arcanum, an Arcanist, sometimes referred to as a Brother, Sister, or Sibling. While not a rank above the others, those members who have demonstrated themselves to be knowledgeable and wise are given the honorific of “Elder,” though this has no relevance to age or seniority within the Arcanum.

In terms of organization, the Arcanum society reports to the Executive Committee at the Foundation House, under direction of the Grand Chancellor. The Foundation House itself is an enormous estate and boasts the “Axis Mundi,” which they claim is the most thorough library of all things arcane and supernatural. Chapter Houses around the globe coordinate and support local Arcanists. Each Chapter House has the freedom to organize itself as necessary for the membership’s purposes, taking on roles beneath the local Chancellor such as Financial Officer, Chief Librarian, or Sergeant-at-arms. These Chapter Houses can provide lodging for Arcanists, either on the premises or nearby. They also serve as secure locations that an Arcanist can retreat to in the event of trouble that might turn up during investigations. Within the Chapter Houses, the members are also connected as a “lodge” of several Arcanists, often a graduated class of Neophytes, that work together to help pursue their varied interests, bringing experts of different fields to work on a single problem. These interests are supported by a College, helping to organize research of different fields like the College of Thaumatology, the Hermetic Studies Programme, and the School of Mythoarchaelogy.]==] },
				["The Children of Osiris"] = { en = [==[M20 Sorcerer, p. 82


The Children of Osiris


Favored Attributes: Intelligence, Wits

Favored Paths: Ephemera, Healing, Herbalism, and Oneiromancy

In ancient Egypt, long before the pyramids stood, before Pharaoh Narmer united the upper and lower kingdoms, there lived a wise and studious mortal king from western Egypt called Osiris. Osiris had a jealous younger brother named Set, who wanted to rule at any cost. After a dramatic but ultimately failed attempted murder, Osiris’ wife, Isis, saved him with her magic. Set became enraged at Isis thwarting him and searched for more cunning ways to counter her power. He found exactly the edge he sought when he was embraced as a vampire.

Emboldened by his new power, Set demanded Osiris hand him the throne. When Osiris refused, Set frenzied and shredded his brother into 14 pieces. Set scattered the pieces across the land to prevent Isis from reviving him.

This wasn’t enough to stop the determined sorceress from gathering the pieces of her husband’s corpse. After gathering as many fragments as she could, all the magic Isis and Osiris’ coven wielded miraculously brought Osiris back, but imperfectly. He was weak. His skin was irreparably damaged from time spent decomposing. It took the coven’s continuous efforts merely to keep Osiris alive.

Distraught, Isis couldn’t bear to see her husband dead or in constant agony. She frantically searched for a better solution and happened across a mysterious figure who promised to restore her husband. She was too desperate to discuss what the process would entail, or what the cost would be, and agreed. The mysterious figure embraced Osiris as a vampire.

Osiris slaughtered his closest friend in the coven immediately after the embrace. When he realized he’d not only killed his dear friend but consumed his blood in a hunger frenzy, he was horrified. Overcome with grief, he blamed Isis and vowed to find a way to banish his monstrous impulses. The coven fractured in two: those who sympathized with Osiris and those who thought him an irredeemable monster. Those sympathetic few were the first mortal Children of Osiris.

The Affiliation grew, joined by vampires who likewise sought freedom from their Beasts and sorcerers seeking to reconcile life and death to become immortal without the flaws of vampirism. At first, the sorcerer and vampire Children were treated as equals. However, after Set finally killed Osiris, the vampires in the faction took control. The sorcerers became servants to their vampiric masters, though the undead Children supposedly followed Osiris’ command that they never embrace their sorcerer counterparts. Some time ago, the vampire Children disappeared, leaving the sorcerers to their own devices.

The Children of Osiris are small but slowly growing due to increased worldwide interest in ancient Egyptian lore and the recent uncovering of some of Osiris’ tombs. They’re mostly congregated in Egypt and surrounding areas, but those who aren’t based in Egypt make a point to visit as often as feasible. They organize into hidden temples designed after tombs. Children of Osiris are led by the most experienced member of any gender, whether or not they’re the oldest. Initiation takes years to complete and consists of solemn rituals modeled after ancient Egyptian funerary practices followed by guided study of ancient languages and magical texts.

They typically practice healthy living, with simple diets and regular exercise encouraged. All Children regardless of gender keep their heads shaved, though many wear wigs outside their temples. This is as much a ritual practice as a health-conscious one — when the Children of Osiris was in its infancy, the only way to reliably prevent lice and potentially deadly resulting skin infections was to shave one’s head.

The Children still venerate Osiris as a god, claiming he isn’t gone forever but took his rightful place as king of the underworld. Most devote their time to meticulous study of their Paths. Some find time to maintain a one-sided rivalry with the more powerful Cult of Isis, though that generally isn’t encouraged and is considered a distraction from the truth in their studies. The progeny of Set have largely left Osiris’ mortal followers alone since the vampire Children’s disappearance, but if his descendants found a sorcerer Children of Osiris temple, things would get ugly fast.]==] },
				["The Cult of Isis"] = { en = [==[M20 Sorcerer, p. 83


The Cult of Isis


Favored Attributes: Charisma, Manipulation

Favored Paths: Divination, Fascination, Fortune, Healing

The Cult of Isis is a fractured and disparate lot, far flung in time and space from their origins in Egypt at the feet of the goddess of healing, Isis. Branches of the Cult have ranged from peaceful magicians seeking to nurture humanity to sorcerers of nature that blessed both field and womb. After the destruction of the mother-goddess, her son, Horus, took control of the Cult to fight against the murderer, Set, and his cursed children. By the time of Cleopatra, the Cult had fallen into disgrace, a broken shell of their former glory, but as Rome conquered Egypt, the Cult joined with the worship of other goddesses, and Isis’ name was spoken alongside those of Juno, Ceres, and Vesta. Fertility cults spread across the region in her name, and more mystery cults diluted the Cult into a myriad of sects and branches, some with radically different beliefs and purposes.

In modern times, the Cult’s influence can be seen in the teachings of Traditions like the Ecstatics and Verbena, or as corrupted kindred who now follow the teachings of Set, but there is a new Cult of Isis that has blossomed in the wake of the Arab Spring of 2010. Led by a magician who calls herself Semet, this branch of the Cult is dedicated to a new era of healing and peace. This started as a small sect’s attempt to care for the relics and hidden wonders of the past, amid unrest and heartache. The priestess Semet organized the Cult as street medics, nurses, caregivers, and mediators. The Cult takes no points of leadership and no stance in politics, merely caring for the wounded or those caught in the middle, while hoping to keep any conflict from escalating beyond repair. The symbols of Isis’ horned-moondisc or her widespread wings are placed as guideposts for refuge and safety. This sect of the Cult has not forgone the mystic teachings of Isis. Amidst a social media organization of amateur medics, the Cult works their magic, tending to the worst wounds that they promise “are not as bad as they appear.” Behind closed doors, the modern priesthood of Isis performs rituals to bless the hands of the workers, and sacred amulets are enchanted for protection of their members.

While Semet’s branch of the Cult grows and spreads across the region, other Cults have continued in more traditional fashions. Cults of fertility that are tied to sensuality and sex draw on natural drives of humanity — ecstatic experiences that bring one closer to the goddess and power their magic. Egyptian hieroglyphics, Demotic chanting, and precise geomantic architecture empower rituals that have been passed down for more than seven millennia. These Cults have grown and travelled far, first from Egypt to Rome, then across the Roman Empire, and now to every corner of the globe with dozens of faces for the goddess. Secretive sects that work social manipulation and control, caring sororities that revere all sacred goddesses, or some of the few who still support Horus, Isis’ immortal son, in his quest for vengeance, all revere the goddess’ name and count themselves as a Cult of Isis.]==] },
				["The Cult of Mercury"] = { en = [==[M20 Sorcerer, p. 83


The Cult of Mercury


Favored Attributes: Charisma, Stamina

Favored Paths: Conjuration, Conveyance, Divination, Fortune for the Roman temple. Replace one with a Path applicable to the local temple’s interpretation of Mercury at Storyteller discretion.

The Cult of Mercury was founded in ancient Rome among many similar cults devoted to specific deities in the local and nearby pantheons. Their first temple was in the Circus Maximus, near a horse racing track and popular merchant site, a fitting location for a god of financial fortune and quick travel.

Local merchants, and later even senators, flocked to the cult to aide their lofty aspirations of power. Despite attracting populations that might otherwise be prone to cutthroat ambitions, the Cult of Mercury requires immense teamwork. The cult exclusively performs ritual magic, organizing up to hundreds of followers in intricate cooperative practice to create their effects. The sheer number of sorcerers performing rituals together require several layers of leadership to organize all the moving parts. During rituals, all sorcerers wear clean white robes, tunics, togas, or other more regionally appropriate white clothing in temples outside Rome. Rituals include incense, coordinated movement, burning candles, holding objects associated with the ritual’s intent, and the entire gathering chanting in Latin and ancient Greek.

Devotees of a god of travel, members of the Cult of Mercury without local political aspirations traveled and formed new congregations as a way to quickly gain rank in the cult. As the Cult of Mercury spread to other regions through both Roman conquests and merchant trade, the cultists likened Mercury to the local deities, claiming these other deities to simply be different aspects and understandings of Mercury. Accordingly, temples may focus on Paths more applicable to their local interpretation of Mercury, such as Shapeshifting for the aspect Mercurius Artaios, a god of bears and hunting in south-eastern France. Practices are similarly localized with ritual elements traditional to the first congregants of the region.

The Cult of Mercury suffered a major blow to leadership and member retention when Constantine converted the Roman Empire to Christianity. Many who joined for favorable luck figured they wouldn’t be testing fate as much to join the new majority and state-sponsored religion rather than stick with what they knew. Those temples that continued to practice hid their religion by masquerading as Christian churches. The effects of this shift linger into the modern day with leadership positions in the Cult of Mercury sharing names with Catholic church ranks.

The Cult of Mercury seeks to capitalize on the recent surge in popularity of ancient religions. Without sufficient converts, entire temples fail when older members die off and the numbers no longer sustain the elaborate ritual work. The cult prefers the ambitious and adventurous, but in the end the leadership isn’t picky so long as there are enough underlings for rituals to function. Parents are encouraged to bring their children into the cult when they’re old enough to perform simple ancillary ritual tasks — and keep secrets in areas where the practice is stigmatized.

The Cult of Mercury can perform amazing feats when in full force, but they’re limited to ritual magic with no fewer than 50 participants. While a cultist can’t use spells cast on the fly, it’s customary for temples to prepare rituals ahead of time that skilled members can finish casting in an emergency. Cult of Mercury characters may learn 2 additional free rituals for every dot in a Path. Herding a large congregation isn’t an easy feat and requires leadership with strong social Attributes. Charisma is typically the favored Attribute for cultists with leadership roles or aspirations, while the average cultist in a congregation may instead favor Stamina for the patience and dedication of being a cog in massive rituals.]==] },
				["The Dozen Priests of the Pythian Order"] = { en = [==[M20 Sorcerer, p. 84


The Dozen Priests of the Pythian Order


Favored Attributes: Charisma, Intelligence

Favored Paths: Divination, Healing, Shapeshifting, Weather Control

The Pythian Order itself once crossed the Hellenic and Greek world. Its members were experts of divination who passed on the words of the gods and found their magic within the rhythm and rhyme of poetry. Not merely a form of art, but an expression of numerology, Pythian practice tied music, astrology, and mathematics together, resonating with the music of the spheres. They strove to find just the right poetic meter to encapsulate this magic, binding it to texts to store this power. A delicate and fussy magic, it was rare to master. The number of priests of the Pythian Order diminished over time. When science and learning declined in Europe, the Pythian Order had already fallen from grace. Their numbers dwindled to those few who had extended their lifespan beyond the natural limits of humanity.

By the time of the Renaissance and renewed interest in the classics, the Dozen Priests of the Pythian Order that still lived were sought out. The few Pythian texts that had found their way to the scholars of the age were a marvel, and the Pythian Order gained a handful of new converts. In the Romantic period, further interest swelled, especially among the poets of that time. These artists found the meaning in their poetry grew to new heights when inspired by the esoteric lore of the Pythians. However, surges of popularity have never revitalized the Pythian Order beyond the few ancient scholars that remain, even as new magicians dedicate themselves to the craft.

What remains of the Order — the Dozen Priests are now reduced to four — dwells in a temple on Milos, an island off the coast of Greece. There, the sacred verses are preserved, and the Priests have begun to question whether to fight the inevitable erosion of time and let the Pythian Order finally fall or to seek out new, worthy, and dedicated students to pass on their knowledge. It is not merely a question of their knowledge being lost, for their poetry is stored, and other Pythian works are in archives and museums. There’s more to consider, for the remaining priests have amassed immense power through centuries of study. To let it die with them seems an affront to the gods they once spoke for. They work now to that end, divining the future and their own end of days, to see if students will arrive to learn from them or if they continue clinging to their tradition out of futile stubbornness.]==] },
				["The Fenian"] = { en = [==[M20 Sorcerer, p. 85


The Fenian


Favored Attributes: Manipulation, Appearance

Favored Paths: Fascination, Shapeshifting, Weather Control

Many sorcerers who share ancestry with the Celts claim to have fae blood and power in their lineage. Most of the time, it’s either patently false or too far back to matter. The Fenian are different. They’re an unbroken family of fae-blooded shapeshifters who can, if one believes them, trace their lineage all the way back to the Tuatha Dé Danann. Their mastery of shifting to animal forms is further evidence of this claim.

In the family’s early days, they were a group of half-fae adventurers who found more adventure than they bargained for. The spark of exploration hit them, and they left their human connections behind to find the truth of their lineage. On learning about their connection to the fae, some left their humanity behind entirely to join the Dreaming. The others made deals with the Tuatha Dé Danann to learn how to control the magic in their blood. They adopted animal forms according to their personalities: The warriors commonly shifted to bears or large felines while the free-spirited tricksters became foxes or corvids. All Fenian learned to influence mortal opinions, and a few gained true mastery over the weather. The family isn’t a normal family of sorcerers so much as a family of innately magical beings. The magical contracts, or geasa, were tailored to each Fenian based on tradition and personal tendencies. One Fenian who greatly enjoys the pleasures of life might be forbidden from eating certain types of food, while a Fenian who bucks authority might be obligated to always accept guidance — even if the guidance is harmful. A Fenian can enter into a geas for powers when learning a new Path or ritual that may also apply to their descendants.

These days, the Fenian are on the brink of extinction. Some speculate their fae blood is growing too thin; others suspect someone broke geasa with the Tuatha Dé Danann. There’s still hope; a young child in the family named Niamh developed the ability to speak to animals after an entire generation lacked any magical aptitude or predilection. There are only several dozen Fenian sorcerers alive and active currently.

Given their magical heritage, Fenian treat all Fenian favored paths as their Affinity Paths but learn all other hedge magic at a higher cost. They pay 10 xp to learn a new non-Fenian Path, new rating x8 to increase a non-Fenian Path, and rating x2 for non-Fenian rituals. Any Fenian under the effect of broken geasa receives an additional experience penalty for all hedge magic, increasing the rating multiplier by 1, and +1 difficulty to all hedge magic and psychic phenomena. It’s therefore more difficult for entire generations to learn and use hedge magic than the average person if they break geasa. This is the only known extant sorcerer bloodline more likely to go through a Changeling Chrysalis than Awaken as a Mage.]==] },
				["The Nephite Priesthood"] = { en = [==[M20 Sorcerer, p. 89


The Nephite Priesthood


Favored Attributes: Stamina, Wits

Favored Paths: Divination, Enchantment, Hellfire, Summoning, Binding, and Warding, and Weather Control

The Nephite Priesthood, also known as “The Dust Prophets,” is an exclusive Affiliation of mystics in The Church of Jesus Christ of Latter-day Saints. They believe that Joseph Smith didn’t publicly reveal the secrets of a priest named Nephi, who God taught through dreams how to perform miracles. Nephi kept a group of disciples to pass on the divine knowledge and serve his people. Nephi and his disciples were killed in the battle of Cumorah and the knowledge destroyed for over a millennia. In 1849, Nephi revealed himself as a celestial being to a pious desert settler named Uriah Spence, so Uriah could restore the Priesthood and protect the Church from an oppressive government and other hostile outsiders. They also prepare for a coming final showdown when the apocalypse comes. All Dust Prophets swear oaths of secrecy. They aren’t allowed to let members of the Church know of their miraculous abilities.

To join the Priesthood, one must be a man in good standing within the Church. Most Nephite Priests were born into the Church, but converts aren’t unheard of. If a man isn’t a Latter-Day Saint, he must first convert to the Church and study for at least several years before a Nephite priest will approach him. They believe that any that strayed from a strict code of conduct would quickly be corrupted by the power and risk damnation. The initiation rites are performed in secret temples. The initiate, known as a Deacon, first fasts for three days. At sunrise on the fourth day, he enters the temple, undresses, and is anointed by oil. He spends the morning in prayer. At noon, the Deacon clothes himself in a pure white robe. A Priest attends at the altar, separated from the Deacon by a veil, and prays with the initiate. As the ceremony concludes, the Deacon is “reborn” into the celestial kingdom, parting the veil and approaching the altar for a final prayer.

After the ritual, the Deacon spends two years studying Nephite miracles and history, including the sacred names of the original Nephite Priests to call on to invoke the miracles. To progress to priesthood and beyond, the Dust Prophet undergoes increasingly longer and more solemn rituals. Priests may operate under their own discretion in the absence of Elders, and after ordination must spend at least two years wandering outside the desert, typically to Central and South America, to spread the faith and learn of the outside world. Elders are older and more experienced priests, typically spending at least a decade wandering and learning after ordination. The High Priest-Prophet is the highest ranking elder, selected by popular vote from the Elders. Most Nephite Priests make an annual journey, wandering for 40 days and 40 nights in the wilderness stretching from Utah to South America, traveling as far away from civilization as possible.

On January 4, 2000, the 104th anniversary of Utah’s statehood, the entire Nephite Priesthood gathered in Salt Lake City for an unknown purpose. What remains of the reports conflict wildly, but one thing is certain — an event of apocalyptic proportions occurred. Only one Nephite Elder, Porter Larsen, remained to pass on the knowledge and rebuild the faction. Some whisper that a mass ritual went horrifically wrong, others speculate the rapture occurred, taking all but one Elder and leaving the rest of the world to its doom. No one openly takes credit for whatever happened, and Elder Larsen hasn’t added to the discussion. His mission is to rebuild the Priesthood, he says, not to waste time concerning himself with what he can’t change. He’s not been seen publicly much since then, and the new Nephite Priesthood hasn’t brought attention to themselves.

The possibility of an outside attack isn’t far-fetched. The Nephite Priesthood had many enemies. US intelligence agencies accrued massive files on the organization, attributing anti-government actions (deserved and undeserved) to them; accordingly, Project Twilight kept tabs on the Priesthood. The Nephite Priesthood believes their powers are divine gifts and considered all other mystical sorcerers devil-worshipers. At best, the Dust Prophets shunned them, even when trespassing on others’ land during the priests’ journeys. They considered friendly interactions with other mystical societies potentially treasonous. Some remain hopeful that the Affiliation, if and when they reemerge, won’t be as contentious as it was under previous leadership.]==] },
				["The Seven Thunders"] = { en = [==[M20 Sorcerer, p. 90


The Seven Thunders


Favored Attributes: Charisma, Manipulation

Favored Paths: Divination, Fortune, Healing, Hellfire

Armageddon was due at the turn of the millennium, but the years have continued to accumulate, and the Seven Thunders, the prophets of this apocalypse, have found that their army of believers have fallen out of faith. The True Faith of the seven prophets has not wavered in the decades that have passed. They continue their mission, albeit changed and adjusted as they realize that their mortal understanding of divine visions was flawed. The Seven Thunders have spread across the globe, supported by their few remaining faithful followers, as they work to bring judgement upon the wicked. The Seven Thunders no longer watch the clock, waiting for a specific date for Armageddon to arrive. They believe that it will come at the appointed time and not before. It may be that Armageddon will not arrive until they have fully prepared the earth for it.

With this new outlook on their mission, the Seven Thunders seek out the unholy, the false gods, and the misled. They’ll bring low the high and mighty; bring them into the light of their faith. If necessary, they will destroy them. They are Judgement on Earth, and while the prophets bring the sword of faith against the greatest of threats, their followers seek whatever foes they can find. The Thunders preach the end of the world, showing signs of their faith, healing the sick, and casting out foul spirits. Meanwhile, they command ordinary people armed with rosaries and rifles to combat vampires, werewolves, and mystics.

As time has passed, the Seven Thunders find that they are not in complete accord. While they believe they have the same mission, the path they walk has changed. Now physically separated to cover more territory and hasten the coming of Armageddon, the Seven Thunders’ methods and focuses have diversified based on what each prophet finds most important. The prophets are not dedicated to specific territories but travel across the continents as their visions lead them , reaching out to local support networks for their missions. This means that some supporters find themselves going from shepherd of their local community to suddenly hunting lycanthropes in the woods within the space of a week. This continual shift of priorities and leadership has driven some followers away, but those who remain are dedicated to the cause, at the risk of their relationships and lives.]==] },
				["The Silver Portal"] = { en = [==[M20 Sorcerer, p. 90


The Silver Portal


Favored Attributes: Charisma, Perception

Favored Paths: Ephemera (Umbrood), Fascination, Oneiromancy, Shadows

The mind is a powerful thing. When we sleep, even the uninitiated can taste potential in the untamed dream worlds. Chaos is only potential waiting to be tapped. The Silver Portal is unique in this understanding of magical ability among sorcerer Affiliations. Their sacred text is an eldritch work that’s been telephoned across centuries, languages, multiple massive revisions, and cultures into something wholly alien from the 5th century (or even older, as it claims) Persian scroll called Zolondrodere it derives from. It teaches that every possible thought and idea exists drifting in Maya, the Dream Realms, waiting for someone with the power to pluck it from this subliminal realm and bring it into reality.

The secrets of the Zolondrodere defy rational thought, even by mystic standards. The sound mind often rejects the tome’s teachings, so Silver Portal initiates must often begin their study through hypnosis, indulging in mind-altering substances, and ritual sensory and sleep-deprivation. Once the sorcerer begins to feel they understand, they enter a dream-like trance, often in front of a mirror inscribed with mystical symbols thought to promote openness. Once they cross the silver portal into Maya, they encounter strange Umbrood and disorienting, potent imagery — fantastical and horrifying in equal measure. There, they find power to bring into the waking world.

Awakened scholars have likened the Silver Portal’s practices to the chaotic nature of the Marauders, which is a rather horrifying thought to most. The sorcerers allow the dream realms to bestow magic upon them that bleeds into the waking world. For a Silver Portal sorcerer, dream and reality aren’t two distinct concepts and have a lot of overlap. They’re the most flexible of all sorcerers, able to bend the rules of linear magic with their practices without getting slapped by Reality for it.

The Silver Portal sorcerer keeps track of the total number of dots spent in Paths and rituals at all times. Whenever the sorcerer enters the Dream Realm on purpose though a trance, the sorcerer’s player may redistribute these dots among Paths and rituals as they wish, even to Paths the sorcerer doesn’t yet know. For each intended Path, the sorcerer rolls their Favored Attribute plus either Meditation at difficulty 6 or Lucid Dreaming at difficulty 5. The number of successes is the number of dots the sorcerer may possess in that Path, up to the number of dots allotted. All allocated points not gained with successes are inaccessible until the effect ends. The sorcerer travels through the Dream Realm to find these powers and rituals, and the storyteller is encouraged to make use of surreal dream imagery for the journey. They may use these temporary powers in the Dream Realm and waking reality until they have restful sleep. The sorcerer must have restful sleep before they may enter a trance to redistribute Path points again. As the sorcerer doesn’t learn paths directly through normal means, they must redistribute dots into a Path or ritual first and spend the Experience to make it one of their baseline powers.

There is no formal hierarchy in the Silver Portal, given the nature of the sorcerers themselves. New members earn initiation by fascinating a Silver Portal sorcerer as much in the dull waking world as by their dreams.]==] },
				["The Society of Enlightened Altruistic Ideologies (SEAI)"] = { en = [==[M20 Sorcerer, p. 91


The Society of Enlightened Altruistic Ideologies (SEAI)


Favored Attributes: Intelligence, Manipulation

Favored Paths: Alchemy, Conjuration, Conveyance, Enchantment

The Enlightened members of the Technocratic Union are some of the greatest opponents of sorcerers around the world, whether they acknowledge the fact that their inner Genius is an Awakened Avatar or not. However, not all members of the Technocracy are Enlightened, and the Society of Enlightened Altruistic Ideologies (SEAI, pronounced sea-ah, for short) work to address the concerns of un-Enlightened associates, ensuring that their needs are met. The SEAI has a bit of a social club feel, with gossip-filled gatherings over coffee and cake, but the topics of discussion are more esoteric and profound compared to the average coffee klatch. Because the SEAI straddles the worlds of Enlightened Science and mundane society, they acquire knowledge of so much beyond their reach. They see the power of sorcerers and mages but are forced to live dull and drab lives. They feel increasing resentment for the Reality Deviants who have tapped into the cosmic energies of the universe, only to squander them; after all, the extraordinary citizens of the SEAI are far more deserving of these powers.

Between pushing papers, fetching coffee, and reporting statistics, the SEAI have overheard things, tracked events, calculated expenditures, and taken careful notes, with a single idea in mind: capture a Tradition mage, mindwipe them, and take their Avatar for themselves. The Progenitors of the Technocracy are already working on the mindwipe technology, so by combining this tech with some spells of the SEAI’s own devising, they have begun to make strides toward their goal. The idea of Nephandic Avatars is ignored as merely propaganda or a fairy tale and has not been truly considered by SEAI. Enlightened operatives who scoff or mock the SEAI may find that they join the Reality Deviants on the list of those that should have their Avatar removed and given to the more worthy, hard-working members of the SEAI. While they have yet to capture a mage alive, the discussions of how to proceed have been made in earnest, and they are ready to strike as soon as the opportunity arises. Occasionally, word of these plans and developments reach the Enlightened members of the Technocratic Union, causing a bit of a concern as members of the SEAI group themselves in accordance with which Tradition they would join, were they Awakened. When these rumors are reported to upper management, SEAI members who have been loose-lipped or been witnessed deviating from protocol are usually taken in for reconditioning.

Sorcerers of all stripes might encounter the Society as the SEAI uses spells to guard their work and experiment with other uses in pursuit of the taking a Tradition mage captive. Some of the SEAI toe the line of information gathering and go ‘undercover’ within sorcerous groups to glean knowledge or discover when a mage might be vulnerable. These citizens risk being caught by the Technocratic Union or the societies they infiltrate, walking a knife’s edge to take power from the undeserving. Other SEAI lose ‘perspective’ and slip from the Technocracy when they get a taste of magic through ritual and study, often when they begin to recognize that the hyperscience they’ve studied seems so similar to Hermetic formulae.]==] },
				["The Society of Leopold"] = { en = [==[The Hunters Hunted II, p. 117


The Society of Leopold


And the angel spoke unto me, in a strong voice, crying, “Many are the children of the Dragon, the Serpent, the great Satan, and they are among you now. I tell you, Servants of Christ, that the Parousia is near, that the Second Coming cometh soon. Stronger still grow the children of the Dragon, and they multiply, and they are a wound unto the earth. And we are the balm for this wound, we must cleanse it with fire, and purify it, and then the earth shall be ready for the Parousia, and we shall be judged worthy.”

— Leopold of Murnau, The Testament of Leopold

Call them candles in the dark. Call them wounded angels. Call them sadistic zealots. But do not call them apathetic. Before science lit its night light to make men brave, these sheep dared to defy the predator lords. They are not antiquated crusaders cloistered in monasteries. Tonight, they wield blade and gun in seedy alleys painted with monster blood and the flickering glow of a neon cross. They recruit and coordinate attacks over the Internet. They blast digital choir music through earbuds to drown out the poisonous words of the demons they exorcise. These are the stories of the modern Inquisition. There are no mortals the Children of Caine fear more.

Theme and Mood

The theme of the Inquisition is the modern crusader. All the world is their Holy Land. When an Inquisitor looks down the most mundane street, she cannot help but see the secret war. There is no going back. The stakes cannot be any higher. The Enemy is the Devil himself, and the souls of all humankind hang in the balance. In the direst moments, the Inquisitor knows this is not even the true war. When the world cracks and Hell breaks loose across the earth, then the real battle will begin. And the Inquisition will be ready.

The mood of the Inquisition is faith and doubt. A bladed pendulum swings between the two. Apocalyptic frenzy makes the blade shiver. What gets cut? What bleeds? Can a witch-hunter do the terrible things required and still maintain the faith? Ecstatic passion and drive, and the wonderful and terrible things they can enable us to do, are at the heart of the faithful hunter’s tale.]==] },
				["The Star Council"] = { en = [==[M20 Sorcerer, p. 92


The Star Council


Favored Attributes: Perception, Intelligence

Favored Paths: Most modern Star Council are psychics, but some know Enchantment, Healing, Shadow, and Quintessence Manipulation

In July, 1947, news of a possible extraterrestrial crash in Roswell, New Mexico swept the nation. People from all walks of life were enamored with and inspired by the possibility of life beyond Earth. The Star Council originally formed as a handful of like-minded UFO enthusiasts and paranormal researchers. Though they came from different backgrounds, ranging from eccentric professors to delinquent teens, they found community and readily shared their theories and findings about space, extraterrestrials, and related conspiracies among the group.

The Star Council welcomed another smaller group, the Thal’hun, to their ranks in the late 1960s. The Thal’hun were more insular than the rest of the Star Council and largely remained a faction of their own, though they participated in sharing their beliefs and findings. They were the first to introduce the Star Council to proof of the supernatural and gained credibility when supposed extraterrestrial technology they stole from the US Government worked just as they predicted.

As decades passed, the Star Council did their best to remain a low priority to the government. Their efforts were often complicated by actions of the Thal’hun faction, and the Star Council had to rely on younger tech-savvy members and discredited lawyers in their ranks to stay under the radar. The Thal’hun’s diverging goals and rigorous study practices became festering points of contention.

Unbeknownst to the group, the non-Thal’hun Star Council was mostly comprised of psychics by the late 1990s. These members typically believe that they’re either victims of extraterrestrial experimentation or they’re actual descendants of extraterrestrials. They believe genetic differences, natural or otherwise, caused their supernatural powers, while the Thal’hun insisted they could never reach their full potential without Thal’hun education.

When the Thal’hun left law enforcement breathing down the group’s necks after an experiment gone terribly wrong in 2002, the Star Council finally ejected them. The associated explosive argument left soured feelings on both sides, and it took the entire Star Council’s efforts to clean up the mess of both the botched experiment and the resulting conflict. Since then, the Star Council went back to their roots as wide-eyed explorers with the entire universe to discover. The Star Council maintains their practices of individualized study and group presentation and discussion. Some use “alien science” derived from Thal’hun practices, but they also accept other adjacent paradigms of hyperscience and technomagic. The Star Council won’t officially support actions to expose government secrets on extraterrestrials, but they often search where they aren’t supposed to. They usually try to be subtle, but if something goes wrong, a fellow member is always quick to help provide cover. Recently, a couple daring young members inspired a swarm of people to storm Area 51 via a viral meme. It didn’t turn out as useful for gathering secret information as they hoped, but the Star Council initiated several new members following the event.

Initiation is an important social convention in the Star Council. The initiate must meet with the members to establish social chemistry and present an informal thesis of their beliefs on the extraterrestrial and the future of the universe to the rest of the Star Council. If the Star Council feels the initiate is ready and a good fit, they throw a party celebrating the new addition to collective knowledge and creativity. The modern Star Council learned from their mistakes with the Thal’hun and want to be sure new initiates contribute without veering the Affiliation’s mission off on a wildly different path.

The Star Council of today is a generation-spanning band of oft written-off weirdos. Many of them face or have faced difficulties with exclusion from society, so they built their own. They’re quick to help each other when needed, and members who fall on hard times are typically welcome to stay at the small house the Star council owns for group social events.

Not all of them started off as UFO-enthusiasts. Some only got interested in the phenomenon after they found community that accepted them in the Star Council. One of the side effects of the Star Council’s philosophy on extraterrestrials is that no matter how bad the world around them gets, they firmly believe that humanity as a whole can get better. They believe there’s something about the little blue dot of a planet called Earth that’s worth crossing galaxies to find. Their prevailing hope, though devastatingly naive at times, is often their greatest strength.]==] },
				["U.S. Government (Project Twilight)"] = { en = [==[M20 Sorcerer, p. 93


U.S. Government (Project Twilight)


Favored Attributes: Dexterity, Wits

Favored Paths: Most are psychics, but hedge magicians commonly learn Divination, Fortune, and Hellfire

There aren’t any U.S. intelligence subdivisions, even classified ones, officially known as “Project Twilight” — that’s just the nickname that stuck. “Project Twilight” includes paraintelligence departments from multiple agencies, such as the Department of Defense, the National Security Agency (NSA), the Central Intelligence Agency (CIA), the FBI Special Affairs Department, and even secret projects within the Center for Disease Control and Department of the Interior. The nickname comes from agents darkly joking that going on a mission was like living in the “Twilight Zone,” though the nickname brings different connotations to younger agents.

All projects that fall under the moniker of Project Twilight are funded through a lump sum called “black book” expenses that Congress authorizes for classified intelligence operations. As such, most individuals, even in some of the highest levels of government, remain unaware of the project’s existence. The agencies would rather things stay that way, since rooting out meddlesome supernatural interference in the government and keeping it secret from the public are the agents’ jobs. All agents have appalling levels of discretion for their duties. Not one would ever be brought up on charges for what would normally be considered gross abuses of power, if it’s justified by stopping vampires and werewolves from running rampant, or preserving “national security” as any official documents code it. Even if an agent’s superior felt the agent crossed a line, or several, the agent would simply be terminated, never to be heard from again. This is doubly true for the hedge magicians and psychics working for the government.

Not all agents in Project Twilight are sorcerers, but many field agents are. It’s much easier to fight rowdy supernaturals with a wider variety of tools at the government’s disposal. And that’s how many Project Twilight sorcerers are viewed: disposable. Agents are sent to deal with everything from Sabbat strikes to egotistical mages on a power trip (which is to say, most of them). At the very least, the pay is better than most other ways a sorcerer can make a legal, if not honest, living.

Many of the higher ups answer to different masters entirely. The Camarilla, Technocracy, Pentex, and others all have their fingers in the paraintelligence divisions to suit their own goals, which often align with keeping the public unaware of the supernatural. Conversely, agents can never get too good at rooting out the supernatural in their own organizations; the supernaturals involved in the agencies won’t let them. Though many agents can be exactingly effective in the field, the inherent conflicts of interest at play in the upper levels work to keep agents focused on matters outside their agency, not their superiors.

Psychics are of particular interest to the government for several reasons. They tend to have much higher-than-average Willpower, and their abilities tend to function without the need for lengthy rituals or specialized equipment. Additionally, they tend to be easier for the non-sorcerers to accept as legitimate because of the massive amounts of media that portray psychics working in the three letter agencies. Because of Technocratic influence in US government and culture, the hedge magicians in the paraintelligence projects are overwhelmingly technosorcerers.

Sorcerers who aren’t affiliated with the Technocracy aren’t likely to trust sorcerers involved in Project Twilight, if their employer (even just the mundane one) is known. Even other Project Twilight sorcerers don’t tend to trust each other, given the sheer frequency with which they end up spying on one another. The government has a long and bloody history oppressing groups from minority ethnicities, religions, and other identities — which make up most sorcerer covens. Historically, magic’s been an outlet for oppressed groups to right wrongs and protect themselves when systems failed them or were never designed to protect them in the first place.]==] },
				["Uzoma"] = { en = [==[M20 Sorcerer, p. 95


Uzoma


Favored Attributes: Charisma, Wits

Favored Paths: Alchemy, Healing, Summoning, Binding, and Warding, Quintessence Manipulation

Originating in the Yoruba regions of Africa, the Uzoma are the gatekeepers of the spiritual world, interceding between the orisha, the gods of all creation, and humanity. For years they served as priests and sorcerers, called babalawos, within the holy city-state of Ife, but as other civilizations oppressed and enslaved their people, the Uzoma began to lose influence. The Uzoma gain power from the Orisha, the Orisha gain power from believers, and as their people were taken into slavery their belief faltered. Wherever their people were taken, the Uzoma were taken with them. In the New World, this faith merged with other beliefs, creating new religions: Candomblé, Vodoun, Macumba, and others. The Uzoma faith continued though, hidden alongside these new faiths, both in their homeland and in Africa. As time has passed, the burden of colonization has lessened somewhat, and the old ways have resurfaced among the African diasporas.

The Uzoma organize in “family” groups called ile, taking a hands-off approach as they watch over their people and territory. After hundreds of years of outside influence, the Uzoma allow for no interference with their people. When the Uzoma step in, there is no holding back, and they strike with no reservations. So long as their world remains at peace, the Uzoma are content to watch and remain in the background. They see their task as being gateways for the spirits, not as magicians. The true sorcerers are the Nhanga, who serve other orisha of darker origins. Uzoma dedicate themselves to others and their people while the Nhanga put themselves above others. Often foreign sorcerers and magicians are labelled as Nhanga as well, due to the Uzoma’s past experiences with them.

Each orisha is unique, and there are over 400 of them, though the Uzoma do not necessarily always agree on the names and roles of each of them. Each orisha has a number, color, food, and dance that is specific to them; knowing these characteristics is necessary for properly communicating with them and winning them over. Each individual has a guiding orisha who influences their personality and behavior, villages take on a patron orisha, and Uzoma select specific orisha they serve.

The magic that the Uzoma perform takes place through religious ritual, beginning with praising and thanking Olorun, the Owner of Heaven. The priests then appeal to specific orishas, asking for their magical assistance in return for the Uzoma’s past service and to empower them for further service in the future. The rituals revolve around dancing, drumming, and singing as ways to reach out to the orisha. Different forms of drumming and dance are tied to certain rituals, and they are never performed outside of these rituals. The performance is given to call to the orisha and invite them to join with the Uzoma’s community; the whole ritual is magical rite, religious service, and celebration all together. As the rite ends, the priest is “mounted” by the orisha, who speaks through the priest as a type of possession, though sometimes the orisha chooses not to speak and merely joins with the babalawo for a time.

The start of an Uzoma’s initiation begins with a reading of the Ifa, a collection of patakis (sayings, myths and stories) that are consulted with a shell divination. The elders discern the initiate’s personal guiding orisha, which helps determine which ile they belong with. The initiate is gifted their elekes, necklaces blessed by the ile babalawo and which signify their house. This begins a year of service as a ‘child.’ They dress in white, follow a strict diet, and cannot be touched during their time of service. Days are spent learning the patakis from the priests of the house and learning to cast the Ifa. After their year of service to the ile, the ‘child’ becomes a babalawo and begins their service to their people and the orisha. While all initiates go to the Yoruban homelands of Nigeria, Benin, and Togo, to begin their apprenticeship, many have returned home to the Americas and Europe, continuing the return of the old ways in new places.]==] },
				-- <<< DESC_END
};
