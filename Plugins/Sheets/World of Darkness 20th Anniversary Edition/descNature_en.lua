-- Nature/Demeanor archetype descriptions, the [en] half (SPEC I102e, I21, V210 / T838).
--
-- One entry per item of PICKER_LIST["nature"], which IS PICKER_LIST["demeanor"] - one table
-- serves both rows (WoD20th.lfm), so one module serves both. Keyed in ENGLISH because that is
-- what the sheet saves (SPEC V24). Three blocks, exactly as the ten description modules
-- already do: "<Book>, p. <n>" - blank - blank - <Name> - blank - blank - <text>. The book
-- title does not translate; only p./pág. does (SPEC I100e).
--
-- PARTIAL BY MEASURE, and that is a decision, not a gap (user 2026-08-30): the picker offers
-- 68 archetypes and 46 have a usable description in the books on disk. The other 22 open the
-- box and fall to V360c's sentence through descText's empty answer (SPEC V365c, V364b) - the
-- right reply, because what they lack is a FILE. Six of the 22 - Bureaucrat, Comedian,
-- Grifter, Optimist, Pragmatist and Trendsetter - appear ZERO times across all 25 PDFs in the
-- library, so they come from a book nobody here has yet.
--
-- Eighteen seam repairs are recorded in the extractor, each confirmed against its page by the
-- user: a page turn cuts a word in half and the halves read like prose, so they cannot be
-- spotted by rule. The extractor is deterministic - it was NOT, and every count taken before
-- that was a sample of a coin toss (a `my ` loop variable was shadowing sort's ).
--
-- One module PER LANGUAGE and never both halves in one file (SPEC V210).
--
-- Data only: no function, no state, no require of gui/ndb/locale (SPEC I24).
-- Extracted from the PDFs by scratchpad/arch_extract.pl; page numbers are the PRINTED page,
-- taken with each book's offset from research/README.md. Do not hand-edit.

return {
				-- >>> NATURE_DESC_BEGIN (generated - SPEC T838)
				["Activist"] = {
					en = [==[Mage: The Ascension 20th Anniversary Edition, p. 268


Activist


The world is broken. Help fix it. Speak truth to power, dig up secrets, call people out on their shit, and reveal your plans for a better world to anyone who will listen. While apathetic cowards sit back and tune out, you step up and do whatever needs doing. Sure, folks might consider you a pain in the ass, but at least you’re making a difference!

Action is your greatest strength. You’re not one to sit things out. There’s no time to waste on mindless self-indulgence and no room to stay scared of what might happen. The wolf’s already halfway through the door, and you refuse to let that bastard win.

Even so, your constant Outrage wears thin. There’s never room to sit back and enjoy life. As far as you’re concerned, complacency is a sin. Your fury’s justified, of course, but it gets old all the same. Before you can truly Ascend, you’ve got to balance righteous pyrotechnics with calm acceptance. Life never has been – and never will be – perfect. Finding a place of serenity within your storm is an essential part of your transcendence.

– Regain Willpower when you successfully confront abuse, right wrongs, or reveal an actual conspiracy and, by doing so, bring it down.]==],
				},
				["Architect"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 88


Architect


The Architect has a sense of purpose even greater than herself. She is truly happy only when creating something of lasting value for others. People will always need things, and the Architect strives to provide at least one necessity. Inventors, pioneers, town founders, entrepreneurs, and the like are all Architect Archetypes. A Kindred Architect might seek to create new laws that affect her fellow undead, or she might aim to establish a new Anarch domain.

— Regain a point of Willpower whenever you establish something of importance or lasting value.]==],
				},
				["Autocrat"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 88


Autocrat


The Autocrat wants to be in charge. He seeks prominence for its own sake, not because he has an operation’s best interests at heart or because he has the best ideas (though he may certainly think so). He may genuinely believe others are incompetent, but ultimately he craves power and control. Dictators, gang leaders, bullies, corporate raiders, and their ilk are Autocrat Archetypes. A Kindred Autocrat may crave a title, or he may wish to be recognized as the leader of a coterie.

— Regain a point of Willpower when you achieve control over a group or organization involving other individuals.]==],
				},
				["Benefactor"] = {
					en = [==[Mage: The Ascension 20th Anniversary Edition, p. 268


Benefactor


It’s a cruel world, but you make things easier. Generous sometimes to a fault, you supply whatever you can provide: money, advice, protection, maybe just a shoulder when someone really needs to cry. You can’t just turn blind eyes to suffering and need. It’s your moral duty to do whatever you can do to make things right. When things get tough, you call upon your inner White Knight and charge in, bringing gifts, guidance, and occasional force when nothing else will do.

Altruism is all too rare, especially in the World of Darkness. Helping people is your pleasure. Magick, as far as you’re concerned, is a tool for helping folks less fortunate than yourself. To do less is an abuse of the powers you possess.

On the flipside, though, you often feel Obligation even when you’re not actually needed. This, in turn, can become resentment – both on your part and on the parts of people who now feel, rightly or wrongly, that they owe you. Sometimes, you just need to back off, chill out, and let people do things for themselves. Martyrdom isn’t always the best Path toward Ascension.

– Regain Willpower when you provide help that someone else desperately needs. The key here is that desperate part. Teaching Sunday school isn’t meeting that level of need; if you used your Arts to assist autistic kids, however, you’d clearly be making a difference in their lives.]==],
				},
				["Bon Vivant"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 88


Bon Vivant


The Bon Vivant knows that life — and unlife — is shallow and meaningless. As such, the Bon Vivant decides to enjoy her time on Earth. The Bon Vivant is not necessarily irresponsible. Rather, she is simply predisposed to having a good time along the way. Most Bon Vivants have low Self-Control ratings, as they are so given to excess. Hedonists, sybarites, and dilettantes are all examples of the Bon Vivant Archetype. A Kindred Bon Vivant may sire a brood of fawning childer, or he may spend his time gorging on the blood of drug abusers for the contact high.

— Regain a point of Willpower whenever you truly enjoy yourself and can fully express your exultation. At the Storyteller’s option, a particularly fabulous revel may yield multiple Willpower points.]==],
				},
				["Bravo"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 88


Bravo


The Bravo is a tough and a bully, and often takes perverse pleasure in tormenting the weak. To the Bravo’s mind, might makes right. Power is what matters, and only those with power should be respected. Naturally, physical power is the best kind, but any kind will do. The Bravo sees overt threats as a perfectly reasonable means of gaining cooperation. The Bravo is not incapable of pity or kindness; he just prefers to do things his way. Robbers, bigots, and thugs are all Bravo Archetypes. A Kindred Bravo may abuse authority the system has granted him, or he may — violently or otherwise — force other Kindred out of his way to get what he wants. He’s almost certainly an asshole.

— Regain a point of Willpower any time you achieve your agenda through brutishness or intimidation. This need not be physical, as many Bravos verbally or socially cow their victims.]==],
				},
				["Caregiver"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 89


Caregiver


Everyone needs a shoulder to cry on. A Caregiver takes her comfort in consoling others, and people often come to her with their problems. Vampires with Caregiver Archetypes often attempt, as best they can, to protect the mortals on whom they feed. Nurses, doctors, and psychiatrists are examples of potential Caregivers. Caregiver Kindred are often the type who — tragically — Embrace mortal loves they’ve left behind in hopes of softening their loss, or even those who create situations of grief in order to ease it and thus validate themselves.

— Regain a point of Willpower whenever you successfully protect or nurture someone else.]==],
				},
				["Celebrant"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 89


Celebrant


The Celebrant takes joy in her cause. Whether the character’s passion is battle, religion, foiling her rivals, or reading fine literature, it gives the Celebrant the strength to withstand adversity. Given the chance, the Celebrant will indulge in her passion as deeply as possible. Unlike the Fanatic (p. 91), the Celebrant pursues her cause not out of duty, but out of enthusiasm. Crusaders, hippies, political activists, and art enthusiasts are Celebrant Archetypes. Celebrant Kindred may cleave to mortal ideologies that are incongruous with their new Damned conditions, or they may be the advocates of new trends and causes that move through undead society.

— Regain a point of Willpower whenever you pursue your cause or convert another character to the same passion. Conversely, lose a point of temporary Willpower whenever you are denied your passion or it is badly lost to you.]==],
				},
				["Chameleon"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 89


Chameleon


Independent and self-reliant, you carefully study the behavior and mannerisms of everyone you come in contact with so you can pass yourself off as someone else later. You spend so much time altering your mannerisms and appearance that your own sire may not even recognize you. Spies, con artists, drag queens, and impostors best represent the Chameleon.

— Regain a point of Willpower whenever you fool someone into thinking you’re someone else for your own (or your pack or coterie‘s) benefit.]==],
				},
				["Child"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 89


Child


The Child is still immature in personality and temperament. He wants what he wants now, and often prefers someone to give it to him. Although he can typically care for himself, he would rather have someone cater to his capricious desires. Some Child Archetypes are actually innocent rather than immature, ignorant of the cold ways of the real world. Actual children, spoiled individuals, and some drug abusers are Child Archetypes. Kindred with the Child Archetype might have not yet fully reached an understanding of the world and have some characteristic such as cruelty, entitlement, sympathy, or hunger that is out of balance with their other personality aspects, as they haven’t yet reached the “rounded” state of adulthood. Note that a Child Archetype need not be a physical, literal child at the time of Embrace. Some people simply never grow up.

— Regain a point of Willpower whenever you manage to convince someone to help you with no gain to herself, or to nurture you.]==],
				},
				["Competitor"] = {
					en = [==[Werewolf: The Apocalypse 20th Anniversary Edition, p. 487


Competitor


The Competitor devotes himself to the pursuit of victory. He may be a gambler by nature, or he may seek out challenges that must be overcome by discipline and skill. Every interaction is an opportunity for him to excel. Werewolves with this Archetype may pursue their goals in politics, in battle, or in other arenas. A Garou Competitor takes Renown very seriously.

— Regain one point of Willpower whenever you succeed at a test or challenge. Note that a test or challenge is more than just a dice roll; it’s an entire dramatic situation. Especially difficult victories may, at the Storyteller’s discretion, allow you to regain multiple Willpower points.]==],
				},
				["Conniver"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 90


Conniver


Why work for something when you can trick somebody else into getting it for you? The Conniver always tries to find the easy way, the fast track to success and wealth. Some people call him a thief, a swindler, or less pleasant terms, but he knows that everybody in the world would do unto him if they could. He just does it first, and better. Criminals, con artists, salespeople, urchins, and entrepreneurs might be Connivers. Some would argue that all Kindred are Connivers in some sense, but those that have the Conniver archetype may be abusive to their childer and ghouls, or they may be more persuasive in gaining support for their machinations.

— Regain a point of Willpower whenever you trick someone into doing something for you, or when you convince someone to help you against their own best interests.]==],
				},
				["Contrary"] = {
					en = [==[Werewolf: The Apocalypse 20th Anniversary Edition, p. 487


Contrary


The Contrary has an innate need to go against the grain and to challenge established social conventions or even laws. Some have a penchant for bizarre behavior such as you’d expect from an eccentric celebrity; others are outright heretics. Many Ragabash play the contrary in a traditional form, defying conventional laws as a way of challenging their relevance.

— Regain a point of Willpower any time you are able to flout social mores without retribution.]==],
				},
				["Creep Show"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 90


Creep Show


You strive to shock and disgust those around you with gratuitous acts and ostentatiously “evil” mannerisms. You realize, of course, that it’s all show and merely a way to intimidate and control others. Outsiders, on the other hand, think you are the Devil incarnate, and you revel in this image. Shock-rockers, rebellious teenagers, circus freaks, and the attention-starved exemplify the Creep Show Archetype.

— Regain a point of Willpower whenever someone recoils from you in horror or otherwise reacts in fear.]==],
				},
				["Curmudgeon"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 90


Curmudgeon


A Curmudgeon is bitter and cynical, finding flaws in everything and seeing little humor in life or unlife. He is often fatalistic or pessimistic, and has very little esteem for others. To the Curmudgeon, the glass is never more than half-full, though it may be damn near empty when other people are involved. Many Internet junkies, pop-culture fans, and Generation Xers are Curmudgeons. Kindred Curmudgeons see elder oppression or spoiled neonates running amok behind every development in undead society, and may or may not rise beyond acerbic grumbling to change any problems they perceive.

— Regain a point of Willpower whenever someone does something specific and negative, just like you said they would. You must predict and quantify this failure aloud, such as by warning, “The Prince is going to fuck us on this one,” or “Just watch, that Malkavian’s ghoul is going to do something really reckless.” You may simply whisper your prophecy of grief to the Storyteller if you wish, instead of announcing it to the whole troupe.]==],
				},
				["Dabbler"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 90


Dabbler


The Dabbler is interested in everything but focuses on nothing. He flits from idea to idea, passion to passion, and project to project without actually finishing anything. Others may get swept up in the Dabbler’s enthusiasm, and be left high and dry when he moves on to something else without warning. Most Dabblers have high Intelligence, Charisma, and Manipulation ratings, but not much in the way of Wits or Stamina. Toreador are often Dabblers, particularly those afflicted with the derisive sobriquet “Poseurs.”

— Regain Willpower whenever you find a new enthusiasm and drop your old one completely.]==],
				},
				["Defender"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 177


Defender


The Defender struggles to defend her chosen cause in the face of its enemies. It may be some fragile innovation or hope of future progress.

Regain a point of Willpower whenever you successfully defend your cause.]==],
				},
				["Deviant"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 90


Deviant


The Deviant is a freak, ostracized from society by unique tastes or beliefs that place her outside the mainstream. Deviants are not indolent rebels or shiftless “unrecognized geniuses”; rather, they are independent thinkers who don’t quite fit in the status quo. Deviant Archetypes often feel that the world stands against them, and as such reject traditional morality. Some have bizarre tastes, preferences, and ideologies. Extremists, eccentric celebrities, and straight-up weirdoes are Deviant Archetypes. Kindred deviants may observe heretical or outlawed habits like diablerie or deference to elders, and they may well go Anarch or Autarkis instead of having to constantly defend their subversion of Traditions or Sect customs.

— Regain a point of Willpower any time you are able to flout social mores without retribution.]==],
				},
				["Director"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 91


Director


To the Director, nothing is worse than chaos and disorder. The Director seeks to be in charge, adopting a “my way or the highway” attitude on matters of decision-making. The Director is more concerned with bringing order out of strife, however, and need not be truly “in control” of a group to guide it. Coaches, teachers, and many political figures exemplify the Director Archetype. Kindred Directors may be simple advocates of established codes, or they may prove instrumental in tearing down corrupt existing orders to make way for new leaders or factional movements.

— Regain a point of Willpower when you influence or aid a group or influential individual in the completion of a difficult task.]==],
				},
				["Enigma"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 91


Enigma


Your actions are bizarre, puzzling, and inexplicable to everyone except yourself. Your strangeness may be a residual effect from your Embrace, or the most effective way for you to carry out your work. To the rest of the world, however, your erratic actions suggest that you’re eccentric if not completely crazy. Conspiracy theorists, deep-cover agents, and Jyhad fanatics all live up to the Enigma Archetype.

— Regain a point of Willpower whenever someone is completely perplexed or baffled by one of your actions that later turns out to be a fruitful endeavor.]==],
				},
				["Eye of the Storm"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 91


Eye of the Storm


Despite your calm appearance, chaos and havoc seems to follow you. From burning cities to emotional upheaval, death and destruction circle you like albatrosses. For you, unlife is a never-ending trial with uncertainty around every corner. Gang leaders, political figures, and other influential individuals exemplify the Eye of the Storm Archetype.

— Regain a point of Willpower whenever a ruckus, riot, or less violent but equally chaotic phenomenon occurs around you.]==],
				},
				["Fanatic"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 91


Fanatic


The Fanatic has a purpose, and that purpose consumes his existence. The Fanatic pours himself into his cause, and he may even feel guilty for undertaking any objective that deviates from his higher goal. To the Fanatic, the end justifies the means — the cause is more important than those who serve it. Players who choose Fanatic Archetypes must select a cause for their character to further. Revolutionaries, zealots, and sincere firebrands are all examples of Fanatic Archetypes. Kindred Fanatics are often champions for or against a particular aspect of undead society, such as equality among all vampires, the extermination of Anarchs, or stamping infernalism out of the Sword of Caine.

— Regain a point of Willpower whenever you accomplish some task that directly relates to your cause.]==],
				},
				["Gallant"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 91


Gallant


Gallants are flamboyant souls, always seeking attention and the chance to be the brightest star. Gallants seek the company of others, if only to earn their adoration. Attention drives the Gallant, and the chase is often as important as its end. Nothing excites a Gallant so much as a new audience to woo. Performers, only children, and those with low self-esteem often embody the Gallant Archetype. Kindred Gallants may be Harpies, or they may have enormous herds of doting thralls.

— Regain a Willpower point whenever you successfully impress another person. Ultimately, the Storyteller is the arbiter of how much you dazzle someone, even in the case of other players’ characters.]==],
				},
				["Guru"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 91


Guru


Your enlightenment draws others to you. You may be a mentor of a particular Path of Enlightenment, a priest with the Church, or merely an idealist. Whatever the case, your presence motivates and moves others to engage in spiritual or ideological pursuits. Your peers view you as calm, centered, and “with it,” even when you are preaching violence as a means to an end. Cult leaders, Zen masters, and Pack Priests are examples of Gurus.

— Regain a point of Willpower whenever someone seeks out your help in spiritual matters and your guidance moves that individual to an enlightened action that he normally would not have taken. Also, regain a point of Willpower whenever you achieve an epiphany that relates to your personal philosophy.]==],
				},
				["Hacker"] = {
					en = [==[Mage: The Ascension 20th Anniversary Edition, p. 269


Hacker


Every system is a locked vault, and you’ve got the keys. If you don’t have ones that work, you’ll make new ones – that’s half the fun of life, after all! Puzzles excite you; limits just piss you off. Especially given the sheer amount of abuse that’s built into any system, the world needs folks like you to tear down impediments and set reality free.

Imagination is your greatest strength. You see things not as they are, but as they could be once you get done with them! Driven to dismantle existing systems and then put them together in interesting new shapes, you tend to pepper your compulsions with sincerely-held philosophy. You’re not a vandal, for crying out loud – you’re a visionary who refuses to accept shit sandwiches handed out as lunch.

Sometimes, though, you go too far. Perversity leads you to tear apart things that weren’t broken… things that may, in fact, have been better left alone. Although it might seem philosophically valid to tear down the wards on a wizard’s lab, those wards might have been laid that way for reasons you didn’t understand until it was a little too late.

– Regain Willpower when you detect a flaw in some important structure, system, or device, or else when you puzzle out a way to improve something that was supposedly designed well to begin with.]==],
				},
				["Innovator"] = {
					en = [==[Mage: The Ascension 20th Anniversary Edition, p. 270


Innovator


There’s always a better way. You spend your life looking for methods and inventions that improve on what has gone before. Sure, past achievements are wonderful enough… but if you just add this, shift that, approach the issue from this other angle instead, then you’ll make a good thing that much better or fix an obvious flaw in a promising design.

Creativity is your strong point. No practice, tool, or traditional method is too good for improvement, especially not at this crucial point in human evolution. Let other people follow the established paths – you’re busy drawing up the next road toward a goal most folks don’t even know exists.

Your Restless Unorthodoxy, though, can get you in trouble. Especially if you belong to a sect or faction based on established results and protocols (the Technocracy, the Hermetic Order, the Akashayana, and so on), your innovations might be someone else’s heresy. Many mages have been burnt at stakes both literal and symbolic for doing the things you do, and a missed step could make (an) ash of you.

– Regain Willpower when your inspiration leads to a helpful new breakthrough.]==],
				},
				["Jester"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 177


Jester


The Jester sees the world as a veil of folly and deceit, and enlightens others through the subtle ways of humor.

Regain a point of Willpower whenever you raise the spirits of those in great misery, or when you undermine a bully or tyrant by making him the object of ridicule.]==],
				},
				["Judge"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 92


Judge


The Judge perpetually seeks to improve the system. A Judge takes pleasure in her rational nature and ability to draw the right conclusion when presented with facts. The Judge respects justice, as it is the most efficient model for resolving issues. Judges, while they pursue the “streamlining” of problems, are rarely visionary, as they prefer proven models to insight. Engineers, lawyers, and doctors are often Judge Archetypes. Kindred Judges might gravitate toward enforcement roles in local society, or they might be a voice of reason in an otherwise radical coterie.

— Regain a point of Willpower whenever you correctly solve a problem by considering the evidence presented, or when one of your arguments unites dissenting parties.]==],
				},
				["Loner"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 92


Loner


Even in a crowd the Loner sticks out, because he so obviously does not belong. Others view Loners as pariahs, remote, and isolated, but in truth the Loner prefers his own company to that of others. For whatever reason, the Loner simply disdains others, and this feeling is often reciprocated. Criminals, radicals, and free thinkers are all Loner Archetypes. Kindred Loners often hail from one of the rugged individualist Clans like the Gangrel or Ravnos, and they have a proclivity for ending up Autarkis by dint of not giving a shit what some up-his-own-ass Prince or Archbishop says is a law.

— Regain a point of Willpower when you accomplish something by yourself, yet which still benefits the coterie in some way.]==],
				},
				["Machine"] = {
					en = [==[Mage: The Ascension 20th Anniversary Edition, p. 270


Machine


Flesh is weak. You are not. Whether or not you’re an actual cyborg, you have the relentless drive of a Terminator on PCP. Flaws do not concern you. Limits are for the mewling meatbags known as human beings. Compassion is for weaklings. Fatigue is for lesser entities. If and when you fall short of perfection, you understand that such failure is just a challenge to do better next time.

A Diligent, Stoic creature, you push yourself to the limits of endurance. Everything you do is done to exacting standards, without complaint or hesitation. The Technocratic Union loves operatives like you.

As far as other people are concerned, however, you’re Creepy and Prone to Burn-Out. Whatever illusions you harbor about your perfection, you’re as flawed as any other mortal thing. Even machines have limits, and unless you learn to acknowledge your own, you’re headed toward the scrap heap, not Ascension.

– Regain Willpower when you transcend the limits of mere flesh, bone, and steel, accomplishing something that no one else has managed to do.]==],
				},
				["Martyr"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 92


Martyr


The Martyr suffers for his cause, enduring his trials out of the belief that his discomfort will ultimately improve others’ lot. Some Martyrs simply want the attention or sympathy their ordeals engender, while others are sincere in their cause, greeting their opposition with unfaltering faith. Many revolutionaries, staunch idealists, and outcasts are Martyr Archetypes. Kindred Martyrs are often associated with reform movements among Kindred society, but rarely as figureheads — and they need not necessarily be on the pro-reform side of the issue.

— Regain a point of Willpower when you suffer some amount of damage or loss of a definable resource for your ideals or another’s immediate gain.]==],
				},
				["Masochist"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 92


Masochist


The Masochist exists to test his limits, to see how much pain he can tolerate before he collapses. He gains satisfaction in humiliation, suffering, denial, and even physical pain. The Masochist defines who he is by his capacity to feel discomfort — he rises each night only to greet a new pain. Certain extreme athletes, urban tribalists, and the clinically depressed exemplify the Masochist Archetype. Kindred Masochists might be overtly self-mortifying horrors who play to their Beast’s self-destructive whims, or they may be ambitious taskmasters, as with a coterie leader who refuses to accept failure and pushes his own limits in his exacting schemes.

— Regain one point of Willpower when your own suffering leads to some tangible gain for you, and two points of Willpower whenever you experience pain in a truly unique way.]==],
				},
				["Mercenary"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 178


Mercenary


The Mercenary believes anything can be a commodity. Appearance and influence are everything when it comes to a sale, and no advantage is wasted.

Regain a point of Willpower whenever you make a successful sale of any commodity or service.]==],
				},
				["Pedagogue"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 178


Pedagogue


The Pedagogue knows it all and make sure his message is heard – at length, if necessary.

Regain a point of Willpower whenever you see or learn of someone who has benefited from the wisdom you share with them.]==],
				},
				["Penitent"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 178


Penitent


The Penitent atones for the grave sin she commits simply by being who she is and feels compelled to “make up” for inflicting herself on the world.

Regain a point of Willpower whenever you feel that you have achieved absolution for a given sin.]==],
				},
				["Perfectionist"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 94


Perfectionist


Perfectionist Archetypes demand flawless execution. A half-hearted job gives the Perfectionist no satisfaction, and she expects the same degree of commitment and attention to detail from others that she demands from herself. Although the Perfectionist may be exacting, the achievement of the end goal drives her, and often those for whom she is responsible. Prima donnas, artists, and architects exemplify the Perfectionist Archetype. A Perfectionist Kindred might be a zealous Sabbat member who expects more than his pack can consistently deliver, or she may be a moralist who sometimes applies her own high standards of Humanity to others in her coterie.

— Regain a point of Willpower whenever you accomplish your goal without any demonstrable flaw or impediment, and regain a Willpower point whenever you motivate another character to succeed as a result of your own shining example.]==],
				},
				["Philosopher"] = {
					en = [==[Vampire: The Dark Ages 20th Anniversary Edition, p. 178


Philosopher


The Philosopher critically examines every situation - looking for logical outcomes and patterns.

Regain a point of Willpower any time a logical, systematic approach to a problem helps you solve it, or information gathered logically is of use in another similar situation.]==],
				},
				["Rebel"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 94


Rebel


The Rebel is a malcontent, never satisfied with the status quo or the system as it is. He hates the very idea of authority and does everything in his power to challenge and undermine it. Perhaps the Rebel truly believes in his ideals, but it is just as likely that he bears authority figures some ill will over a “wrong” done to him in the past. A Rebel may hate institutions categorically, or she may be consumed with opposition toward a single particular authority. Teenagers, insurrectionists, and nonconformists all exemplify the Rebel Archetype. Rebel Kindred certainly include the Sabbat, Anarchs, and temperamental Brujah, but also have room for Tremere who chafe at the rigid Clan hierarchy or neonates who deplore their sires.

— Regain a point of Willpower whenever your actions adversely affect your chosen opposition. Rebels may oppose the government, the Church, a vampire Prince, or any other holder of authority. The player should choose whom or what his character rebels against when he adopts this Archetype. Storytellers should take rebellion against “all authority” with a grain of salt, and apply the Willpower reward for such a broad concept to only greater and greater actions of insurgency.]==],
				},
				["Rogue"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 94


Rogue


Only one thing matters to the Rogue: herself. To each his own, and if others cannot protect their claims, they have no right to them. The Rogue is not necessarily a thug or bully, however. She simply refuses to succumb to the whims of others. Rogues almost universally possess a sense of self-sufficiency. They have their own best interests in mind at all times. Prostitutes, capitalists, and criminals all embody the Rogue Archetype. Kindred Rogues include diablerists, Autarkis, and a Primogen who puts his Clan’s opportunities before the supremacy of the Kindred as a whole.

— Regain a point of Willpower when your self-centered disposition leads you to profit, materially or otherwise. At the Storyteller’s discretion, accumulating gain without exposing your own weaknesses may let you regain two points of Willpower. As well, you may regain a point of Willpower when your efforts benefit the group to which you belong when that benefit comes at the expense of another group.]==],
				},
				["Sadist"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 94


Sadist


You exist to inflict pain and suffering upon others. Killing is too easy; torture is the best way to truly harm a person, and you seek the slowest, most painful means to push others to the ultimate limits. Pain — others’ pain — gives you immense pleasure. Drill sergeants, jilted ex-lovers, and some of the terminally deranged may all embody the Sadist Archetype at one time or another; sadism is rare enough to appear only in aberrant cases, rather than reliably in any type or class of person.

— Regain a point of Willpower whenever you inflict pain upon someone for no reason other than your own pleasure.]==],
				},
				["Scientist"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 94


Scientist


To a Scientist, existence is a puzzle which she can help to reassemble. A Scientist logically and methodically examines her every situation and maneuver, looking for logical outcomes and patterns. This is not to say that the Scientist is always looking for a scientific or rational explanation, but rather she examines her surroundings rigorously and with a critical eye. The system a Scientist attempts to impose on the world may be completely ludicrous, but it is a system, and she sticks by it.

— Regain Willpower any time a logical, systematic approach to a problem helps you solve it, or information gathered logically is of use in another, similar situation.]==],
				},
				["Soldier"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 95


Soldier


The Soldier is not a blindly loyal follower. While she exists for orders, she does not adhere to them unquestioningly. More independent than a Conformist but too tied into the idea of command to be a Loner, the Soldier applies her own techniques to others’ goals. While she may seek command herself someday, her ambitions lie within the established hierarchy and structure. The Soldier has no compunctions about using whatever means necessary to do what needs to be done, so long as the orders to do so came from the right place.

— Regain a point of Willpower when you achieve your orders’ objectives. The more difficult the orders are to fulfill, the better it feels to accomplish them. At Storyteller discretion, pulling off a spectacular success or fulfilling a lengthy mission may well be worth additional Willpower points.]==],
				},
				["Survivor"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 95


Survivor


No matter what happens, no matter the odds or opposition, the Survivor always manages to pull through. Whether alone or with a group, the Survivor’s utter refusal to accept defeat often makes the difference between success and failure. Survivors are frustrated by others’ acceptance of “what fate has in store” or willingness to withstand less than what they can achieve. Outcasts, street folk, and idealists may well be Survivor Archetypes. A Kindred Survivor might be a renegade under a Prince’s edict of Blood Hunt, an erstwhile Bishop forced from power, or a lowly Nosferatu who finds himself kicked from hunting ground to hunting ground with no acknowledged claim of domain.

— Regain one point of Willpower whenever you survive a threatening situation through tenacity, or when your counsel causes someone else to persist in spite of opposition.]==],
				},
				["Thrill-Seeker"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 95


Thrill-Seeker


The Thrill-Seeker lives for the rush of danger. Unlike those of arguably saner disposition, the Thrill- Seeker actively pursues hazardous and possibly deadly situations. The Thrill-Seeker is not consciously suicidal or self-destructive — he simply seeks the stimulation of imminent disaster. Gangbangers, petty thieves, and exhibitionists are all examples of the Thrill-Seeker Archetype. Kindred Thrill-Seekers might habitually break the Masquerade just to see if they’ll get caught, they might maintain contacts in a rival Clan or Sect, or they might actively plot a Prince’s overthrow just to see if they can pull it off.

— Regain a point of Willpower any time you succeed at a dangerous task that you have deliberately undertaken. Thrill-Seekers are not stupid, however, and the Storyteller may choose not to reward a player who heedlessly sends her character into danger for the sole intent of harvesting Willpower.]==],
				},
				["Traditionalist"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 95


Traditionalist


The orthodox ways satisfy the Traditionalist, who prefers to accomplish her goals with time-tested methods. Why vary your course when what has worked in the past is good enough? The Traditionalist finds the status quo acceptable, even preferable, to a change that might yield unpredictable results. Conservatives, judges, and authority figures are all examples of Traditionalist Archetypes. Traditionalist Kindred unsurprisingly look to the Traditions as a behavior model, though a few Anarchs and elders may espouse a “traditionalism” that predates both Camarilla and Sabbat.

— Regain a point of Willpower any time the proven ways turn out to be the best. Also, regain a point of Willpower any time you adhere to one of your previously espoused positions and it proves to be a wise course of action.]==],
				},
				["Visionary"] = {
					en = [==[Vampire: The Masquerade 20th Anniversary Edition, p. 96


Visionary


The Visionary is strong enough to look beyond the mundane and perceive the truly wondrous. Visionaries test accepted societal limits, and seek what few others have the courage to imagine. The Visionary rarely finds satisfaction in what society has to offer; she prefers to encourage society to offer what it could instead of what it does. Typically, society responds poorly to Visionaries, though it is they who are responsible for bringing about progress and change. Philosophers, inventors, and the most inspired artists often have Visionary Natures. Kindred Visionaries may want to plunge all mortals into vampiric thrall, they may adapt technologies that other, more static Kindred fear or overlook, or they may have a “better way” to coexist with other vampires than all of this Prince-and-Regent nonsense.

— Regain a point of Willpower each time you are able to convince others to have faith in your dreams and follow the course of action dictated by your vision. Note that gaining support is the key to a Visionary regaining Willpower. Success need not come to a Visionary, at least not with every step in changing the structures in question. Her greatest successes may indeed come after her Final Death.]==],
				},
				-- <<< NATURE_DESC_END
};
