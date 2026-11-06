-- Discipline descriptions, the [en] half (SPEC T495, V210).
--
-- descDisc.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [en] only, descDisc_pt.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descDisc_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Discipline descriptions for the Vampire tab (SPEC I21). One entry per canonical picker
-- value, keyed in ENGLISH because that is what the sheet saves (SPEC V24); `pt` is a
-- translation of the same three blocks, source line for source line.
--
-- SPEC I24 / T479-T481: this table used to be an upvalue inside the <script> of HH.12.lfm.
-- The <script> CDATA is copied raw into constructNew_*(), so every open sheet parsed and
-- kept its own copy. As a module it is parsed once and cached in package.loaded, and the
-- require that pulls it lives INSIDE discText (SPEC V198).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24). The generator
-- markers migrated verbatim, so research/rebuild_ritual_desc.sh and the .tsv maps still aim
-- at the same region - only the path of the target changed.

return {
				-- >>> DISC_DESC_BEGIN (generated - SPEC T444)
				["Abombwe"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 189


Abombwe


• Predator’s Communion
System: Spend a blood point. For the rest of the scene, the Laibon can sense predators in the area, including vampires, shapeshifters, ghosts, predatory animals, mortals, and ghouls with a Road rating of 4 or less. To pinpoint the location or find a hidden creature, the player rolls Perception + Survival (difficulty 6, modified by the strength of the predator as determined by the Storyteller; stronger predators are generally easier to detect).

•• Invoking the Predator
System: This transformation takes one turn and requires one blood point. The character might grow claws that inflict Strength +1 lethal damage or a tail for balance. Most transformations are automatic, but particularly exotic ones such as poison glands require an Intelligence + Survival roll (difficulty 7). A botch results in a successful transformation, but adds cosmetic changes such as scales or stripes. This power does not suspend the laws of physics; the Laibon cannot create wings or spider webbing strong enough to carry his weight.

••• Unseen Hibernation
System: The player spends a blood point. Unseen Hibernation is automatic and takes a turn to complete. The character falls into a consciousness one step above torpor during this time and his player must make a Road roll (difficulty 6) for the character to rouse prematurely.
The difficulty of rolls to locate the character increase by two. Astral individuals cannot affect him directly, instead meeting with writhing darkness as their hands pass through him.
Violence upon the submerged vampire expels him from the object in a blinding spray (everyone near the vampire, and the vampire are at +2 difficulty on Perception for the turn). The vampire subtracts two from his Initiative for the first turn upon expulsion, but may act normally after that.

•••• Power from Darkness
System: This power costs two blood points and is automatic. One transformation may be active at a time, lasting for a scene, during which resisting Rötschreck is at +1 difficulty.
Examples of use are listed below, but players and Storytellers are encouraged to come up with their own changes:
Hands – Punches inflict Strength +1 aggravated damage.
Head – Gain the ability to see perfectly in normal darkness and a -2 difficulty for seeing in supernatural darkness. Spit a toxin by rolling Dexterity + Athletics (difficulty 7) that paralyzes any enemy’s limbs it touches unless the target succeeds at a Stamina roll (difficulty 7).
Torso – Sprout four spider legs which allow for one additional attack as part of a multiple action in a turn. Climb actions automatically succeed, and attempts to escape by running are at -2 difficulty.
Legs – Kicks inflicts aggravated damage. Leap up to 10 times the normal jumping distance and receive -1 difficulty to landing safely after a fall or jump.
Throat – Emit a primordial roar. Mortals and ghouls must succeed at a Courage roll (difficulty 9) or flee, whilst supernatural beings must succeed at a Courage roll (difficulty 8) or become weak with terror (all dice pools reduced by half, rounded up).

••••• Predator’s Transformation
System: The player spends one blood point and rolls Stamina + Survival (difficulty 7). If successful, the Laibon physically transforms into the creature. The creature must be predatory in nature and at least the size of a cat. Humans and supernatural beings may be duplicated, but this does not include powers. Predator’s Transformation lasts until sunrise or the Laibon ends the power.
A Laibon may duplicate a previous transformation without consuming another creature. This requires a Stamina + Survival roll (difficulty 10) with difficulty reduced by one for each time he has killed and transformed into a creature of that type, to a minimum difficulty of 6. With mortals, vampires, and other humanoids, the Laibon takes on an average appearance for his victim’s ethnic group.]==],
				},
				["Abyss Mysticism"] = {
					en = [==[Lore of the Clans, p. 125


Abyss Mysticism


As the Lasombra delved deeper into the secrets of Obtenebration, they discovered it drew power from a dark realm of shadows called the Abyss. Mystics within the Clan began to study this secret realm to unlock its secrets, and through this developed the art of Abyss Mysticism. The Lasombra keep this power secret from the rest of the Sabbat, as the creatures they summon and control with it are as dark as they are mysterious.

Abyss Mysticism is difficult and time consuming to learn, and comes at a cost. Its rituals often have side effects that create Flaws the character cannot remove that provide no bonus points. To learn the power, a vampire must have at least one dot in both Obtenebration and Occult. She may not learn any Abyss rituals higher than the lowest of her Obtenebration or Occult ratings, and each ritual costs a number of experience points equal to three times the ritual’s level.

Abyss rituals are cast using a Wits + Occult roll. The difficulty is 3 + the level of the ritual being cast. Only one success is required to cast the ritual, but the Storyteller is encouraged to make the penalties for failure especially horrifying.

(More detail on Abyss Mysticism can be found in Rites of Blood, pp. 37-39.)]==],
				},
				["Animalism"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 128


Animalism


• Feral Whispers
System: No roll is necessary to talk with an animal, but the character must establish eye contact (see p. 152) first. Issuing commands requires a Manipulation + Animal Ken roll. The difficulty depends on the creature: Predatory mammals (wolves, cats, vampire bats) are difficulty 6, other mammals and predatory birds (rats, owls) are difficulty 7, and other birds and reptiles (pigeons, snakes) are difficulty 8. This difficulty is reduced by one if the character speaks to the animal in its "native tongue," and can be adjusted further by circumstances and roleplaying skill (we highly recommend that all communication between characters and animals be roleplayed).
The number of successes the player achieves dictates how strongly the character’s command affects the animal. One success is sufficient to have a cat follow an individual and lead the character to the same location, three successes are enough to have a raven spy on a target for weeks, and five successes ensure that a grizzly ferociously guards the entrance to the character’s wilderness haven for some months.
The character’s Nature plays a large part in how he approaches these conversations. The character might try intimidating, teasing, cajoling, or rationalizing. The player should understand that he does not simply play his character in these situations, but the Beast Within as well.
Using this power cannot force an animal to do something against its nature, or to force a creature to risk its life. While the aforementioned grizzly would stand guard to the vampire’s haven and even fight for it, it would not do so against obviously superior numbers or something overwhelmingly supernatural. A predatory bird might be convinced to harry a target, but would definitely not hold ground. A docile dog or skittish cat would have no problem with reporting something it had seen, but it wouldn’t enter combat unless given no other option — though it would likely agree to stand and fight and then flee at the first opportunity, if a harsh Kindred demanded it.

•• Beckoning
System: The player rolls Charisma + Survival (difficulty 6) to determine the response to the character’s call; consult the table below. Only animals that can hear the cry will respond. If the Storyteller decides no animals of that type are within earshot, the summons goes unanswered.
The call can be as specific as the player desires. A character could call for all bats in the area, for only the male bats nearby, or for only the albino bat with the notched ear he saw the other night.
1 success — A single animal responds.
2 successes — One-quarter of the animals within earshot respond.
3 successes — Half of the animals respond.
4 successes — Most of the animals respond.
5 successes — All of the animals respond.

••• Quell the Beast
System: The player rolls Manipulation + Intimidation if forcing down the Beast through fear, or Manipulation + Empathy if soothing it into complacency. The difficulty of the roll is 7 in either case. This is an extended action requiring as many total successes as the target has Willpower. Failure indicates that the player must start over from the beginning, while a botch indicates that the vampire may not affect that subject’s Beast for the remainder of the scene.
When a mortal’s Beast is cowed or soothed, she can no longer use or regain Willpower. She ceases all struggles, whether mental or physical. She doesn’t even defend herself if assaulted, though the Storyteller may allow a Willpower roll if the mortal believes her life is truly threatened. To recover from this power, the mortal’s player rolls Willpower (difficulty 6) once per day until she accumulates enough successes to equal the vampire’s Willpower. Kindred cannot be affected by this power.
Though a vampire’s Beast cannot be cowed with this ability, the Storyteller may allow characters to use the "soothing" variation of this power to pull a vampire out of frenzy. With three or more successes, the frenzying vampire may roll again to pull herself out of frenzy, using the same difficulty as the stimulus that caused the frenzy originally.

•••• Subsume the Spirit
System: The player rolls Manipulation + Animal Ken (difficulty 8) as the character looks into the animal’s eyes (see sidebar on p. 152). The number of successes allows the character to employ some mental Disciplines while possessing the animal, as noted below.
1 success — Cannot use Disciplines.
2 successes — Can use Auspex and other sensory powers.
3 successes — Can also use Presence and other powers of emotional manipulation.
4 successes — Can also use Dementation, Dominate, and other powers of mental manipulation.
5 successes — Can also use Chimerstry, Necromancy, Thaumaturgy, and other mystical powers.
This power entwines the character’s consciousness closely with the animal’s spirit, so much so that the character may continue to think and feel like that animal even after breaking the connection. This effect continues until the character spends a total of seven nights or three Willpower points to resist and finally overcome the animal nature. This should be roleplayed, though the character will be affected to a lesser degree if the player chooses to spend Willpower.
At the end of any particularly exciting incident during possession, the player rolls Wits + Empathy (difficulty 8) for the character to retain his own mind. Failure indicates that the character’s mind returns to his own body, but still thinks in purely animalistic terms. A botch returns the character to his body, and also sends him into frenzy.
The character may travel as far from his own physical body as he chooses while possessing the animal. The character retains no conscious connection with his vampire body during this time, though. The vampire may also venture out during the day, albeit in the animal’s body. However, the character’s own body must be awake to do so, requiring a successful roll to remain awake (see p. 262). If the character leaves the animal’s body (by choice, if his body falls asleep, or after sustaining significant injury), the vampire’s consciousness returns to his physical form instantaneously.
Although the vampire has no conscious link to his body while possessing the animal, he does form a sympathetic bond. Anything the animal feels, the vampire also experiences, from pleasure to pain. In fact, any damage the animal’s body sustains is also applied to the character’s body, though the Kindred body may soak as normal. If the animal dies before the vampire’s soul can flee from the body, the character’s body falls into torpor. Presumably this is in sympathetic response to the massive trauma of death, but some Kindred believe that the vampire’s soul is cast adrift during this time and must find its way back to the body.

••••• Drawing Out the Beast
System: The player must announce his preferred target (since it must be someone within sight, Drawing Out the Beast cannot be used if the vampire is alone), then roll Manipulation + Self-Control/Instinct (difficulty 8). Refer to the table below for the results:
1 success — The character transfers the Beast, but unleashes it upon a random individual.
2 successes — The character is stunned by the effort and may not act next turn, but transfers the Beast successfully. Alternatively, the character may act normally during the turn, but must spend a Willpower point or suffer a single level of lethal damage.
3+ successes — The character transfers the Beast successfully.
If the attempt fails, the character himself immediately enters frenzy. As the character relaxes in expectation of relieving his savage urges, the Beast takes that opportunity to dig deeper. In this case, the frenzy lasts twice as long as normal and is twice as difficult to shrug off; its severity also increases exponentially. Botching this roll is even more catastrophic; the heightened frenzy grows so extreme that not even expending Willpower curbs its duration or effects. The character is a hapless victim to the terrible fury of his Beast, and may well hurl herself into a savage, flesh-rending rampage that leaves the Masquerade (and unfortunate nearby onlookers) in tatters.
If the character leaves the target’s presence before the frenzy expends itself, the vampire loses his Beast, perhaps permanently. While no longer vulnerable to frenzy, the character cannot use or regain Willpower and becomes increasingly lethargic. To recover the Beast, he must find the person who now possesses it (who likely isn’t enjoying herself very much) and coax the Beast into its proper vessel. The most effective way to do so is to behave in ways that make the Beast want to return — however, this isn’t a guarantee that it will wish to do so. Alternatively, the character can simply kill the host (thus causing the Beast to return to the vampire immediately).]==],
				},
				["Assamite Sorcery"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 440


Assamite Sorcery


From a purely functional standpoint, the blood magic that the Assamite sorcerer caste practices differs little from that wielded by the Tremere. From a philosophical perspective, however, worlds of difference separate the two. The Tremere force every piece of knowledge they incorporate into the structured, rigid framework of high Hermetic invocation. By contrast, the sorcerer caste’s practices are the result of millennia of adaptation and melding, and are too disparate to be considered "structured" in any real sense. The modern body of knowledge that is Assamite Sorcery draws its content from a wide array of magical traditions, from the ecstatic rites of Kali and Shiva’s followers to the subtle precision of feng shui to the elegant symbolic and mathematical transformations of Islamic alchemists and astronomers.
Assamite Sorcery is mechanically identical to the more common Thaumaturgy that appears on pp. 212-240. However, though they work on similar principles (the use of vampiric vitae to fuel exertions of conscious will in order to effect change upon the physical or spiritual world), the two are not cross-compatible. A Tremere strives to perform his magic the same way, all the time, every time. An Assamite might never enact the same ritual the same exact way twice in a millennium.
As may be expected, students of Assamite Sorcery have great difficulty learning the practices of other blood magic traditions. All experience points costs to learn other blood magic paths and rituals are increased by half (round up) for Assamite sorcerers. In addition, even once the sorcerer has incorporated these lessons into her repertoire, they are still alien to her. All invocations of a "foreign" path require one extra blood point and all rituals take triple the normal time and require one extra success for any desired result.

The sorcerers have equivalent teachings for many common blood magic techniques in addition to their own unique lessons. The following list is not an exhaustive coverage of everything in the Great Library, but it is a starting point for players and Storytellers who wish to determine the capabilities of Assamite sorcerers. Names in parentheses are the names that the sorcerer caste prefers to use for each item, if the Assamite name differs from the commonly accepted one. Paths marked with an asterisk are usually options for an Assamite sorcerer to learn as his primary path, provided his instructor approves.
Paths: The Path of Blood, The Lure of Flames*, Movement of the Mind*, The Path of Conjuring, Hands of Destruction
Rituals: Defense of the Sacred Haven (Curtain of Will), Wake with Evening’s Freshness (Black Sunrise), Communicate with Kindred Sire (Speak with Sire), Deflection of Wooden Doom (Turn the Impaling Shaft), Ward versus Ghouls, Principal Focus of Vitae Infusion (Draught of the Pebble), Incorporeal Passage (Passage of the Ghul), Bone of Lies (Stain of Guilt)]==],
				},
				["Auspex"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 134


Auspex


• Heightened Senses
System: It takes a reflexive action to activate this ability, but no roll or other cost is required. In certain circumstances, dice rolls associated with using the character’s sense (such as Perception + Alertness) decrease in difficulty by a number equal to the character’s Auspex rating when the power is engaged.
The Storyteller may also use this power to see if the character perceives a threat. In this case, the Storyteller privately rolls the character’s unmodified Auspex rating, applying whatever difficulty he feels best suits the circumstances. For example, sensing that a pistol is pointed at the back of the character’s head may require a roll of difficulty 5, while the sudden realization that a rival for Primogen is planning her assassination may require a 9. Note that even this "precognition" comes only as a result of interpreting details the Kindred is able to notice. It’s not an all-purpose insight or miraculous revelation.
At the character’s discretion, she may selectively heighten one specific sense, rather than leaving them all on. In these cases, the difficulty to perceive stimuli using that sense drops by one, but the difficulty to avoid distraction or temporary bedazzlement increases by one.
This power does not let characters see in pitch darkness, as does Eyes of the Beast (p. 199), but it does reduce difficulty penalties to act in such darkness from +2 to +1, and the character may make ranged attacks in pitch darkness if she can hear, smell, or otherwise detect her foe.

•• Aura Perception
System: After the character stares at the subject for at least a few seconds, the player rolls Perception + Empathy (difficulty 8); each success indicates how much of the subject’s aura the character sees and understands (see the table below). A failure indicates that the play of colors and patterns yields no prevailing impression. A botch indicates a false or erroneous interpretation. The Storyteller may wish to make this roll, thus keeping the player in the dark as to the veracity of the character’s interpretation.
1 success — Can distinguish only the shade (pale or bright).
2 successes — Can distinguish the main color.
3 successes — Can recognize the color patterns.
4 successes — Can detect subtle shifts.
5 successes — Can identify mixtures of color and pattern.
The Aura Colors chart offers some example ideas of common colors and the emotions they reflect that Storytellers can use. Note that it is nearly impossible to determine with certainty if a particular character is lying or not with this power – vampires are inherently deceitful by nature, but even mortals might react with anxiety to questions while still being truthful. It is, however, helpful in determine the target’s emotional state, which might lead the vampire to decide that a particular target is suspicious.
A character may choose to perform a very cursory aura scan of a large area like a nightclub’s dance floor or the audience in a gallery. In this case, the player decides which characteristic of auras she’s looking for, and that’s the only information she’s able to glean if the roll is successful. (At the Storyteller’s discretion, on this general scan roll, more successes on the roll may more quickly yield what the character seeks.) For example, the player may specify, "Who’s the most nervous person in attendance?" or "Are there any vampirically pale auras among the CEO’s entourage?" Thereafter, the player may narrow down her scrutiny of a single individual, with an additional roll as normal.
The character may focus in on a particular subject’s aura only once per scene with any degree of clarity. Any subsequent attempts that result in failure should be considered botches. It is very easy for the character to imagine seeing what she wants to see when judging someone’s intentions. After 24 hours, the character may try again at no penalty.
It is possible, though difficult, to sense the aura of a being who is otherwise invisible to normal sight. Refer to "Seeing the Unseen," p. 142, for more information.
Aura Colors
Afraid — Orange
Aggressive — Purple
Angry — Red
Bitter — Brown
Calm — Light Blue
Compassionate — Pink
Conservative — Lavender
Depressed — Gray
Desirous or Lustful — Deep Red
Distrustful — Light Green
Envious — Dark Green
Excited — Violet
Generous — Rose
Happy — Vermilion
Hateful — Black
Idealistic — Yellow
Innocent — White
Lovestruck — Blue
Obsessed — Green
Sad — Silver
Spiritual — Gold
Suspicious — Dark Blue
Anxious — Auras appear scrambled like static or white noise
Confused — Mottled, shifting colors
Diablerist — Black veins in aura
Daydreaming — Sharp flickering colors
Frenzied — Rapidly rippling colors
Psychotic — Hypnotic, swirling colors
Vampire — Aura colors are pale
Ghoul — Pale blotches in the aura
Magic Use — Myriad sparkles in aura
Werebeast — Bright, vibrant aura
Ghost — Weak, intermittent aura
Faerie — Rainbow highlights in aura

••• The Spirit’s Touch
System: The player rolls Perception + Empathy. The difficulty is determined by the age of the impressions and the mental and spiritual strength of the person or event that left them. Sensing information from a pistol used for a murder hours ago may require a 4, while learning who owned a bloodstained puppet fashioned a century ago might be a 9.
The greater the individual’s emotional connection to the object, the stronger the impression he leaves on it — and the more information the Kindred can glean from it. Events involving strong emotions (a gift-giving, a torture, a long family history) likewise leave stronger impressions than short or casual contact do. Assume that each success offers one piece of information, as per the chart below.
Botch — The character is overwhelmed by psychic impressions for the next 30 minutes and unable to act.
Failure — No information of value.
1 success — Very basic information: the last owner’s gender or hair color, for instance.
2 successes — A second piece of basic information.
3 successes — More useful information about the last owner, such as age and state of mind the last time he used the item.
4 successes — The person’s name.
5+ successes — A wealth of information: nearly anything you want to know about the person’s relationship with that object is available.
At the Storyteller’s discretion, some impressions on objects may be so strong — a knife plunged into Caesar’s breast, the tip of the Spear of Destiny, a fang pulled from the maw of Dracula — that any use of this power may be deemed a success.

•••• Telepathy
System: The player rolls Intelligence + Subterfuge (difficulty of the subject’s current Willpower points). Projecting thoughts into the target’s mind requires one success. The subject recognizes that the thoughts come from somewhere other than his own consciousness, though he cannot discern their actual origin without a successful Perception + Awareness roll (difficulty equal to the vampire’s Manipulation + Subterfuge).
To read minds, one success must be rolled for each item of information plucked or each layer of thought pierced. Deep secrets or buried memories are harder to obtain than surface emotions or unspoken comments, requiring five or more successes to access.
Reading thoughts with Telepathy does not commonly work upon the undead mind. A character may expend a Willpower point to make the effort, making the roll normally afterward. Likewise, it is equally difficult to read the thoughts of other supernatural creatures. However, the character may project her thoughts without expending a Willpower point. These thoughts, however, are still obviously intrusions into the target’s mind, but the character may attempt to disguise her mental "voice" with a roll of Manipulation + Subterfuge (difficulty equals the target’s Perception + Awareness) so the target doesn’t recognize her as the "speaker."
Storytellers are encouraged to describe thoughts as flowing streams of impressions and images, rather than as a sequence of prose (powers such as Telepathic Communication are of more use for that). Instead of making flat statements like "He’s planning on killing his former lover’s new boyfriend," say "You see a fleeting series of visions: A couple kissing passionately in a doorway, then the man walking alone at night; you suddenly see your hands, knuckles white, wrapped around a steering wheel, with a figure crossing the street ahead; your heart, mortal now and hammering with panic as you hear the engine rev wildly; and above all, a blazing anger coupled with emotional agony and a panicked fear of loss." Such descriptions not only add to the story, but they also force the player to interpret for herself what her character gleans. After all, understanding minds — especially highly emotional or deranged minds — is a difficult and often puzzling task.

••••• Psychic Projection
System: Journeying in astral form requires the player to expend a point of Willpower and make a Perception + Awareness roll. Difficulty varies depending on the distance and complexity of the intended trip; 5 is within sight, 7 is nearby or to a familiar location, and 9 reflects a trip far from familiar territory (a first journey from North America to the Far East; trying to shortcut through the earth). The greater the number of successes rolled, the more focused the character’s astral presence is, and the easier it is for her to reach her desired destination.
Failure means the character is unable to separate her consciousness from her body, while a botch can have nasty consequences — flinging her astral form to a random destination on Earth or in the spirit realm, arriving in a place where the sun is active (necessitating a frenzy roll, although the sunlight doesn’t do any damage), or hurtling toward the desired destination so forcefully that the silver cord snaps.
The player may spend a point of Willpower to activate this power, and an additional point of Willpower to gain the success necessary to perform the jaunt. This is an exception to the normal rule where a player may not spend more than a single point of Willpower per turn.
Each scene in Psychic Projection requires another point of Willpower and a new roll. Failure indicates that the vampire has lost her way and must retrace the path of her silver cord. A botch at this stage means the cord snaps, stranding the character’s psychic form in the mysterious astral plane.
An astral form may travel at great speeds (the Storyteller can use roughly 1000 miles per hour or 1500 kilometers per hour as a general guide) and carries no clothing or material objects of any kind. Some artifacts are said to exist in the spirit world, and the character can try to use one of these tools if she finds one. The character cannot bring such relics to the physical world when she returns to her body, however.
Interaction with the physical world is impossible while using Psychic Projection. At best, the character may spend a Willpower point to manifest as a ghostlike shape. This apparition lasts one turn before fading away; while she can’t affect anything physically during this time, the character can speak. Despite lacking physical substance, an astral character can use Auspex normally. At the Storyteller’s discretion, such a character may employ some or all Animalism, Dementation, Dominate, Necromancy, Obtenebration, Presence, Thaumaturgy, and similar non-corporeal powers she has, though this typically requires a minimum of three successes on the initial Psychic Projection roll.
If two astral shapes encounter one another, they interact as if they were solid. They may talk, touch, and even fight as if both were in the material world. Since they have no physical bodies, astral characters seeking to interact "physically" substitute Mental and Social Traits for Physical ones (Wits replaces Dexterity, Manipulation supplants Strength, and Intelligence replaces Stamina). Due to the lack of a material form, the only real way to damage another psychic entity is to cut its silver cord. When fighting this way, consider Willpower points to be health levels; when a combatant loses all of her Willpower, the cord is severed.
Although an astrally projected character remains in the reflection of the mortal world, she may venture further into the spirit realms, especially if she becomes lost. Other beings with particular sensitivity to psychic activity, such as ghosts, werewolves, and even some magi, travel the astral plane as well, and can interact with a vampire’s psychic presence normally (although the astrally projected character is not considered a "ghost" for powers such as Necromancy). The observing character notices the astrally projecting vampire with a Perception + Awareness roll (difficulty 8), requiring more successes than the Psychic Projection activation roll. Even those who do notice you won’t be able to identify you; you are merely an immaterial shade hovering in the general area. Storytellers are encouraged to make trips into the spirit world as bizarre, mysterious, and dreamlike as possible. The world beyond is a vivid and fantastic place, where the true nature of things is stronger and often strikingly different from their earthly appearances.

Seeing the Unseen (p. 142)
Auspex enables Kindred to perceive many things beyond the limits of lesser senses. Among its many uses, Auspex can detect the presence of a supernatural being who is hidden from normal sight (a vampire using Obfuscate, for example, or a ghost) or pierce illusions created by the Discipline of Chimerstry. Note: "Normal sight" includes regular, non-Auspex use of the Awareness skill.
• Obfuscate: When a vampire tries to use her heightened perceptions to notice a Kindred hidden with Obfuscate, she detects the subject’s presence if her Auspex rating is higher than his Obfuscate, and she succeeds at a Perception + Awareness roll (difficulty equals 7 minus the number of dots by which her Auspex exceeds his Obfuscate). Conversely, if the target’s Obfuscate outranks her Auspex, he remains undiscovered. If the two ratings are equal, both characters make a resisted roll of Perception + Awareness (Auspex user) against Manipulation + Subterfuge (Obfuscate user). The difficulty for both rolls is 7, and the character with the most successes wins.
• Chimerstry: Likewise, vampires with Auspex may seek to penetrate illusions created with Chimerstry. The Auspex-wielder must actively seek to pierce the illusion (i.e., the player must tell the Storyteller that his character is trying to detect an illusion). The Auspex-user and Chimerstry-wielder then compare relative ratings, per Obfuscate, above. The process is otherwise identical to piercing Obfuscate.
• Other Powers: Since the powers of beings like magi and wraiths function differently from vampiric Disciplines, a simple comparison of relative ratings isn’t applicable. To keep things simple, both characters make a resisted roll. The vampire rolls Perception + Awareness, while the subject rolls Manipulation + Subterfuge. Again, the difficulty is 7, and the character with the most successes wins.]==],
				},
				["Bardo"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 442


Bardo


• Restore Humanitas
System: When the vampire loses a dot of Humanity, he can attempt to regain it without spending experience points by using this power. The Child must use this power within a week of losing the Humanity, and must not have lost any more Humanity since the initial loss (that is, if the character falls from Humanity 8 to Humanity 7, and then falls to Humanity 6 before using this power, Restore Humanitas can only be used to recover Humanity 7). The character meditates for several hours, and spends all of the blood points currently in his body. The player then rolls Conscience (difficulty equal to the level of Humanity being regained). If the roll succeeds, the character regains the dot of Humanity and (if applicable) the dot of Conscience lost to a botched degeneration roll. If the character gained a derangement, it fades within a week of using Restore Humanitas.

•• Banishing Sign of Thoth
System: The player spends a blood point and rolls Dexterity + Occult (difficulty 7). This power can be used to "dodge" any incoming attack of a mystical nature, including any Disciplines that target the character (whether or not they actually inflict damage). Any successes the player rolls are subtracted from the successes on the attacker’s roll. The sign does not serve to turn aside magically enhanced physical attacks; a punch from a vampire with the Potence Discipline still has the full effect.

••• Gift of Apis
System: Animal blood is just as nourishing to the character as human blood. An animal is considered to have a blood pool equal to the number of health levels it has, rather than the lesser value usually assigned to represent the creature’s less-than-filling fluids (see p. 270 for more on drinking from animals). This ability is always active.

•••• Pillar of Osiris
System: Creating the Pillar of Osiris requires a night-long ritual, with the difficulty determined by the location. The more remote and free from violence the location is, the lower the difficulty. A cave far from human populations that has never seen violence might be difficulty 5, which the site of a grisly murder-suicide in a downtown area would be difficulty 9. The player spends a Willpower point and rolls Willpower. Success creates the Pillar, which does not require a physical pillar — the Pillar of Osiris is conceptual, not literal.
Once the Pillar is created, any vampire with at least one dot of Bardo receives a -3 to the difficulties of any Discipline or other mystical activity (including blood magic) performed at the Pillar. However, this requires regular trips to the Pillar. Once the vampire has created a Pillar, he must visit it at least once a month, or it ceases to function. In addition, for every week he is away from a Pillar (not necessarily the one he created), the difficulties of all rolls to avoid frenzy increase by one. The Beast, long denied by the Child’s ascetic practices, grows in strength while away from the Pillar, and eventually pushes the vampire to frenzy and (likely) Humanity loss. The Children of Osiris, for this and other reasons, do not leave their temples for long.

••••• Paradox
System: The vampire speaks the phrase, and the player spends a point of Willpower and rolls Manipulation + Occult (difficulty equal to the listener’s current Willpower). If multiple listeners are present, the player rolls against the highest difficulty. If the roll is successful, the listener(s) is immobilized for the scene as he contemplates what he has heard. Striking the victim snaps him out of it. At the end of the scene, the paradox is gone, and the target can’t ever quite explain it. He does, however, suffer a permanent +1 difficulty to harm or act against the Child of Osiris.]==],
				},
				["Celerity"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 142


Celerity


System: Each point of Celerity adds one die to every Dexterity-related dice roll. In addition, the player can spend one blood point to take an extra action up to the number of dots he has in Celerity at the beginning of the relevant turn; this expenditure can go beyond her normal Generation maximum. Any dots used for extra actions, however, are no longer available for Dexterity-related rolls during that turn. These additional actions must be physical (e.g., the vampire cannot use a mental Discipline like Dominate multiple times in one turn), and extra actions occur at the end of the turn (the vampire’s regular action still takes place per her initiative roll).
Normally, a character without Celerity must divide their dice if she wants to take multiple actions in a single turn, as per p. 248. A character using Celerity performs his extra actions (including full movement) without penalty, gaining a full dice pool for each separate action. Extra actions gained through Celerity may not in turn be split into multiple actions, however.]==],
				},
				["Chimerstry"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 144


Chimerstry


• Ignis Fatuus
System: The player spends a point of Willpower for the vampire to create this illusion. The volume of smells, ambient lighting, smoke clouds, and the like are limited to roughly 20 cubic feet (half a cubic meter) per dot the vampire has in Chimerstry. The illusion lasts until the vampire leaves its vicinity (such as stepping out of the room) or until another person sees through it somehow. The Cainite may also end the illusion at any time with no effort.

•• Fata Morgana
System: The player spends a Willpower point and a blood point to create the illusion. These static images remain until dispelled, in much the same way that an Ignis Fatuus illusion does.

••• Apparition
System: The creator spends one blood point to make the illusion move in one significant way, or in any number of subtle ways. For example, the vampire could create the illusion of a lurking mugger lurching at her victim, or she could create the illusion of a desolate street, down which a chill wind blows trash while a streetlamp flickers and hums. Taking complicated actions besides maintaining the illusion — that is, anything that would require a dice roll — first requires success on a Willpower roll, resulting in the dissolution of the false construct if the roll fails.
Once the creator stops concentrating on the illusion, it can continue in simple, repetitive motions – roughly speaking, anything that can be described in a simple sentence, such as a guard walking back and forth in front of a steel door. After that, the vampire cannot regain control over the illusion – she can either allow it to continue moving as ordered, or let it fade as described under Ignis Fatuus.

•••• Permanency
System: The vampire need only spend a blood point, and the illusion becomes permanent until dissolved (including "programmed" illusions like those created by Apparition).

••••• Horrid Reality
System: A Horrid Realty illusion costs two Willpower points to set in motion and lasts for an entire scene (though its effects may last longer; see below). If the vampire is trying to injure his victim, his player must roll Manipulation + Subterfuge (difficulty of the victim’s Perception + Self-Control/Instinct). Each success inflicts one health level of lethal damage on the victim that cannot be soaked — the Cainite assaults the victim’s mind and perceptions, not his body. If the player wishes to inflict less damage or change it to bashing, he may announce a maximum amount of damage before rolling the dice. Secondary effects (such as frenzy rolls for illusory fire) may also occur.
The victim heals all his damage instantaneously if he can be convinced that the damage he took was illusory, but convincing him may take some doing, such as with at least two successes on a Charisma + Empathy roll (difficulty equal to the Manipulation + Subterfuge of the Cainite using Horrid Reality). The target must be convinced of the attack’s illusory nature within 24 hours of its taking place, or it becomes too well established in his memory, and he will have to heal the damage using blood (if a vampire) or over time (if mortal).
This power cannot actually kill its victims (though a target with a heart condition may well die from fright). A victim "killed" by an illusory attack loses consciousness or enters torpor.]==],
				},
				["Daimonion"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 208


Daimonion


• Sense the Sin
System: Roll Perception + Empathy against living or undead beings; the difficulty is equal to the subject’s Self-Control or Instinct +4. Success indicates the Baali has gleaned insight into the subject’s weakness. With one success, this is information like a low Virtue, weak Willpower, or recent actions that violated the subject’s Road. Two successes might yield a beloved vice or casual secret. Three or more yield a central Derangement or formative trauma from the subject’s past.

•• Fear of the Void
System: The Baali must first successfully use Sense the Sin or another method to learn the target’s secrets or fears. She must then speak to the target, mocking his insecurities with her tone. A successful Wits + Intimidation roll (difficulty of the subject’s Courage +4) drives the victim into furious fits of terror. Two successes causes panicked flight similar to Rötschreck, while three causes an inflamed Derangement (Storyteller’s choice) and four or more causes catatonia. All effects last for the remainder of the scene. Mortals and supernatural creatures bound to strong emotions (such as fae or ghosts) may not contest this roll; other supernatural creatures may make a contested Courage roll (difficulty of the Baali’s Willpower).

••• Tormented Essence
System: Spend a blood point. The character gathers infernal pain into their hands; most commonly this manifests as a bolt of black flame, but sickening-hued lightning or slick black tentacles are just as common. Regardless, the power creates a missile that inflicts one die of aggravated damage. More blood points may be spent to increase the size and damage of the missile, for one die per point. The player rolls Dexterity + Occult (difficulty 6) to hit the target, who may dodge as normal. As with any normal attack, successes add to the damage dice pool. Vampires confronted with this power make Rötschreck checks (at difficulty 8), regardless of the power’s form. Interestingly, this power is doubly effective against demons and other spirits, whose corporeal forms react poorly to the stuff of torment. Against such creatures, each blood point becomes two dice of damage instead of one.

•••• Psychomachia
System: After successfully using Sense the Sin, the vampire forces the target to roll his lowest Virtue (difficulty of the Baali’s Willpower). Failing this roll brings any Derangements the target possesses to the fore, pitting them against a personified apparition of the victim’s vice summoned from her darker self. A botch indicates the target has been overwhelmed and frenzies — or becomes possessed by his dark passenger. A failure results in a literal fight between the two, though this may take the form of any conflict, such as an abusive argument rather than a physical battle.
The assailant is a Storyteller character with traits equivalent or slightly inferior to the victim’s. Targets with a low Road score face significantly more powerful opposition (+1 to all traits for every level of Road less than 5). The wounds inflicted by the mind are illusory, though they can force a mortal into catatonia or a vampire into torpor upon a phantom "death." The phantasm vanishes on their defeat or the Baali’s loss of concentration.

••••• Condemnation
System: An Intelligence + Occult roll (difficulty equal to the subject’s Willpower) dictates the length and severity of the curse. Successes must be split between both these effects, as per the sidebar below.
Curses with zero successes allotted to duration last for one night. The Baali may choose to end the curse at any time, but they rarely do so. Storytellers should feel free to invent creative or story-appropriate curses. At five successes, a Baali may rip a demon out of a mortal host or relic and fling it back to Hell, but they only do so against the most recalcitrant.
Condemnation
1 success — Up to one week — "Your lightest footfalls are as childish stomps." — All Steath rolls are at +3 difficulty.
2 successes — One month — "Sicken and wither, and feel the weakness of your blood." — The difficulty of all Stamina rolls increases by two, or vampire loses four soak dice.
3 successes — One year — "Live forever in fear: those you respect seek your betrayal." — The vampire suffers increased Social roll difficulties, or the character cannot benefit from Allies or Contacts.
4 successes — Ten years — "Feel the godling in your veins crushed, and your future progeny vanished." — The character cannot Embrace childer or create ghouls.
5 successes — Permanent — "Doom will be upon you, and your missteps become fatal and final." — Simple failures are considered botches.]==],
				},
				["Dark Thaumaturgy"] = {
					en = [==[Rites of Blood, p. 112


Dark Thaumaturgy


Dark Thaumaturgy is expressly defined as "sorcery taught by demons." As such, Dark Thaumaturgy is absolutely, unashamedly, viciously evil. Other items also fall into this realm. The Baali Discipline of Daimoinon, which requires the user to call out demonic names and speak infernal blessings, is infernal and corrupts the user’s soul with each use. All of these powers require a point of morality loss when they are first used, and continuing tests against a character’s Conscience each time they are used after the first — unless the user of such powers has traded their morality for the Path of Evil Revelations. Some examples start on p. 167.]==],
				},
				["Dementation"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 147


Dementation


• Passion
System: The character talks to her victim, and the vampire’s player rolls Charisma + Empathy (difficulty equals the victim’s Humanity or Path rating). The number of successes determines the duration of the altered state of feeling. Effects of this power might include one- or two-point additions or subtractions to difficulties of frenzy rolls, Virtue rolls, rolls to resist Presence powers, etc.
1 success — One turn
2 successes — One hour
3 successes — One night
4 successes — One week
5 successes — One month
6+ successes — Three months

•• The Haunting
System: After the vampire speaks to the victim, the player spends a blood point and rolls Manipulation + Subterfuge (difficulty of his victim’s Perception + Self-Control/Instinct). The number of successes determines the length of the sensory "visitations." The precise effects are up to the Storyteller, though particularly eerie or harrowing apparitions can certainly reduce dice pools for a turn or two after the manifestation.
1 success — One night
2 successes — Two nights
3 successes — One week
4 successes — One month
5 successes — Three months
6+ successes — One year

••• Eyes of Chaos
System: This power allows a vampire to determine a person’s true Nature, among other things. The vampire concentrates for a turn, then her player rolls Perception + Occult. The difficulty depends on the intricacy of the pattern. Discerning the Nature of a stranger would be difficulty 9, a casual acquaintance would be an 8, and an established ally a 6. The vampire could also read the message locked in a coded missive (difficulty 7), or even see the doings of an invisible hand in such events as the pattern of falling leaves (difficulty 6). Almost anything might contain some hidden insight, no matter how trivial or meaningless. The patterns are present in most things, but are often so intricate they can keep a vampire spellbound for hours while she tries to understand their message.
This is a potent power, subject to adjudication. Storytellers, this power is an effective way to introduce plot threads for a chronicle, reveal an overlooked clue, foreshadow important events, or communicate critical information a player seeks. Important to its use, though, is delivering the information properly. Secrets revealed via Eyes of Chaos are never simple facts; they’re tantalizing symbols adrift in a sea of madness. Describe the results of this power in terms of allegory: "The man before you appears as a crude marionette, with garish features painted in bright stage makeup, and strings vanishing up into the night sky." Avoid stating plainly, "You learn that this ghoul is the minion of a powerful Methuselah."

•••• Voice of Madness
System: The player spends a blood point and makes a Manipulation + Empathy roll (difficulty 7). One target is affected per success, although all potential victims must be listening to the vampire’s voice.
Affected victims fly immediately into frenzy or a blind fear like Rötschreck. Kindred or other creatures capable of frenzy, such as Lupines, may make a frenzy check or Rötschreck test (Storyteller’s choice as to how they are affected) at +2 difficulty to resist the power. Mortals are automatically affected and don’t remember their actions while berserk. The frenzy or fear lasts for a scene, though vampires and Lupines may test as usual to snap out of it.
The vampire using Voice of Madness must also test for frenzy or Rötschreck upon invoking this power, though his difficulty to resist is one lower than normal. If the initial roll to invoke this power is a failure, however, the roll to resist the frenzy is one higher than normal. If the roll to invoke this power is a botch, the frenzy or Rötschreck response is automatic.

••••• Total Insanity
System: The Kindred must gain her target’s undivided attention for at least one full turn to enact this power. The player spends a blood point and rolls Manipulation + Intimidation (difficulty of her victim’s current Willpower points). If the roll is successful, the victim is afflicted with five derangements of the Storyteller’s choice (see p. 290). The number of successes determines the duration.
1 success — One turn
2 successes — One night
3 successes — One week
4 successes — One month
5+ successes — One year
On a botch… well, the Storyteller can decide what a vampire inflicts upon herself by attempting to incite the primal hells lurking within the darkest recesses of a victim’s mind.
The victim (or the target of a botch) can spend a number of Willpower points equal to the successes rolled to end the duration prematurely. The Storyteller decides when such Willpower points can be spent (such as after a therapy session or after a friend has managed to prove a particular delusion to be false).]==],
				},
				["Dominate"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 151


Dominate


• Command
System: The player rolls Manipulation + Intimidation (difficulty equals the target’s current Willpower points). More successes force the subject to act with greater vigor or for a longer duration (continue running for a number of turns, go off on a laughing jag, scream uncontrollably).
Remember, too, that being commanded to against one’s Nature confounds the use of this power. Being told to "sleep!" in a dangerous situation or "attack!" in police custody may not have the desired effect, or indeed, any effect at all.

•• Mesmerize
System: The player rolls Manipulation + Leadership (difficulty equal to the target’s current Willpower points). The number of successes determines how well the suggestion takes hold in the victim’s subconscious. If the vampire scores one or two successes, the subject cannot be forced to do anything that seems strange to her (she might walk outside, but is unlikely to steal a car). At three or four successes, the command is effective unless following it endangers the subject. At five successes or greater, the vampire can implant nearly any sort of command.
No matter how strong the Kindred’s will, his command cannot force the subject to harm herself directly or defy her innate Nature. So, while a vampire who scored five successes could make a 98-pound weakling attack a 300-pound bouncer, he could not make the mortal shoot herself in the head.
If a vampire tries to Mesmerize a subject before the target fulfills a previously implanted directive, compare the successes rolled to those gained during the implanting of the first suggestion. Whichever roll had the greater number of successes is the command that now governs in the target’s behavior; the other suggestion is wiped clean. If the successes rolled are equal, the newer command supplants the old one.

••• The Forgetful Mind
System: The player states what sorts of alteration he wants to perform, then rolls Wits + Subterfuge (difficulty equal to the target’s current Willpower points). Any success pacifies the victim for the amount of time it takes the vampire to perform the verbal alteration, provided the vampire does not act aggressively toward her. The table below indicates the degree of modification possible to the subject’s memory. If the successes rolled don’t allow for the extent of change the character desired, the Storyteller reduces the resulting impact on the victim’s mind.
1 success — May remove a single memory; lasts one day.
2 successes — May remove, but not alter, memory permanently.
3 successes — May make slight changes to memory.
4 successes — May alter or remove entire scene from subject’s memory.
5 successes — May reconstruct entire periods of subject’s life.
To restore removed memories or sense false ones in a subject, the character’s Dominate rating must be equal to or higher than that of the vampire who made the alteration. In that situation, the player must make a Wits + Empathy roll (difficulty equal to the original vampire’s permanent Willpower rating) and score more successes than his predecessor did. However, the Kindred cannot use The Forgetful Mind to restore his own memories if they were stolen in such a way.

•••• Conditioning
System: The player rolls Charisma + Leadership (difficulty equal to the target’s current Willpower points) once per scene. Conditioning is an extended action, for which the Storyteller secretly determines the number of successes required. It typically requires between five and 10 times the subject’s Self-Control/Instinct rating. Targets with more empathic Natures may require a lower number of successes, while those with willful Natures require a higher total. Only through roleplaying may a character discern whether his subject is conditioned successfully.
A target may become more tractable even before becoming fully conditioned. Once the vampire accumulates half the required number of successes, the Storyteller may apply a lower difficulty to the vampire’s subsequent uses of Dominate. After being conditioned, the target falls so far under the vampire’s influence that the Kindred need not make eye contact or even be present to retain absolute control. The subject does exactly as she is told (including taking actions that would injure herself), as long as her master can communicate with her verbally. No command roll is necessary unless the subject is totally isolated from the vampire’s presence (in a different room, over the phone). Even if a command roll fails, the target will still likely carry out part of the orders given, simply because her master wishes it.
After the subject is fully conditioned, other Kindred find her more difficult to Dominate. Such conditioning raises others’ difficulties by two (to a maximum of 10).
It is possible, though difficult, to shake Conditioning. The subject must be separated entirely from the vampire to whom she was in thrall. This period of separation varies depending on the individual, but the Storyteller may set it at six months, less a number of weeks equal to the subject’s permanent Willpower rating (so a person with 5 Willpower must stay away from the vampire for just under five months). The subject regains her personality slowly during this time, though she may still lapse into brief spells of listlessness, despair, or even anger. If the vampire encounters the target before that time passes, a single successful Charisma + Leadership roll (difficulty of the target’s current Willpower points) on the part of the vampire completely reasserts the dominance.
If the subject makes it through the time period without intervention by her master, the target regains her former individuality. Even so, the vampire may reestablish conditioning more easily than the first time, since the subject is now predisposed to falling under the Kindred’s mental control. New attempts require half the total number of successes than the last bout of conditioning did (which means the subject reaches the threshold for reduced difficulties sooner, as well).

••••• Possession
System: The vampire must completely strip away the target’s Willpower prior to possessing her. The player spends a Willpower point, then rolls Charisma + Intimidation, while the subject rolls his Willpower in a resisted action (difficulty 7 for each). For each success the vampire obtains over the victim’s total, the target loses a point of temporary Willpower. Only if the attacker botches can the subject escape her fate, since this makes the target immune to any further Dominate attempts by that vampire for the rest of the story.
Once the target loses all her temporary Willpower, her mind is open. The vampire rolls Manipulation + Intimidation (difficulty 7) to determine how fully he assumes control of the mortal shell. Similar to the Animalism power Subsume the Spirit, multiple successes allow the character to utilize some mental Disciplines, noted on the chart below. (Vampires possessing ghouls can use the physical Disciplines the ghoul possesses, but not the mental ones.)
1 success — Cannot use Disciplines
2 successes — Can use Auspex and other sensory powers
3 successes — Can also use Presence and other powers of emotional manipulation
4 successes — Can also use Dementation, Dominate, and other powers of mental manipulation
5 successes — Can also use Chimerstry, Necromancy, Thaumaturgy, and other mystical powers
The character may travel as far from his body as he is physically able while possessing the mortal. The vampire may also venture out during the day in the mortal form. However, the vampire’s own body must be awake to do so, requiring a successful roll to remain awake (see p. 262). If the vampire leaves the mortal shell (by choice, if his body falls asleep, through supernatural expulsion, after sustaining significant injury, etc.), his consciousness returns to his physical form in an instant.
Once freed from possession, the mortal regains mental control of herself. This can happen in an instant, or the victim may lie comatose for days while her psyche copes with the violation.
The vampire experiences everything the mortal body feels during possession, from pleasure to pain. In fact, any damage the victim’s body sustains is also applied to the character’s body (though the Kindred may soak as normal). If the mortal dies before the vampire’s soul can flee from the body, the character’s body falls into torpor. Presumably this is in sympathetic response to the massive trauma of death, though some Kindred believe that the vampire’s soul is cast adrift during this time and must find its way back to the body.
The Kindred can remain in the mortal’s body even if his own torpid form is destroyed, though such a pathetic creature is not likely to exist for long. At each sunrise, the vampire must roll Courage (difficulty 8) or be expelled from the body. If forced from the mortal body, the vampire tumbles into the astral plane, his soul permanently lost in the spirit world. A vampire trapped in a mortal body may not be "re-Embraced." If the Embrace occurs to such a creature, he simply meets Final Death.

Eye Contact (p. 152)
Many myths and stories exist about a vampire’s mystical ability to put people under her spell by looking deeply into her victim’s eyes. The persistence of such stories through the ages isn’t surprising, since a number of Kindred Disciplines powers (most notably Dominate) require eye contact in order to work. Other vampires, learning of this requirement, have attempted everything from wearing mirrored sunglasses to gouging out their own eyes in order to prevent an elder from exerting his will upon them.
But Kindred are not so easily thwarted.
The need for eye contact stems from the aggressor Kindred’s need to see his victim’s soul, and the eyes are the traditionally known as the windows to the soul. While the vampire needs to capture his target’s attention, the target’s eyes need not be present for such a power to work (although the arts of the Tzimisce make this somewhat challenging at times) — they only need to find the soul of his victim laid bare.
A target trying to avoid eye contact can make a Willpower roll against a difficulty equal to Dominate user’s Manipulation + Intimidation (or other appropriate combination for other Disciplines or specific situations, at the Storyteller’s discretion). The difficulty may be reduced for mitigating factors: -1 in the case of the target obscuring his eyes slightly (such as closing her eyes or wearing dark sunglasses) up to a -3 for the eyes being completely unseen (such as with a thick blindfold or having her eyes torn out). Ultimately, however, it is up to the Storyteller to decide whether eye contact is established in a particular case.]==],
				},
				["Flight"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 447


Flight


• The character cannot actually fly, but can soar like a hang-glider. He also cannot carry anything (he needs his hands to help steer). Maximum speed is equal to prevailing winds, or 15 miles/25 kilometers per hour in calm air.

•• The character can make a running takeoff and carry 20 pounds/10 kilograms while flying. Maximum speed is 30 miles/50 kilometers per hour.

••• The character can make a straight, vertical takeoff if unencumbered, or can make a running takeoff carrying up to 50 pounds/25 kg. Maximum air speed is 45 miles/70 kilometers per hour.

•••• The character can now make a vertical takeoff with up to 50 pounds/25 kg of baggage, but can carry up to 100 pounds/45 kg while flying. Maximum speed is 60 miles/95 kilometers per hour.

••••• The character can now carry up to 200 pounds/90 kg, easily enough to carry away an adult person (or vampire). Maximum speed is 75 miles/120 kilometers per hour.

Further dots in the Discipline add 100 pounds/45 kg of weight and 20 miles/30 kilometers per hour to the speed. Gargoyles don’t think of Flight as a Discipline. To them, it’s just flight, part and parcel to being a Gargoyle, and may be baffled by notions such as teaching it to other vampires.]==],
				},
				["Fortitude"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 158


Fortitude


System: A character’s rating in Fortitude adds to his Stamina for the purposes of soaking normal damage (bashing and lethal). A character with this Discipline may also use his dots in Fortitude to soak aggravated damage, though Kindred cannot normally soak things like vampire bites, werewolf claws, magical effects, fire, sunlight, or massive physical trauma. See p. 272, for further details on soaking and damage.]==],
				},
				["Koldunic Sorcery"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 448


Koldunic Sorcery


The actual casting of Koldunic sorcery requires more than a clumsy exertion of will. Such magic demands perfection of form and mastery of the appropriate lore. The caster’s player spends one blood point and rolls (Attribute) + Occult against a difficulty of the power’s level + 3, with the specific Attribute listed for each path or "way." Vampires always use the base Attribute, ignoring any bonuses gained from blood expenditure or other Disciplines. All kolduns must select one of the ways listed below as their primary path.]==],
				},
				["Melpominee"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 453


Melpominee


• The Missing Voice
System: This power functions automatically as long as the character wills it. However, using The Missing Voice while performing any action other than speech or singing incurs a penalty of two dice on that action due to the disruption of the character’s concentration.

•• Phantom Speaker
System: The player rolls Wits + Performance (difficulty 7) and spends a blood point. Each success allows one turn of speech; three or more successes allow speech for an entire scene.

••• Madrigal
System: The player rolls Charisma + Performance (difficulty 7). Each success instills the chosen emotion in a fifth of the Kindred’s audience (more than five successes have no additional effect). The Storyteller decides precisely which members of the audience are affected. Characters may resist this power for the duration of the scene with the expenditure of a Willpower point, but only if they have reason to believe that they are being controlled by outside individuals. The song the vampire sings must also reflect the emotion she wishes to engender — no one’s going to mob the concert security no matter how well she sings "High Hopes," but they might if she performs "I Predict a Riot."
Affected individuals should act in accordance with their Natures — enraged Conformists would join a riot but not start one, aroused Bravos may force their attentions on the object of their desire, and jealous Directors may send cronies after their rivals.
Multiple Daughters may use this Discipline in concert.

•••• Siren’s Beckoning
System: Siren’s Beckoning requires an extended, resisted roll. The player rolls Manipulation + Performance (difficulty equal to the target’s current Willpower); the victim resists with a Willpower roll (difficulty equal to the singer’s Appearance + Performance). If the singer accumulates five more successes than the victim at any point, the hapless soul acquires a new derangement or Psychological Flaw of the Storyteller’s choice. This derangement normally lasts for one night, with an additional night per success over five. With a total of 20 net successes, the Daughter can make it permanent.
Multiple Daughters may use this Discipline in concert.

••••• Virtuosa
System: The Daughter may use Phantom Speaker or Siren’s Beckoning on a number of targets equal to her Stamina + Performance. The player must spend one blood point for every five targets beyond the first.]==],
				},
				["Mytherceria"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 455


Mytherceria


• Folderol
System: The character knows when a target is deliberately lying. No roll or expenditure is necessary for this power to work, but the character must deliberately activate it. Note that this power does not provide any insight into what the truth might be, nor does it enable the vampire to tell if a target is simply stating something false that he believes to be true.

•• Fae Sight
System: The Kiasyd sees faeries and other fae-touched mortals for what they really are, with no roll required. Additionally, the player can detect any form of magic that does not stem from ghosts or the undead, including magic from mages, werewolves, and other such odd sources. The character can recognize these for what they truly are, provided he has seen similar effects before.

••• Aura Absorption
System: The player must make a Perception + Empathy roll. The difficulty is determined by the Storyteller based on the age of the impressions and the mental and spiritual strength of the person who left them. The number of successes determines the amount of information gained, both in terms of images of the scene when the object was being held or touched, and the nature of the person who was holding the object. One scene-type image and one aspect of the person’s identity (Nature, Demeanor, aura, name, sex, or age) becomes clear for each success the player garners on the roll. Anyone attempting to use this power or The Spirit’s Touch on the same object subsequently must accumulate more successes than the Kiasyd did to get any impression at all. The first Kiasyd’s successes subtract from the number of successes scored by anyone trying to read the object thereafter.

•••• Chanjelin Ward
System: The vampire creating the ward inscribes the symbol in a visible location — on a library door, bookshelf, or an individual’s clothing — and the player rolls Intelligence + Larceny (difficulty 7 for inanimate objects, or the subject’s current Willpower +2). Anyone entering the warded area or touching the warded object loses two dice from her Intelligence dice pools as long as she maintains contact with or proximity to the ward. Additionally, anyone seeing the ward becomes addled and lost unless she succeeds on a Wits + Investigation roll (difficulty 8). The Kiasyd is immune to his own wards. The glyphs last for a duration indicated by the number of successes on the Intelligence + Larceny roll:
1 success — One hour
2 successes — One night
3 successes — One week
4 successes — One month
5 successes — One year

••••• The Riddle Phantastique
System: The player rolls Manipulation + Occult (difficulty of the victim’s current Willpower). After a successful roll, the victim can do nothing but sit and ponder the Riddle until she accumulates three times the riddler’s successes. The subject rolls Wits + Occult (difficulty 8, plus or minus the number of derangements the victim has, at the Storyteller’s discretion). She makes this roll as soon as she is told the Riddle, and then once per hour until she has gathered enough successes. Should the victim botch on a roll to solve the Riddle, she takes one level of lethal damage as the mystical enigma racks her body, and she loses all successes from the accumulated total. This damage cannot be healed until the Riddle has been solved. The riddler can end this trance by telling the victim the answer, but no one else can.]==],
				},
				["Necromancy"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 159


Necromancy


System: A Cainite necromancer must learn at least three levels in his primary path before learning his first level in a secondary Necromancy path. He must then master the primary path (all five levels) before acquiring any knowledge of a third path.
As with Thaumaturgy, advancement in the primary path costs the normal experience amount, while study of additional Necromantic paths incurs an additional experience-point cost (see p. 124). Because Necromancy is not quite so rigid a study as Thaumaturgy is, the rolls required to use Necromantic powers can vary from path to path and even within individual paths. The commonly-learned Sepulchre Path is presented first, with the remaining paths presented in alphabetical order.
Statistics for ghosts may be found in Chapter Nine, p. 385.]==],
				},
				["Obeah"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 457


Obeah


• Sense Vitality
System: The Salubri must touch the target to see how close to death she is. He must then make a Perception + Empathy roll (difficulty 7). One success on this roll identifies a subject as a mortal, vampire, ghoul, or other creature. Two successes reveal how many health levels of damage the subject has suffered. Three successes tell how full the subject’s blood pool is (if a vampire) or how many blood points she has left in her system (if a mortal or other blood-bearing form of life). Four successes reveal any diseases in the subject’s bloodstream. A player may opt to learn the information yielded by a lesser degree of success — for example, a player who accumulates three successes may learn whether or not a subject is a vampire as well as the contents of his blood pool.
Alternately, each success on this roll allows the player to ask the Storyteller one question about the subject’s health or health levels. "Was he drugged?" or "Are his wounds aggravated?" are valid questions, but "Did the Sabbat do this?" or "What did the Lupine who attacked him look like?" are not. The Salubri may use this power on herself if she has injuries but has somehow lost the memory of how the wounds were received.
Additionally, at the cost of one blood point, the Salubri may use Empathy for a roll instead of Medicine.

•• Anesthetic Touch
System: If the subject is willing to undergo this process, the player spends a blood point and makes a Willpower roll (difficulty 6) to block the subject’s pain. This allows the subject to ignore all wound penalties for one turn per success. A second application of this power may be made once the first one has expired, at the cost of another blood point and another Willpower roll. If the subject is unwilling for some reason, the player must make a contested Willpower roll against the subject (difficulty 8).
To put a mortal to sleep, the same system applies. The mortal sleeps for five to 10 hours — whatever his normal sleep cycle is — and regains one temporary Willpower point upon awakening. He sleeps peacefully and does not suffer nightmares or the effects of any derangements while asleep. He may be awakened normally (or violently).
Kindred, including the Salubri herself, are unaffected by this power — their corpselike bodies are too tied to death.

••• Corpore Sano
System: This power works on any living or undead creature, but the character must touch the actual injury (or the closest part of the victim’s body, in the case of internal injuries). Each health level to be healed requires the expenditure of one blood point and one turn of contact. Aggravated wounds may also be healed in this manner, but the vampire must spend two blood points instead of one for each aggravated health level.

•••• Shepherd’s Watch
System: The player spends two Willpower points. Erecting this barrier is a standard action, but maintaining it from turn to turn or dropping it is a reflexive action. The invisible barrier extends to about a 3-yard/meter radius from the character, and no one outside that barrier may cross it while she maintains the power. Those within it at its creation may leave and return, however. The barrier moves with the Salubri. It cannot be maintained at a distance.
Those who wish to cross the barrier from the outside, whether friendly or hostile, must best the character in an extended, resisted Willpower roll (difficulty equals the opponent’s current Willpower for the Salubri, and the Salubri’s current Willpower for the opponent). The opponent may cross the barrier as soon as he accumulates three more net successes than the Salubri.

••••• Mens Sana
System: The player spends two blood points and rolls Intelligence + Empathy (difficulty 8). The use of Mens Sana takes at least 10 minutes of relatively uninterrupted conversation. Success cures the subject of one derangement of the Salubri player’s choice. This power cannot cure a Malkavian of his core derangement, though it alleviates its effects for the rest of the scene. A botch inflicts the same derangement on the Salubri for the rest of the scene. This power may not be used by the Salubri to cure her own derangements.]==],
				},
				["Obfuscate"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 184


Obfuscate


• Cloak of Shadows
System: No roll is required as long as the character fulfills the criteria described above. So long as he remains quiet and motionless, virtually no one but another Kindred with a high enough Auspex rating will see him.

•• Unseen Presence
System: No roll is necessary to use this power unless the character speaks, attacks, or otherwise draws attention to himself. The Storyteller should call for a Wits + Stealth roll under any circumstances that might cause the character to reveal himself. The difficulty of the roll depends on the situation; stepping on a squeaky floorboard might be a 5, while walking through a pool of water may require a 9. Other acts may require a certain number of successes; speaking quietly without giving away one’s position, for instance, demands at least three successes. Upon success, the vampire, all her clothing, and objects that could fit into a pocket are concealed.
Some things are beyond the power of Unseen Presence to conceal. Although the character is cloaked from view while he smashes through a window, yells out, or throws someone across the room, the vampire becomes visible to all in the aftermath. Bystanders snap out of the subtle fugue in which Obfuscate put them. Worse still, each viewer can make a Wits + Awareness roll (difficulty 7); if successful, the mental haze clears completely, so those individuals recall every move the character made up until then as if he had been visible the entire time.

••• Mask of a Thousand Faces
System: The player rolls Manipulation + Performance (difficulty 7) to determine how well the disguise works. If the character tries to impersonate someone, he must get a good look at the subject before putting on the mask. The Storyteller may raise the difficulty if the character catches only a glimpse. The chart below lists the degrees of success in manufacturing another appearance. Vampires wishing to mask themselves as a person more attractive than they are must pay additional blood points equal to the difference between the vampire’s Appearance rating and the Appearance of the mask (which means that younger vampires may need to take longer in order to spend the blood necessary).
1 success — The vampire retains the same height and build, with a few slight alterations to his basic features. Nosferatu can appear as normal, albeit ugly, mortals.
2 successes — He looks unlike himself; people don’t easily recognize him or agree about his appearance.
3 successes — He looks the way he wants to appear.
4 successes — Complete transformation, including gestures, mannerisms, appearance, and voice.
5 successes — Profound alteration (appear as the opposite sex, a vastly different age, or an extreme change of size).
Actually posing as someone else carries its own problems. The character should know at least basic information about the individual; especially difficult deceptions (fooling a lover or close friend) require at least some familiarity with the target in order to succeed.

•••• Vanish from the Mind’s Eye
System: The player rolls Charisma + Stealth; the difficulty equals the target’s Wits + Alertness (use the highest total in the group if the character disappears in front of a crowd). With three or fewer successes, the character fades but does not vanish, becoming an indistinct, ghostlike figure. With more than three, he disappears completely. If the player scores more successes than an observer’s Willpower rating, that person forgets that the vampire was there in the first place.
Tracking the character accurately while he appears ghostlike requires a Perception + Alertness roll (difficulty 8). A successful roll means the individual can interact normally with the vampire (although the Kindred looks like a profoundly disturbing ghostly shape). A failed roll results in a +2 difficulty modifier (maximum 10) when attempting to act upon, or interact with, the vampire. The Storyteller may call for new observation checks if the vampire moves to an environment in which he’s difficult to see (heads into shadows, crosses behind an obstacle, proceeds through a crowd). When fully invisible, the vampire is handled as described under Unseen Presence, above.
A person subject to the vanishing makes a Wits + Courage roll (mortals at difficulty 9, vampires at difficulty 5). A successful roll means the individual reacts immediately (although after the vampire performs his action for that turn); failure means the person stands uncomprehending for two turns while her mind tries to make sense of what she just experienced.

••••• Cloak the Gathering
System: The character may conceal one extra individual for each dot of Stealth he possesses. He may bestow any single Obfuscate power at a given time to the group. While the power applies to everyone under the character’s cloak, his player need only make a single roll. Each individual must follow the requirements described under the relevant Obfuscate power to remain under its effect; any person who fails to do so loses the cloak’s protection, but doesn’t expose the others. Only if the vampire himself errs does the power drop for everyone.]==],
				},
				["Obtenebration"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 188


Obtenebration


• Shadow Play
System: This power requires no roll, but a blood point must be spent to activate it. Shadow Play lasts for one scene and requires no active concentration. Kindred cloaking themselves in shadow gain an extra die in their Stealth dice pools and add one to the difficulties of ranged weapon attacks against them. Vampires who use the darkness to make themselves more terrifying add one die to Intimidation dice pools. Opponents plagued by flapping shadows and strangling darkness subtract one die from all Stamina dice pools (including soak). Mortals, ghouls, and other air-breathers reduced to zero Stamina by strangling shadows begin to asphyxiate; vampires lose all appropriate dice but are otherwise unaffected. Only one target or subject may be affected by this power at any given time, though some modicum of concealment is offered to a relatively motionless group.
The unnatural appearance of this power proves extremely disconcerting to mortals and animals (and, at the Storyteller’s discretion, Kindred who have never seen it before). Whenever this power is invoked within a mortal’s vicinity, that individual must make a Courage roll (difficulty 8) or suffer a one-die penalty to all dice pools for the remainder of the scene, due to fear of the monstrous shadows.

•• Shroud of Night
System: The player rolls Manipulation + Occult (difficulty 7). Success on the roll generates darkness roughly 10 feet (three meters) in diameter, though the amorphous cloud constantly shifts and undulates, sometimes even extending shadowy tendrils. Each additional success doubles the diameter of the cloud (though the vampire may voluntarily reduce the area she wishes to cover). The cloud may be invoked at a distance of up to 50 yards/meters, though creating darkness outside the vampire’s line of sight adds two to the difficulty of the roll and requires a blood point’s expenditure.
The tarry mass actually extinguishes light sources it engulfs (with the exception of fire), and muffles sounds until they are indistinguishable. Those within the cloud lose all sense of sight and feel as though they’ve been immersed in pitch. Sound also warps and distorts within the cloud, making it nearly impossible to accomplish anything (+2 difficulty, as per Blind Fighting on p. 274). Even those possessed of Heightened Senses, Eyes of the Beast, Tongue of the Asp, and similar powers suffer the penalty for blindness due to the unnatural darkness. Additionally, being surrounded by the Shroud of Night reduces Stamina-based dice pools by two dice, as the murk smothers and agitates the victims. This effect is not cumulative with Shadow Play, although targets asphyxiate as per Shadow Play if they reach 0 Stamina; more than one unfortunate mortal has "drowned" in darkness.
Mortals and animals surrounded by the Shroud of Night must make Courage rolls per Shadow Play, above, or panic and flee.

••• Arms of the Abyss
System: The player spends a blood point and makes a simple (never extended) Manipulation + Occult roll (difficulty 7); each success enables the creation of a single tentacle. Each tentacle is six feet (two meters) long and possesses Strength and Dexterity ratings equal to the invoking vampire’s Obtenebration Trait — Potence and Celerity dots are added to these Strength and Dexterity ratings, respectively. If the vampire chooses, she may spend a blood point either to increase a single tentacle’s Strength or Dexterity by one or to extend its length by another six feet or two meters. Each tentacle has four health levels, is affected by fire and sunlight as if it were a vampire, and soaks bashing and lethal damage using the vampire’s Stamina + Fortitude. Aggravated damage may not be soaked.
Tentacles may constrict foes, inflicting (Strength +1) lethal damage per turn. Breaking the grasp of a tentacle requires the victim to win a resisted Strength roll against the tentacle (difficulty 6 for each). However, tentacles cannot be used for any kind of manipulation, such as typing or driving.
All tentacles need not emanate from the same source — so long as there are multiple patches of suitable darkness, there are sources for the Arms of the Abyss. Controlling the tentacles does not require complete concentration; if the Kindred is not incapacitated or in torpor, she may control tentacles while carrying out other actions.

•••• Black Metamorphosis
System: The player spends two blood points and makes a Manipulation + Courage roll (difficulty 7) — vampires of lower Generation may have to take two turns to make the transition. Failure indicates the vampire cannot undergo the Black Metamorphosis (though he spends the blood points nonetheless). A botch inflicts two unsoakable health levels of lethal damage on the vampire as darkness ravages his undead body.
While under the effects of the Black Metamorphosis, the vampire possesses four tentacles similar to those evoked via Arms of the Abyss (though their Strength and Dexterity ratings are equal to the vampire’s own Attributes, including dice from Celerity and Potence). These tentacles, combined with the bands of darkness all over the Kindred’s body, subtract two dice from the Stamina and soak dice pools of opponents physically touched in combat, for as long as the vampire remains in contact with the victim. This is not cumulative with other powers in Obtenebration, although targets can asphyxiate at Stamina 0, as per Shadow Play. The vampire may make an additional attack without penalty by using the tentacles (for a total of two attacks, not one additional attack per tentacle). Additionally, the vampire can sense his surroundings fully even in pitch darkness.
The vampire’s head and extremities sometimes appear to fade away into nothingness, while at other times they seem swathed in otherworldly darkness. This, combined with the wriggling tentacles writhing from his body, creates an unsettling sight. Mortals, animals, and other creatures not accustomed to this sort of display must make Courage rolls (difficulty 8) or succumb to a panic that amounts to Rötschreck (though it is inspired by the darkness rather than fire). Many Kindred cultivate this devilish aspect, and the Black Metamorphosis adds three dice to the invoking Kindred’s Intimidation dice pools.

••••• Tenebrous Form
System: The transformation costs three blood points (which may need to occur over three turns, depending on the vampire’s Generation). The vampire is immune to physical attacks while in the tenebrous form (though she still takes aggravated damage from fire and sunlight), but may not herself physically attack. She may, however, envelop and ooze over others, affecting them in the same manner as a Shroud of Night, in addition to using mental Disciplines. Vampires in Tenebrous Form may even slither up walls and across ceilings or "drip" darkness upward — they have no mass and are thus unaffected by gravity. Rötschreck difficulties from fire and sunlight do increase by one for vampires in this form, as the light is even more painful to their shadowy bodies.
Mortals (and others not used to such displays) who witness the vampire transform into unholy shadow require Courage rolls (difficulty 8) in order to avoid the debilitating terror described under Black Metamorphosis.]==],
				},
				["Ogham"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 461


Ogham


• Consecrate the Grove
System: The player spends from one to three blood points, and the character must undertake the process described above. One blood point rouses the plant life in a 10-foot (3-meter) diameter; two blood points doubles that to 20 feet (6 meters); three makes it 40 feet (12 meters). Tracing the desired area takes one turn per blood point spent.
When the blood has been sown, the player rolls Charisma + Survival (difficulty 6). If the roll garners even one success, the plant life animates as the local spirit world is roused to action. Enemies in the area suffer a -2 to all dice pools from distraction and physical interference. Additionally, interlopers must make a Stamina + Athletics roll to avoid three dice of bashing damage from the local flora (provided the local plant life is capable of such damage; trees and brambles probably are, but a grassy meadow doesn’t contain the kind of flora necessary for such an assault). Botching this roll causes the plants to turn on the Lhiannan instead.
This power lasts for one scene.

•• Crimson Woad
System: The character spends one scene tracing the woad on her body; this costs one blood point. The player then rolls Intelligence + Occult (difficulty 7). Each success enables the character to ignore one die of wound penalties from injury. It also subtracts one from the difficulty to avoid frenzy or Rötschreck. This ability lasts through one scene. Additionally, if the character receives more than four health levels of damage, the mystic inscriptions are ruined, and the spirits flee her body.
The Lhiannan may also lash out at her enemies, adding the fury of the woad to her attack. The player may add the number of successes achieved on the above roll to the number of dice rolled for damage for a single close-combat attack (this ability can only be used once per application of Crimson Woad).

••• Inscribe the Curse
System: The player spends three blood points. The Lhiannan must write the foe’s name in blood, and it must be displayed on a part of her body visible to intended target in order for Inscribe the Curse to take effect. The player chooses which curse to enact on the target from the list below; the curse takes effect as soon as the target sees his name. He does not need to understand the language used, but if he can comprehend it, he may resist the curse with a Wits + Occult roll (difficulty 8).
The curses described below expire when the glyph is erased, worn off, or defaced by the Lhiannan’s taking four or more health levels of damage. The curse works differently depending on where the Lhiannan inscribes the target’s name.
Body: Inscribe the name on arms, legs, or belly. The victim’s body becomes ill and weak (+2 to all difficulties on Physical rolls, and all wound penalties are increased by one die) or, in the case of Cainites, the victim cannot use blood other than the one point per day necessary to remain active.
Mind: Inscribe the name across the forehead. The foe becomes confused as parts of his mind become disconnected from one another; he must spend one Willpower point in order to attempt any Knowledge roll or use any magical ability or Discipline (other than Celerity, Fortitude, or Potence). This Willpower doesn’t buy him a success on that roll; it simply allows him to make it.
Voice: Inscribe the name on the throat. The victim loses the power of speech; he can grunt or moan, but cannot say any words.
Soul: Inscribe the name down the sternum and over the heart. The subject loses his will to resist the Beast: difficulties to avoid frenzy are increased by two. Non-vampires are overcome by fear. The target must flee the Lhiannan’s territory unless he succeeds in a Courage roll (difficulty 8).

•••• Moon and Sun
System: The player spends three blood points. The Lhiannan inscribes the desired sigil on her body over the course of 15 minutes. The sigil can be inscribed anywhere, but must be exposed. The character may choose to inscribe both the moon and the sun, but each symbol requires the blood expenditure and 15 minutes to trace it. She can also inscribe these sigils on any voluntary subject.
The sun emblem protects a vampire from the worst effects of fire and sunlight. So long as the symbol remains on the character’s body, the player makes a Stamina roll (difficulty 8) when afflicted by fire or sunlight. If the roll is successful, the damage is considered lethal and the player may roll to soak it normally. This roll must be made every time the character faces such damage.
The moon emblem adds one to the difficulties of Self-Control/Instinct rolls to avoid frenzy (but not Courage rolls to avoid Rötschreck). Other effects of the moon emblem depend on the current phase of the moon:
New Moon: Add one die to Dexterity and Stealth dice pools.
Crescent Moon: Add one die to Wits and Occult dice pools.
Half Moon: Add one die to Perception and Subterfuge dice pools.
Gibbous Moon: Add one die to Charisma and Expression dice pools.
Full Moon: Add one die to Strength and Brawl dice pools.

••••• Drink Dry the Earth
System: The player rolls Perception + Occult (difficulty 8). One success determines if a given location is a suitable site (a decision generally left in the Storyteller’s hands, though a Lhiannan with a high Domain Background may have such a site within her holdings). Two or more successes on this roll grants a rough idea of the site’s power on a scale of 1 to 5. If the character wishes to tap the power of that location, she must spend a scene and one blood point marking various parts of the site with sigils of power, keys for her spirit-shard to unlock the location’s energies.
Once the site is prepared, the player makes a second, reflexive Perception + Occult roll (difficulty 7). Any successes beyond the site’s power rating are ignored. For each success, the player gains two dice, which she may add to any dice pools (except those to avoid frenzy or Rötschreck) for the remainder of the scene. These dice are gone when used, but the character may tap the same location again from turn to turn. The player must make the Perception + Occult roll each time. Each "drink" of the site’s energies depletes it, however, as described below.
The Lhiannan’s spirit-shard is a greedy thing, wearing as it does the garb of a Cainite’s Beast, and drinks the site’s energies recklessly. A Lhiannan can only garner a number of successes equal to 10 times the site’s power rating, after which point the area turns into a barren wasteland, incapable of sustaining life. This sort of activity in particular is certain to attract the attention of Lupines or wizards. A site may replenish itself over a period of years. However, a site that is tapped with Drink Dry the Earth at any point during the year is unable to replenish lost dice at all that year, and if the site is completely drained, it is irrevocably dead.]==],
				},
				["Potence"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 192


Potence


System: Each dot that the vampire has in Potence adds one die to all Strength-related dice rolls. Further, the player can spend one blood point and change his Potence dice into an equal number of automatic successes to all Strength-related rolls for the turn. In melee and brawling combat, successes from Potence (either rolled or automatic) are applied to the damage roll results.]==],
				},
				["Presence"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 193


Presence


• Awe
System: The player spends a blood point and rolls Charisma + Performance (difficulty 7). The number of successes rolled determines how many people are affected, as noted on the chart below. If there are more people present than the character can influence, Awe affects those with lower Willpower ratings first. The power stays in effect for the remainder of the scene or until the character chooses to drop it.
1 success — One person
2 successes — Two people
3 successes — Six people
4 successes — 20 people
5 successes — Everyone in the vampire’s immediate vicinity (an entire auditorium, a mob)
Those affected can use Willpower points to overcome the effect, but must continue spending Willpower every scene for as long as they remain in the same area as the vampire. As soon as an individual spends a number of Willpower points equal to the successes rolled, he shakes off the Awe completely and remains unaffected for the rest of the night.

•• Dread Gaze
System: The player rolls Charisma + Intimidation (difficulty equal to the victim’s Wits + Courage). Success indicates the victim is cowed, while failure means the target is startled but not terrified by the sight. Three or more successes means he runs away in abject fear; victims who have nowhere to run claw at the walls, hoping to dig a way out rather than face the vampire. Moreover, each success subtracts one from the target’s action dice pools next turn.
The character may attempt Dread Gaze once per turn against a single target, though she may also perform it as an extended action, adding her successes in order to subjugate the target completely. Once the target loses enough dice that he cannot perform any action, he’s so shaken and terrified that he curls up on the ground and weeps. Failure during the extended action means the attempt falters. The character loses all her collected successes and can start over next turn, while the victim may act normally again.
A botch at any time indicates the target is not at all impressed — perhaps even finding the vampire’s antics comical — and remains immune to any further uses of Presence by the character for the rest of the story.

••• Entrancement
System: The player spends a blood point and rolls Appearance + Empathy (difficulty equal to the target’s current Willpower points); the number of successes determines how long the subject is Entranced, as per the chart below. (Subjects can still spend Willpower to temporarily resist, like any other Presence power.) The Storyteller may wish to make the roll instead, since the character is never certain of the strength of her hold on the victim. The vampire may try to keep the subject under her thrall, but can do so only after the initial Entrancement wears off. Attempting this power while Entrancement is already in operation has no effect.
Botch — Subject cannot be entranced for the rest of the story.
Failure — Subject cannot be entranced for the rest of the night.
1 success — One hour
2 successes — One day
3 successes — One week
4 successes — One month
5 successes — One year

•••• Summon
System: The player spends a blood point and rolls Charisma + Subterfuge. The base difficulty is 5; this increases to difficulty 7 if the subject was met only briefly. If the character used Presence successfully on the target in the past, this difficulty drops to 4, but if the attempt was unsuccessful, the difficulty rises to 8.
The number of successes indicates the subject’s speed and attitude in responding:
Botch — Subject cannot be Summoned by that vampire for the rest of the story.
Failure — Subject cannot be Summoned by that vampire for the rest of the night.
1 success — Subject approaches slowly and hesitantly.
2 successes — Subject approaches reluctantly and is easily thwarted by obstacles.
3 successes — Subject approaches with reasonable speed.
4 successes — Subject comes with haste, overcoming any obstacles in his way.
5 successes — Subject rushes to the vampire, doing anything to get to her.

••••• Majesty
System: No roll is required on the part of the vampire, but she must spend a Willpower point. A subject must make a Courage roll (difficulty equal to the vampire’s Charisma + Intimidation, to a maximum of 10) if he wishes to be rude or simply contrary to the vampire. Success allows the individual to act normally for the moment, although he feels the weight of the vampire’s displeasure crushing down on him. A subject who fails the roll aborts his intended action and even goes to absurd lengths to humble himself before the vampire, no matter who else is watching. The effects of Majesty last for one scene.]==],
				},
				["Protean"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 199


Protean


• Eyes of the Beast
System: The character must declare his desire to call forth the Eyes. No roll is necessary, but the change requires a full turn to complete. While manifesting the Eyes, the character suffers a +1 difficulty to all Social rolls with mortals unless he takes steps to shield his eyes (sunglasses are the simplest solution). (A vampire without this power who is immersed in total darkness suffers blind-fighting penalties as per p. 274.)

•• Feral Claws
System: The claws grow automatically in response to the character’s desire, and can grow from both hands and feet. The transformation requires the expenditure of a blood point, takes a single turn to complete, and lasts for a scene.
The character attacks normally in combat, but the claws inflict Strength + 1 aggravated damage. Other supernaturals cannot normally soak this damage, although a power such as Fortitude may be used. Additionally, the difficulties of all climbing rolls are reduced by two.

••• Earth Meld
System: No roll is necessary, although the character must spend a blood point. Sinking into the earth is automatic and takes a turn to complete. The character falls into a state one step above torpor during this time, sensing his surroundings only distantly. The player must make a Humanity or Path roll (difficulty 6) for the character to rouse himself in response to danger prior to his desired time of emergence.
Since the character is in an in-between state, any attempts to locate him (catching his scent, scanning for his aura, traveling astrally, and so on) are made at +2 difficulty. Astral individuals cannot affect the vampire directly, instead meeting with a kind of spongy resistance as their hands pass through him. Similarly, digging in the material world encounters incredibly hard-packed earth, virtually as dense as stone.
Attempts at violence upon the submerged vampire from either side return him to his physical nature, expelling the soil with which he bonded in a blinding spray (all Perception-based rolls are at +2 difficulty for the turn). The character himself subtracts two from his initiative for the first turn after his restoration, due to momentary disorientation. Once expelled from the earth, the vampire may act normally.

•••• Shape of the Beast
System: The character spends one blood point to assume the desired shape. The transformation requires three turns to complete (spending additional blood points reduces the time of transformation by one turn per point spent, to a minimum of one). The vampire remains in his beast form until the next dawn, unless he wishes to change back sooner.
While in the animal’s shape, the vampire can use any Discipline he possesses except Necromancy, Serpentis, Thaumaturgy, or Vicissitude (as well as any others the Storyteller deems unavailable). Furthermore, each form gives the character the abilities of that creature. In wolf form, the vampire’s teeth and claws inflict Strength + 1 aggravated damage, he can run at double speed, and the difficulties of all Perception rolls are reduced by two. In bat form, the vampire’s Strength is reduced to 1, but he can fly at speeds of up to 20 miles per hour, difficulties for all hearing-based Perception rolls are reduced by three, and attacks made against him are at +2 difficulty due to his small size.
The Storyteller may allow Gangrel to assume a different animal shape, but should establish the natural abilities it grants the character.

••••• Mist Form
System: No roll is required, although a blood point must be spent. The transformation takes three turns to complete, although the character may reduce this time by one turn for each additional blood point spent (to a minimum of one turn). Strong winds may buffet the character, although Disciplines such as Potence may be used to resist them. Vampires in Mist Form can perceive their surroundings normally, although they cannot use powers that require eye contact.
The vampire is immune to all mundane physical attacks while in mist form, although supernatural attacks affect him normally. Also, the vampire takes one fewer die of damage from fire and sunlight. The character may not attack others physically while in this state — this includes encountering another vampire in mist form. He may use Disciplines that do not require physical substance, however.]==],
				},
				["Quietus"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 203


Quietus


• Silence of Death
System: This power (which costs one blood point to activate) maintains a 20-foot (6-meter) radius of utter stillness around the Kindred for one hour.

•• Scorpion’s Touch
System: To convert a bit of her blood to poison, the Kindred’s player spends at least one blood point and rolls Willpower (difficulty 6). If this roll is successful, and the vampire successfully hits (but not necessarily damages) her opponent, the target loses a number of Stamina points equal to the number of blood points converted into poison — vampires attempting to drink the blood of the Kindred with Scorpion’s Touch are automatically considered to be "successfully hit."
The victim may resist the poison with a Stamina + Fortitude roll (difficulty 6); successes achieved on the resistance roll subtract from the vampire’s successes. The maximum number of blood points a Kindred may convert at any one time is equal to her Stamina. The number of successes scored indicates the duration of the Stamina loss.
1 success — One turn
2 successes — One hour
3 successes — One day
4 successes — One month
5 successes — Permanently (though Stamina may be bought back up with experience)
If a mortal’s Stamina falls to zero through use of Scorpion’s Touch, she becomes terminally ill and loses any immunity to diseases, her body succumbing to sickness within the year unless she somehow manages to increase her Stamina again. If a Kindred’s Stamina falls to zero, the vampire enters torpor and remains that way until one of her Stamina points returns. If a Kindred is permanently reduced to zero Stamina, she may recover from torpor only through mystical means.
To afflict someone with the poison, the Cainite must touch her target’s flesh or hit him with something that carries the venom. Many Assamites lubricate their weapons with the excretion, while others pool the toxin in their hands (or fleck their lips with the poison, for a "kiss of death") and press it to their opponents. Weapons so envenomed must be of the melee variety — arrows, sling stones, bullets, thrown weapons, and the like cannot carry enough of the stuff to do damage, or it drips off in flight. Players whose vampires wish to spit at their targets must make a Stamina + Athletics roll (difficulty 6). No more than two blood points’ worth of poison may be expectorated, and a Kindred may spit a distance of 10 feet (3 meters) for each point of Strength (and Potence) the character possesses. Vampires with Quietus are immune to their own poison, but not the blood-venom of other Kindred with this power.

••• Dagon’s Call
System: The vampire must touch her target prior to using Dagon’s Call. Within an hour thereafter, the vampire may issue the call, though she need not be in the presence or even in the line of sight of her target.
Invoking the power costs one Willpower point. The Kindred’s player makes a contested Stamina roll against the target’s Stamina; the difficulty of each roll is equal to the opponent’s permanent Willpower rating. The number of successes the vampire using Dagon’s Call achieves is the amount of lethal damage, in health levels, the victim suffers. For an additional point of Willpower spent in the next turn, the vampire may continue using Dagon’s Call by engaging in another contested Stamina roll. So long as the Kindred’s player continues to spend Willpower, the character may continue rending her opponent from within.

•••• Baal’s Caress
System: Baal’s Caress does not increase the damage done by a given weapon, but that weapon inflicts aggravated damage rather than normal. No roll is necessary to activate this power, but one blood point is consumed per hit. For example, if a Cainite poisons his knife and strikes his opponent (even if he inflicts no damage), one blood point’s worth of lubrication disappears. For this reason, many vampires choose to coat their weapons with a significant quantity of blood. If the vampire misses, no tainted blood is consumed.

••••• Taste of Death
System: The vampire may spit up to 10 feet (3 meters) for each dot of Strength and Potence he possesses. Hitting the target requires a Stamina + Athletics roll (difficulty 6). Each blood point spewed at the target inflicts two dice of aggravated damage, and there is no limit (other than the vampire’s capacity and per-turn expenditure maximum) to the quantity of blood with which a target may be deluged.]==],
				},
				["Sanguinus"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 463


Sanguinus


• Brother’s Blood
System: The player spends a blood point, which may be used to heal any member of the circle, regardless of distance from the character. The Blood Brother may also "bank" blood, spending five points to heal another’s aggravated wound over the course of several turns. This power takes effect automatically; no roll is necessary. Blood spent by another Frankenstein does not count against the maximum amount of vitae the target character can spend per turn.

•• Octopod
System: The "donor" player spends a blood point for each limb or organ he wishes to loan to the other circle member. (Only the donor needs to have this level of mastery of Sanguinus; the recipient may be any other member of the donor’s circle.) The loaned organs appear at the end of that turn, in whatever location the recipient wishes — eyes on the back of heads or on the ends of hands have been seen, as have entire heads located between a Blood Brother’s legs. Use of this power does not impart any extra attacks, but it may allow for additional sensory input, more blood to be consumed in a single turn, or extra hands to hold weapons or pin down foes. Only external organs may be loaned in this manner — hearts, stomachs, and brains cannot.

••• Gestalt
System: This power confers several benefits on the Blood Brothers. For this power to work, however, every Blood Brother in the circle must spend a blood point. If even one member cannot or will not spend a blood point, this power fails. Once a Blood Brother has met the Final Death, he is no longer a part of the circle, so the power continues to function among the still-undead members of the group. Gestalt lasts for one scene. While this power is active:
• Dominate, Presence, and the like take effect against the highest Willpower rating in the circle. For example, if a vampire attempts to Dominate a Blood Brother under the influence of Gestalt, she must roll against the highest Willpower rating any of the vampires in the circle possesses, even if her subject has the lowest Willpower rating in the circle. Additionally, a Blood Brother affected by powers in this manner drops out of the Gestalt, though Gestalt remains active for others. This mental "fuse" was supposedly created to prevent the entire circle from being Dominated by a vampire looking into the eyes of one Blood Brother.
• Perception difficulties for all Blood Brothers in the circle decrease by three, as they share the sensory input of other vampires in the circle.
• By taking no action other than concentrating, a Blood Brother may "loan" an Ability to another brother. For example, a wounded vampire with Melee 4 may step out of combat and loan a circle-mate with Melee 2 his mastery of that Skill. The "borrowing" vampire makes Ability checks against the loaned Trait as if it were his own.
• The Blood Brothers in the Gestalt may communicate through telepathy, allowing them to coordinate actions. In game terms, only one initiative roll is made for the circle, based on the character with the highest initiative rating (see p. 271).
Not all Blood Brothers in the circle need to have this level of Sanguinus to benefit from the Gestalt. If a given character does not know this power, though, the player rolls Wits + Occult (difficulty 7) when the power is enacted. If this roll fails, the character can still receive loaned Abilities, but gains no other benefits from the Gestalt.

•••• Walk of Caine
System: Each member of the circle can "donate" one step in Generation. In the example listed above, the vampire of Eleventh Generation could take one step from his two circle-mates and drop to Ninth, but the vampire of Thirteenth Generation couldn’t drop lower than Eleventh. No matter how big the circle, no Blood Brother can drop to an effective Generation lower than Fourth. Likewise, a Thirteenth Generation Blood Brother can drop to an effective Generation of Fourteenth, which carries with it the penalties listed for the Fourteenth Generation Flaw (p. 481). (He cannot go to Fifteenth Generation, however.)
As with Gestalt, only one Blood Brother needs to know this power in order to begin the process. Any that don’t have Walk of Caine need to make a Stamina + Awareness roll (difficulty 7). If this roll fails, they may not participate in the action.

••••• Coagulated Entity
System: Every vampire in the circle who wishes to become part of the Coagulated Entity spends three blood points. Three turns after the process begins, the monster is complete and able to act. The vampire of the lowest Generation who is part of the construct guides the creature’s actions. The actual Generation of the creature itself, however, is the highest Generation of any vampire present in the construct, less one for each additional vampire present in the construct. (Using the previous example, the Eleventh-Generation vampire would be the guide but the highest Generation is 13, so the overall Entity would be 13 minus 2, or Eleventh Generation.)
The creature’s Strength, Stamina, and Perception are equal to the guide’s, with a +1 for every additional vampire contained within. (Generational limits do not apply to this creature — through sheer size, a Coagulated Entity may have a Strength of 7 or more.) All physical actions undertaken by the monstrosity gain one extra die to the pool for each vampire beyond the first present in the construct (before splitting dice pools).
Only one vampire in the circle needs to possess Sanguinus at Level Five for this power to work. Body parts tend to shift during the creation of a Coagulated Entity — fanged maws at the ends of hands and eyes atop fleshy stalks have been reported by terrified survivors. Storytellers should feel free to give any bonuses (or penalties) to the construct as they see fit.
A Coagulated Entity may not be staked, as it has too many hearts in unconventional places for any but the blindest luck to impale. It has a vampire’s normal seven health levels, plus two for each additional vampire who becomes part of the entity (treat these extra health levels as Bruised). The entity remains congealed for one scene, unless the Storyteller wishes to rule that no one told the Blood Brothers to separate.]==],
				},
				["Serpentis"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 209


Serpentis


• The Eyes of the Serpent
System: No roll is required, but this power can be avoided if the mortal takes care not to look into the vampire’s eyes. Vampires and other supernatural creatures can also be affected by this power if the Cainite’s player succeeds on a Willpower roll (difficulty 9). If attacked or otherwise harmed, supernatural creatures can spend a point of Willpower to break the spell.
Note: This is different than normal eye contact detailed on p. 152. The target must be able to see the vampire’s eyes for Eyes of the Serpent to work.

•• The Tongue of the Asp
System: The lash of the tongue’s razor fork causes aggravated wounds (difficulty 6, Strength damage). If the Kindred wounds her enemy, she may drink blood from the target on the next turn as though she had sunk her fangs into the victim’s neck. Horrifying though it is, the tongue’s caress is very like the Kiss, and strikes mortal victims helpless with fear and ecstasy. Additionally, the tongue is highly sensitive to vibrations, enabling the vampire to function effectively in the darkness the Clan prefers. By flicking his tongue in and out of his mouth, the vampire can halve any penalties relating to darkness (p. 274).

••• The Skin of the Adder
System: The vampire spends one blood point and one Willpower point. Her skin becomes scaly and mottled; this, combined with the character’s increased flexibility, reduces soak difficulties to 5. The vampire may use her Stamina to soak aggravated damage from claws and fangs, but not from fire, sunlight, or other supernatural energies. The vampire’s mouth widens and fangs lengthen, enabling her bite to inflict an extra die of damage. Finally, the vampire may slip through any opening wide enough to fit her head through.
The vampire’s Appearance drops to 1, and she is obviously inhuman if observed with any degree of care, though casual passersby might not notice, if the vampire is in darkness or wearing heavy clothing.

•••• The Form of the Cobra
System: The vampire spends one blood point; the change is automatic, but takes three turns. Clothing and small personal possessions transform with the vampire. The vampire remains in serpent form until the next dawn, unless he desires to change back sooner. The Storyteller may allow the Setite bonus dice on all Perception rolls related to smell, but the difficulties for all hearing rolls are increased by two. The cobra’s bite inflicts damage equal to the vampire’s, but the vampire does not need to grapple his victim; furthermore, the poison delivered is fatal to mortals.

••••• The Heart of Darkness
System: This power requires no roll. Those who witness a vampire pull his heart from his breast (or cut the heart from another vampire) must make Courage rolls. Failure indicates anything from strong uneasiness to complete revulsion, possibly even Rötschreck.]==],
				},
				["Setite Sorcery"] = {
					en = [==[Rites of Blood, p. 36


Setite Sorcery


There are many different types of Setite sorcery, from voudoun-like wanga to the Egyptian-based akhu. The Serpents of the Light, and their parent Clan, the Followers of Set, have put a great deal of energy into the practice of magic, creating a number of radically different theosophies concerning conjuration and enchantment.
The Serpents of the Light reject Theophidian (Set-based) doctrine in all forms. They accept Caine’s place as the first vampire, rather than adhering to their parent Clan’s beliefs that Set did not descend from the Dark Father. Serpents of the Light believe that through death, one can become a god. If they grow powerful enough, they believe, they can rise to seize rulership of the earth, and control of the spirit-world as well. When a group of militant Egyptian Setites (more than half of whom were Warrior Setites) tried to force New World serpents into accepting their Orthodoxy, they drove a great number of Afro-Caribbean Setites into the Sword of Caine. Because of this schism in doctrine (both magical and theosophical), the Serpents of the Light have a great bitterness toward the Followers of Set, and often seek their parent Clan’s destruction.
The sorcery of the Serpents of the Light requires many levels of initiation. A seeker passes through circles of mystery and learns more with each step along the path. The four Serpents of the Light who hold the highest initiation are called the empereurs, and these vampires are receptacles of a majority of Cobra wisdom and knowledge. Because of the nature of their initiatory tutelage, Cobras are even more jealous of their magical secrets than most other thaumaturges within the Sect, refusing to share knowledge of their ritual practices even with other Cobras – unless those adherents have passed the proper initiation rites.]==],
				},
				["Spiritus"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 465


Spiritus


• Aid from Spirits
System: The character touches the object, and the player spends a blood point and rolls Manipulation + Occult (difficulty 6). If the roll succeeds, the player receives a bonus to her dice pool using that item, equal to the number of successes rolled. For example, if the character uses this power on a gun and the player rolls three successes, she then receives a +3 to her next Firearms roll made with that gun. Unused bonuses fade at the end of the scene, and multiple uses of this power do not combine (the most recent use trumps any previous uses). The character can, however, use the power on multiple objects she uses in the same scene, so long as she has the blood for it.

•• Summon Spirit Beasts
System: The animal summoned must be native to the area — just because the local zoo hosts a tiger doesn’t mean there are tiger-spirits running about. The player must spend one blood point and roll Charisma + Animal Ken (difficulty 7). The number of successes indicates how long the spirit remains material. The spirits have the same number of health levels their physical counterparts would normally have (see p. 388 for some sample animals traits). If they are reduced to Incapacitated, they discorporate.
1 success — One turn
2 successes — Five turns
3 successes — One hour
4 successes — One night
5 successes — One week

••• Aspect of the Beast
System: The player spends a blood point and rolls Manipulation + Occult (difficulty 7). The power lasts for one turn per success, unless otherwise noted. Some examples of aspects are given below, though the player and Storyteller are welcome to make up others:
Beaver’s Bite — This makes the Ahrimane’s bite strong and sharp enough to cut through almost any substance (though it does no additional damage to living or unliving targets).
Chameleon’s Colors — The Ahrimane becomes capable of changing color to suit the environment (-2 difficulties to all Stealth rolls involving hiding).
Ears of the Hare — The Ahrimane can hear as well as a rabbit, reducing the difficulty of Perception rolls involving hearing by two.
Falcon’s Eye — The Ahrimane can see great distances as if she had the eyes of a falcon (-3 to all Perception rolls involving vision).
Ferocity of the Cougar — All Courage rolls are made at -2 difficulty.
Leapfrog — This grants the Ahrimane the ability to leap three times the normal height and distance. (See p. 260 for jumping rules.)
Nose of the Hound — The Ahrimane’s sense of smell is far greater than that of a mortal. She can even track by scent with on a Perception + Survival roll (difficulty set by Storyteller).
Serpent’s Venom — The Ahrimane’s bite transmits a venomous toxin that causes two health levels of damage in living victims per turn (see "Poisons and Drugs," p. 301). The damage continues until the toxin is removed or nullified, or until the Ahrimane’s spirit power ends.
Sound of the Cricket — This grants the power to produce an annoying, grating sound loud enough to deafen those nearby. The target suffers a +4 to all Perception rolls related to hearing for the next scene unless he succeeds on a Willpower roll (difficulty 7).
Squirrel’s Balance — The Ahrimane can move about in the branches and limbs of trees or across tightropes with little fear of falling. All such Athletics rolls have their difficulties decreased by two.
Strength of the Bear — This gives the Ahrimane two extra dots of Strength.
Swiftness of the Stag — The Ahrimane can move at twice her normal running speed.

•••• Engling Fury
System: The player rolls Manipulation + Intimidation (difficulty 8). Every success allows her to regain a point of Willpower, but each use of this power destroys another spirit.

••••• The Wild Beast
System: The change does not require a roll, but the player must spend two blood points. The change raises the vampire’s Strength by three, and Dexterity and Stamina each by two. Appearance falls to 0 and Manipulation is reduced by three. The vampire’s fangs inflict an extra die of damage, and she grows claws that inflict aggravated damage. The character can see in the dark, and all difficulties involving scent, hearing, and vision fall by two. The character can retain the Wild Beast form for a number of hours every night equal to her Willpower rating.]==],
				},
				["Temporis"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 467


Temporis


• Hourglass of the Mind
System: Once purchased, this Discipline gives a vampire a perfect sense of time. The vampire knows events to the nearest second or better. Moreover, the Cainite knows whenever the flow of time is mystically disturbed by use of Celerity, greater levels of Temporis, mortal wizardry, or stranger things. Sensing disturbances is instinctive and reflexive, though it requires a successful Perception + Awareness roll (difficulty 6 for most phenomena, as modified by the Storyteller for distance and intensity).

•• Recurring Contemplation
System: The vampire concentrates on a single victim in his line of sight. The player rolls Manipulation + Occult (difficulty equal to the victim’s current Willpower). With any successes, the victim falls into a light trance and relives the most recent experiences that preceded her fugue. Alternately, the vampire may evoke another set of specific memories and circumstances from the victim’s past, provided that he has some means of telepathically drawing them forth. The recurring events must be relatively benign, insofar as nothing noteworthy happens or nothing happens that would demand the victim’s immediate action. Thus, in the example of the sentry, the vampire could entrance him and walk past unobserved, but not if the sentry spotted him before invoking the power. Ordinarily, the fugue lasts one minute per success. If the vampire’s player spends a blood point to fuel this power, determine the trance’s duration according to the following chart:
1 success — one minute
2 successes — 10 minutes
3 successes — one hour
4 successes — six hours
5+ successes — one day
Entranced victims are oblivious to their surroundings and the actual flow of time around them. However, the fugue ends immediately if the victim suffers any damage or experiences a sudden jolt to her senses, such as a thunderclap or even a gentle nudge. Normal conversation does not break the trance, although shouting does.

••• Leaden Moment
System: The player spends one blood point and rolls Intelligence + Occult. The difficulty depends on the size and nature of the target: a single thrown brick is only difficulty 4, while a crazed ghoul has a difficulty of 9. Targets larger than an adult human cannot be affected with Leaden Moment. It is possible to affect small, closely grouped inanimate objects of the same nature as a single object, though this increases the difficulty by two or more at the Storyteller’s discretion (a hail of bullets might be difficulty 9). This power may be activated reflexively as a defensive action against projectiles, but otherwise requires a full action on the vampire’s initiative. Though failure carries no special penalty apart from wasting blood, a botch means the vampire mistakenly slows himself rather than the target, counting every 1 as a success for that purpose.
If the vampire succeeds, the object slows to one-half its true speed. Every two successes beyond the first reduce this speed by one additional factor, so three successes slows the target to one third its speed, five successes yields quarter speed, etc. The actual mechanics of such slowing depend on the situation. For projectiles, multiply any successes to hit and final damage by the speed factor, rounded down. Similarly apply the speed modifier to the successes of other actions involving Dexterity, Wits, or Strength for slowed characters. Characters with Celerity may spend one blood point to negate one factor of speed reduction at the expense of the usual extra action provided – for example, one blood point cancels a reduction to one half speed, two blood points cancel one third, etc. Leaden Moment lasts one turn for every two successes rolled, rounded up.

•••• Patience of the Norns
System: The player spends two blood points and rolls Intelligence + Occult (difficulty 6). The vampire must be able to perceive the object that he’s suspending, so the player may need to make a Perception + Alertness roll at a difficulty determined by the Storyteller in order to freeze fast-moving objects. If an object exceeds the speed of mortal perception, superhuman perception such as Auspex is required in order to see and stop it (as such, bullets can be stopped with this power, but only if the vampire has at least a dot of Auspex). Objects frozen by this power remain halted according to the number of successes rolled:
1 success — one turn
2 successes — one minute
3 successes — 10 minutes
4 successes — one hour
5 successes — one day
6+ successes — one week per success over 5
Suspended objects retain all energy in their suspension, releasing none to the outside universe. A suspended knife has no kinetic energy as far as the rest of the world is concerned and hangs suspended in mid-air until the power is interrupted or the duration expires. Suspended alchemical or chemical processes also halt, including fire. However, any physical contact more substantial than a falling raindrop breaks the suspension.

••••• Clotho’s Gift
System: The player spends three blood points and rolls Intelligence + Occult (difficulty 7). For a number of turns equal to half the vampire’s Temporis rating, rounded up, the character may take a number of extra actions at her full dice pool equal to the number of successes rolled. These actions follow the timing rules associated with Celerity, but may be used to take any action. A vampire may use the actions granted by Clotho’s Gift to activate Disciplines multiple times, even Disciplines that cannot be used more than once in a turn (such as Dominate or Thaumaturgy). However, for every action spent activating a Discipline, the vampire suffers one level of unsoakable lethal damage. Only one important exception exists: Any attempt to stack extra actions through Celerity, subsequent applications of Clotho’s Gift or other powers results in immediate Final Death, as the vampire collapses into ash as though burned by the sun.]==],
				},
				["Thanatosis"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 471


Thanatosis


• Hag’s Wrinkles
System: This power requires one turn to shape the wrinkles and the expenditure of a blood point. If the power is used to distort a character’s features, the Samedi player must roll Stamina + Subterfuge (difficulty 8). Success raises the difficulty to visually identify the character by one and lasts for one hour per success rolled. If the character is attempting to hide a small object (a wallet, a letter, a small pistol), the roll and duration are the same, but all rolls made to see if the object is detected (for example, a pat-down search or a security guard’s visual inspection) are at +2 difficulty.

•• Putrefaction
System: This power first requires that the character touch his intended target. The player then rolls Dexterity + Medicine (difficulty of the target’s Stamina + Fortitude) and spends a blood point. Success inflicts one health level of lethal damage on the target and removes one point of the victim’s Appearance. This Appearance loss returns to vampires at the rate of one point per night, but is permanent for mortals (though plastic surgery can correct mortals’ physical disfigurement). If a mortal suffers three or more health levels of damage from repeated uses of this power in one scene, gangrene or other ailments may occur.
Putrefaction can also be used on plants, in which case the target becomes blighted and withered. It cannot, however, be used on inanimate objects such as cars or wooden stakes.

••• Ashes to Ashes
System: The transformation to ashes requires one turn and the expenditure of two blood points. While the character is in ash form, the player must make a Perception + Alertness roll (difficulty 9) for any scene in which she wishes her character to be aware of her surroundings. Reforming from the heap of ashes takes one turn. If the character is in a confined space (such as an urn), she explodes from it in a suitably dramatic manner as she brings herself back to full size. If a Samedi is scattered while in this form, one health level and one blood point are lost for each tenth (roughly) of the character that has been dissipated. Five blood points are required to heal each health level lost in this manner. At the Storyteller’s discretion, the Samedi may be missing limbs or vital organs (though never the head or the heart) until the missing health levels are healed.

•••• Withering
System: The Samedi must touch the limb he intends to shrivel. The player spends a Willpower point and rolls Manipulation + Medicine (difficulty equal to the victim’s Stamina + Fortitude). Three successes are required for this power to shrink a limb. With one or two successes, the victim takes one health level of bashing damage, which may be soaked normally, but is otherwise unaffected. (If the Withering attempt is successful, the subject suffers no health level of damage, but rather the withering of the limb itself.)
The effects of Withering fade after one night if a vampire or other supernatural creature is the victim, but mortals (including mages) are permanently afflicted unless some type of supernatural healing is used. If this power is used on an arm or leg, the limb instantly becomes useless. If this power is used on an opponent’s head, mortal victims die instantly. Kindred lose two points from all Mental Attributes while their heads are shrunken and are unable to use any Disciplines except Celerity, Fortitude, and Potence. Multiple uses of this power on the same appendage have no additional effect.

••••• Necrosis
System: The Samedi must make contact with the victim. The player spends two blood points and rolls Dexterity + Medicine (difficulty of the target’s Stamina + Fortitude). The victim takes a number of health levels of lethal damage equal to the number of successes rolled and suffers additional effects as listed below.
1 success — No additional effects
2 successes — Lose one point of Appearance
3 successes — Lose a point each of Appearance and Dexterity
4 successes — Lose a point each of Appearance, Dexterity, and Strength
5+ successes — Lose two points of Appearance and one each of Dexterity and Strength
Attributes lost in this manner are regained when all damage from the Necrosis attack is healed. If a victim is reduced to zero Strength or Dexterity, he is unable to move except for weak flailing and crawling but may still use Disciplines and spend blood points normally.]==],
				},
				["Thaumaturgy"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 212


Thaumaturgy


Thaumaturgy encompasses blood magic and other sorcerous arts available to Kindred. The Tremere Clan is best known for their possession (and jealous hoarding) of this Discipline. The Tremere created Thaumaturgy by combining mortal wizardry with the power of vampiric vitae, and as a result it is a versatile and powerful Discipline. Although there are whispers of the existence of Tremere antitribu in the Sabbat, other Clans in the Sword of Caine have also researched and developed access to such mystical might. Nevertheless, the Tremere of the Camarilla remain this Discipline’s masters.
Like Necromancy, the practice of Thaumaturgy is divided into paths and rituals. Thaumaturgical paths are applications of the vampire’s knowledge of blood magic, allowing her to create effects on a whim. Rituals are more formulaic in nature, most akin to ancient magical "spells." Because so many different paths and rituals are available to the arcane Tremere, one never knows what to expect when confronted with a practitioner of this Discipline.
When a character first learns Thaumaturgy, the player selects a path for the character. That path is considered the character’s primary path, and she automatically receives one dot in it, as well as one Level One ritual. Thereafter, whenever the character increases her level in Thaumaturgy, her rating in the primary path increases by one as well. Additional rituals are learned separately, as part of a story; players need not pay experience points for their characters to learn rituals up to the level equal to their overall rating in Thaumaturgy, though they must find someone to teach the rituals in question. Path ratings never exceed 5, though the overall Thaumaturgy score may. If a character reaches a rating of 5 in her primary path and increases her Thaumaturgy score afterward, she may allocate her "free" path dot to a different path. (Experience costs are covered on p. 124.)
Many Kindred fear crossing the practitioners of Thaumaturgy. It is a very potent and mutable Discipline, and almost anything the Kindred wishes may be accomplished through its magic.

Thaumaturgical Paths
Paths define the types of magic a vampire can perform. A vampire typically learns his primary path from his sire, though it is not unknown for some vampires to study under many different tutors.
As mentioned before, the first path a character learns is considered her primary path and increases automatically as the character advances in the Discipline itself. Secondary paths may be learned once the character has acquired two or more dots in her primary path, and they must be raised separately with experience points. Furthermore, a character’s rating in her primary path must always be at least one dot higher than any of her secondary paths until she has mastered her primary path. Once the character has achieved the fifth level of her primary path, secondary paths may be increased to that level.
Each time the character invokes one of the powers of a Thaumaturgical path, the thaumaturge’s player must spend a blood point and make a Willpower roll against a difficulty equal to the power’s level +3. Only one success is required to invoke a path’s effect — path levels, not successes, govern the power of blood magic. Failure on this roll indicates that the magic fails. A botch causes some kind of loss or catastrophic backfire, such as losing a Willpower point (or dot!), spontaneous combustion, or accidentally letting a living statue run rampant. Thaumaturgy is an unforgiving art.
Various Sects and Clans have different access to each path, but unless the Storyteller decides otherwise, it is assumed the Tremere have some access to all of them. ("Having access" does not mean the same thing as "easily gained," especially within the Tremere power structure.) The paths start with one of the most common (The Path of Blood), and thereafter are presented in alphabetical order. (The unusual "path" of Thaumaturgical Countermagic is also presented, although it is considered a separate Discipline – see p. 228 for details.)]==],
				},
				["Valeren"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 474


Valeren


• Sense Vitality
System: This power works identically to the Obeah power of the same name (p. 457).

•• Anesthetic Touch
System: This power works identically to the Obeah power of the same name (p. 458).

••• Burning Touch
System: The vampire must touch his subject for this power to take effect, and the effects diminish rapidly after he removes his hand. The player spends at least one blood point to activate this power, and each blood point spent reduces the victim’s dice pools by two while the Fury is in contact with the victim. This power is often used for interrogation or torture, wearing down the subject’s resistance and rendering him much more tractable.

•••• Armor of Caine’s Fury
System: The player spends one blood point and rolls Stamina + Melee (difficulty 7). For each success, the character gains one point of armor protection against bashing and lethal damage, to a maximum of five points of protection. Additionally, for every two successes rolled, she gains an additional die to resist Rötschreck from the effects of battle (but not fire or sunlight). This power works for one scene.

••••• Vengeance of Samiel
System: This power costs three blood points. Any single attack made by the vampire automatically hits the target as mystic forces guide the blow. Attacks made in this manner may not be dodged, though they may be blocked, parried, and soaked as normal. The blow strikes as if the Salubri antitribu had succeeded with all of his Dexterity + Melee or Brawling dice pool (which makes for significant damage). This power may be used only once per turn, and only then the Salubri antitribu’s sole action is the attack. Additionally, this power does not work for ranged weapons; only bare hands or melee weapons.]==],
				},
				["Vicissitude"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 241


Vicissitude


• Malleable Visage
System: The player must spend a blood point for each body part to be changed, then roll Intelligence + Medicine (difficulty 6). To duplicate another person or voice requires a Perception + Medicine roll (difficulty 8), and five successes are required for a flawless copy; fewer successes leave minute (or not-so-minute) flaws. Increasing one’s Appearance Trait has a difficulty of 9, and the vampire must spend an additional blood point for each dot of Appearance increased beyond their natural total. A botch permanently reduces the Attribute by one.

•• Fleshcraft
System: After spending a blood point, the vampire must grapple the intended victim. The player of the Flescrafting vampire makes a successful Dexterity + Medicine roll (difficulty variable: 5 for a crude yank-and-tuck, up to 9 for precise transformations). A vampire who wishes to increase another’s Appearance Trait does so as described under Malleable Visage; reducing the Attribute is considerably easier (difficulty 5), though truly inspired disfigurement may dictate a higher difficulty. In either case, each success increases or reduces the Attribute by one.
A vampire may use this power to move clumps of skin, fat, and muscle tissue, thus providing additional padding where needed. For each success scored on a Dexterity + Medicine roll (difficulty 8), the vampire may increase the subject’s soak dice pool by one, at the expense of either a point of Strength or a health level (vampire’s choice).

••• Bonecraft
System: The vampire’s player must spend a blood point and make a Strength + Medicine roll (difficulties as above). Bonecraft may be used without the flesh-shaping arts, as an offensive weapon. Each success scored on the Strength + Medicine roll (difficulty 7) inflicts one health level of lethal damage on the victim, as his bones rip, puncture, and slice their way out of his skin.
The vampire may utilize this power (on herself or others) to form spikes or talons of bone, either on the knuckles as an offensive weapon or all over the body as defensive "quills." If bone spikes are used, the vampire or victim takes one health level of lethal damage (the vampire’s comes from having the very sharp bone pierce through his skin — this weaponry doesn’t come cheaply). In the case of quills, the subject takes a number of health levels equal to five minus the number of successes (a botch kills the subject or sends the vampire into torpor). These health levels may be healed normally. Knuckle spikes inflict Strength +1 lethal damage. Defensive quills inflict a hand-to-hand attacker’s Strength in lethal damage unless the attacker scores three or more successes on the attack roll (in which case the attacker takes no damage); the defender still takes damage normally. Quills also enable the vampire or altered subject to add two to all damage inflicted via holds, clinches, or tackles.
A vampire who scores five or more successes on the Strength + Medicine roll may cause a rival vampire’s rib cage to curve inward and pierce the heart. While this does not send a vampire into torpor, it does cause the affected vampire to lose half his blood points, as the seat of his vitae ruptures in a shower of gore.

•••• Horrid Form
System: The Horrid Form costs two blood points to awaken. All Physical Attributes increase by three, but all Social Attributes drop to zero, except when dealing with others also in Horrid Form. However, a vampire in Horrid Form who is trying to intimidate someone may substitute Strength for a Social Attribute. Damage inflicted in brawling combat increases by one due to the jagged ridges and bony knobs creasing the creature’s hands.

••••• Bloodform
System: The vampire may transform all or part of herself as she deems fit. Each leg can turn into two blood points worth of vitae, as can the torso; each arm, the head, and the abdomen convert to one blood point each. The blood can be reconverted to the body part, provided it is in contact with the vampire. If the blood has been utilized or destroyed, the vampire must spend a number of blood points equal to what was originally created to regrow the missing body part.
A vampire entirely in this form may not be staked, cut, bludgeoned, or pierced, but can be burned or exposed to the sun. The vampire may ooze along, drip up walls, and flow through the narrowest cracks, as though she were in Tenebrous Form (p. 190).
Mental Disciplines may be used, provided no eye contact or vocal utterance is necessary, although the vampire can perceive her surroundings just fine (but the perceptions are always centered on the largest pool of blood). If a vampire in this form "washes" over a mortal or animal, that mortal must make a Courage roll (difficulty 8) or fly into a panic.]==],
				},
				["Visceratika"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 475


Visceratika


• Skin of the Chameleon
System: The player spends one blood point. For the rest of the scene, the Gargoyle’s Stealth dice pool is increased by five. This power is subject to the limitations described above. Any ground movement faster than a walk negates this power’s effect, as does flight (at the Storyteller’s discretion).

•• Scry the Hearthstone
System: The player spends a Willpower point to activate this power, which remains in effect as long as the Gargoyle is within or in contact with the target structure, or until the next sunset. Scry the Hearthstone may be used on anything up to the size of a cave complex, a large theatre, a parking garage, or a mansion. The character gains an innate sense of the location and approximate size and physical condition of all living (or unliving) beings within the structure. To pinpoint a specific individual’s location with this power, the player must succeed in a Perception + Awareness roll (difficulty 6). If the subject is attempting to hide, he may oppose this roll with a roll of Wits + Stealth (difficulty 6).
Scry the Hearthstone may be used to detect the presence of characters who are under Obfuscate or similar powers. In this case, the Gargoyle only knows that there is someone present — she cannot actually see the individual in question. To determine the Gargoyle’s ability to detect Obfuscated characters, compare the relative levels of the Gargoyle’s Visceratika minus one and the intruder’s Obfuscate as per the "Seeing the Unseen" sidebar on p. 142.

••• Bond with the Mountain
System: The player spends two blood points, and the merge takes four turns to complete. This power functions in a fashion similar to the Protean 3 power of Earth Meld, and may only be performed upon bare rock or a similar substance. However, the Gargoyle does not sink fully into the substance with which he merges, and his outline can be detected within the stone with a successful Perception + Alertness roll (difficulty 9). A Gargoyle attacked while Bonded with the Mountain has triple his normal soak dice pool against all forms of attack. However, if he sustains three or more lethal health levels of damage from a single attack, he is forced out of his bond and suffers disorientation similar to that experienced by an Earth Melded character whose slumber is interrupted.

•••• Armor of Terra
System: This power is automatic and requires no roll; it is always in effect. A vampire with Armor of Terra has one extra soak die for all aggravated and lethal attacks and two for all bashing attacks, reduces all wound penalties by one, and halves the damage dice pool of any fire-based source of injury (this Discipline does not change the rules for Rötschreck, however). The difficulty of all touch-based Perception rolls is increased by two, due to the desensitization of the character’s skin.

••••• Flow Within the Mountain
System: Once the character has used Bond with the Mountain, the player spends two more blood points to activate Flow Within the Mountain for the duration of the scene. The Gargoyle can move within stone and cement (otherwise using the same rules as the Protean power Earth Control, p. 200). The character can also use this power to walk through a stone wall and emerge on the other side without first using Bond with the Mountain. In this case, the player spends one blood point and rolls Strength (difficulty 8; Potence adds dice or successes normally). The Gargoyle may flow through a maximum thickness in feet equal to the number of successes rolled, or 30 times the number of successes rolled in centimeters. If the wall or barrier is thicker than this, the character is trapped within it until he is chiseled out or uses Flow Within the Mountain to escape.]==],
				},
				-- <<< DISC_DESC_END
};
