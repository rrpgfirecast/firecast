-- Path descriptions, the [en] half (SPEC T495, V210).
--
-- descPath.lua used to hold en and pt side by side, and require pulled BOTH in to read one:
-- half of every parse was the language the session never opens (SPEC R92f). T495 split it
-- in two. This file holds [en] only, descPath_pt.lua holds the other, the two carry the SAME
-- keys, and the renderer requires the half the sheet is set to - require("descPath_" .. lang ..
-- ".lua"), never a constant name (SPEC V210b). Nothing was removed: both files ship in the
-- .rpk and no entry is dropped (SPEC V210a). The generator markers migrated verbatim to
-- both sides, so every region parser still aims at the same shape (SPEC I24).
--
-- Path descriptions for the Vampire tab (SPEC I21). One entry per canonical picker
-- value, keyed in ENGLISH because that is what the sheet saves (SPEC V24); `pt` is a
-- translation of the same three blocks, source line for source line.
--
-- SPEC I24 / T479-T481: this table used to be an upvalue inside the <script> of HH.13.lfm.
-- The <script> CDATA is copied raw into constructNew_*(), so every open sheet parsed and
-- kept its own copy. As a module it is parsed once and cached in package.loaded, and the
-- require that pulls it lives INSIDE pathText (SPEC V198).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24). The generator
-- markers migrated verbatim, so research/rebuild_ritual_desc.sh and the .tsv maps still aim
-- at the same region - only the path of the target changed.

return {
				-- >>> PATH_DESC_BEGIN (generated - SPEC T445)
				["Ash Path"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 163


Ash Path


• Shroudsight
System: A simple roll of Perception + Awareness (difficulty 7) allows a necromancer to utilize Shroudsight. The effects last for a scene.

•• Lifeless Tongues
System: To use Lifeless Tongues requires a roll of Perception + Occult (difficulty 6) and the expenditure of a Willpower point.

••• Dead Hand
System: The player spends a point of Willpower and makes a successful Wits + Occult roll (difficulty 7) to activate Dead Hand for one scene. For each additional scene the vampire wishes to remain in contact with the Underworld, he must spend a point of blood.

•••• Ex Nihilo
System: Using Ex Nihilo takes a tremendous toll on the necromancer. To activate this power, the vampire must first draw a doorway with chalk or blood on any available surface. (The vampire may draw doors ahead of time for exactly this purpose.) The player must then expend two points of Willpower and two points of blood before making a Stamina + Occult roll (difficulty 8) as the vampire attempts to open the chalk door physically. If the roll succeeds, the door opens and the vampire steps through into the Underworld.
When the vampire wishes to return to the real world, he merely needs to concentrate (and the player spends another Willpower point and rolls Stamina + Occult, difficulty 6). At Storyteller discretion, a vampire who is too deeply immersed in the Underworld may need to journey to a place close to the lands of the living in order to cross over. Vampires who wander too far into the lands of the dead may be trapped there forever.
Vampires in the Underworld cannot feed upon ghosts without the use of another power; their only sustenance is the blood they bring with them.

••••• Shroud Mastery
System: To exercise Shroud Mastery, the necromancer expends two points of Willpower, then states whether he is attempting to raise or lower the Shroud. The player then makes a Willpower roll (difficulty 9). Each success on the roll raises or lowers the difficulties of all nearby wraiths’ attempts to cross the Shroud in any way by one, to a maximum of 10 or a minimum of 3. The Shroud reverts to its normal strength at a rate of one point per hour thereafter.]==],
				},
				["Awakening of the Steel"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 440


Awakening of the Steel


• Confer with the Blade
System: The number of successes determines the amount of information the sorcerer gains regarding the blade’s history and its present state, as well as all information yielded by a lesser number of successes. With three or more successes, the sorcerer may lower the difficulty on his next attempt to apply a blood-magic ritual to the weapon by one.
1 success — Physical information only: precise length and weight (to the micrometer and milligram), chemical composition (assuming the character understands metallurgy), number of damage dice and type of damage (lethal or aggravated).
2 successes — Historical overview: when and where the blade was forged, the name and face of its smith, brief glimpses of significant events in its existence.
3 successes — Sorcerous understanding: the type and relative level of power of any enchantments or supernatural enhancements that the blade possesses as well as the name and face of the individual who laid them.
4 successes — Subliminal synthesis: comprehensive knowledge of the sword’s history. For the next seven nights, the character recognizes the taste of any blood that has ever stained the blade if she tastes it herself.
5 successes — Total communion: The sword and the wielder become linked at a level deeper than the physical and more enduring than the immediate. The Storyteller determines what information the sword holds for the character, but it may include any event in the blade’s history or any aspect of its present existence and condition.

•• Grasp of the Mountain
System: For the rest of the scene, the character has a number of automatic successes to resist all attempts to disarm him, equal to the number of successes rolled. He cannot accidentally drop the blade (which means his botches are likely to result in self-mutilation instead of an empty hand). If the character is somehow disarmed in spite of Grasp of the Mountain, he may call the blade back to his hand by successfully invoking this power again, assuming he has a clear line of sight to the weapon.

••• Pierce Steel’s Skin
System: While Pierce Steel’s Skin is in effect, an attack against an unarmored target inflicts half damage (rounded down). However, for a number of turns equal to the number of successes rolled, each successful attack the character makes against an armored foe inflicts damage on the target’s body armor rather than injuring him directly. Only metal armor can be damaged by this power. When the character makes a successful attack against an armored target, the player does not roll damage. Instead, he rolls a number of dice equal to the sword’s damage bonus (the number of dice that it adds to his Strength) against a difficulty of 7. Each success reduces the armor’s soak bonus by one die. Armor that is reduced to zero soak dice in this manner is completely destroyed and unsalvageable. Additional successes beyond those needed to destroy a piece of armor have no effect.
At the Storyteller’s discretion, Pierce Steel’s Skin may destroy other inanimate objects (walls, doors, cars, dramatically appropriate obstacles) without significant damage to the sword. For the purposes of this power, Fortitude counts as part of the target’s Stamina, not external armor.

•••• Razor’s Shield
System: For a number of turns equal to the number of successes rolled, the character may attempt to parry projectiles. This requires one action for each projectile that the player wishes to block, and the character must be able to see the shot coming (Heightened Senses allows visual tracking of bullets). Each parrying attempt requires a Dexterity + Melee roll, with a difficulty determined by the speed of the projectile. Thrown objects have a difficulty of 6, arrows and crossbow bolts a difficulty of 7, and bullets a difficulty of 9. Each success subtracts one success from the attacker’s attack roll.
Razor’s Shield does not allow the character to parry ranged attacks that do not incorporate solid projectiles, such as flame, lightning, or spat blood.

••••• Strike at the True Flesh
System: The effects of Strike at the True Flesh last for a number of turns equal to the number of successes rolled, and they end with the first successful attack that the character makes within this time period. The sword inflicts only the base amount of lethal damage that a weapon of its size and type would normally cause, disregarding all enhancements that it may have received (though augmentations to the wielder’s strength or speed, such as Potence and Celerity, still have their normal effects, as do extra successes on the attack roll).
However, all the target’s supernatural defenses (including Fortitude) are likewise negated — he soaks the attack only with his base Stamina. If the negation of his powers and defenses renders the target unable to soak lethal damage, he cannot soak the attack at all. Body armor does protect against this attack, as it is a mundane form of defense.]==],
				},
				["Bone Path"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 164


Bone Path


• Tremens
System: To use Tremens, the necromancer spends a single blood point, and the player must succeed on a Dexterity + Occult roll (difficulty 6). The more successes that are achieved, the more complicated an action can be effected in the corpse. One success allows for an instantaneous movement, such as a twitch, while five allow the vampire to set up specific conditions under which the body animates (“The next time someone enters the room, I want the corpse to sit up and open its eyes.”). Under no circumstances can Tremens cause a dead body to attack or cause damage.

•• Apprentice’s Brooms
System: A roll of Wits + Occult (difficulty 7) and the expenditure of a point of both blood and Willpower are all that is necessary to animate corpses with Apprentice’s Brooms. The number of corpses animated is equal to the number of successes achieved. The necromancer must then state the task to which he is setting his zombies. The cadavers turn themselves to their work until they finish the job (at which point they collapse) or something (including time) destroys them.
Corpses animated in this way have no initiative of their own, and are unable to make value judgments. They respond to very literal instruction. Thus, a zombie could be told “sweep this room every day until all the dust and cobwebs are gone” or “transcribe this manuscript” with an expectation of reasonable results, while a more open-ended command such as “fix this motorcycle” or “research this Necromantic ritual and write down the results” would be doomed to failure.
Bodies energized by this power continue to decay, albeit at a much slower rate than normal.

••• Shambling Hordes
System: The player spends a point of Willpower. The player then must succeed on a Wits + Occult roll (difficulty 8). Each success allows the vampire to raise another corpse from the grave, and costs one blood point. If the player cannot or chooses not to pay the blood point cost of additional zombies past a certain number, the extra successes are simply lost. Each zombie can follow one simple instruction, such as “Stay here and guard this graveyard against any intruders,” or “Kill them!”
Note: Zombies created by Shambling Hordes will wait forever if need be to fulfill their functions. Long after the flesh has rotted off their mystically animated bones, the zombies will wait and wait and wait, still able to perform their duties.

•••• Soul Stealing
System: The player spends a point of Willpower and then makes a contested Willpower roll against the intended victim (difficulty 6). Successes indicate the number of hours during which the original soul is forced out of its housing. The body itself remains autonomically alive but catatonic.
This power can be used to create suitable hosts for Daemonic Possession. It has no effect on Kindred or other supernatural creatures (except ghouls) until such creatures are dead — in the case of vampires, this means Final Death.

••••• Daemonic Possession
System: The body in question must be no more than 30 minutes dead, and the new tenant must agree to inhabit it — a ghost or astral form cannot be forced into a new shell. However, most ghosts would gladly seize the opportunity. Should the vampire, for whatever reason, wish to insert a soul into another vampire’s corpse (before it crumbles to ash), the necromancer must achieve five successes on a resisted Willpower roll against the original owner of the body. Otherwise, the interloper is denied entrance.
Note: The soul can use whatever physical abilities (Athletics, Brawl, Potence) his new fleshy home possesses, and whatever mental abilities (Computer, Law, Presence) he already possessed. He cannot use the physical abilities of his old form, or the mental abilities of his new one.]==],
				},
				["Cenotaph Path"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 166


Cenotaph Path


• A Touch of Death
System: The necromancer simply touches a person or object that he suspects is a victim of ghostly influence. The player rolls Perception + Awareness (difficulty 6). If successful, the necromancer can determine whether a ghost has exerted any sort of power on the subject, or even crossed nearby, to the duration detailed below.
1 success — Last turn; detect use of ghostly powers.
2 successes — Last three turns; detect use of ghostly powers.
3 successes — Last hour; detect ghost’s touch and use of ghostly powers.
4 successes — Last day; detect ghost’s touch and use of ghostly powers.
5 successes — Last week; detect nearby passage of ghost, ghost’s touch, and use of ghostly powers.
On a failure, the necromancer receives no impressions. A botch reveals a misleading answer (an object may seem tinged with ghostly power when it’s not, or vice versa). Should the necromancer succeed in detection while touching an object or person that a ghost is possessing, he immediately becomes aware that the ghost is still inside. The impression gained in such a case is sufficient to count as an image of the spirit for purposes of the Sepulchre Path’s powers, so the Kindred may be able to (for example) immediately command a ghost to exit a person whom it possesses.

•• Reveal the Catene
System: The necromancer holds and examines the object for at least three turns — if it’s an item, this means turning it over in his hands, running his fingers along it, or otherwise giving it a critical eye; with a person, this may require a more… invasive… examination. The player then spends a blood point and rolls Perception + Occult (difficulty 7). If successful, the Kindred determines whether the object holds any significance to any ghost and, with three or more successes, the identity of at least one such ghost (which allows the Kindred to use the Sepulchre Path on that wraith, if desired). If the necromancer already knows any of the ghosts involved, their ties are revealed with their identity — so, if the necromancer already knows a wraith well enough to summon and compel it with other powers, successful identification of a fetter tells whether the object is tied to that ghost, in addition to any other impressions gained.
If a botch is scored, the necromancer can never successfully use this power on the item being examined.

••• Tread Upon the Grave
System: The player simply declares intent to sense the Shroud in an area and makes a Willpower roll (difficulty 8). Success reveals whether the location is highly attuned to the Shadowlands, about average (not particularly close to the world of the dead), or far removed from the realm of death. A failing attempt at using the power has no adverse effect, though it may be attempted only once per scene (so the necromancer must either wait for a time or move to a different area before attempting Tread Upon the Grave once more).
A botch stuns the necromancer into inaction for a full turn and costs him a temporary Willpower point, as he is overcome by shivers and a sense of overwhelming despair.
With three or more successes, the necromancer can determine whether the Shroud’s strength has been artificially altered in the area.

•••• Death Knell
System: Whenever someone dies and becomes a ghost within a half-mile or kilometer of the necromancer, she automatically senses the demise (though many choose to ignore this “always-on” power unless actively seeking someone). This power does not automatically pinpoint the location of the new ghost or identify it, but the player may spend one Willpower point and roll Perception + Occult (difficulty 7) for the necromancer to gain a vague sense of the distance and direction to the new wraith. With one success, the Kindred may sense a vague pull in a general direction; with three successes, the necromancer can sense the direction and guess distance to within a quarter-mile or half a kilometer. With five successes, the necromancer immediately senses the location of the new ghost to within one foot or 30 cm. A failure carries no penalty but a botched attempt sends the necromancer scurrying off in the wrong direction.
The Storyteller may rule that disturbances in the Underworld, intervening magic, or other similar phenomena cloud this sensation, simply to prevent overburdening a chronicle with constant ghost-hunting and dice rolling.

••••• Ephemeral Binding
System: The necromancer must coat an object with his blood (a full blood point’s worth); if the subject is a person, then that individual must ingest the vitae. The player marks off the blood point, spends a point of Willpower, and rolls Manipulation + Occult (difficulty 8). If successful, the item temporarily becomes a fetter to one wraith. If the Kindred already knows the name of the wraith or has a strong psychic impression, then the object can become a fetter at any range, even to a ghost who normally does not come near the living world (so long as the ghost still exists). Otherwise, the necromancer must be able to see or sense the ghost (with Witness of Death, Shroudsight, or other such means).
A fetter artificially created in this fashion functions for all necromantic and ghostly purposes as a normal fetter: It can be detected with other Necromancy powers, the vampire gains a bonus to Necromancy against the wraith attuned to it, and the ghost similarly finds exertion of its powers easier upon the subject (so the vampire might turn an unwitting ghoul into a consort for a wraith familiar with possession…). The ghost can sink into the fetter to heal; conversely, if the fetter is destroyed, the wraith is banished to some inaccessible region of the Underworld, perhaps never to return.
A fetter created with Ephemeral Binding lasts for one night per success scored. The expenditure of an additional point of Willpower increases this duration to a week per success, whereas spending a permanent dot of Willpower extends the duration to a year and a day.
Botching with this power not only causes failure but also makes the ghost immediately aware of what the necromancer was trying to do. Most ghosts do not take kindly to meddling Kindred trying to make artificial chains for them.]==],
				},
				["Corpse in the Monster"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 168


Corpse in the Monster


• Masque of Death
System: The player spends one blood point for the character to gain the form described. Those afflicted with the Masque of Death lose two points of Dexterity and Appearance (minimum of 1 in Dexterity and 0 in Appearance) for the duration of the power. The player also gets two extra dice to his Intimidation dice pool, should he wish to terrify any onlookers. Further, if the character remains perfectly still, observers must roll five successes on a Perception + Medicine roll (difficulty 7) to distinguish the character from a normal corpse. The player doesn’t need to roll anything to have the character stop moving — vampires have no autonomic functions.
If the user inflicts Masque of Death on another vampire, he must spend a blood point, touch the target, and then make a Stamina + Medicine roll (difficulty equal to the target’s Stamina + 3). The Masque of Death lasts until the next sunset, unless the character who created the masque wishes to extinguish its effects earlier.

•• Cold of the Grave
System: The player spends one Willpower point. For the remainder of the scene, the character takes no wound penalties, and the player gains an additional die to all dice pools that involve resisting emotional manipulation, such as Intimidation or Empathy. However, the player also loses a die from dice pools to emotionally manipulate others. The character is a cold fish to those she interacts with, and they do not respond readily to her. The Cold of the Grave does not protect the character against the depredations of the Beast. She may be emotionally cold on the surface, but if others taunt and anger her sufficiently, she is still subject to frenzy as normal.

••• Curse of Life
System: The player spends one Willpower and rolls Intelligence + Medicine (difficulty 8) to affect a target within line of sight and no farther than 20 yards or meters from the character. If the roll succeeds, the target suffers the weaknesses of the living without gaining any benefit from that state. He does not become immune to sunlight or holy artifacts, for instance. However, he does become badly distracted by mundane needs, with the net result that his player suffers a +2 difficulty penalty to all rolls. He can ignore these distractions at the cost of one Willpower point per scene. Additionally, the victim cannot use blood to raise his Physical Attributes while this power is in effect, and Willpower cannot eliminate this penalty. The power remains in effect until the next sunset.

•••• Gift of the Corpse
System: The player spends one Willpower and rolls Stamina + Occult (difficulty 8). For every success, the character can spend one turn in a state in which he is more akin to an animated corpse than a vampire. Holy artifacts and sanctified ground have no effect, and the character is immune to frenzy and Rötschreck. Sunlight does only bashing damage, and then only if bare skin is exposed on a clear day. Being staked through the heart is only as much of a danger as getting stabbed through his dead spleen would be. Fire harms him only as it would a mortal — causing lethal damage instead of aggravated.
Should the character end the power’s duration while exposed to any of the aforementioned harmful things, he immediately takes their full effect. If he is staked, he become immobilized; if he is on or near fire, he begins to take the damage a Cainite should take, and he must immediately roll against Rötschreck.

••••• Gift of Life
System: The player spends 12 blood points, burning as much blood as possible each turn until she meets that level. She then rolls Stamina + Occult (difficulty 6) and needs only one success for the power to work. A botch has catastrophic effects. The character might be instantly killed or might inadvertently Embrace her victim, for example. If it takes longer than one turn to spend the necessary blood to enact this ability, it does not take effect until all 12 points have been spent. However, the blood must be spent continuously — the vampire cannot burn five, run off and feed, then burn seven more an hour later. On the other hand, she may feed as she activates the power — in one turn she might burn one blood point while drinking three. Since few Kindred above the Seventh Generation can easily expend such an amount of blood, the most efficient way to activate this power is to have a human nearby who can be sacrificed to power the transformation.
After her transformation, the character gains many traits of an ordinary human. She is largely immune to the scorching effects of the sun (Fortitude difficulties to soak damage from direct sunlight are halved, and she takes no damage if she is sufficiently covered), and she can experience and enjoy many of the fine things about human life. She retains a few of her vampiric benefits, however. Fortitude and Auspex abilities remain in place if she has either of those Disciplines, and the Storyteller may allow her to retain other Disciplines as well if he deems them dramatically appropriate. She also retains a vampire’s benefits when it comes to handling bashing damage. However, she is still vulnerable to holy artifacts, human faith, and being staked. Her blood remains vitae, not human blood. Use of this ability — which creates a mockery of human life — may interfere with a character’s Path advancement, at the Storyteller’s discretion.
The vampire is no more vulnerable to fire than any other mortal while in this half-alive state, but she still suffers somewhat from the Beast. Frenzy and Rötschreck difficulties are halved (round up). She can remain active during the day without Humanity or Path-based dice pool caps, although she is certainly tired during the day, since that is not her usual time of activity.
Her Beast exacts a dangerous retribution when her day of “life” is done. Although its influence is greatly suppressed during this power’s duration, the Beast has its way with the vampire for the next six nights, as all difficulties to resist frenzy increase by three. The wise necromancer hides herself away somewhere during that period, but, depending on morality and temperament, enforced isolation might drive her to frenzy on its own.]==],
				},
				["Die Herrschaft des Wyrm"] = {
					en = [==[Dark Ages Tome of Secrets, p. 109


Die Herrschaft des Wyrm


• Malfean Infection
System: The infernalist must know the name of her target, and paint an eye on her palm in vitae. For each success on the Path use, the victim loses any powers associated with his True Faith for a number of nights:
1 success — One night
2 successes — Three nights
3 successes — One week
4 successes — One month
5 successes — One year
6 or more successes — Permanent (or until removed via a blessing)
If reflected back on the infernalist due to a botched roll or the victim successfully combating the effect with a Wits + Occult roll, the Malfean Infection prevents Dark Thaumaturgy’s use for a number of nights corresponding to the number of successes, as stated above. This limitation can be removed through a new subservient deal with a demon.

•• Bane to the Soul
System: The infernalist must hold an item or article once touched by her target, and drip vitae upon it. A demonic Bane will attach to the target’s soul on a success, increasing the difficulty of Virtue tests by +2 (to a maximum of 9). Each success determines how long the Bane remains:
1 success — One night
2 successes — Three nights
3 successes — One week
4 successes — One month
5 successes — One year
6 or more successes — Permanent (or until removed via a blessing)

••• Dissonant Miserere
System: The infernalist must possess a piece of the victim’s skin, hair, or a nail, and soak it in vitae. The Wyrm’s screaming mouths enter the victim’s mind, increasing the difficulty of all Willpower tests and any test requiring concentration by one point per success rolled (to a maximum of difficulty 9), and removes a temporary Willpower point from the victim each night it remains.
The effect is permanent, until the victim receives a blessing or calls upon a madness demon to relieve him of this pain. If the latter occurs, the demon — a shrieking creature without tangible form — will offer the victim a reprieve in exchange for a service. The nature of this service depends on how weak-willed the demon believes the victim is at this point (and is determined by the Storyteller), but typical requests include the murder of an innocent, the divestment of all worldly goods, or a sacrifice of vitae to the infernalist.

•••• Feed the Wyrm
System: The infernalist must possess a portion (one blood point) of the victim’s blood, mix his vitae with it, and drink the concoction. This may form a blood bond, if the blood is that of another vampire. Once the blood is swallowed, a successful roll inflicts one level of aggravated damage per success. This damage may be soaked with Fortitude. The victim’s body contorts with pain and manifests inhuman growths, reducing her Appearance rating by two dots. The Appearance loss is cumulative if this power is used more than once.
The victim may only recover her Appearance rating by agreeing to serve the Wyrm. If she does so, an urge demon of vanity appears in a reflective surface and demands a sacrifice, the severity of which is determined by how great a loss of beauty has occurred. Sacrifices may entail ripping the smile from a newborn’s face, slaying a dozen virgins, or the victim allowing a Maeljin to permanently inhabit her soul.

••••• House the Maeljin
System: The infernalist must murder a mortal or vampire with whom they hold a close relationship. If the victim is a vampire, the infernalist must perform diablerie on his prey. A successful roll manifests one of the Maeljin in the body of the infernalist. Each success determines how long the Maeljin remains:
1 success — One scene
2 successes — One night
3 successes — Two nights
4 successes — Four nights
5 successes — One week
6 or more successes — Permanent (or until removed via a blessing)
If the Maeljin remains permanently, the vampire runs the risk of losing all control to the demon inside them. It then becomes a race to achieve purification before the Maeljin can exert absolute dominance.
The natures of the various Maeljin differ. As beings of elemental unholiness, they represent abstract sins, such as shame, loss, anger, and a multitude of further intangible concepts. Maeljin all empower their host with six points to spread among Attributes (no Attribute may gain more than two), six points to spread among Abilities, and six points to spread among Disciplines (no Discipline may gain more than two). The Storyteller decides where these points are allocated on the character sheet.
As examples of how a possessing Maeljin may empower its host, a Maeljin of Lust might allocate six points across Social Attributes, place three points in Performance and another three in Expression, with two points going to Presence, two more to Dominate, and the final two on Daimonion. A Maeljin of Lies may allocate two points to Manipulation, two to Intelligence, and two to Dexterity, with six points spread among coercive Abilities. The final six might be allocated to Obfuscate, Presence, and Chimerstry.
An inhabiting Maeljin allows its host to practice the powers it has bestowed freely. It wants the host empowered and terrible. However, occasionally it will attempt to sway or outright control its host into acting in ways favorable to its alien agenda. In such cases, the vampire must make an Instinct/Self-Control roll (difficulty 8) to not act in the way the Maeljin wishes. The Storyteller determines the Maeljin’s wishes. It may attempt to exert control once a night.
As the Maeljin approaches the conclusion of its inhabitation, it seeks to consume the host by driving him into an act of self-destruction. The Maeljin can only attempt this once, but to resist throwing himself onto a pyre, greeting the sun, or walking into a sanctified building, the vampire must succeed on a Courage roll (difficulty 9). If his coterie attempts to restrain him, he immediately falls to frenzy. The Maeljin will depart peacefully if unsuccessful in its attempt to claim the entire soul of its host.]==],
				},
				["Elemental Mastery"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 214


Elemental Mastery


• Elemental Strength
System: The player allocates a total of three temporary bonus dots between the character’s Strength and Stamina. The number of successes on the roll to activate the power is the number of turns these dots remain. The player may spend a Willpower point to increase this duration by one turn. This power cannot be “stacked” — one application must expire before the next can be made.

•• Wooden Tongues
System: The number of successes dictates the amount and relevance of the information that the character receives. One success may yield a boulder’s memory of a forest fire, while three may indicate that it remembers a shadowy figure running past, and five will cause the rock to relate a precise description of a local Gangrel.

••• Animate the Unmoving
System: This power requires the expenditure of a Willpower point with less than four successes on the roll. Each use of this power animates one object no larger than human-sized; the caster may simultaneously control a number of animate objects equal to his Intelligence rating. Objects animated by this power stay animated as long as they are within the caster’s line of sight or up to an hour, although the thaumaturge can take other actions during that time.

•••• Elemental Form
System: The number of successes determines how completely the character takes the shape she wishes to counterfeit. At least three successes are required for the character to use her senses or Disciplines while in her altered form. This power lasts for the remainder of the night, although the character may return to her normal form at will.

••••• Summon Elemental
System: The character must be near some quantity of the classical element corresponding to the spirit he wishes to invoke. The spirit invoked may or may not actually follow the caster’s instructions once summoned, but generally will at least pay rough attention to what it’s being told to do. The number of successes gained on the Willpower roll determines the power level of the elemental.
The elemental has three dots in all Physical and Mental Attributes. One dot may be added to one of the elemental’s Physical Attributes for each success gained by the caster on the initial roll. The Storyteller should determine the elemental’s Abilities, attacks, and damage, and any special powers it has related to its element.
Once the elemental has been summoned, the thaumaturge must exert control over it. The more powerful the elemental, the more difficult a task this is. The player rolls Manipulation + Occult (difficulty of the number of successes scored on the casting roll + 4), and the number of successes determines the degree of control:
Botch — The elemental immediately attacks the thaumaturge.
Failure — The elemental goes free and may attack anyone or leave the scene at the Storyteller’s discretion.
1 success — The elemental does not attack its summoner.
2 successes — The elemental behaves favorably toward the summoner and may perform a service in exchange for payment (determined by the Storyteller).
3 successes — The elemental performs one service, within reason.
4 successes — The elemental performs any one task for the caster that does not jeopardize its own existence.
5 successes — The elemental performs any task that the caster sets for it, even one that may take several nights to complete or that places its existence at risk.]==],
				},
				["Grave’s Decay"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 171


Grave’s Decay


• Destroy the Husk
System: The player spends one blood point as the vampire drips her vitae onto the corpse. The player then rolls Intelligence + Medicine (difficulty 6). One success is all that is needed to render the corpse into dust, although the process takes a number of turns equal to five minus the successes.

•• Rigor Mortis
System: The player spends a point of Willpower and rolls Intelligence + Medicine (difficulty 7). Each success freezes the target in place for one turn. A failure simply indicates the loss of the Willpower point, while a botch renders the target immune to powers in the Grave’s Decay path for the next 24 hours. The target must be visible and within about 25 yards or meters for this ability to take effect. A frozen target is treated as though he has been staked (see p. 280). With a Willpower roll (difficulty 7) and two successes, the target can break out of the rigor on her turn. Failure causes her a level of bashing damage and means another turn wasted and frozen.

••• Wither
System: The player spends a Willpower point. The character chooses a limb on the target and then touches that limb. If the target is trying to avoid contact, the invoker’s player rolls Dexterity + Brawl to hit as normal. If the character succeeds in touching the intended limb, the target suffers two aggravated wounds. Unless the target soaks both wounds (such as with Fortitude), the struck limb is crippled and unusable until both of those wounds have healed. Kindred heal the wounds as they would any other aggravated wound (see p. 285). Mortals are incapable of healing aggravated wounds, so they suffer throughout their lives unless they are healed through supernatural means. A withered limb does not degenerate further, even on a mortal. The character may be crippled for life, but the limb won’t become infected or gangrenous.
The effects of the withering depend on the affected limb. A crippled arm has a Strength of 0, cannot benefit from Potence, and cannot carry anything heavier than about half a pound (200 grams). A crippled leg prevents the character from moving faster than a stuttering hop or dragging limp. The character suffers the effects of the Lame Flaw (see p. 482). A single withered eye or ear imposes a +1 difficulty to relevant Perception rolls. Losing both eyes or both ears imposes the effects of the Blind or Deaf Flaws (see pp. 484 and 483). A withered tongue imposes the effects of the Mute Flaw (p. 483), while a withered face reduces the target’s Appearance by one for each aggravated wound suffered.

•••• Corrupt the Undead Flesh
System: The player chooses a target within her character’s line of sight and no more than 20 yards or meters away. She rolls Intelligence + Medicine (difficulty 6) and spends a point of Willpower. The victim’s player must roll Stamina (+ Fortitude, if appropriate) against a difficulty equal to the attacker’s Willpower. If the player scores more successes than the victim, he acquires a virulent disease immediately. The disease has the following effects:
• The victim’s Strength and Wits are halved (round down).
• The victim loses one point of Dexterity.
• The victim’s player must spend one additional blood point every evening for the vampire to rouse himself to consciousness. Mortals lose one health level per day instead.
• The victim’s player must roll Self-Control or Instinct each time the character feeds (difficulty 8). On a failure, the vampire cannot keep the blood he just ingested inside his body, and he vomits it up in great horrifying gouts of gore, losing any benefit the blood might have provided. Humans vomit up food.
Every evening at sunset, the victim has a chance to throw off the plague. The victim’s player rolls Stamina, with a difficulty equal to 10 minus the number of sunsets since acquiring the plague. On a successful roll, the character fights the disease to a standstill and begins to recover. He instantly regains his ability to manage blood, and he heals back one lost Attribute point per hour until all have returned.

••••• Dissolve the Flesh
System: The player spends two blood points and a Willpower point as the vampire extracts a quantity of her vitae charged with the power of the grave. If she drips it onto a single Kindred victim anytime within the next few turns (most of the blood must reach the victim, so flinging a few drops is ineffective), it causes whole chunks of the victim’s body to crumble to ash. The player rolls Willpower against a difficulty of the victim’s Stamina + 3. For every success, the target takes one aggravated wound.
The undead flesh damaged by this power turns to dust (gone for the time being), and it must be regenerated painstakingly by the victim, should he survive. That dust doubtlessly has mystical properties that various sorcerers might be able to take advantage of. Every wound inflicted by this ability represents the loss of about one-eighth of the target’s weight; the Storyteller chooses where the loss comes from. (It might also be shed from all over, leaving the victim a bit gaunter or missing chunks of flesh.)
Regenerating body parts occurs naturally while healing aggravated wounds at the normal rate (see p. 285).]==],
				},
				["Hands of Destruction"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 217


Hands of Destruction


• Decay
System: If the roll is successful, the inanimate object touched by the thaumaturge ages 10 years for every minute the Kindred touches it. If the vampire breaks physical contact and wishes to age the object again, another blood point must be spent and another roll must be made. This power does not affect vampires.

•• Gnarl Wood
System: Fifty pounds or twenty-five kilograms of visible wood may be gnarled for each blood point spent on this power (the thaumaturge may expend as much blood as she likes on this power, up to her per-turn generational maximum). It is also possible to warp multiple visible objects — like all the stakes a team of vampire-hunters wields.

••• Acidic Touch
System: The player spends one blood point to create the acid — the blood literally transmutes into the volatile secretion. One blood point creates enough acid to burn through a quarter-inch or half a centimeter of steel plate or three inches (seven centimeters) of wood. The damage from an acid-augmented hand-to-hand attack is aggravated and costs one blood point per turn to use. A thaumaturge is immune to her own acidic touch.

•••• Atrophy
System: The victim may resist the effects of Atrophy by scoring three or more successes on a Stamina + Athletics roll (difficulty 8). Failure means the limb is permanently and completely crippled. Partial resistance is possible: One success indicates that the difficulty of any roll involving the use of the arm increases by two, though these effects are still permanent with regard to mortals. Two successes signify that difficulties increase by one. Vampires afflicted by this power may spend five blood points to rejuvenate atrophied limbs. Mortals are permanently crippled. This power affects only limbs or parts of limbs (arms, legs, hands); it does not work on victims’ heads, torsos, etc.

••••• Turn to Dust
System: Each success on the roll ages the victim by 10 years. A potential victim may resist with a Stamina + Courage roll (difficulty 8), but must accumulate more successes than the caster’s activation roll — it’s an all-or-nothing affair. If the victim succeeds, he does not age at all. If he does not acquire more successes than the thaumaturge, he ages the full amount. Obviously, this power, while it affects vampires, has no detrimental effect on them (they’re immortal). At most, a Kindred victim grows paler and withers slightly (-1 to Appearance) for one night.]==],
				},
				["Iter Pernix"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 297


Iter Pernix


• One being (a mount or walking human)

•• Up to six mounts or one laden wagon

••• Up to twelve mounts or four supply wagons

•••• Up to 24 mounts or eight supply wagons or one siege engine

••••• Up to 48 mounts or sixteen supply wagons or four siege engines]==],
				},
				["Lure of Flames"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 218


Lure of Flames


• Candle (difficulty 3 to soak, one health level of aggravated damage/turn)

•• Palm of flame (difficulty 4 to soak, one health level of aggravated damage/turn)

••• Campfire (difficulty 5 to soak, two health levels of aggravated damage/turn)

•••• Bonfire (difficulty 7 to soak, two health levels of aggravated damage/turn)

••••• Inferno (difficulty 9 to soak, three health levels of aggravated damage/turn)]==],
				},
				["Mastery of the Mortal Shell"] = {
					en = [==[Rites of Blood, p. 138


Mastery of the Mortal Shell


• Vertigo
System: A touch from the thaumaturge invokes disorientation in her victim. If successful, all of the victim’s physical actions are at +1 difficulty for the duration of the power. Subsequent uses of this Path may extend the duration, though the difficulty will not increase further.

•• Contortion
System: By making physical contact with one of the limbs of the target, the thaumaturge renders it useless for the duration of Contortion. A leg rendered useless makes standing difficult, and the victim suffers from increased difficulty (+1 to +3, depending on circumstances) to appropriate Dexterity challenges related to her leg, such as dancing or balancing on ledges. A contorted arm hangs lifeless at the subject’s side. A useless head causes loss of speech and increases the difficulty of all Social rolls are at +2 as the facial muscles spasm out of control.

••• Seizure
System: A light touch from the thaumaturge forces the very unpleasant effects of this power upon the target. For the duration of the seizure, a target’s body writhes, tormenting her to the point of incapacitation. Victims suffer a +2 difficulty penalty to all physical actions. The victim also suffers one level of bashing damage every turn, as her body helplessly twists itself. At Storyteller discretion, the effects of this power may even cause death in extremely ill or wounded mortals.
Damage may be reduced as normal (although levels from armor do not apply).

•••• Body Failure
System: The thaumaturge no longer needs to touch her victim to strike out with this level of mastery of the Path. She may affect any target within her line of sight, but she must keep visual contact with the victim at all times to maintain this effect. A successful activation of this power grants effects similar to Seizure, except that damage is lethal (and thus not soakable by mortals) due to complete mass tissue and organ failure. Additionally, the victim suffers a +2 difficulty penalty to all actions.
The subject may resist the effects of Body Failure via a Stamina + Fortitude roll when the thaumaturge attempts to strike the target (difficulty equals the thaumaturge’s current Willpower). Each success the victim gains on this roll reduces the duration of Body Failure by one turn.

••••• Marionette
System: The thaumaturge may affect any target within her line of sight, but she must keep visual contact with the victim at all times to maintain this effect. A subject may resist the effects of Marionette on a Stamina + Fortitude roll (difficulty equal to the thaumaturge’s current Willpower) when the thaumaturge attempts to take control. Each success the victim gains on this roll reduces the duration of Marionette by one turn. Victims lacking Fortitude do not have the physical resistance to defy this effect.
For the duration of this power, the thaumaturge can cause the victim to perform any physical action, using the target’s pools with a penalty of +2 difficulty to all rolls. The concentration this power requires also increases the thaumaturge’s own difficulties by two for all other personal actions undertaken while manipulating the victim. To extend the duration of this control, the thaumaturge must make a second activation roll. Marionette does not rob the victim of her cognizance, only physical control over her body. During this time of thaumaturge’s mastery, the target remains aware that some outside force is manipulating her physical actions, conscious that they are not her own. The victim may spend a point of Willpower to attempt to take a mental or social action, such as activating a Discipline or speaking.]==],
				},
				["Movement of the Mind"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 220


Movement of the Mind


• One pound/one-half kilogram

•• 20 pounds/10 kilograms

••• 200 pounds/100 kilograms

•••• 500 pounds/250 kilograms

••••• 1000 pounds/500 kilograms]==],
				},
				["Neptune’s Might"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 218


Neptune’s Might


• Eyes of the Sea
System: The number of successes rolled determines how far into the past the character can look.
1 success — One day
2 successes — One week
3 successes — One month
4 successes — One year
5 successes — 10 years
The Storyteller may require a Perception + Occult roll for the character to discern very small details in the transmitted images. This power can only he used on standing water; lakes and puddles qualify, but oceans, rivers, sewers, and wine glasses do not.

•• Prison of Water
System: The number of successes scored on the roll is the number of successes the victim must score on a Strength roll (difficulty 8; Potence can add to this roll) to break free. A subject may be held in only one prison at a time, although the caster is free to invoke multiple uses of this power upon separate victims and may dissolve these prisons at will. If a sufficient quantity of water (at least a bathtub’s worth) is not present, the difficulty of the Willpower roll to activate this power is raised by one.

••• Blood to Water
System: The character must touch her intended victim. The player rolls Willpower normally. Each success converts one of the victim’s blood points to water. One success kills a mortal within minutes. Vampires who lose blood points to this power also suffer dice pool penalties as if they had received an equivalent number of health levels of injury. The water left in the target’s system by this attack evaporates out at a rate of one blood point’s worth per hour, but the lost blood does not return.
At the Storyteller’s discretion, other liquids may be turned to water with this power (the difficulty for such an action is reduced by one unless the substance is particularly dangerous or magical in nature). The character must still touch the substance or its container to use this power.

•••• Flowing Wall
System: The character touches the surface of a standing body of water; the player spends three Willpower points and the normal required blood point and rolls normally. Successes are applied to both width and height of the wall; each success “buys” 10 feet/three meters in one dimension. The wall may be placed anywhere within the character’s line of sight, and must be formed in a straight line. The wall lasts until the next sunrise. It cannot be climbed, though it can be flown over. To pass through the barrier, any supernatural being (including beings trying to pass the wall on other levels of existence, such as ghosts) must score at least three successes on a single Willpower roll (difficulty 9).

••••• Dehydrate
System: This power can be used on any target in the character’s line of sight. The player rolls normally; the victim resists with a roll of Stamina + Fortitude (difficulty 9). Each success gained by the caster translates into one health level of lethal damage inflicted on the victim. This injury cannot be soaked (the resistance roll replaces soak for this attack) but can be healed normally. Vampires lose blood points instead of health levels, though if a vampire has no blood points this attack inflicts health level loss as it would against a mortal. The victim of this attack must also roll Courage (difficulty equal to the number of successes scored by the caster + 3) to be able to act on the turn following the attack; failure means he is overcome with agony and can do nothing.]==],
				},
				["Path of Conjuring"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 220


Path of Conjuring


• Summon the Simple Form
System: Each turn the conjurer wishes to keep the object in existence, another Willpower point must be spent or the object vanishes.

•• Permanency
System: The player must invest three blood points in an object to make it real.

••• Magic of the Smith
System: Objects created via Magic of the Smith are automatically permanent and cost five blood points to conjure. Particularly complex items often require a Knowledge roll (Crafts, Science, Technology, etc.) in addition to the basic roll.

•••• Reverse Conjuration
System: This is an extended success roll. The conjurer must accumulate as many successes as the original caster received when creating the object in question. This can also be used by the thaumaturge to banish object she created herself with this Path.

••••• Power Over Life
System: The player spends 10 blood points. Imperfect and impermanent, creatures summoned via this path are too complex to exist for long. Within a week after their conjuration, the simulacra vanish into insubstantiality.]==],
				},
				["Path of Corruption"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 221


Path of Corruption


• Contradict
System: This power may be used on any subject within the character’s line of sight. The player rolls as per normal. The target rolls Perception + Subterfuge (difficulty equal to the number of successes scored by the caster + 2). Two successes allow the subject to realize that she is being influenced by some outside source. Three successes let her pinpoint the source of the effect. Four successes give her a moment of hesitation, neither performing her original action nor its inverse, while five allow her to carry through with the original action.
The Storyteller dictates what the subject’s precise reaction to this power is. Contradict cannot be used in combat or to affect other actions (at the Storyteller’s discretion) that are mainly physical and reflexive.

•• Subvert
System: This power requires the character to make eye contact (see p. 152) with the intended victim. The player rolls normally. The target resists with a roll of Perception + Subterfuge (difficulty equal to the target’s Manipulation + Subterfuge). If the thaumaturge scores more successes, the victim becomes inclined to follow a repressed, shameful desire for the length of time described below.
1 success — Five minutes
2 successes — One hour
3 successes — One night
4 successes — Three nights
5 successes — One week
The Storyteller determines the precise desire or agenda that the victim follows. It should be in keeping with the Psychological Flaws that she possesses or with the negative aspects of her Nature (for example, a Loner desiring isolation to such an extent that she becomes violent if forced to attend a social function). The subject should not become fixated on following this new agenda at all times, but should occasionally be forced to spend a Willpower point if the opportunity to succumb arises and she wishes to resist the impulse.

••• Dissociate
System: The character must touch the target. The player rolls normally. The target resists with a Willpower roll (difficulty of the thaumaturge’s Manipulation + Empathy). The victim loses three dice from all Social rolls for a period of time determined by the number of successes gained by the caster:
1 success — Five minutes
2 successes — One hour
3 successes — One night
4 successes — Three nights
5 successes — One week
This penalty applies to all rolls that rely on Social Attributes, even those required for the use of Disciplines. If this power is used on a character who has participated in the Vaulderie or a similar ritual, that character’s Vinculum ratings are reduced by three for the duration of Dissociate’s effect.
Dissociate’s primary effect falls under roleplaying rather than game mechanics. Victims of this power should be played as withdrawn, suspicious, and emotionally distant. The Storyteller should feel free to require a Willpower point expenditure for a player who does not follow these guidelines.

•••• Addiction
System: The subject must encounter or be exposed to the sensation, substance, or action to which the character wants to addict him. The thaumaturge then touches his target. The player rolls normally; the victim resists with a Self-Control/Instinct roll (difficulty equal to the number of successes scored by the caster + 3). Failure gives the subject an instant addiction to that object.
An addicted character must get his fix at least once a night. Every night that he goes without satisfying his desire imposes a cumulative penalty of one die on all of his dice pools (to a minimum pool of one die). The victim must roll Self-Control/Instinct (difficulty 8) every time he is confronted with the object of his addiction and wishes to keep from indulging. Addiction lasts for a number of weeks equal to the thaumaturge’s Manipulation score.
An individual may try to break the effects of Addiction. This requires an extended Self-Control/Instinct roll (difficulty of the caster’s Manipulation + Subterfuge), with one roll made per night. The addict must accumulate a number of successes equal to three times the number of successes scored by the caster. The victim may not indulge in his addiction over the time needed to accumulate these successes. If he does so, all accumulated successes are lost and he must begin anew on the next night. Note that the Self-Control/Instinct dice pool is reduced every night that the victim goes without feeding his addiction.

••••• Dependence
System: The character engages the target in conversation. The player rolls normally. The victim rolls Self-Control/Instinct (difficulty equals the number of successes scored by the caster + 3). Failure means that the victim’s psyche has been subtly bonded to that of the thaumaturge for one night per success rolled by the caster.
A bonded victim is no less likely to attack his controller, and feels no particular positive emotions toward her. However, he is psychologically addicted to her presence, and suffers a one-die penalty to all rolls when he is not around her or performing tasks for her.
Additionally, he is much less resistant to her commands, and his dice pools are halved when he attempts to resist her Dominate, Presence (or other mental or emotional control powers), or mundane Social rolls. Finally, he is unable to regain Willpower when he is not in the thaumaturge’s presence.]==],
				},
				["Path of Haunting"] = {
					en = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, p. 174


Path of Haunting


• Song of the Dead
System: The vampire chants to the victim while her player spends one blood point and rolls Manipulation + Occult (difficulty of the target’s current Willpower). A botch indicates the vampire affects herself as though she had gained successes equal to the number of 1s rolled.
For a number of nights equal to the successes rolled, the target suffers depression and morbid anxiety. This fixation adds +2 to the difficulty of Social rolls (except those involving Intimidation) and +1 to the difficulty of all other non-reflexive rolls. If a target suffers the effects of this power for more continuous nights than his permanent Willpower, he loses a dot of permanent Willpower. This cycle continues after an interval of the new rating in days, with the victim losing a dot of permanent Willpower after each such iteration. Once a character drops to zero permanent Willpower, he commits suicide (if living) or falls into torpor (if a vampire). If the power is interrupted for at least one night, the victim recovers his permanent Willpower at the rate of one dot per week. A vampire who falls into torpor from reaching zero Willpower awakens with his original rating.

•• Summon Wisp
System: The player spends one blood point and rolls Charisma + Occult (difficulty 5) to conjure an orb of pale light that lasts one scene. The wisp can take any color the vampire chooses and has no substance or weight. It may fly as fast as the vampire can run, casting cold illumination as bright as a candle. Mortals who behold the wisp must roll Willpower (difficulty 4) and achieve more successes than the caster or fall into a mild trance, which adds +1 to the difficulty of all actions due to distraction. If the vampire’s successes are double the mortal’s, he follows the light without regard for any but the most obvious obstacles. He walks around trees and rocks, but falls prey to quicksand or a high parapet. Any loud noise or other distraction immediately breaks the reverie.
If the vampire’s player botches the conjuration roll, the wisp appears and acts with its own malevolent agenda. Such a creature is only a nuisance, but can display remarkable cunning in luring enemies to the vampire’s haven or giving away her position.

••• Harrowing
System: The vampire makes eye contact with the victim, while her player spends one blood point and rolls Manipulation + Occult (difficulty of the target’s permanent Willpower). If successful, the victim feels a slight sense of unease. When he next sleeps, he suffers horrible nightmares about his own demise. Even though he cannot fully remember the content of his visions after he wakes, the emotional trauma prevents him from regaining Willpower. In addition, his twisted déjà vu and unnatural paranoia give him the Nightmares and Eerie Presence Flaws (V20, p. 495) for the day. A botch in casting this power inflicts the same terrible dreams on the vampire when she slumbers.

•••• Phantasms
System: The vampire envisions the desired apparition, while the player spends one blood point and rolls Manipulation + Occult (difficulty 7). These creations have no substance and cannot speak or perform complicated actions, though they emit a surreal cold. Each success allows the vampire to create one phenomenon, or add one characteristic or condition to another phantom. For example, three successes could animate shadows to shuffle and writhe (one success) and create an illusion of dripping gore that bursts into a spray of flies when someone draws close (one success for the gore and one success for the condition). This power may create apparitions anywhere in the caster’s line of sight. The Storyteller remains the final arbiter of what is or is not possible with this power.
A botch calls the attention of a malefic ghost, giving the vampire the Haunted Flaw (V20, p. 495) for a number of nights equal to the 1s rolled.

••••• Torment
System: The player spends one blood point and rolls Manipulation + Occult (difficulty 8). On a botch, the vampire permanently gains the Haunted Flaw (V20, p. 495), attracting the vilest and most hateful ghosts. If successful, the victim feels a sudden chill. The difficulty for ghosts to affect the target with any power decreases by one for every success rolled, to a minimum of difficulty 4. Malicious ghosts flock to the target, eagerly inflicting every horror at their disposal. The difficulty reduction diminishes by one every day at dawn until the victim returns to normal and the spectres lose interest. Multiple applications of this power may not be stacked to increase duration or intensity of effect. The statistics and powers of spectres are left to the Storyteller, but the experience should terrify the character utterly and may well result in derangements at the least.]==],
				},
				["Path of Mars"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 224


Path of Mars


• War Cry
System: For the duration of one scene, the vampire adds one to his Courage Trait. Additionally, for the purposes of hostile effects, his Willpower is considered to be one higher (though this bonus applies only to the Trait itself, not the Willpower pool). A character may only gain the benefits of War Cry once per scene.

•• Strike True
System: By invoking this power, the player need not roll to see if the vampire’s attack hits — it does, automatically. Only Melee or Brawl attacks may be made in this manner. These attacks are considered to be one-success attacks; they offer no additional damage dice. Also, they may be dodged, blocked, or parried normally, and the defender needs only one success (as the attacks’ number of success is assumed to be one). Strike True has no effect if attempted on multiple attacks (dice pool splits) in a single turn from one character.

••• Wind Dance
System: The player can dodge any number of attacks with her full dice pool in a single turn. This advantage applies only to dodges — if the character wishes to attack and dodge, the player must still split her dice pool. This power lasts for one scene.

•••• Fearless Heart
System: Fearless Heart grants the vampire an extra point in each of the Physical Attributes (Strength, Dexterity, and Stamina). These Traits may not exceed their generational maximums, though the player may use blood points to push the character’s Traits even higher. The effects last for one scene, and a character may gain its benefits only once per scene. The vampire must spend two hours in a calm and restful state following the use of Fearless Heart, or lose a blood point every 15 minutes until he rests.

••••• Comrades at Arms
System: The player chooses one of the lower-level powers in the path, invoking it as normal. Afterward, he touches another character and (if the roll for Comrades at Arms is successful) bestows the benefit on her as well. The same power may be delivered to any number of packmates, as long as the rolls for Comrades at Arms are successful and the thaumaturge pays the appropriate blood costs.]==],
				},
				["Path of Spirit Manipulation"] = {
					en = [==[Rites of Blood, p. 142


Path of Spirit Manipulation


• Hermetic Sight
System: Hermetic Sight allows the thaumaturge to perceive the spirit realm interlaid over the material world for one hour. Each additional level of success on the activation roll increases the duration of this power by an additional thirty minutes.

•• Astral Cant
System: Astral Cant allows the thaumaturge to speak to any spirit visible via Hermetic Sight for fifteen minutes. Each additional level of success on the activation roll increases the duration of this power by an additional fifteen minutes to the duration.

••• Voice of Command
System: The thaumaturge makes the normal opposed Willpower roll against the spirit. The target spirit resists with Willpower (difficulty of the thaumaturge’s Manipulation + Occult). The degree of success the thaumaturge attains determines the complexity and severity of the command that she can issue.
Botch — The spirit is immune to the character’s commands for the rest of the night. It reacts however the Storyteller deems appropriate. Typically, the spirit is angry enough to seek revenge at the first opportunity. It may ignore, taunt or even attack the character, at the Storyteller’s discretion.
Failure — The spirit is unaffected, and further attempts to command it are made at +1 difficulty (cumulative).
1 success — The spirit obeys a very simple command that is of no great inconvenience to it.
2 successes — The spirit heeds a relatively straightforward command that it is not innately opposed to performing.
3 successes — The spirit agrees to perform a moderately complex task that does not violate its ethics.
4 successes — The spirit consents to an extended or intricate task that does not place it in immediate danger.
5 successes — The spirit accepts a lengthy or nigh-impossible task, or one that means its destruction.

•••• Entrap Ephemera
System: The thaumaturge must first locate a vessel symbolically aligned with the targeted spirit that will eventually become the fetish. Then she must command the targeted spirit to enter the vessel via an opposed Willpower roll. The target spirit resists with Willpower (difficulty equals the thaumaturge’s Manipulation + Occult).
Should the thaumaturge succeed, she can create a fetish of a power level based on the number of successes achieved over the spirit, up to a level five fetish. For example, if the thaumaturge wins the opposed Willpower roll against the spirit by three successes, she creates a level three fetish.
Creating and maintaining a fetish is difficult; because of this, the number of fetishes a thaumaturge may create is limited by her Willpower. If the thaumaturge gives away said fetish, it still counts against her total available slots. She may only create an additional fetish when one of her previous fetishes has been destroyed.
A fetish grants a number of bonus dice to a specific skill comparable to the level of the fetish. For example, a healing spirit trapped inside a scalpel would grant extra dice (the level of the fetish) for any Medicine roll. The Storyteller always has final authority on what sort of fetish can be made.
A fetish is activated by rolling the user’s Willpower (difficulty equals the fetish’s power level + 3). A botch on this roll destroys the physical component of the fetish and frees the spirit that was trapped within.

••••• Duality
System: The thaumaturge may interact with the spirit world for fifteen minutes. Each additional level of success on the activation roll increases the duration of this power by an additional fifteen minutes. Duality can only be enacted while the character begins the process in the physical world. While in this state, the thaumaturge becomes susceptible to attacks from both realms and suffers from a +1 difficulty to all Perception rolls. The character is still considered to be in the physical world for purposes of basic physics (and common sense).
Spirits who have been previously angered will seek physical revenge on unwary thaumaturges using this power.
A botch on the roll to activate this power tears the vampire out of the physical world and traps him in the spirit realm. The way back the physical realm, if there is one, is left to the Storyteller’s discretion, and may spark an entirely new story.]==],
				},
				["Path of Technomancy"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 224


Path of Technomancy


• Analyze
System: A character must touch the device in order to apply this power. The number of successes rolled determines how well the character understands this particular piece of equipment. One success allows a basic knowledge (on/off and simple functions), while three successes grant competence in operating the device, and five successes show the character the full range of the device’s potential. The knowledge lasts for a number of minutes equal to the character’s Intelligence.
This power can also be used to understand a nonphysical technological innovation — generally a piece of software — at +2 difficulty. The character must touch the computer on which the software is installed — simply holding the flash drive or CD-ROM is not enough. Software applied remotely to a device (such as through an app store) also cannot be analyzed until it is installed.

•• Burnout
System: A character can use this power at a range of up to 10 times her Willpower in yards or meters, although a +1 difficulty is applied if she is not touching the target item. The number of successes determines the extent of the damage:
1 success — Momentary interruption of operation (one turn), but no permanent damage.
2 successes — Significant loss of function; +1 difficulty to use using the device for the rest of the scene.
3 successes — The device breaks and is inoperable until repaired.
4 successes — Even after repairs, the device’s capabilities are diminished (permanent +1 difficulty to use).
5 successes — The equipment is a total write-off; completely unsalvageable.
Large enough systems, such as a server cluster or a passenger aircraft, impose a +2 to +4 difficulty (at Storyteller discretion) to affect with this power. Additionally, some systems, such as military and banking networks, may be protected against power surges and spikes, and thus possess one to five dice (Storyteller discretion again) to roll to resist this power. Each success on this roll (difficulty 6) takes away one success from the Thaumaturgy roll.
Burnout may be used to destroy electronic data storage, in which case three successes destroy all information on the target item, and five erase it beyond any hope of non-magical recovery.

••• Encrypt/Decrypt
System: The character touches the device or data container that he wishes to encrypt. The player rolls normally. The number of successes scored is applied as a difficulty modifier for anyone who attempts to use the protected equipment or access the scrambled information without the assistance of the character. The caster can dispel the effect at any time by touching the target item and spending a point of Willpower.
This power may also be used to counter another thaumaturge’s use of Encrypt/Decrypt. The player rolls at +1 difficulty; each success negates one of the “owner’s.”
The effects of Encrypt/Decrypt last for a number of weeks equal to the character’s permanent Willpower rating.

•••• Remote Access
System: This power may be used on any electronic device within the character’s line of sight. The number of successes rolled is the maximum number of dice from any relevant Ability that the character may use while remotely controlling the device. (For instance, if Fritz has Technology 5 and scores three successes while using Remote Access on a keypad lock, he can only apply three dots of his Technology rating to any rolls that he makes through any use of the power.) Remote Access lasts for a number of turns equal to the number of successes rolled, and can only be used on one item at a time.
If an item is destroyed while under the effects of Remote Access, the character takes five dice of bashing damage due to the shock of having his perceptions rudely shunted back into his own body.

••••• Telecommute
System: The character touches any form of communications device: a cellphone, 3G-equipped netbook, Wi-Fi tablet, or anything else that is connected directly or indirectly to the Internet. The player rolls normally and spends a Willpower point. Telecommute lasts for five minutes per success rolled, and may be extended by 10 minutes with the expenditure of another Willpower point. The number of successes indicates the maximum range that the character can project her consciousness away from her body:
1 success — 25 miles/40 kilometers
2 successes — 250 miles/400 kilometers
3 successes — 1000 miles/1500 kilometers
4 successes — 5000 miles/8000 kilometers
5 successes — Anywhere in the world
While in the network, the character can apply any other Path of Technomancy power to any device or data with which she comes in contact. A loss of connection, either through the destruction of a part of the network or simply a loss of cell signal, hurls her consciousness back to her body and inflicts eight dice of bashing damage.
A character traveling through the Internet by means of this power can use her Path of Technomancy powers at a normal difficulty. Using any other abilities or powers while engaged thus is done at a +2 difficulty.]==],
				},
				["Path of the Father’s Vengeance"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 226


Path of the Father’s Vengeance


• Zillah’s Litany
System: If the subject has any blood bonds or Vinculi to other vampires, this power reveals them to the caster. Although the caster may not know the vampires in question, this power does reveal the names and gives rough psychic impressions of the individuals in question.

•• The Crone’s Pride
System: This power reduces the target’s Appearance to zero. All Social rolls during this time generally fail, unless the character attempts to intimidate or browbeat the subject. This power lasts for one night.

••• Feast of Ashes
System: The victim of this power can no longer consume blood, vomiting it up as he would mortal food or drink. Instead, the victim can eat only ashes, and the “blood points” he gains from this may be used only to rise each night. Ashen “blood points” may not be used to power Disciplines, raise Attributes, or feed ghouls (though actual blood points in the character’s body at the time this power is invoked may still be used for such). One blood point’s worth of ash is roughly one pint or half-liter, and any ash will do — cigarette ash, campfire leftovers, or vampire corpses destroyed by fire or sunlight. This power lasts for one week.

•••• Uriel’s Disfavor
System: The presence of any light makes the subject uncomfortable, and bright light of any kind — flashlights, headlights, etc. — inflict one health level of aggravated damage on the character for every turn he remains under its direct focus. Most vampires who suffer this curse elect to sleep for the duration, hiding away in the darkness of their havens until they can walk again among the living without pain. This power lasts for one week.

••••• Valediction
System: When this power takes effect, the subject immediately reverts to her original Generation. This change may entail losing points in certain Traits due to generational maximums. This power lasts for one week, after which any Traits reduced to higher-Generation maximums return to normal. It takes three turns to speak the full verse that implements this power’s effects.]==],
				},
				["Path of the Focused Mind"] = {
					en = [==[Rites of Blood, p. 139


Path of the Focused Mind


• Readiness
System: This power is only usable on the thaumaturge herself. Every success on the activation roll adds one die to a special dice pool for the remainder of the turn. These dice may be used on any Wits-related rolls or actions that the thaumaturge performs during this turn. Alternatively, each die removed from the dice pool adds one to the caster’s initiative rating.

•• Centering
System: This power is usable on any one subject within earshot of the thaumaturge and lasts for one turn per success on the activation roll. During this period, the target is unaffected by any power or effect (with the notable exception of Elder disciplines) that reduces her dice pools. This includes wound penalties, situational modifiers, and Disciplines. Modifications to difficulty numbers still apply during this time, however. In addition, due to the unnatural serenity that this power bestows, the target receives two additional dice in all attempts to avoid or break frenzy.

••• One-Tracked Mind
System: This power may affect anyone who can hear the thaumaturge. Successful invocation makes the target unable to split any dice pools for multiple actions and unable to change tactics after actions have been declared. As a side benefit, the target reduces the difficulty of the declared action by one. Additional actions that the victim takes (from Celerity, for example) during the duration of this power must follow up upon their initial action, as they concentrate wholly upon this one idea. If the target wishes to attempt a different course of action, she must spend a point of Willpower per scene (or per turn in combat). The duration of One-Tracked Mind is one scene, or one turn per success on the activation roll.

•••• Dual Thought
System: Successful use of Dual Thought allows the caster to take two actions without penalty during her turn. (Note that this power specifically lifts the restrictions of multiple actions detailed in V20, p. 248.) The extra action granted by this power must be a mental action, whether it’s the use of Disciplines such as the use of Auspex or Thaumaturgy, or the contemplation of some problem. If the character is using both actions to solve a problem, she has two separate dice pools to draw from. These two actions happen at the same time, as determined by the initiative rating of the character. You may not use the extra action to re-cast Dual Thought.

••••• Perfect Clarity
System: Perfect Clarity lasts for the duration of one scene, (or one turn plus an additional turn for every success on the activation roll if used while in combat). For this period, the thaumaturge has the difficulties of all actions reduced by two. The Kindred is immune to frenzy and Rötschreck from all sources, even supernatural triggers. Finally, any means to control or influence the thaumaturge suffer a +2 difficulty, including powers such as Presence, Dominate, and Dementation.]==],
				},
				["Path of the Levinbolt"] = {
					en = [==[Rites of Blood, p. 140


Path of the Levinbolt


• Flicker
System: The thaumaturge simply glances at a target powered by electricity. Upon a successful activation roll, she can shut down an electrical device for ten minutes per success on the activation roll. The spark of electricity arcs from the device directly into the thaumaturge in a frightening display of mystical power. The source of this power is immediately known.

•• Spark
System: The thaumaturge simply touches a target (after the requisite blood expenditure and activation roll by the player) and releases the spark. The electricity can snap from any part of the caster’s body, so a thaumaturge might give an unpleasant surprise to someone touching her. The resulting electrical discharge inflicts four dice of lethal damage to targets (difficulty 7 to soak), and short-circuits electronic equipment and devices not specifically grounded against lightning strikes.

••• Illuminate
System: Each success scored on the player’s activation roll translates to approximately one turn of power sufficient to run a handful of lights or a small electrical device. Alternately, the thaumaturge can shock someone by touch, as with the Spark power, but for eight dice of lethal electrical damage (difficulty 8 to soak).
The current created with this power is not strong enough to force its way through less-than-ideal conductors, and thus simply inflicts electrical damage on raw metals, woods, or other matter in the form of a burn and discoloration. The thaumaturge can alternately allow the electricity to spark around her hand, eyes, or head; this creates illumination about equal to a dim light bulb, and lowers the difficulty of any Intimidation rolls by 2.

•••• Thor’s Fury
System: The thaumaturge focuses her concentration upon her target and then directs hurled bolts via a Perception + Science roll (difficulty of 6 plus the range in yards/meters, maximum 4 yards/meters). Each success inflicts a level of lethal damage (difficulty 8 to soak). The source of this power is immediately known.

••••• Eye of the Storm
System: When a thaumaturge spends a Willpower point to invoke this power, she solidifies the stored electricity inside of her into a mystical barrier that completely surrounds her. The caster becomes immune to any ranged attacks. Metal weapons such as swords inflict injury as normal for the first strike, but are then melted from contact with the barrier, and the wielder takes a level of lethal damage. Enemies that dare to touch the caster suffer two points of aggravated damage (difficulty 8 to soak). Non-metal weapons, such as wooden stakes, are not affected by Eye of the Storm. This power lasts for a single turn, with each additional success on the activation roll extending this duration by one turn. Mental and social attacks may pass through this barrier.]==],
				},
				["Potestas Exsecrabilis"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 300


Potestas Exsecrabilis


• Stigma
System: The thaumaturge spends a blood point and rolls Willpower as usual. If successful, the target suffers a +2 penalty to all Social actions (rolls involving Charisma, Manipulation, or Appearance) to a maximum increased difficulty of 9. The effect lasts until the next sunset or until the caster decides to lift the curse.

•• Malady
System: For every success that the thaumaturge rolls, the target’s Strength, Dexterity, and Stamina pools are reduced by one (to a maximum of a three-dice penalty with three successes) for a number of nights equal to the caster’s Willpower. Each night, the victim can make a Willpower roll (difficulty 7) to shake off the effect; each success reduces the penalty to Physical Attributes by one die until the next night. If she removes all penalties in a single night, the curse is broken.

••• Scapegoat
System: For every success that the thaumaturge rolls, the curse lasts for one night. During that time, the victim appears to everyone he encounters as some form of enemy. Although this does not necessarily result in immediate violence, it does tend to prevent the target from interacting in any normal way with those around him.

•••• Corrupt Body
System: Once the thaumaturge lays the curse and rolls for successes, the target can try to resist by rolling Willpower (difficulty 7), with each success reducing the effective strength of the curse by one. After that, however, there is no chance to undo it unless the caster lifts it voluntarily or the duration has elapsed.
The curse only requires one turn to cast, but the transformation takes three turns to complete. For those three turns, the pain of the change reduces the dice pool for any action the target takes by three. Afterward, for the duration of the curse, the victim‘s dice pools for all actions are reduced by one (cumulative with wound penalties). In addition, the target has one attribute of the caster’s choice — Strength, Dexterity, Stamina, or Appearance — reduced to 1. The duration depends on the number of successes rolled:
1 success — One night
2 successes — One week
3 successes — One month
4 successes — One season
5 successes — One year

••••• Acedia
System: The effects of this curse require a Willpower roll (difficulty 8) to resist. If the target botches the roll and the caster achieved at least three successes in casting it, the curse is permanent. Otherwise, the duration is the same as Corrupt Body.
While under the influence of Acedia, the victim cannot succeed at any task automatically, and is treated as having rolled one botch in every action. (In other words, negate one success in every roll, with no successes meaning a botched result.) Even if she succeeds, the maximum effective result she can achieve is two successes, including additional success from Willpower or other sources.]==],
				},
				["Rego Calatio"] = {
					en = [==[Dark Ages Tome of Secrets, p. 111


Rego Calatio


• Petty Demon (Attributes 4/3/2, Abilities 3/2/1, Willpower 3, Health 4)

•• Madness Demon (Attributes 5/4/3, Abilities 4/3/2, Willpower 4, Health 6, Blood Points 5, two points of Disciplines, one of which must be Dementation)

••• Passion Demon (Attributes 6/5/4, Abilities 5/4/3, Willpower 6, Health 7, Blood Points 6, four points of Disciplines, two of which must be Presence)

•••• Murderous Demon (Attributes 7/6/5, Abilities 6/5/4, Willpower 7, Health 8, Blood Points 7, six points of Disciplines, three of which must be Potence)

••••• Named Demon (Attributes 8/7/6, Abilities 7/6/5, Willpower 9, Health 10, Blood Points 10, eight points of Disciplines, allocated wherever the infernalist chooses with a maximum of six points in a single Discipline)
The number of successes rolled determines how much control the infernalist has over his summoned demon:
Failure — The summoning does not occur. It may be retried with a new sacrifice.
1 success — The demon is bound to the circle for a night, and will only listen to the infernalist.
2 successes — The demon is bound to the circle for a night, and will listen to anyone in its proximity, answering simple questions.
3 successes — The demon is bound to remaining within eyeshot of the infernalist for a night. It is well disposed and will answer complicated questions accurately.
4 successes — The demon is bound to remaining within eyeshot of the infernalist for a night. It is forced to serve the infernalist in simple tasks.
5 successes — The demon is able to leave the infernalist’s sight and do his dark bidding. It willingly submits to the infernalist’s decrees for the night’s duration.
6 or more successes — A demon one grade higher than intended is summoned, and treated as if summoned with 4 successes. The maximum grade is the Named Demon.]==],
				},
				["Sepulchre Path"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 160


Sepulchre Path


• Witness of Death
System: The player rolls Perception + Awareness (difficulty 5). Success allows the vampire to perceive ghosts as described for the rest of the scene (in the mortal world — seeing ghosts in the land of the dead requires Shroudsight, on p. 163). Failure has no special effect, but a botch means the vampire can see only the dead for the scene; everything else appears as shapeless, dim shadows. While the vampire’s other senses remain attuned to the living, he is all but blind in this state and suffers a +3 difficulty to most vision-based Perception rolls and attacks. Ghosts notice the glowing eyes of a vampire using this power only with a successful Perception + Alertness roll (difficulty 7).

•• Summon Soul
System: The player spends one blood point and rolls Manipulation + Occult (difficulty equal to 7 or the ghost’s Willpower, whichever is higher). The vampire must know the name of the ghost and have on hand an object the ghost had contact with in life. Provided that the target has died and become a ghost, success means the shade appears before the necromancer as described above. Not everyone becomes a ghost — it requires a strong will to persevere in the face of death, and souls that have found peace pass on to their eternal rewards. Moreover, it is possible for the dead to suffer spiritual dissolution and destruction after they become ghosts. The Storyteller should consider all these factors when deciding whether a particular ghost exists for a vampire to summon.
Vampires know if their summons should have succeeded by a feeling of sudden, terrifying descent as they reach too far into the great Beyond, so this power can be used to determine whether a soul has endured beyond death. While a failure means the vampire wastes blood, a botch calls a spirit other than the one sought — usually a malevolent ghost known as a Spectre (see p. 385). Such a fiend torments the one who summoned it with every wicked power at its disposal.
Once a ghost is summoned, it may not deliberately move out of sight of the vampire, though it can take any other actions, including direct attack. The vampire’s player may spend a Willpower point to dismiss the ghost at any time (unless he rolled a botch). Otherwise, at the end of the scene, shadows engulf the spirit once more and return it to its original location.

••• Compel Soul
System: The vampire locates and approaches the intended ghost or calls it to his presence with Summon Soul. As with the previous power, he must have the ghost’s name and an object it handled in life. His player then spends one blood point and rolls Manipulation + Occult in a resisted roll against the ghost’s Willpower (difficulty 6 for both rolls).
If the vampire wins, the number of net successes determines the degree of control he has over the ghost (as described below). Moreover, the vampire’s control keeps ghosts that have been called with Summon Soul from returning to their original locations at the end of the scene. If the ghost wins, the vampire loses a number of Willpower points equal to the ghost’s net successes. On a tie, the roll becomes an extended contest that continues each turn until one side wins. If the vampire botches at any point, the ghost is immune to any use of the vampire’s Necromancy for the rest of the scene. If the ghost botches, it must obey as if the vampire’s player had rolled five net successes.
1 success — The ghost must perform one simple task for the vampire that does not place it in certain danger. It must attend to this task immediately, although it can delay the compulsion and pursue its own business at a cost of one Willpower point per scene. The ghost may not attack the vampire until this task is complete. It is possible to issue the task of answering one question, in which case the ghost must answer truthfully and to the best of its knowledge.
2 successes — The vampire may issue two orders or ask two questions as outlined for one success. Alternatively, the vampire may demand a simple task with a real possibility of danger, as long as the danger is not certain. The ghost may delay this compulsion with Willpower.
3 successes — The vampire may issue three orders as outlined for one success. Alternatively, he may demand the ghost fulfill one difficult and dangerous task or a simple assignment that has an extended duration of up to one month. The ghost may delay such orders with Willpower.
4 successes — The vampire may issue four orders, as outlined for one success, or assign two tasks, as for two successes. Alternatively, the vampire may command the ghost to perform one complex assignment that puts the ghost at extreme risk, or perform any number of non-threatening tasks as the vampire’s slave for up to one month (or, if the necromancer spends a permanent point of Willpower, for a year and a day). It is possible for ghosts to delay individual tasks, but not put off enslavement.
5 or more successes — The vampire may issue multiple orders that have a sum complexity or danger of five successes’ worth. Instead, the vampire may order the ghost to perform any one action that it is capable of executing within one month. Such a task can place the ghost in immediate peril of destruction, or even force it to betray and assault loved ones. It is not possible for ghosts to delay a task of this magnitude with Willpower — they must obey.

•••• Haunting
System: The player spends one blood point while standing at the location for the haunting or touching the intended prison. She then has the ghost brought to her by whatever means she desires, though Summon Soul is quickest and most reliable. Her player then rolls Manipulation + Occult (difficulty is equal to the target’s current Willpower points if resisted, to a minimum of 4; otherwise it is 4). The difficulty rises by one if the vampire wishes to place the ghost in an object. As usual, the difficulty decreases by one if the necromancer has a part of the spirit’s corpse in addition to knowing its name (minimum difficulty 3).
Each success binds the ghost within the location or object for one night. This duration extends to one week if the player spends a Willpower point or a year and a day for a dot of permanent Willpower. A wraith attempting to leave the area of a haunting must make an extended Willpower roll (difficulty 9, four cumulative successes necessary in a single scene) or take a level of aggravated damage for each roll. If the wraith runs out of health levels, it is hurled deep into the Underworld to face destruction.

••••• Torment
System: The player rolls Stamina + Empathy (difficulty equal to the wraith’s current Willpower points), and the vampire reaches out to strike the wraith. Each success inflicts a level of lethal damage on the wraith. Should the wraith lose all health levels, it immediately vanishes into what appears to be a doorway to some hideous nightmare realm. Ghosts “destroyed” thus cannot reappear in or near the real world for a month.]==],
				},
				["The Bialowieza Kraina"] = {
					en = [==[Dark Ages Tome of Secrets, p. 46


The Bialowieza Kraina


• Domain Breach
System: The koldun expends at least one point of blood within the area he wishes to affect with this Discipline, and the player rolls to activate this power (Attribute: Perception). One square kilometer (2/3 of a mile) surrounding the koldun is affected for each blood point spent. For the remainder of the night, the koldun senses if any visitors enter or exit the determined area.
If this power is activated within the Białowieza Forest, no initial expenditure of blood is required. This power cannot be used in a predominantly urban environment.

•• Fingers of Bialowieza
System: The koldun expends blood, ensuring it touches the plant she wishes to affect, and rolls to activate this power (Attribute: Dexterity). The plant will attempt to ensnare anyone passing within two meters (2 yards) of its reach, remaining ready to grapple in this way for one night per blood point spent. For the purposes of grappling, the plant rolls six dice. It inflicts one level of bashing damage for each turn subsequent to a successful grapple. The plant gains an additional die to grappling with each subsequent turn, to a maximum of ten dice. Small plants possess two health levels for the purposes of destruction, with tree limbs holding up to six, depending on size. They hold one dot of Stamina for each health level, and can soak bashing damage.
If this power is activated within the Białowieza Forest, the plants’ bashing damage and their health levels are doubled from their initial numbers, with Stamina increasing as a byproduct of the increase in health.

••• Grondrska’s Impasse
System: The koldun expends at least one point of blood within the area she wishes to affect, and the player rolls to activate this power (Attribute: Perception). One square kilometer (2/3 of a mile) surrounding the koldun is affected for each blood point spent. For the remainder of the night, any visitors sensed using Domain Breach suffer an increased difficulty of three on attempts to track, escape, and navigate within the area, as the undergrowth shifts and looms around the intruder. If the visitor fails his roll, the koldun can choose whether to move him closer, farther away, or in the direction of a well-placed trap.
If this power is activated within the Białowieza Forest, the undergrowth saps two dots from the visitor’s Perception, returned if he leaves the area. The koldun can choose to have this not affect certain visitors who triggered the power of Domain Breach.

•••• The Mouth of Djabelek
System: The koldun spills at least one point of blood within the earthen area she wishes to affect, and spends a point of Willpower along with making the roll to activate this power (Attribute: Strength). Should any being step within ten meters (11 yards) of where the power was activated, a pit two meters (2 yards) in diameter and three meters (3 yards) deep opens. Each blood point spent leaves the victim trapped and immobile for a turn. To break free requires a successful Strength-based roll on the part of the victim (difficulty 8) and requires five successes on an extended test. Beings trapped in the pit suffer two levels of lethal damage each turn, which can be soaked (difficulty 7).
If this power is activated within the Białowieza Forest, the duration of this power is doubled. The koldun can choose to have this not affect certain visitors.

••••• The White Tower
System: The koldun scatters one point of blood on the soil; the player spends a point of Willpower and makes the roll to activate this power (Attribute: Stamina). The White Tower takes effect immediately, the earth shifting, jagged bones and blocks of earth forming an apparently organic circular wall to surround the koldun, at five meters (5 1/2 yards) tall. For each success on activation, another floor five meters high is constructed above the initial one, one floor a turn. The White Tower stretches beneath the earth as far as it stretches above it, and bears no entrance or exit, unless the koldun wills one. Any possessions left within the last time the Discipline was activated remain in the tower. The White Tower is highly resistant to external forces, possessing 20 levels of health and an invulnerability to all but aggravated damage.
The White Tower can fold back into the earth with the koldun in tow, at the expenditure of a further blood point and single point of Willpower. At this point, the vampire is effectively entombed five meters (5 1/2 yards) beneath the earth at the location where the White Tower stood.
For the cost of an additional blood point and point of Willpower, along with the roll for activating the power (Attribute: Stamina), the White Tower emerges anywhere within 20 kilometers (12 1/2 miles) of the previous location, providing the area is forested. The size of this new White Tower is established in the same manner as the initial roll.
The White Tower does not deconstruct if the koldun wills an exit to appear and departs the building. If any Cainite falls to torpor inside the White Tower, or mortal falls asleep within, it consumes them and adds the vampire’s bones to the others lining the walls and floors.
If this power is activated within the Białowieza Forest, it possesses double the levels of health.]==],
				},
				["The Black Sea Kraina"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 277


The Black Sea Kraina


• Danubian Voices
System: The koldun drips the requisite blood into a river, stream, or other flowing waterway. Even the runoff from thawing snow or a heavy rain is enough to make use of this power. If it is the Danube itself, or one of its tributaries, no initial expenditure of blood is necessary at all. They then make the activation roll (Attribute: Charisma); if they succeed, a spirit of the water appears to them and will serve them (such as they can) for a number of days equal to successes rolled. This duration may be extended any time before it expires by splashing the water with more blood; one blood point extends the spirit’s thralldom by an additional day.
What the spirit can do is quite limited; they can converse with the koldun, sharing whatever they know, or they can give it a message to carry to someone or someplace else. The spirit will be more than happy to talk of what it knows; river spirits can be quite garrulous and the Tzimisce is advised to help lead the spirit to the topics they’re most interested in lest they be regaled for hours with prosaic descriptions of surrounding countryside. The spirit is only capable of moving up and down their waterway (and upstream is much slower than down), so the recipient of the message must be someone it can encounter in its journey. Another method involves instructing the spirit to go to a place along its path and delivering the message to the first person it meets, though this obviously has its drawbacks as well. A koldun may also beseech a water spirit to remain in one place and watch for trespassers or other threats, then to move quickly along the riverbed to warn her of danger should any present itself.

•• Grave of the Marea Neagra
System: The koldun may always descend safely into the lowest depths of the Black Sea, where she may rest comfortably, protected from the sun and the outside world. By splashing her blood into a body of water large enough to contain her mass and making her activation roll (Attribute: Wits), she imbues that water with all the protective properties of the Black Sea. She cannot be harmed by sunlight, her body is perfectly preserved for as long as she remains interred within, and she becomes extremely difficult to detect. To spot the koldun, a character must roll Perception + Alertness (difficulty 8) and achieve more successes than the koldun rolled on her activation roll. Those who engage the submerged Tzimisce take two levels of lethal damage each turn they remain in the freezing cold water.

••• Pontos Euxeinos
System: The koldun must have access to a large enough body of water to submerge herself in. Once submerged in the comforting water, she releases the requisite blood into it (though if it is actually the Black Sea, no blood point expenditure is necessary), then make her activation roll (Attribute: Stamina). Each success may be allocated to healing just as if it were a blood point (one success heals one level of bashing or lethal damage, while five successes will heal a level of aggravated damage). This does not reduce the limitation of time upon healing; to heal aggravated damage, the koldun must remain submerged and at rest for a day per level healed.

•••• Minions of Deep Marmora
System: The koldun splashes his blood upon the surface of the water — at least one blood point, but as many as he chooses to spend — then makes the activation roll (Attribute: Manipulation). For each success, up to the total number of blood points spent, one minion emerges from the water. The Minions of Deep Marmora are strange humanoid creatures, combining the features of frog and fish. They will perform one task for the koldun, after which they are free to return to their watery abodes. Each minion may be given a different task to perform. Minions use the following stats (stats in parentheses are for those minions summoned from the Black Sea itself):
Attributes: Strength 4 (5), Dexterity 3, Stamina 4 (5), Charisma 1, Manipulation 1, Appearance 0, Perception 3, Intelligence 1 (2), Wits 2 (3)
Willpower: 3
Health Levels: Ok, Ok, -1, -1, (-1), -2, -2, -2, -5, (-5), Incapacitated
Abilities: Athletics 2, Brawl 4, Intimidation 3, Survival 3
Attack: Claws (Strength + 2, lethal), Grapple (Strength + 4, bashing), scales and blubbery flesh gives +2 dice to soak rolls.
Abilities: Minions of Marmora can breathe air or water equally well. They’re accomplished swimmers, moving as easily in water as out.

••••• Pontos Axeinos
System: The koldun drips his blood into a body of water (unless it is the Black Sea, in which case no blood need be expended) and makes the activation roll (Attribute: Intelligence). She may allocate their successes to manifest any number of dangerous waterborne hazards for her opponents to deal with; some examples of what each success can accomplish: a whirlpool or undertow with a Strength rating equal to the koldun’s Strength that may seize or drag others, increase the current’s Strength multiplier by one, reveal jagged rocks that do Strength + 3 lethal damage when smashed upon, fog that increases all sight-based Perception difficulties by 2, driving winds and rain with gales up to 50 miles per hour/75 km per hour, a precipitous drop in water temperature to near freezing levels, and so on. This power lasts a scene, and then dissipates.]==],
				},
				["The Blessings of the Great Dark Mother"] = {
					en = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, p. 86


The Blessings of the Great Dark Mother


• Cradlesong
System: The ashipu sings her cradlesong, spends one blood point, and rolls Perception + Occult (difficulty equal to the highest current Willpower rating of the individuals in the group, or the current Willpower rating of the individual if attempting to affect a singular target). If successful, the song causes any and all infernal pacts, spiritual pacts, and voluntary or involuntary bonds of any kind (including the blood bond) to become “visible” in some way to the caster.

•• Kessep
System: The ashipu invokes the gift of the argent serpent, spending one blood point and rolling Manipulation + Occult, with a difficulty equal to the target’s current Willpower. If successful, the invocation causes a single selected bond between the target and an enthralled spirit or bound demon to be broken. This, of course, frees the previously bound spirit or demon to flee, take vengeance, or visit whatever consequences of bondage they prefer upon their former owner.

••• Sotheq
System: The ashipu invokes the gift of the twilight owl, spending one blood point and rolling Manipulation + Occult, with a difficulty equal to the target’s current Willpower. If successful, the invocation causes a psychic or spiritual silence to fall across all bonds and pacts in which the target is involved — he can no longer issue commands to his bound spirits or servitor demons, nor can he receive communication or commands from any spirit or demon that holds him in thrall. Exceptional success (four successes or more) extends this effect to the Cainite at the other end of any blood bond in which the target is engaged.

•••• Allah
System: The ashipu invokes the gift of the night-shadow cat, spending one blood point and rolling Manipulation + Occult, with a difficulty equal to the target’s current Willpower, for each spirit or demon that the target holds enthralled as a servitor. Success frees the bound spirit or demon to do as it wills. Failure not only fails to free the spirit or demon, but also allows those entities to know precisely who attempted to sever those ties.

••••• Memo
System: The ashipu invokes the gift of the great serpent of the ocean, spending one blood point and rolling Perception + Occult, with a difficulty equal to the current Willpower of the target. By so doing, she gains the knowledge of what impelled the target to enter into a bargain in which his soul would be forfeit. Each success rolled yields more detailed knowledge of her target, the nature and strengths of the pact, and any infernal investments or gifts that the target possesses. Spectacular success yields the True Name of the target’s demonic patron and the opportunity to directly engage it in a contested Manipulation + Occult (difficulty equal to it’s permanent Willpower) roll. Success on the part of the ashipu severs the bond between the infernalist and their patron; success on the part of the patron allows the bond to remain intact. Failure of any roll in this sequence allows the infernality’s patron to perceive the ashipu and derive substantial information about her through the contact.]==],
				},
				["The Covenant of Enki"] = {
					en = [==[Rites of Blood, p. 160


The Covenant of Enki


Many of the paths associated with Dur-An-Ki are functionally identical to various Thaumaturgy paths. In many cases, the Dur-An-Ki version came first and was adapted to Thaumaturgy by Tremere.
The Covenant of Enki is one of those paths: it is functionally identical to Neptune’s Might (V20, pp. 218-220).]==],
				},
				["The Fires of the Inferno"] = {
					en = [==[Rites of Blood, p. 167


The Fires of the Inferno


• Lighter (difficulty 3 to soak, one health level of damage/turn)

•• Stovetop (difficulty 4 to soak, two health levels of damage/turn)

••• Blowtorch (difficulty 5 to soak, three health levels of damage/turn)

•••• Flame-thrower (difficulty 7 to soak, four health levels of damage/turn)

••••• Conflagration (difficulty 9 to soak, five health levels of damage/turn)]==],
				},
				["The Flow of Ashe"] = {
					en = [==[Rites of Blood, p. 165


The Flow of Ashe


• Touch of Life
The wangateur may ingest a special mixture of herbs and powders in lieu of expending blood when trying to imitate the characteristics of the living. The effect lasts for one scene. The wangateur may ingest this mixture for himself or provide it to another Kindred (but not a mortal) who must swallow the mixture during that scene. In the latter case, the wangateur decides which aspect of the living the other Kindred will imitated.

•• Strength of Root and Stone
The wangateur may inhale a mixture of herbs and powders through the nose instead of expending blood when trying to augment a Physical Attribute. The effect is the same as if the vampire had spent one point of blood to improve a Physical Attribute. The effect lasts for one scene. The wangateur may use this mixture himself or provide it for another (including a mortal). If it is to be used by another, the wangateur decides which Attribute is to be augmented when the mixture is prepared.

••• Breath of Life
The wangateur may use a mixture of herbs and powders in place of blood when trying to heal herself. The specific mixture produces a paste which the wangateur must physically smear on the area to be healed. The effect is the same as if the vampire had spent one point of blood to repair physical damage. This power cannot be used to heal aggravated damage, only bashing or lethal. The wangateur may use this mixture for himself or for another (including a mortal).

•••• Favor of the Orishas
The wangateur may use a mixture of herbs and powders in order to fuel any Discipline (including blood magic) that requires exactly one point of blood to function. This formula also requires a small quantity of blood to function, but it need not come from the wangateur and, in fact, can come from an enemy (human or Kindred) who has shed blood nearby. The wangateur may only use this mixture on herself and must make a superficial cut on her arm and then rub the mixture into the open wound.

••••• Gift of Ashe
The wangateur may now create mixtures using the first three levels of this path which will maintain their efficacy for an entire night rather than just one turn or scene. Furthermore, the wangateur can maintain a number of mixtures up to his Intelligence simultaneously. Thus, he can provide the mixtures to allies and no longer needs to be nearby in order to provide the appropriate benefits — he can simply give the mixture to an ally and send her on her way.]==],
				},
				["The Green Path"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 215


The Green Path


• Herbal Wisdom
System: The number of successes rolled determines the amount of information that can be gained from the contact. Depending on the precise information that the vampire seeks, the Storyteller might require the player to roll Intelligence + Occult in order to interpret the results of the communication.
1 success — Fleeting cryptic impressions
2 successes — One or two clear images
3 successes — A concise answer to a simple query
4 successes — A detailed response to one or more complex questions
5 successes — The sum total of the plant-spirit’s knowledge on a given subject

•• Speed the Season’s Passing
System: The character touches the target plant. The player rolls normally, and the number of successes determines the amount of growth or decay. One success gives the plant a brief growth spurt or simulates the effects of harsh weather, while three noticeably enlarge or wither it. With five successes, a full-grown plant springs from a seed or crumbles to dust in a few minutes, and a tree sprouts fruit or begins decaying almost instantaneously. If this power is used in combat, three successes are needed to render a wooden weapon completely useless. Two successes suffice to weaken it, while five cause it to disintegrate in the wielder’s hand.

••• Dance of Vines
System: Any total amount of vegetation with a mass less than or equal to the character’s own may be animated through this power. The plants stay active for one turn per success scored on the roll, and are under the complete control of the character. If used for combat purposes, the plants have Strength and Dexterity ratings each equal to half the character’s Willpower (rounded down) and Brawl ratings one lower than that of the character.
Dance of Vines cannot make plants uproot themselves and go stomping about. Even the most energetic vegetation is incapable of pulling out of the soil and walking under the effect of this power. However, 200 pounds (100 kilograms) of kudzu can cover a considerable area all by itself….

•••• Verdant Haven
System: A character must be standing in a heavily vegetated area to use this power. The Verdant Haven springs up around the character over the course of three turns. Once the haven is established, anyone wishing to enter the haven without the caster’s permission must achieve more than the caster’s original number of successes on a single roll of Wits + Survival (difficulty equal to the caster’s Willpower). The haven lasts until the next sunset, or until the caster dispels or leaves it. If the caster scored four or more successes, the haven is impenetrable to sunlight unless physically breached.

••••• Awaken the Forest Giants
System: The character touches the tree to be animated. The player spends a blood point and rolls normally. If the roll succeeds, the player must spend a blood point for every success. The tree stays animated for one turn per success rolled; once this time expires, the tree puts its roots down wherever it stands and cannot be animated again until the next night. While animated, the tree follows the character’s verbal commands to the best of its ability. An animated tree has Strength and Stamina equal to the caster’s Thaumaturgy rating, Dexterity 2, and a Brawl rating equal to the caster’s own. It is immune to bashing damage, and all lethal damage dice pools are halved due to its size.
Once the animating energy leaves a tree, it puts down roots immediately, regardless of what it is currently standing on. A tree re-establishing itself in the soil can punch through concrete and asphalt to find nourishing dirt and water underneath, meaning that it is entirely possible for a sycamore to root itself in the middle of a road without any warning.]==],
				},
				["The Hand of the Magi"] = {
					en = [==[Rites of Blood, p. 160


The Hand of the Magi


Many of the paths associated with Dur-An-Ki are functionally identical to various Thaumaturgy paths. In many cases, the Dur-An-Ki version came first and was adapted to Thaumaturgy by Tremere.
The Hand of the Magi is one of those paths: it is functionally identical to The Lure of Flames (V20, p. 218).]==],
				},
				["The Hunter’s Winds"] = {
					en = [==[Rites of Blood, p. 159


The Hunter’s Winds


• Scent of Deception
System: A successful roll means that the target either leaves no scent that can be detected or tracked, or she leaves the scent of someone else known to her. A failure means nothing happens. A botch means that her scent is more easily identifiable to others (in addition to the other penalties for botching a blood magic roll).

•• Chameleon’s Skin
System: For the duration of the scene following the activation scene, the difficulty of all Perception rolls to detect the target increase by +4 so long as he remains stationary. While he is in motion, the effect is negated, but once he comes to rest again against a different surface, he can reassert the camouflage with a successful Perception + Stealth roll (difficulty 6, or 9 if someone is actively searching for him at the time). Any texture changes are illusory; the target does not gain the durability of a brick wall just by standing near it.

••• Unassuming Pose
System: If the roll succeeds, any observer will automatically assume that the target belongs in whatever location he is found. Those searching for him are incapable of perceiving that he is an intruder. However, this effect cannot fool technology, and anyone observing through CCTV, for example, can spot him as an interloper.

•••• Whiff of Kalif
System: If the effect is successfully activated, anyone who observes the target during the rest of the scene must reflexively roll Wits + Alertness (difficulty 7) or become intoxicated for a number of hours equal to the ashipu’s successes in triggering the effect. Affected individuals are incapable of taking any action beyond staring vacantly at visions only they can see or perhaps giggling from time to time. However, any direct threat to an affected individual immediately causes the intoxication to fade.

••••• Ghost Body
System: If activated successfully, the target becomes immaterial in nearly every sense. The effect does not make her into a true ghost, and she is incapable of interacting with wraiths or spirits while in this form. She is also incapable of using any Disciplines while in this form. The effect ends as soon as the target makes the conscious decision to affect the physical world in any way.]==],
				},
				["The Keeper’s Way"] = {
					en = [==[Dark Ages Tome of Secrets, p. 42


The Keeper’s Way


• Sense the Ripples
Assamites learning this path learn first to listen and read the largest ripples in the Great Pool, indicting dramatic events: the death or torpor of an Elder or Eldest, a planned treachery, or worse. Though dramatic events can be seen as they occur, it is only with higher knowledge that a practitioner can know in any detail what has occurred. With each success, she may ask one clarifying question related to the subject that can be answered with yes or no. Paradoxical questions cannot be answered.

•• The Gift of Haqim
With greater study, a practitioner can stretch the blood drawn from the Great Pool. He must drink at least one blood point from the pool. His body is filled by the pool, regardless of how far he is from the actual pool. He gains blood points equal to the number of successes, which come once per hour until fully awarded.

••• The Distant Crimson
With this spell, a practitioner can observe the physical surroundings of any Assamites in a one hundred kilometer radius. She may see through the eyes of the Assamites present at the location, and can tell their general emotional states, whether they have sufficient blood to get through the week, and whether they have been in combat in the last night. With additional successes, she may filter her perceptions based on an additional, formally recognized trait such as caste or age.

•••• Know the Fate of One
By examining the minute stirrings of the pool with more clarity, a practitioner can sense a dramatic change in the fate of one vampire. She may ask questions that can be answered with a yes or a no, equal to the number of successes on her roll. This spell is frequently done to discern the true depravity of especially powerful vampires. When the warriors believe they must inflict Final Death on a Prince, they first ask the Keepers.

••••• Cast into the Pool of Blood
This spell must always be cast by four sorcerers. By emptying themselves of blood points with their hands in the pool, the practitioners can feel the blood of all members of the clan flowing through them, and can impact the immediate fate of the Clan Assamite. All participants’ Generation increase by one, as they sacrifice their blood’s potency to influence the clan’s fate. Though they may not control time, nor impact things directly, through the power of this ritual they may dramatically impact the result of a series of events. In effect, they choose a goal to accomplish, which must be agreed to by all casting members. For each success, choose one of the following:
• Individuals gain –1 difficulty on relevant actions (to a minimum difficulty 3).
• Individuals gain +1 die on relevant actions (to a maximum +5 dice).
• Those obstructing the goal gain +1 difficulty (to a maximum difficulty 9).
• Those obstructing the goal lose 1 die (to a minimum dice pool 1).
For example: If the goal is to prevent an army from invading Alamut, all warriors would receive bonuses to their rolls made to defend the city, and all sorcerers would gain bonuses to rituals in defense of the collective, while enemies would suffer penalties to attack the Assamites therein.]==],
				},
				["The Kraina of Enoch"] = {
					en = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, p. 169


The Kraina of Enoch


• Shroud of Oblivion
System: The koldun spends a Willpower point, then makes the activation roll (Attribute: Stamina). With a success, the koldun’s skin turns to ash and crumbles to nothing, exposing his meat to the elements. He plunges his hands into the earth, parting any impediment as if it were fresh tilled soil, and wrenches forth an insubstantial sheet of inky night, yanking out a piece of the Underworld with which to wrap himself. Once donned, the appearance of anything blanketed by the shroud becomes visibly muted; in the physical world, all beneath its shield resembles black-and-white television images in a full color world, while in the Underworld, things take on a more ghastly hue of deeper darkness and decay.
Shroud of Oblivion centers on and follows the koldun. The power has a radius of five feet/two meters per success scored on the activation roll, and a duration (in turns) equal to the successes. All those within the radius benefit from the shroud’s effects. The effects of this power differ according to what land the koldun is currently located (see the sidebar “Vampires in the Underworld” on p. 119): while in the mortal world, damage from sunlight lessens to bashing. If anywhere in the Underworld, the faint sun deals no damage.
When the duration of the power expires, the koldun bleeds out, losing one point of blood each turn until he expends a blood point to rejuvenate his skin (unless in the Underworld, in which case no blood is lost). Penalties sustained to activate this power are tallied after the duration ends. Healing prior to that time suspends the power’s effects.

•• Spectral Cloak
System: The koldun plucks out her eyes, crushes them in her hands, and extends her palms to the sky, then makes the activation roll (Attribute: Perception). With a success, the pulp turns to dust and takes flight on an eerie howl of wind that pours from a fathomless darkness within her empty sockets. Shadows drawn from the surroundings engulf the koldun who vanishes, rendering her invisible to standard vision (for those with Auspex, see the sidebar “Seeing the Unseen” on p. 142 of V20, using the koldun’s rating in this kraina). Though the koldun sees normally inside the radius of the power’s effect, she is blind to anything outside of this area. Others within the radius must succeed on a Willpower roll (difficulty equal to the koldun’s rating in the kraina plus successes scored on the activation roll, maximum 9), or be afflicted with the Deathsight Flaw (V20, p. 494) and attempt to flee in fright for a number of turns equal to the successes scored on the activation roll.
The power’s radius centers on and follows the koldun, allowing her to move about and act on others, even violently, without being revealed. Spectral Cloak has a radius of ten feet/three meters per success scored on the activation roll and a duration (in turns) equal to the successes. When the duration of the power expires, the koldun is abandoned to blindness until she expends one blood point to heal (unless in the Underworld, where the koldun may continue to see indefinitely, despite the loss of her eyes). Penalties sustained to activate this power are tallied after the duration ends. Healing prior to that time suspends the power’s effects.

••• Pond of Malevolent Dread
System: The koldun spends a turn eviscerating himself, thrusting his hands deep in his abdomen to expel his entrails onto the ground, then makes the activation roll (Attribute: Stamina). With a success, his bowels bore through the earth past any obstruction blocking their path, then cross over the threshold which separates the vibrant lands of the living from the desiccated lands of the dead. His entrails touch the very depths of the Underworld’s bottom layer, taking root in the Sea of Shadows. The vampire drains its essence into himself and discharges it outward in pulsating waves of despair that bubble up through the earth to ring him in a liquid pool of seething, writhing spectres. Ghostly arms stretch out to clutch and feast upon those walking through the circle’s radius. The rippling pool centers below the koldun, who remains locked in place from the waist down until the power ends.
The power has a radius of fifteen feet/five meters per success scored on the activation roll and a duration (in turns) equal to the successes. All those within the radius have their speed slowed to ¼ and must succeed at a Willpower roll each turn (difficulty equal to the koldun’s rating in the kraina plus successes scored on the activation roll, maximum 9) or lose 1 point of permanent Willpower.
When the duration of the power expires, the koldun severs his viscera buried in the earth and incurs two levels of unsoakable lethal damage. This damage cannot be healed by any other means other than by spending blood. Additionally, the koldun loses an amount of blood points equal to half the successes scored on the activation roll, rounded up (unless in the Underworld, in which case no blood is lost). Wounds sustained to activate this power are tallied after the duration ends. Healing prior to that time suspends the power’s effects.

•••• Wrath of the Tempest
System: The koldun spends one Willpower point and lifts her head to the sky, then makes the activation roll (Attribute: Strength). With a success, she opens her mouth and a choir of voices not her own issue a deafening cry that blends into thunder as storm clouds gather above her for the remainder of the turn. A still silence follows as the koldun stands frozen, her expression transfixed, echoing the call. Moments later, a roaring hurricane explodes around her, breaching forth from the land of the dead with all the fury of the Underworld. Its eye, a focused funnel, descends into the koldun’s mouth, causing her to convulse and writhe as she rises thirty feet into the air.
The tempest has a radius of twenty feet/seven meters per success scored on the activation roll and a duration (in turns) equal to the successes. All those within the radius must succeed on a Willpower roll (difficulty 8) each turn or gain a derangement and enter a strange fugue state (described on p. 291 of V20) called a “Harrowing” as the storm warps memories, trapping those within in an internal labyrinth of regret, depression, and hopelessness for the rest of the scene. While the storm rages, the koldun is mindless and completely unaware of her surroundings; she sustains one level of unsoakable bashing damage each turn as the tempest pounds her from within (unless in the Underworld, in which case the bashing damage may be soaked normally). Penalties sustained to activate this power are tallied after the duration ends. Healing prior to that time suspends the power’s effects.

••••• Hunger of the Void
System: The koldun spends a Willpower point, reaches down his throat, and pulls out his own soul. He spends a turn tormenting and stretching the spirit’s mouth ever wider as it mutely protests, clawing impotently at its violator in shocked disbelief. He tosses the contorted soul to the earth at his feet, then makes the activation roll (Attribute: Strength) before diving into it. With a success, the giant maw transforms into a cavity five feet in circumference that begins sucking in all it can to appease its insatiable appetite.
The power has a radius of twenty five feet/eight meters per success scored on the activation roll and a duration (in turns) equal to the successes. All those within the radius are dragged ten feet/three meters per turn toward the Nihil, and have their speed slowed by half every five feet/two meters nearer they are to it. If consumed by the maw, they disappear and must make a Willpower roll (difficulty 9). After the power ends, the Nihil implodes, leaving an enormous crater in its wake. At the base of the crater lies the koldun with all the maw has consumed resting on top of him. Characters who have failed the roll are turned into mindless creatures, their virtues and morality stripped from them completely and reduced to zero. Vampires succeeding on the roll enter a Harrowing (see Wrath of the Tempest) for the rest of the scene and gain a derangement. Regardless of success or failure, any mortal consumed by the pit has its soul obliterated and enters a permanent coma.
A vampire’s undead stasis cannot incarnate this otherworldly energy. Upon the power’s conclusion, fissures of unfiltered nothingness shred the koldun’s soul from within as searing chars erupt to split the flesh across his entire frame (inflicting two levels of aggravated damage).]==],
				},
				["The Kraina of the Well"] = {
					en = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, p. 172


The Kraina of the Well


• Call the Children
System: Necessitating a full scene of uninterrupted focus and the expenditure of one blood point to enact, the koldun performs a long series of incantations while tracing glyphs surrounding a circle in his own blood around the entrance to his Well of Sacrifice. The power and strength of a demon the koldun is capable of summoning rises proportionate to the level of his advancement in the kraina.
As the koldun’s skill in the kraina rises, so, too, does his ability to invoke demons of increasing power. Over the course of the scene he makes an extended invocation roll (Attribute: Wits), requiring an amount of successes equal to the difficulty level of the demon summoned.
Kraina Level 1 — Difficulty Level 5 Successes; Fallen Tempter
Kraina Level 2 — Difficulty Level 6 Successes; Fallen Tempter: +30
Kraina Level 3 — Difficulty Level 7 Successes; Fallen Tempter: +55
Kraina Level 4 — Difficulty Level 8 Successes; Earthbound Defiler in Darkness
Kraina Level 5 — Difficulty Level 9 Successes; Earthbound Defiler in Darkness: +30
Demons use the statistics presented on pp. 386-387 of V20. Storytellers should freely exchange specific Abilities and Disciplines for others and vary Attribute scores to suit the needs of their game. Demons invoked through Call the Children are not in possession of a mortal host, retaining the countenance of their Apocalyptic Form described under Powers and Weaknesses. Without being bound, a demon cannot exit the confines of the summoning circle within and will be ripped back into Hell after a number of turns equal to the difficulty level of its conjuration have expired. The demon can communicate, but generally demand an exchange of goods or services (sometimes even a contract) for any information asked of them, and even then, there’s no guarantee they need answer truthfully. The player may choose to summon the same demon again at a later date if a bargain was struck but unfulfilled before the conclusion of the power’s duration. Two or more koldun with this power may elect a primary summoner and work in concert to invoke an entity. The difficulty level is reduced by one (minimum 4) for each koldun assisting in the invocation.

•• Heed the Hell-bound Heart
System: By sipping a blood point directly from her Well, the koldun adds her levels attained in Kraina of the Well to her Awareness Ability for detecting demonic influence in areas tainted by its presence or souls stained by its touch. This effect last for as long as the blood point remains in her system. Blood is always consumed in the order it was ingested.

••• Aegis Alighieri
System: The koldun lacerates a vein, spending one turn and a blood point to coat an amulet in her blood, then makes the activation roll (Attribute: Charisma). For the remainder of the scene, the koldun adds successes scored on the activation roll to the difficulty rating for supernatural attacks and influences of infernal origin used to target her (such as infernally blessed objects, Investments and Gifts, or any Disciplines and blood sorcery powers wielded by infernalists and demons). She also gains an amount of extra dice on rolls to resist those same effects equal to the amount of successes scored. Any mundane or mystical object may be consecrated as an amulet; popular choices include ceremonial daggers, shamed crucifixes, or decapitated heads that animate to scream endlessly in silence. However, only the koldun benefits from the protection granted through Aegis Alighieri and must have the amulet on her person for this power to function. Prior to activating this power, the koldun is required to have dipped the amulet in her Well, letting it soak therein for one full night. Two or more koldun working together in close proximity (within 50 feet/15 meters) grant each other one extra success on resistance rolls and increase the difficulty to target by one (maximum 9) for all koldun present with this power activated.

•••• Heave the Host of Hell
System: The koldun creates a link to his Well by molding or digging a bowl-shaped impression (minimum one foot/30 cm in diameter) into the earth and christening it with one blood point. He chants a litany of admonishments and curses while sprinkling the blood on the area or baptizing the subject he intends to exorcize, then makes the activation roll (Attribute: Manipulation).
To cleanse an area, being, or thing of infernal imprint or evict a demonic entity, an amount of successes are required relative to the degree of corruption infused (1 to 2 for minor blemishes, 3 for subtle infections of noticeable evil, 4 or more for objects and spaces radiating a palpably potent malevolence). Infernalists imbued with the diabolical and demonic spirits disgracing an area with their presence (or directly in possession of beings, locations, or things) may resist by spending a Willpower point, then rolling Willpower (difficulty equal to the koldun’s permanent Willpower rating). Demons failing the roll are dismissed and banished back to Hell. Cleansed infernalists do not regain their damned souls, but any infernal mark that once permeated there being is permanently expelled.
One or more koldun with Heave the Host of Hell may assist a primary exorcist to negate an infernal blight. The difficulty level to cleanse or evict is reduced by one (minimum 4) for each koldun aiding in the exorcism.

••••• Reap the Well
System: Upon summoning a demon or discovering an escapee unfettered and loose outside the prison of Hell, the koldun may attempt to bind and enslave the creature to her will. The koldun cuts her wrists, taking a turn to pool one blood point in her cupped hands in order to fabricate a connection to her Well. When ready, she spends a Willpower point and makes the activation roll (Attribute: Strength). The blood leaps from her hands in the form of six interlocking hooked chains anchored beneath her slit wrists which lunge toward the target with unerring precision (maximum 100 feet/30 meters). If the roll is a success, the blood-hooks painfully latch into the entity, creating gory wounds (no damage) regardless of whether the creature possesses a physical form. An ensnared creature may struggle to break one chain per turn by spending a Willpower point, then rolling Willpower (difficulty equal to the koldun’s permanent Willpower rating).
For as long as the hooks penetrate the entity’s body, once per turn the koldun may demand its True Name, tormenting the demon by rolling Intelligence + Intimidation against the target’s current Willpower points to wrack its soul with excruciating pain. With a success, the victim cries out the answer in supplication. The koldun has two choices: she may unshackle and dismiss the demon through Heave the Host of Hell, or absorb it into herself.
A koldun that has acquired a demon’s True Name reduces the difficulty level by two when evoking it at a later date through Call the Children. Demons bound by their True Name may exit the confines of a circle they’ve been invoked within, and can be commanded by a koldun to complete a number of tasks for a number of days equal to the successes scored on the invocation roll. The demon will answer any of the koldun’s questions, and the koldun does not need to offer an exchange of services for questions or tasks.
If choosing to absorb a chained demon, the koldun may spend a blood point to instantly call it forth again. Chained demons are wholly compliant and serve the will of the koldun in whatever capacity she demands, but must remain in bondage (maximum 100 feet/30 meters) to the koldun. A koldun can control up to six chained demonic thralls; each chain divided decreases the amount of chains available for future binding and increases the difficulty to torment untamed demons by one.
A demon who disobeys or lies to a summoner who knows its True Name when conjuring it causes a demon crippling agony. Should Reap the Well be used to perform a violent exorcism on a living host possessed by a demon, the host rolls Stamina against a difficulty equal to the amount of turns taken to tame the demon into revealing its True Name. A failure results in the host dying of shock. Multiple koldun may Reap the Well together, collectively decreasing the difficulty to torment a demon by one per chain (minimum 4). The Hellreaper who successfully extracts the demon’s True Name on their turn may choose to bind it or dismiss it. All koldun present hear the demon howl its True Name, and if dismissed, may individually conjure it. A demon in thrall to a Hellreaper cannot be evoked until released from service.]==],
				},
				["The Laws of Suleiman"] = {
					en = [==[Rites of Blood, p. 160


The Laws of Suleiman


Many of the paths associated with Dur-An-Ki are functionally identical to various Thaumaturgy paths. In many cases, the Dur-An-Ki version came first and was adapted to Thaumaturgy by Tremere.
The Laws of Suleiman is one of those paths: it is functionally identical to Path of Spirit Manipulation (Rites of Blood, pp. 142-145).]==],
				},
				["The Nightshade Path"] = {
					en = [==[The Black Hand: A Guide to the Tal’Mahe’Ra, p. 70


The Nightshade Path


• Tend the Body Garden
System: The player spends one blood point as the vampire lets some of her blood drip on to a corpse, and rolls Wits + Occult (difficulty 6). Successes allow the vampire to accelerate or arrest decomposition as follows:
1 success — Delay or accelerate rot by up to one day
2 successes — Up to one week
3 successes — Up to one month
4 successes — Up to one year
5 or more successes — Storyteller’s discretion
The vampire may use this power on mortals and animals as long as the remains have not been substantially scattered. It may be used on Kindred no longer than one turn after they’ve met Final Death. Corpses that recently belonged to the living change according to local conditions, so that one stored in a dry place might mummify, while another that rests on soil quickly sprouts plants and maggots. Living things that feed from the dead are quickened or held in stasis as the corpse is, provided they’re plants, fungi, or no larger than a scarab beetle. Kindred under Final Death wither and fall to dust without attracting such organisms.

•• Witch’s Fruit
System: The player spends a blood point while the vampire touches edible plant matter. No roll is required. The first living creature to eat this tainted meal falls into a waking, ambulatory trance for a scene, during which she may see into the Shadowlands, hear its denizens, and even touch and be touched by ghosts. The target may not make physical contact with buildings and other objects that were never alive, and may not be dragged into the Tempest or any other place that has no corresponding location in the living world. Tainted plant matter rots by the next sunrise and loses the ability to impart this state.
Witches’ fruits are mild hallucinogens. Twisted visions of ghosts and long-fallen buildings disorient mortals under their influence. This normally imposes +2 to difficulties to perform any actions except for Willpower rolls while affected. Creatures who are familiar with supernatural phenomena don’t suffer this penalty.

••• Raise the Green One
System: The player rolls Wits + Occult (difficulty 8). He spends one Willpower point and one blood point while concentrating on a corpse that lays upon or within fertile soil. If the roll succeeds, red-tinged vines, branches, and leaves envelop the corpse, and it rises to do the necromancer’s bidding. The necromancer may only raise the Green Ones one at a time, and may never have multiple Green Ones active at the same time.
Green Ones are stronger, faster, and possess better instincts than most zombies. Their traits are Strength 4, Dexterity 4, Stamina 4, Athletics 2, Brawl 3, and the equivalent of 2 dots of Fortitude, as their damp bodies resist injuries. Bashing damage inflicts half damage to a Green One. Like vampires, they suffer bashing damage from gunfire. Unlike ordinary zombies, they act in standard initiative order.

•••• Wails and Whispers
System: The vampire concentrates on a target, screaming or whispering as her intentions dictate. (The target does not need to be able to hear the vampire.) The player spends one point of Willpower and rolls Wits + Occult (difficulty 8). If she wishes to lure her target closer to death, each success adds one level of lethal damage to the total inflicted by the next injury he suffers in that scene. If she wishes to prevent the target from dying, each success sets aside one level of damage (of any kind) from the next injury the target suffers during the scene, but this benefit only lasts until the end of the scene, after which the set aside damage returns. The target suffers injury but doesn’t feel its effects, up to and including death, until the scene ends and the damage returns. Note that the Storyteller can rule that very large amounts of damage may cause death due to total or near-total destruction of the body, regardless of this power’s effects.

••••• Chthonic Womb
System: The vampire must drink at least one point of a mortal victim’s blood, but may kill him using another method. Another person or incident may cause the mortal’s demise, but the necromancer must make physical contact with him at the moment of death. At that point the player spends one point of Willpower and rolls Wits + Occult (difficulty 8). If the player succeeds, the soul occupies the vampire’s body in a dormant state for up to one month per success. (Aura Perception or similar powers will reveal the presence of the dormant soul, which might be mistaken for a form of possession.) The necromancer may store multiple souls this way, but “twins,” “triplets,” and more tax the “mother’s” energy. Each soul stored beyond the first drains one additional blood point when the vampire awakens each night.
At any point before the soul leaves her body, the vampire may summon it forth to manifest with either the traits of a recently deceased ghost (see V20, p. 385) or those it possessed in life, along with a recently deceased ghost’s supernatural abilities. It must perform three services for its “mother.” After that, the soul is free to move on to its ultimate destiny. If the ghost is commanded to perform any task that would traumatize a mortal (typically, those which would risk a Humanity check in a vampire with that trait at 7) it may, at the Storyteller’s discretion, treat the necromancer as a “fetter,” an object that the ghost fixates upon and uses as a tie to the living world. This gives the ghost the ability to haunt the necromancer until it is banished. The necromancer may always simply dismiss the soul when it appears, or even command it to leave her body while the soul still slumbers.]==],
				},
				["The Path of Blood"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 213


The Path of Blood


• A Taste for Blood
System: The number of successes achieved on the roll determines how much information the thaumaturge gleans and how accurate it is.

•• Blood Rage
System: Each success forces the subject to spend one blood point immediately in the way the caster desires (which must go towards some logical expenditure the target vampire could make, such as increasing Physical Attributes or powering Disciplines). Note that blood points forcibly spent in this manner may exceed the normal “per turn” maximum indicated by the victim’s Generation. Each success gained also increases the subject’s difficulty to resist frenzy by one. The thaumaturge may not use Blood Rage on herself to circumvent generational limits.

••• Blood of Potency
System: One success on the Willpower roll allows the character to lower his Generation by one step for one hour. Each additional success grants the Kindred either one step down in Generation or one hour of effect. Successes earned must be spent both to decrease the vampire’s Generation and to maintain the change (this power cannot be activated again until the original application wears off). If the vampire is diablerized while this power is in effect, it wears off immediately and the diablerist gains power appropriate to the caster’s actual Generation. Furthermore, any mortals Embraced by the thaumaturge are born to the Generation appropriate to their sire’s original Generation (e.g., a Tenth-Generation Tremere who has reduced his effective Generation to Eighth still produces Eleventh-Generation childer).
Once the effect wears off, any blood over the character’s blood pool maximum dilutes, leaving the character at his regular blood pool maximum. Thus, if a Twelfth-Generation Tremere (maximum blood pool of 11) decreased his Generation to Ninth (maximum blood pool 14), ingested 14 blood points, and had this much vitae in his system when the power wore off, his blood pool would immediately drop to 11.

•••• Theft of Vitae
System: The number of successes determines how many blood points the caster transfers from the subject. The subject must be visible to the thaumaturge and within 50 feet (15 meters). Using this power prevents the caster from being blood-bound, but otherwise counts as if the vampire ingested the blood herself. This power is spectacularly obvious, and Camarilla princes justifiably consider its public use a breach of the Masquerade.

••••• Cauldron of Blood
System: The number of successes gained determines how many blood points are brought to boil. The subject suffers one health level of aggravated damage for each point boiled (individuals with Fortitude may soak this damage using only their Fortitude dice). A single success kills any mortal, though some ghouls with access to Fortitude are said to have survived after soaking all of the aggravated damage.]==],
				},
				["The Path of Jinn’s Gift"] = {
					en = [==[Rites of Blood, p. 160


The Path of Jinn’s Gift


Many of the paths associated with Dur-An-Ki are functionally identical to various Thaumaturgy paths. In many cases, the Dur-An-Ki version came first and was adapted to Thaumaturgy by Tremere.
The Path of Jinn’s Gift is one of those paths: it is functionally identical to The Path of Conjuring (V20, pp. 220-221).]==],
				},
				["The Path of Life’s Waters"] = {
					en = [==[Rites of Blood, p. 160


The Path of Life’s Waters


Many of the paths associated with Dur-An-Ki are functionally identical to various Thaumaturgy paths. In many cases, the Dur-An-Ki version came first and was adapted to Thaumaturgy by Tremere.
The Path of Life’s Waters is one of those paths: it is functionally identical to The Path of Blood (V20, pp. 213-214).]==],
				},
				["The Path of Phobos"] = {
					en = [==[Rites of Blood, p. 168


The Path of Phobos


• Induce Fear
System: The infernalist may target any subject within her line of sight. She must concentrate, gesture toward the victim, and chant the proper invocation to Hell. Should she succeed, the victim becomes noticeably upset and preoccupied, which should be role-played. To resist, the victim must make a Courage roll (difficulty 4 + the number of successes achieved on the activation roll, to a maximum of 9) to take any action other than looking for the imagined stalker.
All of the victim’s dice pools for the duration of this power are automatically reduced by one. The duration of this power is limited by the number of successes achieved on the activation role:
1 success — One Turn
2 successes — Five Turns
3 successes — One Hour
4 successes — One Night
5 successes — Two Nights

•• Spook
System: The infernalist must see her victim and whisper a prayer to Hell for this power to work. The nagging sense of discomfort in the back of the character’s mind becomes more tangible. Mortals must make a successful Courage roll (difficulty 7) to keep from fleeing the area in terror. Vampires must make the same roll, but if they fail they enter Rötschreck.

••• Terrorize
System: The infernalist must concentrate for a moment and then gesture toward her victim. Should she succeed, the terrorized subject must succeed in a Courage roll (difficulty 7) to shake off her fear in order to act. Otherwise she simply cowers, feebly hiding from her imagined object of terror. Botching this Courage roll results in a derangement, preferably suited to the fear visiting the victim.
The duration of this power is limited by the number of successes achieved on the activation role:
1 success — One Turn
2 successes — Five Turns
3 successes — 30 Minutes
4 successes — One Hour
5 successes — One Night

•••• Fear Plague
System: The infernalist must see and then loudly curse her victim for this terrible power to take effect. Once cursed, this power lasts for a week. The victim is constantly harassed by his fear every moment. For the duration of this power, all Willpower rolls are made as though the character’s permanent rating is three lower than normal (to a minimum of 1).

••••• Leech of Fear
System: As long as she has her subject in sight, the infernalist may attempt to gain sustenance from any fear that the victim might be currently suffering. Naturally, the victim must have cause to be afraid of something or someone while the infernalist practices this power. These fears may not be caused by other applications of this path.
The number of successes achieved on the activation roll determines the number of points transmuted into the infernalist’s “fear pool.” Each point in this “fear pool” may be spent exactly like a blood point, beyond normal Generation limits. However, this extra source of power must be utilized before sunrise or it will disappear.
In addition to the lost Willpower point, a botch means that the infernalist gets no “fear pool” from the victim, and cannot use the power on that victim again for 24 hours.]==],
				},
				["The Path of Praapti"] = {
					en = [==[Rites of Blood, p. 165


The Path of Praapti


• Teleport up to 10 yards/meters.

•• … up to 50 yards/meters.

••• … up to 500 yards/meters.

•••• … up to 5 miles/8 kilometers.

••••• … up to 500 miles/800 kilometers.
Teleportation is rarely exact. Every “1” rolled on a successful roll throws the sorcerer off by 10% of the total destination. The number of successes rolled determines what can be conveyed. A single success allows for the teleportation of the sorcerer’s nude body. Each additional success allows for the conveyance of an additional twenty pounds. If the successes rolled are not enough to encompass what the sorcerer seeks to carry, the Storyteller decides what is left behind.]==],
				},
				["The Path of Skulls"] = {
					en = [==[Dark Ages Tome of Secrets, p. 54


The Path of Skulls


• Calvaria Emissicius
System: The necromancer must possess the skull of any creature he’s personally slain. The player spends a blood point and rolls Perception + Occult (difficulty 5). Failure has no effect; a botch means the skull crumbles to dust immediately. Success means the necromancer can instantly enter a meditative state in which he can see through the sockets of the skull, canceled only once the trance is broken or the sun rises. This spying state can be reentered a number of times equal to the number of successes.

•• Consilium Mortuus
System: The necromancer must possess the decapitated head of a being whose language he would understand. The player must spend at least one blood point and roll Manipulation + Empathy (difficulty 6). Failure has no effect; a botch means the head will answer only in lies to the necromancer’s questioning. Success forces the head to answer one question posed by the necromancer truthfully, but it must be to a question to which the head’s former owner would know an answer. For each blood point spent above the initial one, an additional question may be asked.
No spirit is summoned with Consilium Mortuus — the dead being with whom the necromancer communicates isn’t even aware of being channeled. The answer comes through vestigial memory, traces left in the head’s rotting brain, imprinted on its putrefying tongue.

••• Ammorsus Vicarius
System: The necromancer must possess a skull or rotting head with all teeth removed. The player must spend one point of Willpower and at least one point of blood for this power to take effect. In place of teeth, a vicious row of fangs emerges in the skull, remaining until it consumes as many blood points as spent by the necromancer in its activation. At this point, the skull becomes inert and its fangs fall out.
The skull instinctively bites when in a half-meter (1 1/2 feet) proximity to living flesh and warm blood. With the vampire’s expenditure of a second Willpower point, it will also tackle Cainites. The skull is able to propel itself half a meter (1 1/2 feet) with jaws wide on a single occasion, with a total combat dice pool of 6 and standard difficulty. A successful bite from an independent skull is an immediate clinch from which the skull will not retract until destroyed.
The skull may be wielded as a weapon by the necromancer, in which case it holds the same combat dice pool and difficulty as the weapon upon which it’s affixed (see V20 Dark Ages p. 349). In this case, the skull will willingly retract its bite if the necromancer pulls it away from a victim.
The skull’s bite deals three levels of aggravated damage for every turn its fangs are gripped on a target. It also consumes one blood point per turn, which is necromantically channeled to the Cainite who gave it power. Vitae channeled in this way can count toward a blood bond.
The skull is destructible, but takes at least one turn of focused attack to destroy. For the purposes of defense, the skull cannot dodge or maneuver. It has a Strength rating of 3 for determining resistance to being pried free and a Stamina rating of 2; it only has three health levels, and it can only soak bashing damage.
A necromancer may animate multiple skulls by making the expenditure of Willpower and blood for each.

•••• Exedo Animus
System: The necromancer must possess a skull, and know the identity of the person of whom the skull once formed a part. The player must spend two Willpower and two blood points, and roll Intelligence + Occult (difficulty 7). Failure has no effect; a botch means the memories of the deceased will be confused and misleading. Success allows the necromancer to upend the skull and drink the personality from it. For each success, the necromancer gains an hour as host to the skull’s memories and identity.
The effects of Exedo Animus allow the necromancer to perform Intelligence-based rolls surrounding recollection and memories of the deceased at a difficulty decreased by 3. These memories stop at the point of death — the spirit in communion is a shadow of life, rather than an independent, thinking wraith.
Exedo Animus also grants the necromancer the power to impersonate the identity of the deceased, gaining three dice on Performance-based rolls when doing so. Such an imitation suffers penalties when the necromancer doesn’t physically resemble the dead source of her mimicry, but when utilizing Obfuscate or explaining she’s channeling the dead instead of being the dead, these acts are more successful.

••••• Degulo
System: The necromancer must possess the skull of the being whose powers he wishes to ingest and subsume. The player must spend two Willpower and make a Willpower roll (difficulty 9). Willpower cannot be spent to create an automatic success on this roll. Failure has no effect; a botch means the necromancer loses whatever he was prepared to sacrifice for the Discipline, but gains none of the benefits. Success allows the necromancer to unhinge his jaw and consume the skull whole, subsequently subsuming elements of the devoured spirit.
Degulo forces the vampire to lose any one trait on his character sheet. The Storyteller then replaces this trait rating with that held by the dead person whose skull has been consumed.
The vampire using Degulo is restricted to swapping only one trait rating, and as the skull is consumed in the act, this act cannot be repeated with further traits from the same spirit. Unlike the other levels of the Path of Skulls, if there is a wraith of the deceased, it is affected by this power, gaining the trait bequeathed by the necromancer in exchange for its own.
Degulo’s sole restriction applies to Disciplines, allowing only for an equal rating swap of Cainite powers. A necromancer cannot exchange his one dot in Auspex for another Cainite’s four dots in Dominate, but can exchange his one dot in Auspex for the first dot of the deceased Cainite’s Dominate Discipline. The practitioner of Degulo then loses his chosen Discipline as a Clan Discipline, gaining the consumed Discipline as his new Clan Discipline.]==],
				},
				["The Path of Woe"] = {
					en = [==[Dark Ages Tome of Secrets, p. 57


The Path of Woe


• Finding the Locus
System: The player spends one blood point as her vampire rubs vitae into her eyes, and rolls Perception + Awareness (difficulty 5). Failure has no effect; a botch means the necromancer mistakes the wrong object for a Fetter. Success allows the necromancer to see an ectoplasmic glow surrounding something important to a wraith, such as the sword used to kill him, the dress she died in, the house in which he grew up, or the daughter she gave up to the Church. Each additional success allows the necromancer to see trails to other Fetters for the same wraith. The Discipline effects last for one scene. This power only allows the vampire to see a Fetter. While the wraith will often manifest if its Fetter is threatened, the necromancer will not be able to see it until it makes its presence obvious.

•• Expurgate the Damned
System: The necromancer must be in an enclosed space, form a circle of human bones, or paint one using his own vitae. The player must spend one blood point (more if painting a circle, with volume at Storyteller discretion) and roll Wits + Theology (difficulty 7, reduced by one if a Fetter within the area is identified, by two if the Fetter is harmed, and three if the Fetter is destroyed). If the wraith was within the area affected by Expurgate the Damned prior to the roll, a success ejects it from the Shadowlands and in to the living world in a vulnerable, physical form. A failure results in the Power not working; a botch pulls the vampire through the Shadowlands, where she finds herself subject to whatever the wraith has planned.
Wraiths expurgated into the necromancer’s area bear the statistics in V20 Dark Ages (p. 403), and can soak both bashing and lethal damage. Wraiths brought forth in this way can freely return to the Shadowlands, but few do when their Fetters are under threat.

••• Blood Scourge
System: The player spends a minimum of one blood point. The vitae flows freely from the palms and soles of the necromancer, who may cast her hands as if wielding a whip against the spirit before her. The player must roll Melee + Dexterity for her Cainite to hit the wraith, with the wraith granted the chance to dodge if in a position to do so. For every point of blood spent, the necromancer will inflict this number in aggravated damage on the wraith. This burning vitae causes such agony as to increase the difficulty by two on any attempt by the wraith to use its powers.
Blood Scourge cannot harm wraiths in the Shadowlands, unless the necromancer is present there.

•••• Cursed Eucharist
System: The player rolls Stamina + Theology (difficulty 6) while the necromancer attempts to feed from a wraith. On a failure, nothing happens; a botch results in burning ichor being drained from the spirit, causing one level of aggravated damage to the Cainite. Success converts the Passion being drained from the wraith into temporary Willpower, at a rate of one Willpower to every two points of Passion being consumed.

••••• Purge the Apostate’s Soul
System: The player spends three points of Willpower and rolls Intelligence + Theology (difficulty 8), while the necromancer is in the presence of at least one wraith. Failure results in nothing happening; a botch reverses the effect onto the vampire. Each success inflicts a level of aggravated damage on the soul of the wraith and anyone else within a 10-meter (11 yard) radius of the necromancer, mortal or undead. For every health level lost by the wraith, a sloughed pool of ectoplasm is produced. The necromancer can drink this, recovering one point of Willpower for each pool lapped up from the ground.
The use of this power irreversibly contaminates the 10 meter (11 yard) radius surrounding the necromancer, making it a sphere where life is incapable of growing, and into which wraiths can never again enter.]==],
				},
				["The Path of the Ailing Jackal"] = {
					en = [==[Rites of Blood, p. 160


The Path of the Ailing Jackal


Many of the paths associated with Dur-An-Ki are functionally identical to various Thaumaturgy paths. In many cases, the Dur-An-Ki version came first and was adapted to Thaumaturgy by Tremere.
The Path of the Ailing Jackal is one of those paths: it is functionally identical to The Path of the Father’s Vengeance (V20, pp. 226-228).]==],
				},
				["The Path of the Evil Eye"] = {
					en = [==[Rites of Blood, p. 160


The Path of the Evil Eye


• Humiliation
System: Each success represents one night during which the target is affected by the curse. The curse triggers once per night at a time of the Storyteller’s choosing, usually the scene during which the character is in front of the largest number of individuals or in which he is in front of the largest number of socially important people. That is, it may trigger while the character is in a crowded restaurant or when he is alone with the Prince, whichever has the greatest potential for personal embarrassment. The Storyteller determines when the curse triggers, but it should do so at least once per night.
During the trigger scene, on every Social roll made for the character, the player must add a number of automatic 1s equal to the sorcerer’s rating in the Path of the Evil Eye, thereby increasing the likelihood of a botch on a Social roll. In addition, during the trigger scene, the Storyteller should roll a number of dice equal to the sorcerer’s rating in this path (difficulty 5). Successes mean that some external event happens that causes embarrassment to the character, such as a waiter spilling drinks on him or a car splashing him with mud.

•• Loss
System: Within one week, the target loses one dot from an appropriate Background. Generally, the curse preferentially attacks Resources over other Backgrounds, but theoretically any form of tangible Background representing a personal asset can be a valid target. The sorcerer has no control over how the Background point is lost or even which Background point is lost. The Storyteller may even choose to decide randomly.

••• Peril
System: The number of successes determines how many nights the character is at risk. At the start of each night, the Storyteller must roll a die and, depending on the results, fashion an encounter for the targeted character.
1-3 — None. The curse does not trigger during this night.
4-6 — Minor: An encounter which is not likely to harm the character but which has a chance to do so. A mortal tries to mug the character while she is in front of mortals, or simply tries to hold up a convenience store while the character is in line paying for gas. A bar patron takes offense to something the character does or says and tries to pick a fight.
7-8 — Moderate: An encounter with a significant likelihood of at least some harm to the character. The character is involved in a car wreck or struck by a hit-and-run driver. Stairs give way while the character is climbing them.
9 — Severe: An encounter in which the character is almost certain to suffer some lethal damage. The character inadvertently says something offensive that provokes frenzy rolls in nearby vampires. The building collapses while the character is in it or a fire breaks out.
10 — Catastrophic: An encounter that is potentially deadly. The character’s is locked out of his haven during the day. The character unwittingly says something that offends a pack of nearby Lupines.
Nights on which there is no peril do not count against the ashipu’s successes; the curse will continue until the target has suffered a number of dangerous encounters equal to the successes or the curse is lifted. During any dangerous encounter, a targeted character has a chance to realize she is under a curse (if she didn’t already know it). The roll is Intelligence + Occult. The default difficulty is 9, but it drops to 8 if the character has Auspex or to 6 if the character has any knowledge of this Path.

•••• Enemy
System: For each success on the Willpower roll, the target loses one dot of Allies, Contacts, Influence, or Retainers. This may reflect friends and allies who have become angry with the character and turn their back on him, it may reflect contacts and allies who are simply unavailable for a time, or it may actually result in such characters being injured or even dying due to ill fortune. Alternatively, the player may choose to spend some or all of the successes to give the target a new Enemy (as per the Enemy Flaw) who arrives to pursue a vendetta against the character. Regardless, the effects manifest within a week, and the player of the targeted character may neither regain lost Backgrounds nor remove the Enemy Flaw without learning about and neutralizing the curse.

••••• The Eye That Wounds
System: While the curse allows for flexibility, the default assumption is that for every two successes (rounded up), the target (or object, if the curse is directed toward a possession of the target) suffers one level of aggravated damage. Generally, even a single level of damage is sufficient to slay an animal or destroy most objects. If used against a mortal, this power will permanently maim him. If used against a Kindred, the curse will inflict damage shaped by the ashipu’s words. If she compliments his beautiful eyes, they will be burned and he might be rendered blind until he can heal. If she mocks his honeyed words, the curse might burn out his tongue and leave him unable to speak. This curse may be transmitted through an effigy, but the normal difficulty penalty imposed for using an effigy increases by +2 (see Principles of Contagion and Sympathy on pp. 133-135).]==],
				},
				["The Path of the Twilight Garden"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 289


The Path of the Twilight Garden


• Whispers to the Soul
System: A Lilin whispers one of the secret names of Lilith. Any single target within 100 paces and in the character’s line of sight will hear the whisper as if the invoker were speaking directly into his ear. The target must immediately make a Willpower roll (difficulty 8) or be tormented by nightmares and hallucinations for a number of days and nights equal to the invoker’s Manipulation score. This causes the target to lose two dice from all dice pools for the duration of of the power.

•• Kiss of the Dark Mother
System: The player spends a blood point as the vampire fills her mouth with the caustic substance. The next bite attack she makes deals double damage before soak is applied. This does not make feeding more efficient, nor does it exacerbate the damage done by blood loss. If the vampire does not use a bite attack on a target, her bite remains potent for the rest of the night.

••• Dark Humors
System: The player spends two blood points as the Lamia cuts open her skin (she may use a knife, bite her tongue, or simply rake her skin with her claws). She transubstantiates a small amount of blood into one of the humors described below. She may also use this as a defense against another vampire that is feeding on her. The target needn’t ingest the humor to suffer its effects; skin contact is all that is required.
The four humors are:
Phlegmatic: Exposure to phlegmatic humors makes the target lethargic. All dice pools are reduced by two for the remainder of the scene.
Melancholy: Melancholic humors plunge the target into deep despair. For the rest of the scene, he may not spend any Willpower points and the difficulty of all his Willpower rolls is increased by two.
Sanguine: When exposed to sanguine humors, the target becomes prone to excessive bleeding. Any lethal or aggravated wounds will deal an extra level of damage of the appropriate type on the following turn.
Bilious: Bilious humors poison the target, inflicting a number of levels of lethal damage equal to the necromancer’s Stamina.

•••• Caul of the Neverborn
System: The vampire drinks at least five points’ of blood from a cold corpse, then spends five points to invoke the power. She then transforms on a spiritual and physiological level; her eyes become solid black, her manner becomes distant and cold. She gains two additional soak dice and immunity to all wound penalties for the remainder of the scene. With a successful Perception + Occult roll (difficulty 7), she may see into the Shadowlands and speak with any ghosts there. Finally, she can immediately tell the relative health of any being she sees, as injuries and diseases manifest themselves vividly on a creature’s aura.

••••• Lament of D’hainu
System: The player rolls spends two Willpower points and rolls Stamina + Athletics, difficulty 7. For every success she rolls, the radius of Lament of D’hainu increases by five yards/meters. Anyone within the radius of the Lament (except the necromancer) must make a Willpower roll, difficulty 7. If the Willpower roll fails, the Lament’s victims are overcome with despair and seek to end their lives immediately. Men will fall on their swords, lupines will tear out their own throats, and mages will turn their magics against themselves. Unless stopped, a victim of the Lament will not cease in her quest for death until she succeeds in killing herself. Cainites affected by the Lament are not driven to suicide, but rather fall into torpor immediately. Even if the target succeeds at the Willpower roll, he shakes off his suicidal urges, but her dice pool for all actions is reduced by two for the remainder of the scene. If a victim who failed the Willpower roll has not succeeded in killing herself by the end of the scene, the effects of the Lament wear off, but her dice pool for all actions is reduced by two until the next sunrise.]==],
				},
				["The Revelations of Duat"] = {
					en = [==[Dark Ages Tome of Secrets, p. 61


The Revelations of Duat


• Sight of the Jackal
System: Additional successes allow greater perception of the strength, shape, and history of the ghost. The power lasts for the remainder of the scene. Ghosts become aware of the sorcerer on a botch, and depending on their temperament they may attack the vampire. Sight of the Jackal does not allow sorcerers to communicate with the dead.

•• Weigh the Virtues
System: For each success, a different deed — from saving a child from a crocodile’s jaws to murdering a rival over a lover — appears to the sorcerer in vivid detail. On a botch, this power reveals one of the sorcerer’s sins to his most trusted companions.

••• Pharaoh’s Sentry
System: When a sorcerer practices Pharaoh’s Sentry on a corpse dead for a single night in a place a ghost haunts, a fragment of the ghost’s soul moves to the corpse and causes its reanimation. The sorcerer must have used Weigh the Virtues previously to identify a spiritual hook with which to snare the spirit. Each success allows the power to be used on a corpse dead for an additional night.
The sorcerer’s edict must be a single sentence, i.e. “You must guard this tomb from all intruders but me,” or “You must follow this man to his house, and kill him inside.” Ambiguity leads to grave mistakes. In the previous examples, “You must guard this tomb from all intruders,” would lead to even the sorcerer being attacked should he attempt to enter the tomb; and “You must follow this man to his house and kill him,” may lead to the victim’s murder at a premature point, rather than inside the hoped-for building.
The animated corpse remains active permanently without succumbing to decomposition.
A botch on attempting the Pharaoh’s Sentry causes the corpse to rise and mindlessly attack its summoner until destroyed.
Attributes: Strength 4, Dexterity 3, Stamina 5, Charisma 0, Manipulation 0, Appearance 0, Perception 1, Intelligence 0, Wits 1
Abilities: Alertness 2, Athletics 2, Brawl 3, Intimidation 2, Melee 2, Stealth 2
Disciplines: Fortitude 1
Willpower: 5
Health: 7
Notes: These sentries commonly have a reserve of seven blood points, and crumble to dust after using them. This blood is dead for the purpose of feeding, so cannot be consumed by vampires.

•••• Imbue with the Grace of Anubis
System: A sentry with basic memory of its defining deeds will act impulsively in ways similar to its former life; i.e. a former murderer who cut the throats of merchants will always slay any traders it meets with attacks to the neck, while a priest who assisted the poor will target the homes of the wealthy, burning them down and massacring the inhabitants. A single success plants the memory of one deed in the mind of the sentry, with each additional success giving the sorcerer the option to place another.
The spirit from which the deed is drawn for the creation of this powered sentry is aware of its virtues or sins being drained, but without the sorcerer’s aid cannot recover the piece it loses to this power. The sorcerer must spend a blood point to return the deed to the spirit from which it originated, at which point it becomes an unthinking sentry retaining the same statistics, but none of the freedom of thought.
The sentry attacks its master on a botched roll.
Attributes: Strength 5, Dexterity 4, Stamina 5, Charisma 0, Manipulation 0, Appearance 0, Perception 2, Intelligence 0, Wits 2
Abilities: Alertness 2, Athletics 3, Brawl 3, Intimidation 3, Melee 3, Stealth 3
Disciplines: Fortitude 2, Potence 1
Willpower: 7
Health: 8
Notes: These sentries commonly have a reserve of eight blood points, and crumble to dust after using them. Storytellers may augment statistics appropriate for the deed imbued in the corpse.

••••• The Sorcery of Life
System: The sorcerer must have taken steps necessary to Imbue with the Grace of Anubis, and hold in their thrall an animated corpse bearing the fire of emotion-fueled deeds. Each success converts to points the sorcerer can assign to the sentry’s Attributes or Disciplines. Any Disciplines granted to the sentry must be from those the sorcerer holds. The Proto-Bane Mummy is still subject to the sorcerer’s whims, but will attempt intricate tasks if its Intelligence is increased to allow understanding of complicated commands.
As with Imbue with the Grace of Anubis, the spirit harvested for the creation of this Proto-Bane Mummy is aware of its virtues or sins being stolen. The sorcerer must spend a blood point to return the deed, at which point the corpse becomes an unthinking sentry retaining the same statistics, but none of the freedom of thought or capability to use Disciplines.
Attributes: Strength 6, Dexterity 4, Stamina 6, Charisma 1, Manipulation 1, Appearance 0, Perception 3, Intelligence 1, Wits 2
Abilities: Alertness 3, Athletics 3, Brawl 3, Intimidation 4, Leadership 1, Melee 3, Stealth 3, Survival 2, Occult 2, Theology 1
Disciplines: Fortitude 2, Potence 2
Willpower: 9
Health: 12
Notes: These are the default statistics for the Proto-Bane Mummy, before additional successes are translated to additional points. These monsters commonly have a reserve of ten blood points, and crumble to dust after using them. They can acquire further blood through eating a vampire or mortal’s flesh. Storytellers may augment statistics appropriate for the deed imbued in the corpse. Proto-Bane Mummies can soak all but aggravated damage.]==],
				},
				["The Revelations of Eden"] = {
					en = [==[Dark Ages Tome of Secrets, p. 64


The Revelations of Eden


• Remove one point of temporary Willpower from the victim, and one dot from her Willpower rating.

•• From the victim remove one point of temporary Willpower, and one dot from her Road rating.

••• From the victim remove one point of temporary Willpower, and one dot from her Self-Control/Instinct.

•••• From the victim remove one point of temporary Willpower, and choose her new Demeanor.

••••• From the victim remove one point of temporary Willpower, and choose her new Nature.]==],
				},
				["The Revelations of Midgard"] = {
					en = [==[Dark Ages Tome of Secrets, p. 65


The Revelations of Midgard


• Bestowment of Scales
System: Bestowment of Scales affects any living creature or ghoul from whom the Cainite has fed, no matter the distance. When such a cultist incurs harm, the sorcerer can reflexively apply her undead endurance to the cultist’s body, the damage being transferred to the vampire. The Cainite can soak this damage in the normal way, though any damage not soaked by the vampire is suffered by the cultist. The cultist develops scales in the place they would have suffered harm. Depending on the location, this can reduce the cultist’s Appearance rating, though Setites acknowledge the deformity as a blessing. A botch on this power allows the vampire to absorb the damage, but prevents her from soaking any of it.

•• Suffer for Jormungandr
System: When a Cainite schooled in Suffer for Jörmungandr receives physical harm, she may apply that harm to a mortal servant from whom she has taken blood, and to whom she has given vitae. The cultist must be within eyeshot of the sorcerer. Suffer for Jörmungandr is activated reflexively unless the vampire chooses not to use it. For each success accrued beyond the first, the vampire may inflict an additional level of the damage that she has incurred on her chosen cultist. Damage acquired in a single turn may not be distributed among multiple cultists, and any damage exceeding the cultist’s health track will return to the vampire to soak or incur. The manifestation of this power reduces the cultist’s Appearance rating gradually, at Storyteller discretion. A botch on the roll for this power still transfers all damage to a cultist, but each point is converted to aggravated if it’s not already so.

••• Swallow the Tail
System: This power is always activated as the final action of a turn, after Celerity actions. Blood within eyeshot of the vampire slithers towards her, taking a turn to reach her mouth and replenish lost blood points. It is the Storyteller’s discretion how many blood points are in the surrounding area, but each success rolled allows one blood point to slink towards the sorcerer. On a botch, the power forces the vampire to disgorge ten blood points minus her Road rating. This power cannot be used to drain blood from a living or undead vessel.

•••• Cycle of the Midgard Serpent
System: A Setite using this power may impart points in Disciplines to a ghoul who’s consumed at least one point of her blood. The number of Discipline points bestowed is equal to the number of successes rolled. The power remains until the sun next sets. Some powers are dangerous or actually self-destructive if a mortal uses them. The Storyteller has the final ruling on whether a ghoul can use a given Discipline.
For the purposes of Disciplines that require the expenditure of blood points to activate, the ghoul possesses an equal number of blood points to those consumed from the regnant on the night the power is activated. A botch on this roll results in the ghoul gaining the points in Disciplines until the next sunset, but the blood bond to his domitor breaks. The breaking of this bond is not known to the vampire.

••••• Apep’s Transformation
System: This power only affects a mortal or ghoul cultist who’s imbibed the blood of the vampire sorcerer. On a successful roll, the cultist’s body spends ten turns — minus the number of successes rolled — contorting and shifting into a limbless serpent, its arms and legs sloughing off as an amalgamation of dead skin, tissue, and bone. The Apep cultist bulges into a serpent form approximately the size of a destrier. It cannot speak, but can understand its creator’s language. The change into an Apep cultist is permanent. The serpent remains loyal to the vampire as a bestial ghoul, still requiring regular doses of vitae. Any Revelations of Midgard powers usable on followers remain usable on the Apep cultist. A botch on the roll to perform this power kills the cultist and provokes a frenzy test for the sorcerer, as she’s presented with a humiliating failure of faith.
The Apep cultist has the following statistics:
Attributes: Strength 5, Dexterity 5, Stamina 4, Charisma 3, Manipulation 1, Appearance 1, Perception 3, Intelligence 2, Wits 3
Abilities: Alertness 4, Athletics 4, Brawl 5, Intimidation 5, Performance 3, Stealth 4, Survival 3, Theology 3
Disciplines: Fortitude 1, Potence 2, Presence 2
Willpower: 9
Health: 15, no wound penalties
Notes: The Apep cultist commonly has a reserve of ten blood points, and sinks into a torpid state without blood. They can acquire further blood through drinking from a victim. Apep cultists can soak all but aggravated damage. Its bite attack uses eight dice (Strength + 3).]==],
				},
				["The Taking of the Spirit"] = {
					en = [==[Rites of Blood, p. 170


The Taking of the Spirit


• Return of 3 Willpower points per day’s rest

•• Return of 2 Willpower points per day’s rest

••• Return of 1 Willpower point per day’s rest

•••• Return of 1 Willpower point per week’s rest

••••• Return of 1 Willpower point per two week’s rest]==],
				},
				["The Transylvanian Kraina"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 275


The Transylvanian Kraina


• Burebista’s Throne
System: The koldun spends a blood point and makes the activation roll (Attribute: Perception). If atop any mountain in Carpathia, there is no need to expend blood. On a success, the koldun can send his senses soaring high into the air, or extend them beyond their body; how far depends on how many successes are rolled (see below). This effect lasts until the koldun pulls back his senses or the end of the scene, whichever comes first.
1 success — A 50 yard/meter radius
2 successes — A 100 yard/meter radius
3 successes — A 500 yard/meter radius
4 successes — A mile/1.5 kilometer radius
5 successes — A three mile/ten kilometer radius

•• Pietrosu’s Hospitality
System: The koldun must toss the requisite blood into the air (unless they are standing within sight of the Carpathians, in which case no blood expenditure is required) and make the activation roll (Attribute: Dexterity). If they succeed, a powerful, frigid wind arises all around the koldun for a number of turns equal to successes rolled. This wind causes one level of bashing damage each turn and numbs the bodies of anyone except the koldun caught within, reducing their movement by half and Dexterity pools by two. On the turn after this power expires, the Dexterity penalty is reduced to one and movement is three-quarters, and the turn after that the victim regains full Dexterity and mobility. A useful side effect of this power is that the koldun is immune to the cold and force of wind while this is active; when trekking in mountains or other environs where wind may be a hazard, they need only activate Pietrosu’s Hospitality to ward themselves from danger.

••• The Banks of the Basca
System: The koldun releases her blood into running water - a river or stream is most common, though a rivulet or even just runoff from thawing snow is enough — and rolls to activate this power (Attribute: Strength). On a success, the blood bolsters the flow, causing it to swell and surge forward, a flash flood given magical life. Anyone, as well as most anything not secured to the ground, caught in its path will be swept away towards the point of lowest elevation at a rate of a hundred yards a turn, and must soak five dice of bashing damage per turn. Any subject somehow prevented from being carried downstream — wedged against a wall or other immoveable object, for instance — takes twice the normal amount of damage. Additionally, mortals must make a swimming roll (difficulty 8) each turn to avoid swallowing great mouthfuls of water; failure inflicts one additional level of lethal damage which cannot be soaked. These rushing waters last for a number of turns equal to successes rolled to activate the power, or twice that number if the source of the flooding is any Carpathian river.

•••• Kupala’s Exhalation
System: The koldun expends blood, at least one point’s worth but as much as she wants, and rolls to activate this power (Attribute: Stamina). Once per turn, for a number of turns equal to the successes she rolled, to a limit of however much blood was spent, she may cause the gasses beneath the ground to erupt upward, forming a tiny volcanic crater. These gasses are bitingly cold; anyone caught within a ten-foot radius of the cone is subject to the same damage and penalties as Pietrosu’s Hospitality. Even worse, the bubbling gas is highly flammable; any nearby flame will ignite the gas in a terrible explosion, inflicting five dice of lethal damage (aggravated to vampires) to all those within range of the cone. If this power is activated within the Berca basin, each blood point spent counts for double.

••••• Restless Medias
System: The koldun spends a Willpower point in addition to the usual blood point and activation roll (Attribute: Strength). If used within sight of the Carpathians, no blood point expenditure is necessary. Each success allows the koldun to either affect a larger area (see below) or prolong the earthquake’s duration. Anyone and anything caught within range of the quake is subject to ten dice of lethal damage each turn they remain in its area of effect, and must make a Dexterity + Athletics roll (difficulty 8) or else be knocked off their feet. Most homes and simple structures will collapse after a turn or two; structures of sturdier construction, such as castles, remain standing four or five turns before they are utterly destroyed.
1 success — One home or a small building
2 successes — Several buildings, as many as five
3 successes — An entire street in a town or village
4 successes — A large structure, such as a castle
5 successes — An entire village, or a portion of a city]==],
				},
				["The Way of Earth"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 448


The Way of Earth


• Grasping Soil
System: The koldun may direct any patch of earth within a 100-foot/30-meter radius to ensnare a target for two turns per success rolled. Animated dirt ascends and constricts midway between the victim’s knees and hips, holding her fast unless her player scores five successes on Strength + Survival roll (difficulty 6). It is also possible to use this power as an attack, in which case the grasping earth crushes once and then releases. Used in this manner, each success on the casting inflicts one level of lethal damage. Such damage manifests as broken legs and crushed feet.

•• Endurance of Stone
System: A successful activation roll grants the koldun two extra dots of Stamina for the rest of the scene. These dots are considered part of the character’s natural Stamina and may aid in any uses of that Attribute, including soak.

••• Hungry Earth
System: Like Grasping Soil, every success on the activation roll leaves the victim immobile for one turn. However, the difficulty of the Strength + Survival roll to break free increases to 8 and doing so still requires five successes. As the earth continues to shift and grasp while the power remains active, this roll must be made as a single (though repeatable) attempt rather than an extended test. In addition, beings trapped in the crushing pit suffer one level of lethal damage each turn. Beings capable of soaking this damage may do so, but at difficulty 7. At the end of the power’s duration, the earth yawns once more to release the victim.

•••• Root of Vitality
System: The player spends as many blood points as desired (which may require multiple turns depending on Generation) and makes the activation roll. Each success permits the earth to heal two levels of bashing damage or one level of lethal damage. Healing aggravated damage requires two successes per level. The total number of health levels that may be restored with each use of this power is the number of blood points invested or the number of successes on the activation roll, whichever is lower. Any blood points spent beyond the number of successes drain away to no effect. The actual healing process takes one turn per bashing level, one minute per lethal level, and one hour per aggravated level. Once the healing is complete or the power is interrupted through determined excavation, the earth expels the target back to the surface.

••••• Kupala’s Fury
System: This power requires a Willpower point in addition to the usual cost and activation roll. The koldun smites the earth with his fist, and his anger flows through the soil to any target in his line of sight. The quake erupts outward from that point, inflicting 10 dice of lethal damage on everything and everyone in the area of effect. Most wooden structures collapse entirely and even buildings of concrete and steel may grow cracked and pitted with superficial damage from the shaking earth. This tremor lasts one turn and affects an area determined by the number of successes rolled. It is not possible to apply fewer successes than those rolled.
1 success — One house or single storefront
2 successes — Five lesser structures or a small city block
3 successes — An entire side street or a large city block
4 successes — Multiple square blocks or a large structure (like a stadium)
5 successes — An entire neighborhood or massive industrial complex]==],
				},
				["The Way of Fire"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 452


The Way of Fire


• Fiery Courage
System: Once learned, this power is permanent and requires no activation roll or blood. The koldun subtracts his rating in the Way of Fire from the difficulty of Courage rolls to resist Rötschreck from exposure or proximity to flame. This power does not aid in resisting the panic that accompanies sunlight or any other causes apart from actual fire. If this reduces the difficulty of a Courage roll below two, the koldun simply does not succumb to the Red Fear. Koldun never risk Rötschrek from fire and magma they conjure.

•• Combust
System: For every success on the activation roll, the target suffers one level of aggravated damage. This attack may be dodged, but not blocked, and can affect living (or unliving) beings at +2 difficulty. It is only possible to make one fiery attack per turn.

••• Wall of Magma
System: The wall of magma summoned with this power has a lifespan of two turns per success rolled. If the koldun wishes to release the magma along a shape other than a protective circle, increase the base difficulty by one. Characters cannot approach a wall of molten rock without a Courage roll (difficulty 8), and even then, the close blistering heat inflicts a level of aggravated damage. Actual contact with the lava increases the damage to three levels and raises the soak difficulty to 9, assuming any sort of soak is possible. The koldun takes no damage from his proximity to the summoned magma (although contact with it still damages him as normal).

•••• Heat Wave
System: On a successful activation roll, the victim suffers five levels of lethal damage that may be soaked by beings capable of such. Vampire targets also lose five blood points, regardless of the damage inflicted.

••••• Volcanic Blast
System: This power costs one Willpower point in addition to a blood point. For every success on the activation roll, the initial lava burst lasts one turn. The rivers of burning liquid rock then flow sluggishly for twice this duration before suddenly cooling and hardening. Even if an object survives the heat, it now lies trapped beneath the rock. Anything that makes contact with lava (including the koldun) suffers a minimum of three levels of aggravated damage. For objects that don’t have health levels, the Storyteller must decide how many turns they last before melting or erupting into their own inferno. A botch on this power opens the lava geyser under an unintended target, possibly the koldun himself.]==],
				},
				["The Way of Sorrows"] = {
					en = [==[Rites of Blood, p. 157


The Way of Sorrows


• The Frustrations of Nestrecha
System: For one turn per success, the target may not spend Willpower for any purpose.

•• The Insults of Krivda
System: In response to the insult, the target must immediately roll Self-Control to resist frenzy against a difficulty of 5 + the number of successes on the activation roll, maximum difficulty 9.

••• The Weeping of Kruchina
System: For one turn per success, the target is overwhelmed by intense misery and weeps uncontrollably. She cannot engage in any action that requires concentration, and a Kindred loses one blood point each turn as vitae streams from her eyes.

•••• The Misfortune of Chernogolov
System: The target automatically loses two successes on every roll she attempts. The effect lasts for a number of consecutive rolls equal to the successes rolled.

••••• The Starvation of Marena
System: For each success, the target suffers two levels of bashing damage that can be soaked normally. In addition, a vampire targeted with this power loses one blood point per success.]==],
				},
				["The Way of Water"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 450


The Way of Water


• Pool of Lies
System: With a successful activation roll, the koldun may project an illusion on any water surface in line of sight. The illusion may speak and move however the vampire wishes, though it has no substance and cannot step beyond the bounds of the water. The phantom lasts one turn per success rolled, after which it slowly dissipates into fine mist. It is possible to extend this lifespan with subsequent activations of the power, each of which stack in determining final duration. Rolls to extend an illusion’s duration add one to the base difficulty, but require no blood. Once an illusion fades away, it must be cast anew.

•• Watery Haven
System: This power requires no blood. If the player gains two or more successes on the activation roll, the vampire sinks into the water as per the Protean power Earth Meld. A body of water must be at least two feet deep and as large in other dimensions as the vampire’s body to contain him. Catching a glimpse of a hidden koldun in the water requires a successful Perception + Alertness roll (difficulty 8).

••• Fog Over Sea
System: For every success on the activation roll, the koldun may walk on water for one scene or one hour, whichever is longer. A koldun may choose to drop the effects of this power in order to submerge or swim; however, the vampire may not walk on water again unless he reactivates the power.

•••• Minions of the Deep
System: The player spends one Willpower point and makes the standard activation roll. With success, the player may spend blood to summon elemental minions. This blood must be dripped or flung into a body of water, which may require multiple turns depending on generational limits for blood expenditure.
Once the last drop of blood falls, the water rises into whatever form the koldun desires. The caster may create as many minions as blood points spent, though not more than the total number of successes rolled. Regardless of their form, the spirits have a rating equal to the vampire’s Wits in all Traits. These beings have no Knowledges and no Skills apart from Stealth. Furthermore, their Mental and Social Attributes are considered to have a rating of 1 except in passive or defensive situations (such as to resist persuasion or mind-control).
Water elementals soak and otherwise suffer damage as vampires, including from sunlight. Fire harms them less, inflicting bashing damage only. Moreover, the watery creatures may extinguish flames with their liquid bodies, though not without suffering injury. An elemental who leaves the body of water that spawned it suffers one level of aggravated damage per hour. Minions regenerate one level of damage of any kind (including aggravated) each turn they remain in contact with a large body of water, but do not otherwise heal. Unless destroyed, summoned minions last until the next dawn before collapsing into inanimate puddles.

••••• Doom Tide
System: The player spends a Willpower point in addition to the usual blood. For every success on the activation roll, the resulting whirlpool has a radius of five feet/1.5 meters, centered anywhere in the vampire’s line of sight. Whirlpools have a base Strength of 15, increasing by 5 dots per success after the first. Victims must successfully oppose this Strength with their own Strength + Survival (difficulty 8) in order to break free. Those who fail are sucked into the depths and pounded with crushing currents. Living beings drown normally, while vampires and other non-breathing creatures simply remain trapped helplessly in the vortex. This power lasts for one scene.]==],
				},
				["The Way of Wind"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 449


The Way of Wind


• Breath of Whispers
System: Every time the koldun wishes to send a new message via this power, his player makes the usual activation roll. However, the player need only spend blood the first time the power is used during a given scene. Each success permits one turn of speech. After the vampire concludes the message, swift winds carry it to its destination. Within a minute, the target hears the koldun as if the vampire whispered in his ear. He may reply or remain silent, but anything he says within a number of turns equal to the koldun’s successes flies back to the koldun. This power may bring words to anyone within a mile (one and a half kilometers) who is not in a sealed room. While using this power, a koldun must concentrate fully. Any disturbance breaks the communication.

•• Biting Gale
System: With a successful activation roll, the koldun summons a freezing wind within a maximum of a 100-yard/meter radius. Anyone caught in this frigid blast suffers one die of bashing damage each turn (which may be soaked normally), loses two dice from all Dexterity pools, and moves at half normal speed. The winds last as long as the koldun wills, provided he maintains concentration. Any non-reflexive actions on the part of the vampire cause the winds to still and dissipate. This includes any movement.

••• Breeze of Lethargy
System: For two turns per success, the koldun creates a wind inflicting extreme lethargy within a 200-foot/60-meter radius. Players of characters caught in this wind must roll Stamina + Survival (difficulty 8). This roll is made once every ten minutes of exposure. Failure means the character halves all dice pools involving physical actions for the remaining duration of the wind and halves all movement rates for the scene. A botch puts the character to sleep (or a state of light torpor for vampires) for the scene. Sleeping characters awaken if prodded, shaken, or otherwise manhandled, though they move slowly and may suffer halved dice pools if the wind persists.

•••• Ride the Tempest
System: With a successful activation roll, the koldun fades into the wind and flies at 250 mph/400 kph to his destination. This power cannot effectively function in caves, buildings, or other enclosed areas. Outside, the vampire’s flight navigates all obstacles. Once the koldun arrives at his destination or the scene ends, the vampire descends to earth and solidifies.

••••• Tempest
System: With a successful activation roll and a point of Willpower (in addition to the usual blood), a koldun may conjure a terrible storm. It takes six hours for the clouds to gather and thicken overhead, minus one hour for every success rolled. If this results in a duration of less than one hour, the clouds blossom outward from directly overhead like a black canopy, filling the sky in mere minutes. Once the clouds form, the rain begins to fall in torrents and the lightning begins. The storm persists at full strength for one hour per success rolled. It gradually dissipates over the hour following that. During the peak of its fury, the storm may cause flooding and certainly chills any exposed mortal to the bone (1 die of unsoakable bashing damage every five minutes of full exposure). Lightning strikes regularly, far more than a usual storm. Indeed, for a cost of one Willpower point, a koldun may direct lightning at a foe using his Perception + Occult (difficulty 6). A successful strike inflicts 10 dice of lethal damage (which can be soaked normally). Only one such attack may be made each turn.]==],
				},
				["The Way of the Spirit"] = {
					en = [==[Rites of Blood, p. 156


The Way of the Spirit


• The koldun can perceive everything within a 50-foot/20-meter radius.

•• ... within a 100-yard/meter radius.

••• ... within a quarter-mile/half-kilometer radius.

•••• ... within a mile/1.5 kilometer radius.

••••• ... within a five mile/eight kilometer radius.
System: The number of successes on the activation roll determines how many successive scenes the effect lasts. If activated before the sun rises, the koldun’s awareness can extend into the daylight hours, and the koldun suffers no negative effects from monitoring his lands during the day. He does still suffer the usual dice penalties for taking any other actions during the day.]==],
				},
				["Ushabti"] = {
					en = [==[Rites of Blood, p. 163


Ushabti


• Laborer
The ushabti can be a human or an animal. It is mindless and obeys all orders from its master. It has two dots in each Physical Attribute, one dot in each Mental Attribute, and no dots in any Social Attribute. It has no Abilities.

•• Servitor
To the Laborer, add three additional Attribute dots. None can be applied to any Social Attribute, and no Mental Attribute can rise above 2. Add two dots of non-combat Abilities.

••• Guard
To the Laborer, add six dots of Attributes and four dots of Abilities. Guards may have Social Attributes, but no Social or Mental Attribute may exceed 2, nor can any Ability.

•••• Overseer
To the Laborer, add nine dots of Attributes and six dots of Abilities; no Social or Mental Attribute may exceed 3, nor can any Ability.

••••• Gift of Khnum
The ultimate expression of this art, the Gift of Khnum (the legendary creator of humanity according to Egyptian lore) allows the sorcerer to create what is effectively a living body, either as an obedient slave or as a ready-made vessel for a wraith or a spirit. The character who activates the ushabti decides which, although the latter option requires her to have a compliant wraith or spirit handy.
To the basic Laborer, add 12 dots of Attributes and eight dots of Abilities. The ushabti gains the Virtues, Humanity, and Willpower of a starting vampire. It is sentient but emotionally bound to the one who activates it as if by a blood bond. This is true even if a spirit or wraith possesses it. Each use of Gift of Khnum costs two Willpower points at the time of activation, and the player may spend additional Willpower points to gain automatic successes on the activation roll. An ushabti created with this Path does not degrade unless someone actively challenges its identity and persuades it that it is not real. Absent proof of its own unreality, the ushabti is effectively immortal.]==],
				},
				["Vitreous Path"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 174


Vitreous Path


• Eyes of the Dead
System: The player rolls Perception + Occult, difficulty 6. One success lets a necromancer determine whether someone is injured, diseased, or dying, as well as whether the individual labors under any sort of curse or baleful magic.
Further, the vampire can divine the target’s eventual demise, depending on the successes scored. One success means the character can guess how long the target has to live to within a few weeks. Three successes means the character can estimate how long the target has to live and what the probable source of death will be, as the entropic markings show the wounds that will someday exist on that person. Five successes means the character can actually see where and when the event will occur by interpreting the black marks on the target’s soul.
This ability lasts for one scene, though the necromancer may choose to end the power early. It can be used to read the fate of only one target at a time. Storytellers should exercise judgment with this power, since the markings of death are typically unavoidable. He may decide to roll the dice himself, so that the player has no way of knowing whether her insight is correct.

•• Aura of Decay
System: No roll is required, but this power does cost at least one blood point. Objects subjected to this Aura of Decay break down and become useless after being targeted. How the object gives out, as well as the exact mechanism of failure, is up to the Storyteller. Corrosion, metal fatigue, or sheer brittleness are all suitably likely for any given item’s demise, but the in-game effect of using a doomed item is as if the owning character rolled a botch. The speed at which an item breaks down depends on how many blood points are spent.
One blood point — One week
Two blood points — One day
Three blood points — End of scene
Four blood points — Five turns
Five blood points — One turn
Note that since this power requires the expenditure of blood points, a character cannot cause an Aura of Decay while staked.

••• Soul Feast
System: The player spends one Willpower point to allow the vampire to feed on the negative energies of the dead. If the character is drawing the energies from the atmosphere, she must be in a place where death has occurred within the hour or in a place where death is common, such as a cemetery, a morgue, or the scene of a recent murder. Generally, the necromancer can draw anywhere from one to four points of entropy from such a location, although the difficulty in using all Necromancy and similar deathly powers within the area increases by an equal amount for a number of nights equal to the points taken. The energies of such an area may only be drained once until the area’s entropy replenishes.
In cases when the necromancer feeds on a ghost, the vampire must actually attack the wraith as if feeding normally. Wraiths have up to 10 “blood points” that may be taken from them, and they become less and less substantial as their spirit essence drains away. The character is vulnerable to any attack the ghost might make, even those that do not normally affect the physical world; while feeding, the vampire is essentially in a half-state, existing in both the living lands and the Underworld simultaneously. The wraith so attacked is considered immobilized and cannot run or escape unless it can defeat the vampire in a resisted Willpower roll (difficulty 6 for both sides). This power may also be used in conjunction with Ash Path Necromancy, allowing the vampire to drain power (though not sustenance) from ghosts while traveling in the lands of the dead.
This soul energy may be used just like blood in every respect except for when the vampire rises for the night. It can activate Disciplines, heal wounds, boost Attributes, etc. Botching this power renders the vampire unable to feed through the Shroud for the rest of the night. However, she remains susceptible to the assaults of ghosts and spirits for several turns (generally, a number of turns equal to the amount of energy that could have been drawn from the area, or one turn if attacking a ghost) as she hovers between worlds, unable to function effectively in either.

•••• Breath of Thanatos
System: The player spends one blood point and rolls Willpower (difficulty 8). Only one success is needed to draw out the Breath of Thanatos. If dispersed to summon Spectres, the energies cover roughly one-quarter of a mile (400 meters) in radius, centered around the necromancer. The range increases by an additional one-quarter mile or 400 meters for every additional blood point expended.
Spectres summoned with this power will ignore the summoning necromancer for the duration of the power unless provoked, but may well go out of their way to wreak havoc on anyone else in the vicinity. The necromancer can then use other Necromancy powers (such as those in the Sepulchre Path) to manipulate and affect these Spectres. Ghosts so targeted may then interact with the necromancer as normal, although the other Spectres in the area will continue to ignore both the vampire and the targeted ghost. This energy disperses after a scene, after which the Spectres leave to find new prey. Mechanics for Spectres can be found on p. 385.
If the cloud is directed toward a particular target, the necromancer must either touch the target or direct the stream of entropy using Dexterity + Occult (difficulty 7). A target laden with entropy suffers one (and only one) level of aggravated damage; this generally manifests as sudden illness or decay. The target’s social difficulties while interacting with those unfamiliar with the touch of death — most normal humans, as well as some supernatural creatures — increase by 2. Furthermore, supernatural perceptions indicate the target is tainted with decay, which can be dangerous. This form of taint lasts until sunrise; a victim already plagued by this power cannot be affected again until the previous fog of entropy has dispersed.
A botch on the roll to control this power indicates that the vampire has turned the energy upon himself, and suffers all the effects of the vitriolic breath. This inflicts the usual injury and may subject the necromancer to the possibly dangerous attention of provoked Spectres and other creatures from beyond the grave.

••••• Night Cry
System: The vampire chooses a number of targets within one yard or meter per dot of Necromancy and invokes Night Cry with a terrible scream. The player spends a Willpower point and a blood point for each target beyond the first. (In other words, she spends no blood if only going after one target, or one blood for two targets. Generational blood limits apply, and the vampire may not “pre-spend” blood prior to using Night Cry.)
The player then chooses whether the vampire will aid or harm the targets, and rolls Manipulation + Occult (difficulty 6). If she chooses to aid the target or targets, each success gives each affected target a -2 difficulty modifier to all of his actions for one turn per success. If she instead chooses harm, each success causes an aggravated wound to each target. Targets may be any kind of living creature, including supernatural ones.
No matter the result, the Night Cry is heard on both sides of the Shroud, attracting the attention of anyone nearby. On a botch, the necromancy may summon unruly ghosts or Spectres, similar to Breath of Thanatos.]==],
				},
				["Weather Control"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 228


Weather Control


• Fog: Vision is slightly impaired and sounds are muffled; a +1 difficulty is imposed on all Perception rolls that involve sight and hearing, and the effective range of all ranged attacks are halved.
• Light breeze: A +1 difficulty is imposed on all Perception rolls that involve smell.
• Minor temperature change: It is possible to raise or lower the local temperature by up to 10 degrees Fahrenheit or 5 degrees Celsius.

•• Rain or snow: As Fog, but Perception rolls are impaired to a much greater extent; the difficulty modifier for all such rolls rises to +2. In addition, the difficulty on all Drive rolls increases by two.

••• High Winds: The wind speed rises to around 30 miles per hour or 50 kilometers per hour, with gusts of up to twice that. Ranged attacks are much more difficult: +1 to firearm attacks and +2 to thrown weapons and archery. In addition, during fierce gusts, Dexterity rolls (difficulty 6) may be required to keep characters from being knocked over by the winds. When gale-force winds are in effect, papers go flying, objects get picked up by the winds and hurled with abandon, and other suitably cinematic effects are likely.
••• Moderate temperature change: The local temperature can be raised or lowered by up to 20 degrees Fahrenheit or 10 degrees Celsius.

•••• Storm: This has the effects of both Rain and High Winds.

••••• Lightning Strike: This attack inflicts 10 dice of lethal damage. Body armor does not add to the target’s dice pool to soak this attack.]==],
				},
				-- <<< PATH_DESC_END
};
