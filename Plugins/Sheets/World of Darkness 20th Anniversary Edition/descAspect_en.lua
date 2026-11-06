-- Hedge Path Aspects, the en half (SPEC I244f, V585, V210, V345 / T1426).
--
-- One entry per Aspect a Hedge Path offers in its Aspects window (HEDGE_ASPECTS, root form).
-- The 11 general Aspects of M20 Sorcerer p.13-14 sit under their bare name; under
-- '<Path>|<name>' sit the 23 a Path brings of its own and the 11 general ones a Path CHANGES,
-- whose body is the Path's sentence before the general ladder. descText tries '<Path>|<name>'
-- first and the bare name second (SPEC I244f(2)(3)), so one Aspect name can mean two things.
--
-- Its own module and not keys in descNumina: V32 holds every descNumina key to a picker item.
-- Three blocks separated by two blank lines (SPEC I21): source, name, body. The book title and
-- the name in block 2 do not translate; only p./pag. does. LF only (SPEC V345).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).
-- BUILT in T1426: the Path texts are cut by line from descNumina_<lang>.lua and the rest comes
-- from research/hedge_aspects.json (the pt of those is the translation made for T1426).

return {
				-- >>> ASPECT_DESC_BEGIN (generated - SPEC T1426)
				["Area"] = {
					en = [==[M20 Sorcerer, p. 13


Area


• 1-foot radius
•• 3-foot radius
••• 6-foot radius
•••• 12-foot radius
••••• 25-foot radius]==],
				},
				["Damage/Healing"] = {
					en = [==[M20 Sorcerer, p. 13


Damage/Healing


For each level of this Aspect, up to two dice of lethal damage can be healed or caused. An additional two successes spent on this Aspect converts the damage healed or caused to aggravated.]==],
				},
				["Distance"] = {
					en = [==[M20 Sorcerer, p. 13


Distance


These ranges are guidelines for populated regions. For less populated ones, the numbers may be doubled or even tripled. Distance is used for travel, movement, and remote effects. For effects emanating directly from the hedge wizard, such as combat spells, use Range instead.
• Only a few feet
•• Up to around 20 feet
••• Up to 100 feet
•••• Up to half a mile
••••• Up to five miles]==],
				},
				["Duration"] = {
					en = [==[M20 Sorcerer, p. 13


Duration


• A few minutes
•• One scene
••• A day or two
•••• A couple of weeks
••••• Several months]==],
				},
				["Number of Targets"] = {
					en = [==[M20 Sorcerer, p. 13


Number of Targets


• A single target
•• Two targets
••• Up to 10
•••• Up to 50
••••• Hundreds]==],
				},
				["Metaphysical Weight"] = {
					en = [==[M20 Sorcerer, p. 13


Metaphysical Weight


• Simple creatures such as small, unintelligent animals, most minor Gafflings and the smallest beings in the hosts of a heaven or hell
•• Larger creatures such as bears or wolves, more powerful Gafflings, ghosts that have begun to learn to navigate their existence but have no experience
••• Humans and truly intelligent beings, like most Jagglings, ghosts who can navigate the underworld effectively, minor angels, servitor demons, and notable elementals
•••• Enhanced humans like ghouls, kinfolk, and other sorcerers, as well as powerful Jagglings, Umbrood Preceptors, and infernal tempters
••••• Powerful beings such as the truly supernatural (vampires, werewolves, mages, fae, etc.), Incarnae, the barons of hell and the generals of the heavenly host]==],
				},
				["Passengers"] = {
					en = [==[M20 Sorcerer, p. 13


Passengers


• Yourself, but no clothing or equipment
•• Yourself, your clothing, and a small amount of stuff
••• Yourself and one extra person or equivalent weight in stuff
•••• Two passengers
••••• Three passengers]==],
				},
				["Range"] = {
					en = [==[M20 Sorcerer, p. 13


Range


• Touch only (requires a successful Brawl attack if the target is unwilling)
•• Less than 10 feet
••• Less than 25 feet
•••• About 50 feet
••••• Within 150 feet]==],
				},
				["Sympathetic Connection"] = {
					en = [==[M20 Sorcerer, p. 14


Sympathetic Connection


• Direct physical contact
•• True Name
••• Body part, including blood, nail clippings, etc.
•••• Prized possession
••••• Any possession]==],
				},
				["Travel Speed"] = {
					en = [==[M20 Sorcerer, p. 14


Travel Speed


• About three times faster than foot
•• Roughly driving speed
••• Driving without speed limits or red lights
•••• Miles are covered in seconds
••••• Instantaneous travel]==],
				},
				["Weight"] = {
					en = [==[M20 Sorcerer, p. 14


Weight


• Less than an ounce
•• A few pounds
••• Up to 100 pounds
•••• Up to 1000 pounds
••••• Large objects such as cars or elephants can be moved]==],
				},
				["Divination|Time Period"] = {
					en = [==[M20 Sorcerer, p. 24


Time Period


• one day

•• one week

••• one month

•••• one year

••••• 10 years]==],
				},
				["Divination|Accuracy"] = {
					en = [==[M20 Sorcerer, p. 25


Accuracy


• Visions and signs are incredibly vague and difficult to interpret with any certainty

•• Typically accurate but deeply buried in symbolism

••• Accurate but vague and open to misinterpretation

•••• The truth’s there under layers of symbolism, but not terribly difficult to interpret

••••• Accurate and often easy to understand, though still subject to human error]==],
				},
				["Divination|Query"] = {
					en = [==[M20 Sorcerer, p. 25


Query


• A simple question that could be answered yes or no if you were talking to a person rather than stars or entrails

•• A specific question that can be answered with a short and simple explanation. For example, “Which road ahead is safest?” but not “What’s our enemy’s plan?”

••• The question could be researched and answered with public source knowledge if only you had the hours to put in.

•••• The question may be detailed and require hidden information, but the information could be uncovered given enough time and know-how.

••••• A very detailed query that would normally require lost, destroyed, or deliberately hidden information to answer.]==],
				},
				["Ephemera|Spiritual Reach"] = {
					en = [==[M20 Sorcerer, p. 25


Spiritual Reach


• The magician can sense spirits and get their attention but can do little else.

•• The magician is restricted to calling upon a general type of spirit

••• Now specific spirits can be called through tailor-made rituals, and almost always show up unless the magician has offended them in some way.

•••• Spirits begin to approach the magician unprompted. The magician can see into the Penumbra, which increases the numbers and types of spirit they can interact with. The magician can also fight back against spirits if they need to, though most try to avoid it.

••••• The magician can now go to the spirits instead of needing them to come to the physical world. Though physical travel into the Umbra is still impossible, the magician can astrally project there, using Wits for Dexterity, Manipulation for Strength, Intelligence as Stamina, and Willpower as Health Levels. They are connected to their body by a silver thread, and if they run out of Willpower, it snaps, severing their connection and leaving them stranded.]==],
				},
				["Fascination|Allure"] = {
					en = [==[M20 Sorcerer, p. 29


Allure


• Add 1 die to social die pools
•• Add 2 dice to social die pools
••• Add 3 dice to social die pools
•••• Add 4 dice to social die pools
••••• Add 5 dice to social die pools]==],
				},
				["Fascination|Willbending"] = {
					en = [==[M20 Sorcerer, p. 29


Willbending


• Intriguing: You draw attention even in a crowd, and individuals find you interesting in one-on-one conversation. You may make mild suggestions that align with the target’s personality and situation such as getting another drunk if they are at a bar.
•• Alluring: Almost everyone at the gathering knows you were there, and individuals will try to find a way to see you again. You may make strong suggestions that align with the target’s personality and situation, such as heading home with the hedge wizard after a fun night.
••• Beguiling: Everyone assumes that you had a hand in setting up the party, and individuals around you will vie for your attention. You may make suggestions that don’t necessarily align with the target’s personality and situation, such as suggesting they break up with their long-term partner to give the caster of the spell a one-off chance.
•••• Entrancing: Invitations or not, the party is held for you by everyone’s estimation. Individuals no longer just want your attention, they crave your approval, possibly making fools of themselves in the process. You may make strong suggestions that don’t align with the target’s personality or interests, such as suggesting that the target fight another to defend the magician’s honor.
••••• Enthralling: If you started throwing things, this place would become a full-scale riot; those present find themselves hard-pressed to resist your requests, doing almost anything you might request. Hell, they may even kill for you or put their life on the line for you if you ask the right way. You may make strong suggestions that wildly defy the target’s character and circumstances, such as suggesting that the spell’s victim burns down a bar for daring to announce last call.]==],
				},
				["Fortune|Severity"] = {
					en = [==[M20 Sorcerer, p. 31


Severity


• A minor blessing or curse, generally something simple, such as a Freudian slip or managing to just barely catch a bus the target needs.
•• A lasting but non-permanent inconvenience, injury, or small benefit. Sprains, non-life-threatening illness, and broken objects are standard bad luck, whereas good luck might be as simple as avoiding the flu for a season, a minor combat advantage, or the resolution of a minor obstacle.
••• A major setback or bonus. Temporary but grave illnesses and serious social faux pas are the most common curses, while finding helpful bureaucrats, success with gambling or relationships, or an additional die to combat pools are the most common blessings.
•••• Now the blessings and curses can have serious and permanent effects. Debilitating injuries, bankruptcy, a social tragedy that leaves the target a pariah, winning the lottery, surviving almost certain death, or just a chance encounter that changes the target’s social standing are all possible.
••••• Curses at this level almost always result in a painful and unusual death. Targets get decapitated, suffer incurable wasting illnesses, experience horrific car accidents, and more. Blessings are similarly dramatic, such as being rescued from state execution by a call from the governor. Other last-minute saves from certain death are possible, but also victories far rarer than one in a million: An enemy in combat may trip and break their neck, the beneficiary might find a lost tome in a used bookstore bargain bin, or they could win political office with no name recognition.]==],
				},
				["Hellfire|Special Effects"] = {
					en = [==[M20 Sorcerer, p. 34


Special Effects


• Decay: Instead of damaging living targets, the spell breaks down anything they are wearing or carrying. For each point of damage it would inflict, it can turn three pounds of material to junk.
• Dust Storm: The spell summons a storm of dust, scouring the area (which must have at least three dots) and, in addition to damage, causing blindness in the area for one turn per health level inflicted.
• Sleet: A stream of ice and freezing water causes brief blindness and leaves the ground slippery. This cannot be made aggravated.
• Smoke: The caster emits a cloud of poisonous smoke that envelops the area (which must be at least three dots in the Area Aspect). Everyone within the cloud takes one level of damage per turn unless protected. A normal gas mask provides two turns of protection before becoming useless. Beings that do not need to breathe are immune to this damage. Vision, even if enhanced, is completely obscured while in the cloud.
•• Earthquake: the spell causes the ground to split open and engulf, then crush, the target. They can roll Strength at difficulty 6 to try to dig free. They need as many successes as health levels of damage they suffered. This cannot be made aggravated.
•• Lightning: Instead of fire, the spell fires a bolt of electricity. Anyone in contact with the target through a conductive material takes the same damage as the target.
•• Tanglewood: Plants flail and attack the target, throwing thorns, splinters, and other bits of wood at it. With extreme luck (at least three successes beyond the spell’s requirement) this can stake a vampire, but a magician who counts on it will likely be badly disappointed. If the target is standing in dense undergrowth, they are captured by the plants. A creature restrained in this fashion cannot move until they accumulate as many successes on a Strength roll (difficulty 7) as damage dealt by the spell. This cannot be made aggravated.
•••• Drowning Tide: This requires an Olympic sized swimming pool or larger body of water. The target is pulled underwater by a sudden wave or undertow, causing them to start drowning (see M20 page 440-441). Escape from the water requires an extended Strength roll, difficulty 8, with at least two successes necessary, often more. This only does drowning damage.

The Special Effects above must be purchased with Freebie or Experience Points at a cost of the dot rating + 1.]==],
				},
				["Illusion|Senses"] = {
					en = [==[M20 Sorcerer, p. 35


Senses


• Affects one sense
•• Affects two senses
••• Affects three senses
•••• Affects four senses
••••• Full sensory range]==],
				},
				["Illusion|Realism"] = {
					en = [==[M20 Sorcerer, p. 35


Realism


• Completely immobile and fixed; if visual, flat
•• Changes with perspective so the viewer moving doesn’t disrupt it immediately
••• Illusions can have moving parts, but only large ones
•••• Smaller motions and variations are possible, but there are still subtle tells
••••• Fully immersive, this level completely fools all targeted senses]==],
				},
				["Maelstroms|Intensity"] = {
					en = [==[M20 Sorcerer, p. 38


Intensity


• Drawing a breeze and fog from the underworld into the world of the living pacifies the local Shadowlands. Ghosts in the area are calmed. They’ll defend themselves, but otherwise they won’t attack anyone in the area for the duration without succeeding on a Willpower roll (difficulty 6).
•• A rainstorm is summoned, and it drains so much energy from the underworld that ghosts are frozen in place unless they make a Willpower roll (difficulty 7). They’re made just corporeal enough that the magician can physically move them. Usually, they remove the ghosts from an area where they are unwelcome.
••• Calling a full-scale thunderstorm does even more to quiet the Shadowlands. This drains the power of Oblivion from the area. Ghosts are sedated as in the first rank, but those under control of their Shadows are restored to reason. Results vary with spectres, but legends exist of hedge magicians with this Path pulling a spectre away from Oblivion.
•••• Powerful storms in the world of the living, with gale-force winds, hail, and plenty of property damage can truly sap the power of Oblivion in the Shadowlands. Spectres and other deeply malicious ghosts who fail a Willpower roll (difficulty 8) disappear within the barrage of wind and hail. No hedge magician knows for sure what happens to these spirits, but they are never seen in the location where the power was evoked for a year and a day.
••••• A massive storm draining all energy from the corresponding region of the Shadowlands. Both the area and its reflection in the Shadowlands becomes utterly uninhabitable for ghosts. The Restless Dead must flee the area, or else suffer five dice of damage per round until they do so.]==],
				},
				["Necromancy|Ghost Binding"] = {
					en = [==[M20 Sorcerer, p. 39


Ghost Binding


• The caster can see, hear, and speak to ghosts in their vicinity, whichever side of the Shroud they are on.
•• The magician can now terrify the restless dead. Filling themself with the necrotic energy of the Shadowlands, the dead can see them as alive but infused with the power of death. This results in a –2 difficulty on all Intimidation and Subterfuge rolls against the dead.
••• The caster forces a ghost to take on a corporeal form, whether they could do so on their own or not. For the duration, the ghost is for all intents and purposes a living person again, including the usual seven Health levels. If killed, however, they don’t simply return to being a ghost. Instead, the experience transforms the ghost into a spectre, a ghost consumed by and subservient to the powers of Oblivion. And this spectre has a grudge against the caster.
•••• Any ghost can be summoned to the caster at this level. All the magician needs is the ghost’s True Name and to win a contested Willpower roll. If the necromancer is successful, the ghost must then immediately arrive. Keep in mind that most dead people do not become ghosts, and most ghosts do not appreciate being summoned.
••••• Masters of Necromancy can compel obedience from the dead. In addition to the Path roll, they must win a contested Willpower roll. If they do so, they can demand the ghost perform one simple task or answer one simple question to the best of their ability. For tasks, the Duration Aspect covers how long the ghost must attempt to accomplish it.]==],
				},
				["Necronics|Impedance"] = {
					en = [==[M20 Sorcerer, p. 41


Impedance


• The magician floods the local underworld with electrical energy, shutting down all active ghostly powers. Ghosts may ignore this, continuing as they were, if they succeed on a Willpower roll (difficulty 8).
•• At this level, instead of merely stopping a haunting, the magician can increase the Shroud rating. This costs one success per rank increased, with the first rank included in the base cost of the spell (so in addition to the regular requirements, 2 successes are needed to increase the Shroud from 6 to 9).
••• Places can be defended from haunting by the simple technique of tricking the ghost into haunting somewhere else. At this rank, the magician can create a trap, a fake realm the ghost can haunt instead of the real location. A ghost can realize they’ve been tricked with a Wits + Enigmas roll (difficulty 8) and can escape with another one.
•••• At this level, the magician may directly use their bioelectricity as an attack against a ghost. When using this rank of Necronics, the Area and Duration Aspects are replaced by Damage and Range.
••••• Masters of this Path are capable of devastating a region of the Shadowlands and its inhabitants. They call it “creating a zero,” and they “format” the space to a default pattern. When successful, there’s nothing left. For the duration of the spell, the region becomes uninhabitable to ghosts, causing the Restless Dead to lose Corpus at a rate of 3 per turn until they can escape the area. If they fail to escape before running out of Corpus levels, they disappear. Magicians generally believe these ghosts have been destroyed completely, rather than the usual consequences of running out of Corpus. As no Necronics expert has ever seen one that survived being “zeroed out,” this seems to be the best guess.]==],
				},
				["Oneiromancy|Dreamwalking"] = {
					en = [==[M20 Sorcerer, p. 42


Dreamwalking


• Basic Oneiromancy allows the magician to touch the dreams of others, seeing flashes of imagery that could be interpreted to get insights into their target’s nature and history.
•• The oneiromancer can now enter the dreams of others, not merely see them. They become a part of the dream, forced to take on a role appropriate to the dream itself. Once in the dream, changes can be made. The magnitude of the changes determines the difficulty of an additional Oneiromancy roll, with creating small items being difficulty 6 but violating the theme of the dream being difficulty 8, perhaps with a Threshold.
••• Dreamwalkers can now watch dreams from the outside, seeing them clearly but not being pulled into them. They can now truly transform the dreams they encounter. With this rank, they can create terrors mimicking the Nightmares Flaw or soothe a dream to the point of helping the dreamer regain an additional point of temporary Willpower.
•••• Dream Sendings become available to the caster at this level. They can craft specific and detailed dream sequences for their target that repeat once per success. If they repeat more than once or twice per night, the target can become suspicious that their dreams are being manipulated.
••••• Masters of Oneiromancy can create shared dreams, bringing one person into the dream for each success on the casting roll. The environment begins as a mixture of their subconscious influences, but the oneiromancer can manipulate it further using lower levels of the Path.]==],
				},
				["Quintessence Manipulation|Flow"] = {
					en = [==[M20 Sorcerer, p. 44


Flow


• Sense Surroundings: Sensing the energies of the area becomes a routine task. With a moment of meditation or invocation, a sorcerer determines if an area or item is charged with power (whether Quintessence, vampire blood, Gnosis, or another mystic source). With three successes, the sorcerer identifies the Resonance of said energy.

•• Focused Awareness: The ability to sense the ebb and flow of energy transcends local surroundings and the inanimate and crosses into the realm of individuals. Now the sorcerer can perceive another individual using subtle magics and allow them to see obstructed meridians or occluded energy flows. This reveals curses left on individuals or blocked Quintessence flow through the body imposed by malicious disruptions. The ability to gauge magical potential in a subject also becomes available. While especially useful in identifying potential threats, the amount of information gleaned in this way lacks detailed nuance to fully define if the subject is a supernatural creature or a normal human with a certain aptitude.

••• Disrupt: No longer held to observing, now the skilled sorcerer can begin to affect the Quintessence around them. Still unable to bend and gracefully manipulate the energy, the practitioner of this path is at least versed enough to cause disruptions to the flow around them. With their invocation or focus, the sorcerer can quell the flow in the local area, causing a Quintessence source to become dormant for a time. Disruption also can mean diverting. A flow of Quintessence may be turned aside and sent along a new path in much the same way. Alternatively, with some effort a practitioner can trap a mote of Quintessence in a simple object for a limited amount of time.

•••• Control: Mere brute force gives way to nuanced control of the flow of Quintessence within themselves, the world around them, and within the pattern of others. The flows of energy through themselves are now flowing rivers with metered channels and locks allowing the practitioner to harness the Quintessence in a place of power. Each success on an effort of this type allows the sorcerer to channel one point of Quintessence per success, up to the limit of that area’s power. Quintessence drawn this way dissipates unless used within the next turn.

An enemy’s flow of energy is now a viable target for disruption at this level of understanding. Stripping the energy from another’s pool destroys one Quintessence for every success rolled. More alien energies of other supernatural creatures are still accessible, but doing so is more taxing. The energy of other supernatural creatures is disrupted by one point for every two successes.

The flow of energy through an individual’s pattern is essential to their health. A sorcerer with this knowledge can cause great harm or provide great help, albeit over an extended period through something akin to a curse or boon. Altering the flow of another’s life energy can promote or deteriorate their health but takes a great deal of time to become evident. They become ill more often, finding it difficult to fight off a mere cold, and take longer to recover from simple injury. If left unchecked they will inevitably fall victim to an environmental carcinogen or a malady that runs in their family history. On the other hand, benefitting the flow of Quintessence in an individual will see the recipient barely ever falling ill for more than a day, bouncing back from any injury as though it were a mere inconvenience and living to a ripe old age. Through this function the hedge wizard can grant physical Merits or inflict physical Flaws, by spending 2 successes per point of the Merit or Flaw.

••••• Rule: Masters of Quintessence Manipulation have attained a level of understanding that puts the flow of energy at their beck and call, impressing even the Awakened. Now, stored Quintessence can be directly infused into countermagic, adding dice to countermagic pools. Sensing Quintessence being directed, the sorcerer can interrupt the flow of energy, preventing another sorcerer from using Quintessence of their own. Each success blocks a point of Quintessence or Tass from empowering an effect.]==],
				},
				["Shadows|Shadowgrip"] = {
					en = [==[M20 Sorcerer, p. 46


Shadowgrip


The severity and persistence of the controlled shadows is gauged by one’s Shadowgrip. When a target attempts to resist the Path of Shadows, they make a Willpower test with a difficulty determined by the selected Aspect. Any success ends the effect on the following turn or after one minute.

• Deepening: Bringing shadows deeper into our vision can create a distracting and intimidating atmosphere. Within an area the overall lighting itself may not change per se, but the shadows deepen, and even sounds become slightly smothered at the edges. These shadows can also be cast upon others to confer the Path’s benefits, such as a bonus to Stealth tests in shadowy conditions.

•• Shaping: Taking further mastery of the dark material that comprises shadow, the sorcerer now crafts pattern and intent behind their shadow weaving. Upon a successful casting, the sorcerer adds two dice to any pools involving Intimidation or Stealth as well as any Subterfuge test to hide their identity. Conversely, the shadows can surround an individual and cast doubt and confusion upon the victim’s senses. At this level of mastery, they are strong enough to cause the target to hesitate or reconsider their actions due to the unidentifiable unease. This causes the target a –1 penalty to rolls made to dodge or that rely on quick reaction time. A Willpower test at difficulty 6 allows the victim to shake the shadows from their eyes and focus on their task at hand.

••• Entrenching: Not content with merely strengthening shadows, the sorcerer now animates the shadowstuff itself, letting it shift and roil about them. Should they take their deepening skills further, light now withers in the target location, and color will desaturate before the shadows. Affecting another is now far more effective. Shadows shift and distort in their eyes, and unsettling whispers can be heard when the victim gets too close to a pool of gathered shade. Being harried in such a way causes a –1 difficulty on all tests. The effect can be broken with a Willpower test at difficulty 7. Finally, the caster can cause shadows to flutter or shake creating visual diversions and increasing the difficulty of all ranged attacks made against the beneficiary by one.

•••• Commanding: The shadow’s “willingness” to act has become outright eagerness. The torment the shadowstuff visits upon the sorcerer’s foes is maddening and now causes a –2 difficulty on all tests made by the target. Any attempt to shake free calls for a Willpower test at difficulty 8 and may send some enemies into a frenzy or rage if they fail. Wreathing a target in benevolent shadows gives a +4 on all Intimidation and Stealth dice pools and any Subterfuge dice pool that is used to mask one’s identity.

••••• Ruling: Shadows know who their master is and immediately act with abandon at the sorcerer’s call. Enemies may be reduced to a gibbering heap on the floor from the horrific maleficent shades. Opponents must succeed at a difficulty 9 Willpower test or be reduced to uselessness, crumpling to the ground. This test can be repeated on each of the target’s turns, but the target may only act normally on a turn in which they gain a success. If the target leaves the affected area, they regain the ability to act normally. The darkness that engulfs those who wish to remain unseen is nigh impenetrable from without and within, save for the sorcerer themselves, decreasing the difficulty of Stealth tests by one. This darkness carries a weight so palpable, it may damage recording equipment engulfed by its influence.]==],
				},
				["Shapeshifting|Scale"] = {
					en = [==[M20 Sorcerer, p. 47


Scale


• Cosmetic changes only, such as eye color or growing hair.

•• Small but noticeable changes, such as growing claws or scales.

••• The magician can change a single body part to that of some other creature.

•••• Half-Shift: the magician can either change half of their body to an animal’s or take a form halfway between human and animal.

••••• Full Shifting: The magician can change completely into an animal.]==],
				},
				["Shapeshifting|Subject"] = {
					en = [==[M20 Sorcerer, p. 47


Subject


••• The magician can only affect themselves.

•••• The magician may transform another target.

••••• The magician may affect two subjects at once.]==],
				},
				["Shapeshifting|Disparity"] = {
					en = [==[M20 Sorcerer, p. 47


Disparity


••• Only a single animal feature.

•••• The magician can take on two unrelated shifts, such as the head of one animal and the body of another.

••••• Three unrelated shifts are possible.]==],
				},
				["Starlight|Wending"] = {
					en = [==[M20 Sorcerer, p. 48


Wending


• The threshold is the first obstacle a navigator must master. With focus and will, any doorway can serve as a threshold into the Shadowlands. The door only remains open for the navigator and will allow them and their passengers to pass. Traveling companions benefit from the same life preserving effect as the caster so long as they remain within sight of their navigator. Anyone attempting to reopen the doorway once closed will find the mundane corresponding threshold. This door collapses after it has been reopened and closed again by the navigator during their return from the Shadowlands, or willfully collapsed by the navigator to close the way behind them. A different doorway in the Shadowlands can be used to re-enter the Skinlands, but another activation of Starlight must be performed to create the new threshold. There is a drawback to this technique; The destination in the Skinlands is difficult to know without more capabilities as a navigator.

•• The Shadowlands are more familiar to a navigator of this level. Confidence swells in their chest, and the realm of the dead seems far less frightening. While traveling in the Shadowlands, the navigator benefits from –1 difficulty on all Awareness, Leadership, Survival, and Occult rolls concerning this environment, as well as Willpower rolls to overcome fear and intimidation.

••• The navigator has found a point in the Shadowlands that is akin to their own personal North Star. No matter where they are in the Shadowlands, so long as they can see this star, the navigator has a general understanding of where they may exit into the Skinlands when opening a new threshold.

•••• The familiarity with the Shadowlands is now palpable to any traveling companions the navigator has brought along. Traveling companions of the navigator benefit from a –1 difficulty to Willpower rolls made to overcome fear and intimidation, as well as Awareness and Survival rolls made within the Shadowlands.

••••• The navigator’s guiding light within the Shadowlands is visible to them even with their eyes closed. No matter how deep they travel or how turned around they may get, the navigator will always be able to find their way to a door back to the Skinlands. Furthermore, they know exactly where their exit from the Shadowlands will lead.]==],
				},
				["Summoning, Binding, and Warding|Warding Strength"] = {
					en = [==[M20 Sorcerer, p. 49


Warding Strength


Warding has Duration and Strength, each level of which subtracts one die from all actions the summoned being takes against the magician. For three successes, Warding Strength allows the creation of a Warding Circle, which the being cannot cross without a Willpower roll (difficulty 6) where they achieve more successes than the magician.]==],
				},
				["Summoning, Binding, and Warding|Binding Intensity"] = {
					en = [==[M20 Sorcerer, p. 49


Binding Intensity


• The creature cannot directly act against the magician.

•• Any single question must be answered truthfully.

••• All questions for the duration must be answered truthfully, and the being may be compelled to perform one service, though they may interpret the command liberally so long as they literally satisfy it.

•••• A single task is performed as directed, following the orders closely.

••••• The magician may transfer limited control of the binding to another person. The being performs one task for them and answers any questions the summoner asks of it.]==],
				},
				["Weather Control|Intensity"] = {
					en = [==[M20 Sorcerer, p. 50


Intensity


• Small changes only. This includes warm or cold breezes, slight but noticeable changes in temperature, and causing fire to momentarily flicker and flare.

•• The weather worker can cause minor affects that do not cause direct damage. The sorcerer might call up a dense fog that imposes perception penalties (see Mage 20 p. 435), clear a cloudy sky, or create winds in the direction they desire.

••• A sorcerer may form and dispel simple rainstorms. Strong winds can impose a penalty on ranged attacks by blowing the projectile off course and causing difficulties aiming. The weather worker may also change the temperature up to 30 degrees Fahrenheit in either direction. Depending on the starting temperature, this may impose or remove penalties from heat illness or hypothermia. Flash floods can also be deadly.

•••• A weather worker’s storm strength increases. They can now command gale-force winds, lightning, hail, and other damaging weather effects. They may now target individuals to take the brunt of the storm, and damaging effects do 4 + successes damage. Lightning causes lethal damage while bashing damage results from hail. Other effects may also cause damage, within reason. Weather effects can cause moderate penalties to those caught in the storms.

••••• The sorcerer can cause extreme effects. Thunderstorms are well within the weather worker’s grasp. Destructive tornadoes and other powerful meteorological activity can tear through a city. The sorcerer may cause 6 + successes bashing or lethal every 15 minutes to those in the storm’s path. Anyone caught in the storm also suffers maximum environmental penalties.]==],
				},
				["Fortune|Duration"] = {
					en = [==[M20 Sorcerer, p. 31


Duration


Fortune uses the Duration Aspect, but treats all durations as one higher, with Duration 5 consisting of spells lasting for several years.

M20 Sorcerer, p. 13

• A few minutes
•• One scene
••• A day or two
•••• A couple of weeks
••••• Several months]==],
				},
				["Fortune|Number of Targets"] = {
					en = [==[M20 Sorcerer, p. 31


Number of Targets


Additionally, it uses the Number of Targets Aspect, but all targets must be related (members of a family, the population of a small town, etc.).

M20 Sorcerer, p. 13

• A single target
•• Two targets
••• Up to 10
•••• Up to 50
••••• Hundreds]==],
				},
				["Healing|Damage/Healing"] = {
					en = [==[M20 Sorcerer, p. 33


Damage/Healing


This path uses the Damage/Healing Aspect. Bashing damage can be healed with one success per damage level. Additionally, each success can reduce a toxin, disease, or wound penalty (caused by pain rather than a missing limb, for example) by one level. See Mage 20 p. 406 for information on wound penalties and p. 442 for the toxin and disease chart.

M20 Sorcerer, p. 13

For each level of this Aspect, up to two dice of lethal damage can be healed or caused. An additional two successes spent on this Aspect converts the damage healed or caused to aggravated.]==],
				},
				["Weather Control|Distance"] = {
					en = [==[M20 Sorcerer, p. 50


Distance


Weather Control uses the Aspects Distance (treat the measurement on the chart as the radius of effect), Duration, and Intensity:

M20 Sorcerer, p. 13

These ranges are guidelines for populated regions. For less populated ones, the numbers may be doubled or even tripled. Distance is used for travel, movement, and remote effects. For effects emanating directly from the hedge wizard, such as combat spells, use Range instead.
• Only a few feet
•• Up to around 20 feet
••• Up to 100 feet
•••• Up to half a mile
••••• Up to five miles]==],
				},
				["Necronics|Area"] = {
					en = [==[M20 Sorcerer, p. 41


Area


•••• At this level, the magician may directly use their bioelectricity as an attack against a ghost. When using this rank of Necronics, the Area and Duration Aspects are replaced by Damage and Range.

M20 Sorcerer, p. 13

• 1-foot radius
•• 3-foot radius
••• 6-foot radius
•••• 12-foot radius
••••• 25-foot radius]==],
				},
				["Necronics|Duration"] = {
					en = [==[M20 Sorcerer, p. 41


Duration


•••• At this level, the magician may directly use their bioelectricity as an attack against a ghost. When using this rank of Necronics, the Area and Duration Aspects are replaced by Damage and Range.

M20 Sorcerer, p. 13

• A few minutes
•• One scene
••• A day or two
•••• A couple of weeks
••••• Several months]==],
				},
				["Necronics|Damage/Healing"] = {
					en = [==[M20 Sorcerer, p. 41


Damage/Healing


•••• At this level, the magician may directly use their bioelectricity as an attack against a ghost. When using this rank of Necronics, the Area and Duration Aspects are replaced by Damage and Range.

M20 Sorcerer, p. 13

For each level of this Aspect, up to two dice of lethal damage can be healed or caused. An additional two successes spent on this Aspect converts the damage healed or caused to aggravated.]==],
				},
				["Necronics|Range"] = {
					en = [==[M20 Sorcerer, p. 41


Range


•••• At this level, the magician may directly use their bioelectricity as an attack against a ghost. When using this rank of Necronics, the Area and Duration Aspects are replaced by Damage and Range.

M20 Sorcerer, p. 13

• Touch only (requires a successful Brawl attack if the target is unwilling)
•• Less than 10 feet
••• Less than 25 feet
•••• About 50 feet
••••• Within 150 feet]==],
				},
				["Necromancy|Duration"] = {
					en = [==[M20 Sorcerer, p. 40


Duration


••••• Masters of Necromancy can compel obedience from the dead. In addition to the Path roll, they must win a contested Willpower roll. If they do so, they can demand the ghost perform one simple task or answer one simple question to the best of their ability. For tasks, the Duration Aspect covers how long the ghost must attempt to accomplish it.

M20 Sorcerer, p. 13

• A few minutes
•• One scene
••• A day or two
•••• A couple of weeks
••••• Several months]==],
				},
				["Summoning, Binding, and Warding|Number of Targets"] = {
					en = [==[M20 Sorcerer, p. 49


Number of Targets


Additionally, it has Number of summoned beings (or swarms) and Metaphysical Weight for the summoned being.

M20 Sorcerer, p. 13

• A single target
•• Two targets
••• Up to 10
•••• Up to 50
••••• Hundreds]==],
				},
				["Summoning, Binding, and Warding|Metaphysical Weight"] = {
					en = [==[M20 Sorcerer, p. 49


Metaphysical Weight


Additionally, it has Number of summoned beings (or swarms) and Metaphysical Weight for the summoned being.

Binding similarly has the aspects of Duration and Metaphysical Weight, as well as Binding Intensity. Some beings, especially those with Metaphysical Weight 5, are powerful enough to require binding rituals with large thresholds in addition to the usual requirements — sometimes as high as 20 or more successes.

M20 Sorcerer, p. 13

• Simple creatures such as small, unintelligent animals, most minor Gafflings and the smallest beings in the hosts of a heaven or hell
•• Larger creatures such as bears or wolves, more powerful Gafflings, ghosts that have begun to learn to navigate their existence but have no experience
••• Humans and truly intelligent beings, like most Jagglings, ghosts who can navigate the underworld effectively, minor angels, servitor demons, and notable elementals
•••• Enhanced humans like ghouls, kinfolk, and other sorcerers, as well as powerful Jagglings, Umbrood Preceptors, and infernal tempters
••••• Powerful beings such as the truly supernatural (vampires, werewolves, mages, fae, etc.), Incarnae, the barons of hell and the generals of the heavenly host]==],
				},
				-- <<< ASPECT_DESC_END
}
