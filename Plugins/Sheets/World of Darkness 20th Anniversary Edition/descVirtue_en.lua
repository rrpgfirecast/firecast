-- The seven Virtues, the en half (SPEC I250c, V593, V210, V345 / T1452).
--
-- One entry per item of PICKER_LIST["virtue1"] and ["virtue2"] plus Courage, keyed in ENGLISH
-- because that is what the sheet saves (SPEC V24). Three blocks separated by two blank lines
-- (SPEC I21): source, name, body. The book title and the name in block 2 do not translate; only
-- p./pag. does. LF only (SPEC V345).
--
-- Written by hand from the books, no generator (SPEC Q162.9): the V20 entries from the English V20
-- p.119-120 and p.314-315; Reflection and Wisdom exist only in the Classical Age book, which has no
-- English edition, so those two are TRANSLATED from it (SPEC Q76.3).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).

return {
				-- >>> VIRTUE_DESC_BEGIN (SPEC T1452)
				["Conscience"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 119


Conscience


Conscience is a Trait that allows characters to evaluate their conduct with relation to what is “right” and “wrong.” A character’s moral judgment with Conscience stems from her attitude and outlook. Conscience is what prevents a vampire from succumbing to the Beast, by defining the Beast’s urges as unacceptable.

Conscience factors into the difficulty of many rolls to avoid committing a transgression. Additionally, Conscience determines whether or not a character loses Humanity by committing acts that do not uphold her moral code (see “Degeneration,” p. 309). A character with a high Conscience rating feels remorse for transgressions, while a character with a lower Conscience may be more callous or ethically lax.

Some vampires replace the Conscience Virtue with the Virtue of Conviction (p. 314); unless your Storyteller tells you it’s OK to do this, assume Conscience is used.

• Uncaring
•• Normal
••• Ethical
•••• Righteous
••••• Remorseful]==],
				},
				["Conviction"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 314


Conviction


The Conviction Virtue quantifies a character’s ability to maintain a sense of reason when faced with desire, suffering, or need. Conviction represents the reconciliation of the predatory urge with the character’s capacity for atrocity.

As opposed to Conscience, which deals with remorse and atonement for Path transgressions, a character with Conviction recognizes his failure and plans to overcome it. Conviction is completely inhuman; the character who has this Trait can no longer pass for human under anything but the most cursory of scrutiny. Creatures who can sense the Beast (vampires, werewolves, etc.) immediately recognize someone with the Conviction Virtue for what he truly is: a monster. Like Conscience, Conviction comes into question when a character must check for degeneration.

• Steady
•• Determined
••• Driven
•••• Brutal
••••• Completely self-assured]==],
				},
				["Reflection"] = {
					en = [==[Vampire: The Classical Age 20th Anniversary Edition, p. 161


Reflection


While Conscience works with rationalization through moral judgment and Conviction works with the character’s dedication to a cause, Reflection works with critical, impartial thought that seeks to gather the facts in order to decide whether a course of action was necessary or not for that vampire’s existence.

Characters with Reflection tend to think about consequences and possible reactions. As soon as actions happen, they rationalize them. Afterwards, there may or may not be some emotion based on what was rationalized. The fact is that characters with Reflection rarely suffer the effects of emotions, and are often blank in their emotional expressions. Their judgment is about what is truly right or wrong.

• Indifferent
•• Normal
••• Thoughtful
•••• Resolute
••••• Rational]==],
				},
				["Self-Control"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 120


Self-Control


Self-Control defines a character’s discipline and mastery over the Beast. Characters with high Self-Control rarely succumb to emotional urges, and are thus able to restrain their darker sides more readily than characters with low Self-Control.

Self-Control comes into play when a character faces her Beast in the form of frenzy (p. 298). Self-Control allows the character to resist the frenzy. Note: A character may never roll more dice to resist or control a frenzy than she has in her blood pool — it’s hard to deny the Beast when one’s mind clouds with hunger.

As with Conscience, Self-Control can be replaced, in this case by the Virtue of Instinct (p. 314). Again, unless the Storyteller specifically says it’s all right to do so, assume Self-Control is used.

• Unstable
•• Normal
••• Temperate
•••• Hardened
••••• Total self-mastery]==],
				},
				["Instinct"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 314


Instinct


The Instinct Virtue refers to a character’s ability to control the Beast by familiarity rather than denial. It allows characters to “ride the wave” of frenzy and emotional excess by keeping a close rein on their passion, rather than letting passion control them. As atavistic as Conviction, Instinct is the Virtue of a monster who accepts his nature rather than maintaining a sense of human compassion.

Instinct allows the character to harness the Beast’s destructive power; a character with high Instinct is primal and turbulent. A player rolls Instinct when attempting to control a character’s existing frenzy.

When a character who possesses the Instinct Virtue faces frenzy, she always enters the frenzy, unless the difficulty to avoid it is less than her Instinct Trait, in which case she may choose whether or not to frenzy. Thereafter, for the duration of the frenzy, the character is wholly under the Beast’s sway, and must be run by the player (or controlled by the Storyteller) in an appropriate fashion. Any time the player wishes the character to consciously take an action (known as “riding the wave”), she must roll Instinct against the difficulty to avoid the frenzy. Frenzies affect the character normally (including ignoring wound penalties, etc.), though she may sometimes exert a bit of control while so enraged.

• Intuitive
•• Feral
••• Bestial
•••• Visceral
••••• Primal]==],
				},
				["Wisdom"] = {
					en = [==[Vampire: The Classical Age 20th Anniversary Edition, p. 161


Wisdom


Self-Control represses. Instinct sets free. Wisdom understands. Wisdom is not based merely on repressing or letting go. Characters with Wisdom can tell when it is the best moment to act emotionally or not. They understand the situation around them well enough to rationalize their emotions and allow themselves to act at the appropriate moment. The great advantage of Wisdom is that it acts as both Self-Control and Instinct. Characters with Wisdom can use the Beast in their favor just as they can repress it. This is the great advantage of obtaining it.

• Foolish
•• Normal
••• Understanding
•••• Experienced
••••• Wise

The great flaw of wise characters is that, because they use the middle ground as their escape from the Beast, with neither much repression nor much freedom, rolls that use Wisdom to control their emotions in any way increase in difficulty by one.]==],
				},
				["Courage"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 120


Courage


All characters have a Courage Trait, regardless of the Path they follow. Courage is the quality that allows characters to stand in the face of fear or daunting adversity. It is bravery, mettle, and stoicism combined. A character with high Courage meets her fears head-on, while a character of lesser Courage may flee in terror.

Kindred use the Courage Virtue when faced with circumstances they endemically dread: fire, sunlight, True Faith. See the section on Rötschreck (p. 299) for mechanical systems dealing with character fear.

• Timid
•• Normal
••• Bold
•••• Resolute
••••• Heroic]==],
				},
				-- <<< VIRTUE_DESC_END
}
