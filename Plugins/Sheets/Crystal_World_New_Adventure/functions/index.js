const { onRequest } = require("firebase-functions/v2/https");
const admin = require("firebase-admin");

admin.initializeApp();

const db = admin.firestore();
const FieldValue = admin.firestore.FieldValue;

const TRADE_TTL_MS = 10 * 60 * 1000;
const MAX_ITEMS_PER_OFFER = 10;
const MAX_INVENTORY_ITEMS = 60;
const DAILY_TIME_ZONE = "America/Sao_Paulo";
const TIMED_POTION_FIELDS = [
  "Forca", "Destreza", "Constituicao", "Inteligencia", "Sabedoria", "Carisma",
  "CA", "RD", "HP", "PP", "Dano",
  "BracoDeFerro", "Correr", "DanoCurtoAlcance", "DanoLongoAlcance",
  "EmpurrarObstaculo", "Escalar", "AcertoDistancia", "AcertoCurtoAlcance",
  "DesarmarArmadilha", "Esquivar", "Furtividade", "Iniciativa",
  "MontariaDirecao", "Roubo", "AcertoMagico", "IdentificarCriatura",
  "Investigacao", "LerManuscrito", "Medicina", "PrepararEstrategia",
  "Profissao", "ResistenciaMental", "DetectarMagia", "DanoMagico",
  "Historia", "Natureza", "PerceberMentira", "Percepcao", "Religiao",
  "Sobrevivencia", "Atuar", "Discurso", "Intimidar", "Mentir", "Seducao",
  "ResistenciaCansaco", "ResistirVeneno", "SegurarFolego", "SuporteFrioCalor",
];
const TIMED_POTION_DEFS = {
  "potion forca menor": { bonuses: { Forca: 2 }, minutes: 10, label: "Forca" },
  "potion destreza menor": { bonuses: { Destreza: 2 }, minutes: 10, label: "Destreza" },
  "potion constituicao menor": { bonuses: { Constituicao: 2 }, minutes: 10, label: "Constituicao" },
  "potion inteligencia menor": { bonuses: { Inteligencia: 2 }, minutes: 10, label: "Inteligencia" },
  "potion sabedoria menor": { bonuses: { Sabedoria: 2 }, minutes: 10, label: "Sabedoria" },
  "potion carisma menor": { bonuses: { Carisma: 2 }, minutes: 10, label: "Carisma" },
  "potion dano menor": { bonuses: { Dano: 2 }, minutes: 10, label: "Dano" },
  "potion acerto menor": { bonuses: { AcertoCurtoAlcance: 2, AcertoDistancia: 2, AcertoMagico: 2 }, minutes: 10, label: "Acertos" },
  "potion esquiva menor": { bonuses: { Esquivar: 2 }, minutes: 10, label: "Esquivar" },
  "potion ca menor": { bonuses: { CA: 1 }, minutes: 10, label: "CA" },
  "potion rd menor": { bonuses: { RD: 1 }, minutes: 10, label: "RD" },
  "potion hp menor": { bonuses: { HP: 10 }, minutes: 10, label: "HP maximo" },
  "potion pp menor": { bonuses: { PP: 10 }, minutes: 10, label: "PP maximo" },
  "potion braco de ferro menor": { bonuses: { BracoDeFerro: 2 }, minutes: 10, label: "Braco de Ferro" },
  "potion correr menor": { bonuses: { Correr: 2 }, minutes: 10, label: "Correr" },
  "potion dano curto alcance menor": { bonuses: { DanoCurtoAlcance: 2 }, minutes: 10, label: "Dano Curto Alcance" },
  "potion dano longo alcance menor": { bonuses: { DanoLongoAlcance: 2 }, minutes: 10, label: "Dano Longo Alcance" },
  "potion empurrar obstaculo menor": { bonuses: { EmpurrarObstaculo: 2 }, minutes: 10, label: "Empurrar Obstaculo" },
  "potion escalar menor": { bonuses: { Escalar: 2 }, minutes: 10, label: "Escalar" },
  "potion acerto distancia menor": { bonuses: { AcertoDistancia: 2 }, minutes: 10, label: "Acerto a Distancia" },
  "potion acerto curto alcance menor": { bonuses: { AcertoCurtoAlcance: 2 }, minutes: 10, label: "Acerto Curto Alcance" },
  "potion desarmar armadilha menor": { bonuses: { DesarmarArmadilha: 2 }, minutes: 10, label: "Desarmar Armadilha" },
  "potion furtividade menor": { bonuses: { Furtividade: 2 }, minutes: 10, label: "Furtividade" },
  "potion iniciativa menor": { bonuses: { Iniciativa: 2 }, minutes: 10, label: "Iniciativa" },
  "potion montaria direcao menor": { bonuses: { MontariaDirecao: 2 }, minutes: 10, label: "Montaria Direcao" },
  "potion roubo menor": { bonuses: { Roubo: 2 }, minutes: 10, label: "Roubo" },
  "potion acerto magico menor": { bonuses: { AcertoMagico: 2 }, minutes: 10, label: "Acerto Magico" },
  "potion identificar criatura menor": { bonuses: { IdentificarCriatura: 2 }, minutes: 10, label: "Identificar Criatura" },
  "potion investigacao menor": { bonuses: { Investigacao: 2 }, minutes: 10, label: "Investigacao" },
  "potion ler manuscrito menor": { bonuses: { LerManuscrito: 2 }, minutes: 10, label: "Ler Manuscrito" },
  "potion medicina menor": { bonuses: { Medicina: 2 }, minutes: 10, label: "Medicina" },
  "potion preparar estrategia menor": { bonuses: { PrepararEstrategia: 2 }, minutes: 10, label: "Preparar Estrategia" },
  "potion profissao menor": { bonuses: { Profissao: 2 }, minutes: 10, label: "Profissao" },
  "potion resistencia mental menor": { bonuses: { ResistenciaMental: 2 }, minutes: 10, label: "Resistencia Mental" },
  "potion detectar magia menor": { bonuses: { DetectarMagia: 2 }, minutes: 10, label: "Detectar Magia" },
  "potion dano magico menor": { bonuses: { DanoMagico: 2 }, minutes: 10, label: "Dano Magico" },
  "potion historia menor": { bonuses: { Historia: 2 }, minutes: 10, label: "Historia" },
  "potion natureza menor": { bonuses: { Natureza: 2 }, minutes: 10, label: "Natureza" },
  "potion perceber mentira menor": { bonuses: { PerceberMentira: 2 }, minutes: 10, label: "Perceber Mentira" },
  "potion percepcao menor": { bonuses: { Percepcao: 2 }, minutes: 10, label: "Percepcao" },
  "potion religiao menor": { bonuses: { Religiao: 2 }, minutes: 10, label: "Religiao" },
  "potion sobrevivencia menor": { bonuses: { Sobrevivencia: 2 }, minutes: 10, label: "Sobrevivencia" },
  "potion atuar menor": { bonuses: { Atuar: 2 }, minutes: 10, label: "Atuar" },
  "potion discurso menor": { bonuses: { Discurso: 2 }, minutes: 10, label: "Discurso" },
  "potion intimidar menor": { bonuses: { Intimidar: 2 }, minutes: 10, label: "Intimidar" },
  "potion mentir menor": { bonuses: { Mentir: 2 }, minutes: 10, label: "Mentir" },
  "potion seducao menor": { bonuses: { Seducao: 2 }, minutes: 10, label: "Seducao" },
  "potion resistencia cansaco menor": { bonuses: { ResistenciaCansaco: 2 }, minutes: 10, label: "Resistencia Cansaco" },
  "potion resistir veneno menor": { bonuses: { ResistirVeneno: 2 }, minutes: 10, label: "Resistir Veneno" },
  "potion segurar folego menor": { bonuses: { SegurarFolego: 2 }, minutes: 10, label: "Segurar Folego" },
  "potion suporte frio calor menor": { bonuses: { SuporteFrioCalor: 2 }, minutes: 10, label: "Suporte Frio Calor" },};

function send(res, status, payload) {
  res.status(status).json(payload);
}

function allowCors(req, res) {
  res.set("Access-Control-Allow-Origin", "*");
  res.set("Access-Control-Allow-Headers", "Content-Type, Authorization");
  res.set("Access-Control-Allow-Methods", "POST, OPTIONS");
  if (req.method === "OPTIONS") {
    res.status(204).send("");
    return true;
  }
  return false;
}

function requireString(body, field) {
  const value = String((body && body[field]) || "").trim();
  if (!value) {
    throw new Error(`Campo obrigatorio: ${field}`);
  }
  return value;
}

function optionalString(body, field) {
  return String((body && body[field]) || "").trim();
}

function normalizeCode(code) {
  return String(code || "").trim().toUpperCase().replace(/\s+/g, "");
}

function makeTradeCode() {
  const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
  let out = "CW-";
  for (let i = 0; i < 5; i += 1) {
    out += chars[Math.floor(Math.random() * chars.length)];
  }
  return out;
}

function nowTimestamp() {
  return admin.firestore.Timestamp.now();
}

function todayKeySaoPaulo() {
  return new Intl.DateTimeFormat("en-CA", {
    timeZone: DAILY_TIME_ZONE,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(new Date());
}

function nextMidnightSaoPauloLabel() {
  return "00:00hrs";
}

function expiresTimestamp() {
  return admin.firestore.Timestamp.fromMillis(Date.now() + TRADE_TTL_MS);
}

function timestampExpired(value) {
  if (!value) return false;
  const millis = typeof value.toMillis === "function" ? value.toMillis() : new Date(value).getTime();
  return Number.isFinite(millis) && millis <= Date.now();
}

async function deleteTradeDocument(ref) {
  const batch = db.batch();
  const hostItems = await ref.collection("offers").doc("host").collection("items").get();
  const guestItems = await ref.collection("offers").doc("guest").collection("items").get();
  hostItems.docs.forEach((doc) => batch.delete(doc.ref));
  guestItems.docs.forEach((doc) => batch.delete(doc.ref));
  batch.delete(ref.collection("offers").doc("host"));
  batch.delete(ref.collection("offers").doc("guest"));
  batch.delete(ref);
  await batch.commit();
}

function splitCharacterId(characterId) {
  const raw = String(characterId || "").trim();
  const parts = raw.split("__");
  if (parts.length >= 2) {
    return { playerDocId: sanitizeDocId(parts[0]), characterDocId: sanitizeDocId(parts.slice(1).join("__")) };
  }
  return { playerDocId: "Jogador", characterDocId: sanitizeDocId(raw) };
}

function playerRefFromCharacterId(characterId) {
  return db.collection("players").doc(splitCharacterId(characterId).playerDocId);
}

function characterRef(characterId) {
  const ids = splitCharacterId(characterId);
  return db.collection("players").doc(ids.playerDocId).collection("characters").doc(ids.characterDocId);
}

function inventoryRef(characterId, itemDocId) {
  return characterRef(characterId).collection("inventory").doc(itemDocId);
}

function sanitizeDocId(value) {
  let out = String(value || "").normalize("NFC").replace(/\//g, "-").replace(/[\u0000-\u001f\u007f]/g, " ").replace(/\s+/g, " ").trim();
  if (!out || out === "." || out === ".." || /^__.*__$/.test(out)) out = "Item";
  return Buffer.byteLength(out, "utf8") > 1400 ? out.slice(0, 240) : out;
}

function isStackItem(item) {
  const usaQuantidade = String(item.usaQuantidade || "").toLowerCase();
  const tipo = String(item.tipoItem || "").toLowerCase();
  return usaQuantidade === "true" || usaQuantidade === "sim"
    || tipo === "material" || tipo === "outros" || tipo === "minerio" || tipo === "minério"
    || tipo === "pocao" || tipo === "poção" || tipo.startsWith("potion") || tipo.startsWith("pocao") || tipo.startsWith("poção")
    || tipo === "consumivel" || tipo === "consumível" || tipo.startsWith("consum");
}

function normalizePotionName(value) {
  return String(value || "")
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/ç/g, "c")
    .replace(/[^a-z0-9]+/g, " ")
    .trim();
}

function timedEffectRef(characterId, effectId) {
  return characterRef(characterId).collection("activeEffects").doc(effectId);
}

function activeEffectPayloadFromDocs(docs) {
  const now = Date.now();
  const bonuses = Object.fromEntries(TIMED_POTION_FIELDS.map((field) => [field, 0]));
  const effects = [];

  for (const doc of docs) {
    const data = doc.data() || {};
    const expiresAt = data.expiresAt;
    const expiresMs = expiresAt && typeof expiresAt.toMillis === "function" ? expiresAt.toMillis() : new Date(expiresAt || 0).getTime();
    if (!Number.isFinite(expiresMs) || expiresMs <= now) continue;
    const effectBonuses = data.bonuses && typeof data.bonuses === "object"
      ? data.bonuses
      : { [String(data.stat || "")]: data.value };
    const normalized = {};
    for (const [field, rawValue] of Object.entries(effectBonuses)) {
      const value = Math.floor(Number(rawValue || 0));
      if (Object.prototype.hasOwnProperty.call(bonuses, field) && value !== 0) {
        bonuses[field] += value;
        normalized[field] = value;
      }
    }
    effects.push({
      id: doc.id,
      name: String(data.name || ""),
      bonuses: normalized,
      expiresAtMs: expiresMs,
      remainingSeconds: Math.max(0, Math.ceil((expiresMs - now) / 1000)),
    });
  }

  return { bonuses, effects };
}

function itemLevelText(item) {
  if (isStackItem(item)) return "";
  const text = String(item.textoUpgrade || "").trim();
  if (/^\+/.test(text)) return text;
  const level = Math.max(0, Math.floor(Number(item.nivelUpgrade || 0)));
  return `+${level}`;
}

function inventoryDisplayId(item, suffix = "") {
  const nome = String(item.nomeItem || item.uidInventario || "Item").normalize("NFC").trim() || "Item";
  return sanitizeDocId(`${nome}${itemLevelText(item)}${suffix}`);
}

function itemInventoryDocId(item) {
  return sanitizeDocId(item.uidInventario || item.itemUid || item.firebaseDocId || inventoryDisplayId(item));
}

function uniqueList(values) {
  const out = [];
  for (const value of values) {
    const text = sanitizeDocId(value || "");
    if (text && !out.includes(text)) out.push(text);
  }
  return out;
}

function inventoryDocCandidates(item) {
  return uniqueList([
    item.firebaseDocId,
    item.uidInventario,
    item.itemUid,
    item.displayId,
    inventoryDisplayId(item),
  ]);
}

async function readInventoryCandidate(tx, characterId, item) {
  const candidates = inventoryDocCandidates(item);
  let fallback = null;
  for (const docId of candidates) {
    const ref = inventoryRef(characterId, docId);
    if (!fallback) fallback = { ref, snap: null, docId };
    const snap = await tx.get(ref);
    if (snap.exists) return { ref, snap, docId };
  }
  return fallback;
}

async function readStackDestination(tx, characterId, item) {
  const displayId = inventoryDisplayId(item);
  const candidates = uniqueList([item.firebaseDocId, item.displayId, displayId]);
  let fallback = null;
  for (const docId of candidates) {
    const ref = inventoryRef(characterId, docId);
    if (!fallback) fallback = { ref, snap: null, docId };
    const snap = await tx.get(ref);
    if (snap.exists) return { ref, snap, docId };
  }
  return fallback;
}

function offeredQuantity(offer, item) {
  return Math.max(1, Math.floor(Number(offer.quantity || item.quantidade || 1)));
}
function tradeRef(tradeId) {
  return db.collection("trades").doc(tradeId);
}

async function findTradeByCode(code) {
  const normalized = normalizeCode(code);
  if (!normalized) return null;
  const querySnap = await db.collection("trades").where("code", "==", normalized).limit(1).get();
  if (querySnap.empty) return null;
  const doc = querySnap.docs[0];
  return { ref: doc.ref, snap: doc };
}

async function findTradeByCodeInTransaction(tx, code) {
  const normalized = normalizeCode(code);
  if (!normalized) return null;
  const query = db.collection("trades").where("code", "==", normalized).limit(1);
  const querySnap = await tx.get(query);
  if (querySnap.empty) return null;
  const doc = querySnap.docs[0];
  return { ref: doc.ref, snap: doc };
}
async function resolveTradeInTransaction(tx, body) {
  const tradeId = optionalString(body, "tradeId");
  const code = normalizeCode(optionalString(body, "code"));
  let ref = tradeId ? tradeRef(tradeId) : null;
  let snap = ref ? await tx.get(ref) : null;
  if ((!snap || !snap.exists) && code) {
    const found = await findTradeByCodeInTransaction(tx, code);
    if (found) {
      ref = found.ref;
      snap = found.snap;
    }
  }
  if (!ref || !snap || !snap.exists) throw new Error("Sala de troca expirada. Crie uma nova sala.");
  const data = snap.data() || {};
  if (data.status !== "completed" && timestampExpired(data.expiresAt)) {
    throw new Error("Sala de troca expirada. Crie uma nova sala.");
  }
  return { ref, snap };
}
function tradePartyDocName(value, fallback) {
  const name = String(value || fallback || "Jogador").normalize("NFC").trim() || String(fallback || "Jogador");
  return sanitizeDocId(name);
}

function tradeDocumentId(hostPlayerName, guestPlayerName, code, flags = []) {
  const host = tradePartyDocName(hostPlayerName, "HOST");
  const guest = tradePartyDocName(guestPlayerName, "CONVIDADO");
  const suffix = sanitizeDocId(normalizeCode(code || makeTradeCode()));
  const flagText = flags.filter(Boolean).map((flag) => sanitizeDocId(flag)).join("-");
  return sanitizeDocId(`${host}-${guest}-${suffix}${flagText ? `-${flagText}` : ""}`);
}

function sameTableName(a, b) {
  const left = String(a || "").normalize("NFC").trim().toLowerCase();
  const right = String(b || "").normalize("NFC").trim().toLowerCase();
  if (!left || !right) return true;
  return left === right;
}

function offerItemDisplayName(offer) {
  const data = typeof offer.data === "function" ? (offer.data() || {}) : (offer || {});
  const item = data.itemSnapshot || data.item || {};
  const quantity = Math.max(1, Math.floor(Number(data.quantity || item.quantidade || 1)));
  const nome = String(item.nomeItem || item.nome || item.name || item.uidInventario || "Item").normalize("NFC").trim() || "Item";
  const level = itemLevelText(item);
  return `${quantity}x ${nome}${level ? ` ${level}` : ""}`;
}

function offerItemRecord(offer) {
  const data = typeof offer.data === "function" ? (offer.data() || {}) : (offer || {});
  const item = data.itemSnapshot || data.item || {};
  return {
    nomeItem: String(item.nomeItem || item.nome || item.name || item.uidInventario || "Item").normalize("NFC"),
    quantidade: Math.max(1, Math.floor(Number(data.quantity || item.quantidade || 1))),
    rank: String(item.RankItem || item.rankItem || item.rank || item.Rank || ""),
    nivelUpgrade: Math.max(0, Math.floor(Number(item.nivelUpgrade || 0))),
    textoUpgrade: itemLevelText(item),
    tipoItem: String(item.tipoItem || ""),
    uidInventario: String(item.uidInventario || item.itemUid || ""),
    imagemestilo2: String(item.imagemestilo2 || item.imagem || item.imageUrl || ""),
  };
}

function offerResumo(items) {
  return items.map(offerItemDisplayName);
}
function flatOfferFields(side, docs) {
  const out = {};
  docs.slice(0, MAX_ITEMS_PER_OFFER).forEach((doc, index) => {
    const n = index + 1;
    const data = typeof doc.data === "function" ? (doc.data() || {}) : (doc || {});
    const item = data.itemSnapshot || data.item || {};
    const quantity = Math.max(1, Math.floor(Number(data.quantity || item.quantidade || 1)));
    out[`${side}Item${n}_quantity`] = quantity;
    for (const [key, value] of Object.entries(item)) {
      if (value === undefined || value === null) continue;
      if (typeof value === "object") continue;
      out[`${side}Item${n}_${key}`] = value;
    }
  });
  return out;
}
function publicTradeData(doc) {
  const data = doc.data() || {};
  return {
    tradeId: doc.id,
    code: data.code || "",
    status: data.status || "",
    hostCharacterId: data.hostCharacterId || "",
    hostName: data.hostName || "",
    hostPlayerName: data.hostPlayerName || data.playerName || "",
    hostTableName: data.hostTableName || data.tableName || "",
    guestCharacterId: data.guestCharacterId || "",
    guestName: data.guestName || "",
    guestPlayerName: data.guestPlayerName || "",
    guestTableName: data.guestTableName || "",
    tradeTitle: data.tradeTitle || "",
    hostItemsResumo: data.hostItemsResumo || [],
    guestItemsResumo: data.guestItemsResumo || [],
    resumoTroca: data.resumoTroca || "",
    hostConfirmed: data.hostConfirmed === true,
    guestConfirmed: data.guestConfirmed === true,
    hostCompleteRequested: data.hostCompleteRequested === true,
    guestCompleteRequested: data.guestCompleteRequested === true,
    createdAt: data.createdAt || null,
    updatedAt: data.updatedAt || null,
    expiresAt: data.expiresAt || null,
    hostGold: Number(data.hostGold || 0),
    hostSilver: Number(data.hostSilver || 0),
    guestGold: Number(data.guestGold || 0),
    guestSilver: Number(data.guestSilver || 0),
  };
}

function sameText(a, b) {
  return String(a || "").normalize("NFC").trim().toLowerCase() === String(b || "").normalize("NFC").trim().toLowerCase();
}

function sideForActor(trade, body = {}) {
  const characterId = String(body.characterId || "").trim();
  const characterName = String(body.characterName || "").trim();
  if (trade.hostCharacterId === characterId) return "host";
  if (trade.guestCharacterId === characterId) return "guest";
  if (characterName && sameText(trade.hostName, characterName)) return "host";
  if (characterName && sameText(trade.guestName, characterName)) return "guest";
  throw new Error("Personagem nao participa desta troca.");
}

function assertTradeParticipant(trade, characterId, body = {}) {
  sideForActor(trade, { ...body, characterId });
}

function sideForCharacter(trade, characterId, body = {}) {
  return sideForActor(trade, { ...body, characterId });
}

function assertTradeEditable(trade) {
  if (trade.hostConfirmed === true || trade.guestConfirmed === true) {
    throw new Error("Uma oferta confirmada bloqueia alteracoes. Desconfirme antes de editar.");
  }
}
function validateItemSnapshot(item) {
  if (!item || typeof item !== "object") {
    throw new Error("Item invalido.");
  }
  let uid = String(item.uidInventario || item.itemUid || item.firebaseDocId || "").trim();
  let nome = String(item.nomeItem || item.nome || item.name || item.Nome || item.titulo || item.label || item.text || item.descricaoLoja || "").normalize("NFC").trim();
  if (!uid) {
    uid = sanitizeDocId(`item_${Date.now()}_${Math.floor(Math.random() * 100000)}`);
  }
  if (!nome) {
    nome = String(uid || "Item").normalize("NFC").trim() || "Item";
  }
  const normalized = { ...item, nomeItem: nome, uidInventario: uid, itemUid: uid };
  normalized.firebaseDocId = itemInventoryDocId(normalized);
  normalized.displayId = inventoryDisplayId(normalized);
  return normalized;
}

async function withJsonRequest(req, res, handler) {
  if (allowCors(req, res)) return;
  if (req.method !== "POST") return send(res, 405, { ok: false, error: "Use POST." });

  try {
    const result = await handler(req.body || {});
    return send(res, 200, { ok: true, ...result });
  } catch (err) {
    console.warn(`${req.path || req.url}: ${err.message || String(err)}`);
    return send(res, 400, { ok: false, error: err.message || String(err) });
  }
}

exports.syncInventory = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const characterId = requireString(body, "characterId");
  const playerName = optionalString(body, "playerName");
  const characterName = optionalString(body, "characterName");
  const tableName = optionalString(body, "tableName");
  const gold = Math.max(0, Math.floor(Number(body.gold || 0)));
  const silver = Math.max(0, Math.floor(Number(body.silver || 0)));
  const items = Array.isArray(body.items) ? body.items : [];

  if (items.length > MAX_INVENTORY_ITEMS) {
    throw new Error(`Inventario excede ${MAX_INVENTORY_ITEMS} itens.`);
  }

  const batch = db.batch();
  batch.set(playerRefFromCharacterId(characterId), {
    playerName,
    tableName,
    updatedAt: FieldValue.serverTimestamp(),
  }, { merge: true });

  batch.set(characterRef(characterId), {
    playerName,
    characterName,
    tableName,
    characterId,
    gold,
    silver,
    updatedAt: FieldValue.serverTimestamp(),
  }, { merge: true });

  const existing = await characterRef(characterId).collection("inventory").get();
  existing.forEach((doc) => batch.delete(doc.ref));

  for (const rawItem of items) {
    const item = validateItemSnapshot(rawItem);
    batch.set(inventoryRef(characterId, item.firebaseDocId), {
      ...item,
      updatedAt: FieldValue.serverTimestamp(),
    });
  }

  await batch.commit();
  return { characterId, totalItems: items.length };
}));

exports.registerCharacterOpen = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const characterId = requireString(body, "characterId");
  const playerName = optionalString(body, "playerName");
  const characterName = optionalString(body, "characterName");
  const tableName = optionalString(body, "tableName");
  const gold = Math.max(0, Math.floor(Number(body.gold || 0)));
  const silver = Math.max(0, Math.floor(Number(body.silver || 0)));

  const batch = db.batch();
  batch.set(playerRefFromCharacterId(characterId), {
    playerName,
    tableName,
    updatedAt: FieldValue.serverTimestamp(),
  }, { merge: true });

  batch.set(characterRef(characterId), {
    playerName,
    characterName,
    tableName,
    characterId,
    gold,
    silver,
    openedAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
  }, { merge: true });

  await batch.commit();
  return { characterId };
}));

exports.claimDailyCollection = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const characterId = requireString(body, "characterId");
  const playerName = optionalString(body, "playerName");
  const characterName = optionalString(body, "characterName");
  const tableName = optionalString(body, "tableName");
  const todayKey = todayKeySaoPaulo();
  const ref = characterRef(characterId).collection("dailyLocks").doc("coleta");

  return db.runTransaction(async (tx) => {
    const snap = await tx.get(ref);
    const data = snap.exists ? snap.data() : {};

    const usesToday = data.lastCollectionDay === todayKey ? Number(data.collectionCount || 0) : 0;
    const maxCollectionsPerDay = 3;

    if (usesToday >= maxCollectionsPerDay) {
      return {
        ok: false,
        alreadyCollected: true,
        todayKey,
        resetAt: nextMidnightSaoPauloLabel(),
        error: "Voce ja coletou 3 vezes hoje. A coleta libera novamente as 00:00hrs.",
      };
    }

    const collectionCount = usesToday + 1;

    tx.set(ref, {
      lastCollectionDay: todayKey,
      lastCollectionAt: FieldValue.serverTimestamp(),
      collectionCount,
      maxCollectionsPerDay,
      playerName,
      characterName,
      tableName,
      updatedAt: FieldValue.serverTimestamp(),
    }, { merge: true });

    return {
      ok: true,
      alreadyCollected: false,
      collectionCount,
      maxCollectionsPerDay,
      todayKey,
      resetAt: nextMidnightSaoPauloLabel(),
    };
  });
}));

exports.useTimedPotion = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const characterId = requireString(body, "characterId");
  const playerName = optionalString(body, "playerName");
  const characterName = optionalString(body, "characterName");
  const tableName = optionalString(body, "tableName");
  const potionName = optionalString(body, "potionName");
  const key = normalizePotionName(potionName);
  const def = TIMED_POTION_DEFS[key] || TIMED_POTION_DEFS[`${key} menor`];
  if (!def) {
    throw new Error("Esta potion nao possui efeito temporario cadastrado no servidor.");
  }

  const effectId = sanitizeDocId(key);
  const expiresAt = admin.firestore.Timestamp.fromMillis(Date.now() + (def.minutes * 60 * 1000));
  const bonuses = {};
  for (const [field, rawValue] of Object.entries(def.bonuses || { [def.stat]: def.value })) {
    if (TIMED_POTION_FIELDS.includes(field)) {
      bonuses[field] = Math.floor(Number(rawValue || 0));
    }
  }
  await timedEffectRef(characterId, effectId).set({
    name: potionName || key,
    label: def.label,
    bonuses,
    durationMinutes: def.minutes,
    expiresAt,
    playerName,
    characterName,
    tableName,
    updatedAt: FieldValue.serverTimestamp(),
  }, { merge: true });

  const snap = await characterRef(characterId).collection("activeEffects").get();
  const payload = activeEffectPayloadFromDocs(snap.docs);
  return {
    characterId,
    effectId,
    bonuses,
    durationMinutes: def.minutes,
    expiresAtMs: expiresAt.toMillis(),
    ...payload,
  };
}));

exports.getActivePotionEffects = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const characterId = requireString(body, "characterId");
  return {
    characterId,
    disabled: true,
    ...activeEffectPayloadFromDocs([]),
  };
}));

exports.createTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const hostCharacterId = requireString(body, "hostCharacterId");
  const hostName = requireString(body, "hostName");

  let code = makeTradeCode();
  for (let i = 0; i < 5; i += 1) {
    const found = await findTradeByCode(code);
    if (!found) break;
    code = makeTradeCode();
  }

  const hostPlayerName = optionalString(body, "playerName") || hostName;
  const hostTableName = optionalString(body, "tableName");
  const ref = db.collection("trades").doc(tradeDocumentId(hostPlayerName, "AGUARDANDO", code));
  const trade = {
    code,
    status: "open",
    hostCharacterId,
    hostName,
    hostPlayerName,
    hostTableName,
    guestCharacterId: "",
    guestName: "",
    guestPlayerName: "",
    guestTableName: "",
    tradeTitle: `${hostPlayerName}-AGUARDANDO`,
    hostConfirmed: false,
    guestConfirmed: false,
    hostCompleteRequested: false,
    guestCompleteRequested: false,
    hostGold: 0,
    hostSilver: 0,
    guestGold: 0,
    guestSilver: 0,
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
    expiresAt: expiresTimestamp(),
  };


  await db.runTransaction(async (tx) => {
    tx.create(ref, trade);
  });

  return { tradeId: ref.id, code, hostName, hostPlayerName, hostTableName, guestName: "", guestCharacterId: "" };
}));

exports.joinTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const code = normalizeCode(requireString(body, "code"));
  const guestCharacterId = requireString(body, "guestCharacterId");
  const guestName = requireString(body, "guestName");
  const guestPlayerName = optionalString(body, "playerName") || guestName;
  const guestTableName = optionalString(body, "tableName");

  const current = await findTradeByCode(code);
  if (!current) throw new Error("Codigo de troca nao encontrado.");
  const currentData = current.snap.data() || {};
  if (currentData.status !== "completed" && timestampExpired(currentData.expiresAt)) {
    await deleteTradeDocument(current.ref);
    throw new Error("Sala de troca expirada. Crie uma nova sala.");
  }
  const result = await db.runTransaction(async (tx) => {
    const found = await findTradeByCodeInTransaction(tx, code);
    if (!found) throw new Error("Codigo de troca nao encontrado.");

    const oldRef = found.ref;
    const snap = found.snap;

    const trade = snap.data();
    if (trade.status !== "open" && trade.status !== "joined") {
      throw new Error("Troca nao esta aberta.");
    }
    if (trade.hostCharacterId === guestCharacterId) {
      throw new Error("Host nao pode entrar como convidado.");
    }
    if (trade.guestCharacterId && trade.guestCharacterId !== guestCharacterId) {
      throw new Error("Troca ja possui outro convidado.");
    }

    const hostPlayerName = trade.hostPlayerName || trade.playerName || trade.hostName || "HOST";
    const hostTableName = trade.hostTableName || trade.tableName || "";
    const nextData = {
      ...trade,
      status: "joined",
      guestCharacterId,
      guestName,
      guestPlayerName,
      guestTableName,
      hostPlayerName,
      hostTableName,
      guestConfirmed: false,
      hostConfirmed: false,
      guestCompleteRequested: false,
      hostCompleteRequested: false,
      tradeTitle: `${hostPlayerName}-${guestPlayerName}`,
      updatedAt: FieldValue.serverTimestamp(),
    };
    const desiredRef = db.collection("trades").doc(tradeDocumentId(hostPlayerName, guestPlayerName, code));
    let finalRef = oldRef;

    if (desiredRef.id !== oldRef.id) {
      const desiredSnap = await tx.get(desiredRef);
      if (desiredSnap.exists) throw new Error("Ja existe uma troca com esse host e convidado para este codigo.");
      const hostOfferSnap = await tx.get(oldRef.collection("offers").doc("host").collection("items"));
      const guestOfferSnap = await tx.get(oldRef.collection("offers").doc("guest").collection("items"));
      tx.set(desiredRef, nextData);
      hostOfferSnap.docs.forEach((doc) => tx.set(desiredRef.collection("offers").doc("host").collection("items").doc(doc.id), doc.data()));
      guestOfferSnap.docs.forEach((doc) => tx.set(desiredRef.collection("offers").doc("guest").collection("items").doc(doc.id), doc.data()));
      hostOfferSnap.docs.forEach((doc) => tx.delete(doc.ref));
      guestOfferSnap.docs.forEach((doc) => tx.delete(doc.ref));
      tx.delete(oldRef);
      finalRef = desiredRef;
    } else {
      tx.set(oldRef, nextData, { merge: true });
    }

    return { tradeId: finalRef.id, ...publicTradeData({ id: finalRef.id, data: () => nextData }) };
  });

  return result;
}));
exports.addItemToTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tradeId = optionalString(body, "tradeId");
  const characterId = requireString(body, "characterId");
  const item = validateItemSnapshot(body.item);
  const quantity = Math.max(1, Math.floor(Number(body.quantity || item.quantidade || 1)));


  let resolvedTradeId = tradeId;
  await db.runTransaction(async (tx) => {
    const resolved = await resolveTradeInTransaction(tx, body);
    resolvedTradeId = resolved.ref.id;
    const ref = resolved.ref;
    const snap = resolved.snap;
    const trade = snap.data();
    assertTradeParticipant(trade, characterId, body);
    if (trade.status !== "open" && trade.status !== "joined") throw new Error("Troca nao aceita alteracoes.");
    assertTradeEditable(trade);

    const source = await readInventoryCandidate(tx, characterId, item);
    if (!source || !source.snap || !source.snap.exists) throw new Error(`Voce nao possui o item ${item.nomeItem}.`);
    const sourceData = source.snap.data() || {};
    if (isStackItem(item)) {
      const atual = Math.max(0, Math.floor(Number(sourceData.quantidade || item.quantidade || 0)));
      if (atual < quantity) throw new Error(`Voce nao possui quantidade suficiente de ${item.nomeItem}.`);
    }

    const side = sideForCharacter(trade, characterId, body);
    const offerItemsRef = ref.collection("offers").doc(side).collection("items");
    const offerRef = offerItemsRef.doc(item.uidInventario);
    const offerSnap = await tx.get(offerRef);
    if (!offerSnap.exists) {
      const currentOffers = await tx.get(offerItemsRef);
      if (currentOffers.size >= MAX_ITEMS_PER_OFFER) throw new Error("A oferta ja possui o maximo de 10 itens.");
    }
    tx.set(offerRef, { itemSnapshot: item, quantity, updatedAt: FieldValue.serverTimestamp() });
    tx.update(ref, { hostConfirmed: false, guestConfirmed: false, hostCompleteRequested: false, guestCompleteRequested: false, updatedAt: FieldValue.serverTimestamp() });
  });

  return { tradeId: resolvedTradeId || tradeId, characterId, itemUid: item.uidInventario, quantity };
}));
exports.removeItemFromTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tradeId = optionalString(body, "tradeId");
  const characterId = requireString(body, "characterId");
  const itemUid = requireString(body, "itemUid");


  await db.runTransaction(async (tx) => {
    const resolved = await resolveTradeInTransaction(tx, body);
    const ref = resolved.ref;
    const snap = resolved.snap;
    const trade = snap.data();
    assertTradeParticipant(trade, characterId, body);
    if (trade.status !== "open" && trade.status !== "joined") throw new Error("Troca nao aceita alteracoes.");
    assertTradeEditable(trade);

    const side = sideForCharacter(trade, characterId, body);
    tx.delete(ref.collection("offers").doc(side).collection("items").doc(itemUid));
    tx.update(ref, { hostConfirmed: false, guestConfirmed: false, hostCompleteRequested: false, guestCompleteRequested: false, updatedAt: FieldValue.serverTimestamp() });
  });

  return { tradeId, characterId, itemUid };
}));



exports.setTradeCurrency = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tradeId = optionalString(body, "tradeId");
  const characterId = requireString(body, "characterId");
  const gold = Math.max(0, Math.floor(Number(body.gold || 0)));
  const silver = Math.max(0, Math.floor(Number(body.silver || 0)));


  await db.runTransaction(async (tx) => {
    const resolved = await resolveTradeInTransaction(tx, body);
    const ref = resolved.ref;
    const snap = resolved.snap;
    const trade = snap.data();
    assertTradeParticipant(trade, characterId, body);
    if (trade.status !== "open" && trade.status !== "joined") throw new Error("Troca nao aceita alteracoes.");
    assertTradeEditable(trade);

    const charSnap = await tx.get(characterRef(characterId));
    const money = charSnap.data() || {};
    if (Number(money.gold || 0) < gold) throw new Error("Voce nao possui ouro suficiente.");
    if (Number(money.silver || 0) < silver) throw new Error("Voce nao possui prata suficiente.");

    const side = sideForCharacter(trade, characterId, body);
    const update = {
      hostConfirmed: false,
      guestConfirmed: false,
      hostCompleteRequested: false,
      guestCompleteRequested: false,
      updatedAt: FieldValue.serverTimestamp(),
    };
    update[`${side}Gold`] = gold;
    update[`${side}Silver`] = silver;
    tx.update(ref, update);
  });

  return { tradeId, characterId, gold, silver };
}));
exports.confirmTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tradeId = requireString(body, "tradeId");
  const characterId = requireString(body, "characterId");
  const confirmed = body.confirmed !== false;

  const result = await db.runTransaction(async (tx) => {
    const resolved = await resolveTradeInTransaction(tx, body);
    const ref = resolved.ref;
    const snap = resolved.snap;
    const trade = snap.data();
    const side = sideForCharacter(trade, characterId, body);
    if (trade.status !== "open" && trade.status !== "joined") throw new Error("Troca nao esta pronta para confirmar.");
    if (side === "guest" && !trade.guestCharacterId) throw new Error("A troca ainda nao tem convidado.");

    const update = { updatedAt: FieldValue.serverTimestamp(), hostCompleteRequested: false, guestCompleteRequested: false };
    update[`${side}Confirmed`] = confirmed;
    tx.update(ref, update);

    return {
      hostConfirmed: side === "host" ? confirmed : trade.hostConfirmed === true,
      guestConfirmed: side === "guest" ? confirmed : trade.guestConfirmed === true,
    };
  });

  return { tradeId, ...result };
}));

exports.completeTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tradeId = requireString(body, "tradeId");
  const characterId = requireString(body, "characterId");

  let responseHostItems = [];
  let responseGuestItems = [];
  let completionResult = null;

  await db.runTransaction(async (tx) => {
    const resolved = await resolveTradeInTransaction(tx, body);
    const ref = resolved.ref;
    const snap = resolved.snap;
    const trade = snap.data();

    if (trade.status === "completed") {
      completionResult = { status: "completed", alreadyCompleted: true };
      return;
    }
    if (trade.status !== "joined" && !(trade.status === "open" && trade.guestCharacterId)) throw new Error("Troca nao esta pronta.");
    if (!trade.hostCharacterId || !trade.guestCharacterId) throw new Error("A troca precisa de host e convidado.");
    if (trade.hostConfirmed !== true || trade.guestConfirmed !== true) {
      throw new Error("Os dois jogadores precisam confirmar.");
    }

    const side = sideForCharacter(trade, characterId, body);
    const hostCompleteRequested = trade.hostCompleteRequested === true || side === "host";
    const guestCompleteRequested = trade.guestCompleteRequested === true || side === "guest";
    if (!hostCompleteRequested || !guestCompleteRequested) {
      tx.update(ref, { hostCompleteRequested, guestCompleteRequested, updatedAt: FieldValue.serverTimestamp() });
      completionResult = { status: "joined", pendingCompletion: true, hostCompleteRequested, guestCompleteRequested };
      return;
    }

    const hostItemsSnap = await tx.get(ref.collection("offers").doc("host").collection("items"));
    const guestItemsSnap = await tx.get(ref.collection("offers").doc("guest").collection("items"));
    const hostItems = hostItemsSnap.docs.map((doc) => doc.data()).slice(0, MAX_ITEMS_PER_OFFER);
    const guestItems = guestItemsSnap.docs.map((doc) => doc.data()).slice(0, MAX_ITEMS_PER_OFFER);
    responseHostItems = hostItems;
    responseGuestItems = guestItems;

    const hostGold = Number(trade.hostGold || 0);
    const hostSilver = Number(trade.hostSilver || 0);
    const guestGold = Number(trade.guestGold || 0);
    const guestSilver = Number(trade.guestSilver || 0);
    const hostCharRef = characterRef(trade.hostCharacterId);
    const guestCharRef = characterRef(trade.guestCharacterId);
    const hostCharSnap = await tx.get(hostCharRef);
    const guestCharSnap = await tx.get(guestCharRef);
    const hostMoney = hostCharSnap.data() || {};
    const guestMoney = guestCharSnap.data() || {};

    if (Number(hostMoney.gold || 0) < hostGold || Number(hostMoney.silver || 0) < hostSilver) throw new Error("Host nao possui moedas suficientes.");
    if (Number(guestMoney.gold || 0) < guestGold || Number(guestMoney.silver || 0) < guestSilver) throw new Error("Convidado nao possui moedas suficientes.");

    const moves = [];
    for (const offer of hostItems) {
      const item = validateItemSnapshot(offer.itemSnapshot);
      const qty = offeredQuantity(offer, item);
      moves.push({ from: trade.hostCharacterId, to: trade.guestCharacterId, fromLabel: "Host", item, qty });
    }
    for (const offer of guestItems) {
      const item = validateItemSnapshot(offer.itemSnapshot);
      const qty = offeredQuantity(offer, item);
      moves.push({ from: trade.guestCharacterId, to: trade.hostCharacterId, fromLabel: "Convidado", item, qty });
    }

    for (const move of moves) {
      move.source = await readInventoryCandidate(tx, move.from, move.item);
      if (!move.source || !move.source.snap || !move.source.snap.exists) {
        throw new Error(`${move.fromLabel} nao possui o item ${move.item.nomeItem}.`);
      }
      if (isStackItem(move.item)) {
        move.dest = await readStackDestination(tx, move.to, move.item);
      }
    }

    for (const move of moves) {
      const item = move.item;
      const sourceData = move.source.snap.data() || {};
      if (isStackItem(item)) {
        const atual = Math.max(0, Math.floor(Number(sourceData.quantidade || item.quantidade || 0)));
        if (atual < move.qty) throw new Error(`${move.fromLabel} nao possui quantidade suficiente de ${item.nomeItem}.`);
        const restante = atual - move.qty;
        if (restante > 0) {
          tx.set(move.source.ref, { quantidade: restante, quantidadeDisplay: String(restante), updatedAt: FieldValue.serverTimestamp() }, { merge: true });
        } else {
          tx.delete(move.source.ref);
        }

        const transferred = { ...item, quantidade: move.qty, quantidadeDisplay: String(move.qty), recebidoDeTroca: true };
        transferred.firebaseDocId = inventoryDisplayId(transferred);
        transferred.displayId = inventoryDisplayId(transferred);
        if (move.dest && move.dest.snap && move.dest.snap.exists) {
          const destData = move.dest.snap.data() || {};
          const novaQtd = Math.max(0, Math.floor(Number(destData.quantidade || 0))) + move.qty;
          tx.set(move.dest.ref, { ...transferred, quantidade: novaQtd, quantidadeDisplay: String(novaQtd), updatedAt: FieldValue.serverTimestamp() }, { merge: true });
        } else {
          tx.set(inventoryRef(move.to, transferred.firebaseDocId), { ...transferred, updatedAt: FieldValue.serverTimestamp() });
        }
      } else {
        tx.delete(move.source.ref);
        const newUid = `${item.uidInventario}_trade_${Date.now()}_${Math.floor(Math.random() * 100000)}`;
        const transferred = { ...item, uidInventario: newUid, itemUid: newUid, quantidade: "", quantidadeDisplay: item.textoUpgrade || item.quantidadeDisplay || "+0", recebidoDeTroca: true };
        transferred.firebaseDocId = itemInventoryDocId(transferred);
        transferred.displayId = inventoryDisplayId(transferred, ` #${newUid.slice(-6)}`);
        tx.set(inventoryRef(move.to, transferred.firebaseDocId), { ...transferred, updatedAt: FieldValue.serverTimestamp() });
      }
    }

    if (hostGold > 0 || hostSilver > 0 || guestGold > 0 || guestSilver > 0) {
      tx.set(hostCharRef, { gold: Number(hostMoney.gold || 0) - hostGold + guestGold, silver: Number(hostMoney.silver || 0) - hostSilver + guestSilver, updatedAt: FieldValue.serverTimestamp() }, { merge: true });
      tx.set(guestCharRef, { gold: Number(guestMoney.gold || 0) - guestGold + hostGold, silver: Number(guestMoney.silver || 0) - guestSilver + hostSilver, updatedAt: FieldValue.serverTimestamp() }, { merge: true });
    }

    const hostItemsResumo = offerResumo(hostItems);
    const guestItemsResumo = offerResumo(guestItems);
    const hostPlayerName = trade.hostPlayerName || trade.hostName || "HOST";
    const guestPlayerName = trade.guestPlayerName || trade.guestName || "CONVIDADO";
    const hostTableName = trade.hostTableName || trade.tableName || "";
    const guestTableName = trade.guestTableName || "";
    const hostVazio = hostItems.length === 0 && hostGold <= 0 && hostSilver <= 0;
    const guestVazio = guestItems.length === 0 && guestGold <= 0 && guestSilver <= 0;
    const flagsAuditoria = [];
    if (!sameTableName(hostTableName, guestTableName)) flagsAuditoria.push("ILEGAL");
    if (hostVazio || guestVazio) flagsAuditoria.push("SUSPEITA");
    const tradeTitle = `${hostPlayerName}-${guestPlayerName}${flagsAuditoria.length > 0 ? `-${flagsAuditoria.join("-")}` : ""}`;
    const completedData = {
      status: "completed",
      hostCompleteRequested: true,
      guestCompleteRequested: true,
      completedAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
      tradeTitle,
      auditFlags: flagsAuditoria,
      ilegalEntreMesas: flagsAuditoria.includes("ILEGAL"),
      suspeitaOfertaVazia: flagsAuditoria.includes("SUSPEITA"),
      hostPlayerName,
      guestPlayerName,
      hostTableName,
      guestTableName,
      hostItemsResumo,
      guestItemsResumo,
      hostOfferItems: hostItems.map(offerItemRecord),
      guestOfferItems: guestItems.map(offerItemRecord),
      hostOfferGold: hostGold,
      hostOfferSilver: hostSilver,
      guestOfferGold: guestGold,
      guestOfferSilver: guestSilver,
      resumoTroca: `${hostPlayerName} enviou: ${hostItemsResumo.join(", ") || "nenhum item"}; ${guestPlayerName} enviou: ${guestItemsResumo.join(", ") || "nenhum item"}`,
    };
    const auditRef = db.collection("trades").doc(tradeDocumentId(hostPlayerName, guestPlayerName, trade.code || body.code, flagsAuditoria));
    if (auditRef.id !== ref.id) {
      tx.set(auditRef, { ...trade, ...completedData });
      hostItemsSnap.docs.forEach((doc) => tx.set(auditRef.collection("offers").doc("host").collection("items").doc(doc.id), doc.data()));
      guestItemsSnap.docs.forEach((doc) => tx.set(auditRef.collection("offers").doc("guest").collection("items").doc(doc.id), doc.data()));
      hostItemsSnap.docs.forEach((doc) => tx.delete(doc.ref));
      guestItemsSnap.docs.forEach((doc) => tx.delete(doc.ref));
      tx.delete(ref);
    } else {
      tx.update(ref, completedData);
    }
  });

  const hostOfferDocs = responseHostItems.map((d, i) => ({ id: `host_${i}`, itemSnapshot: d.itemSnapshot || d.item || {}, quantity: d.quantity || offeredQuantity(d, d.itemSnapshot || d.item || {}) }));
  const guestOfferDocs = responseGuestItems.map((d, i) => ({ id: `guest_${i}`, itemSnapshot: d.itemSnapshot || d.item || {}, quantity: d.quantity || offeredQuantity(d, d.itemSnapshot || d.item || {}) }));

  if (completionResult && completionResult.pendingCompletion) return { tradeId, ...completionResult };
  if (completionResult && completionResult.alreadyCompleted) return { tradeId, ...completionResult };
  return { tradeId, status: "completed", completedNow: true, hostCompleteRequested: true, guestCompleteRequested: true, ...flatOfferFields("host", responseHostItems), ...flatOfferFields("guest", responseGuestItems), hostItems: hostOfferDocs, guestItems: guestOfferDocs };
}));

exports.cancelTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tradeId = requireString(body, "tradeId");
  const characterId = requireString(body, "characterId");

  let deleted = false;
  await db.runTransaction(async (tx) => {
    const resolved = await resolveTradeInTransaction(tx, body);
    const snap = resolved.snap;
    const trade = snap.data();
    assertTradeParticipant(trade, characterId, body);
    if (trade.status === "completed") throw new Error("Troca ja foi concluida.");
  });

  const resolved = tradeId ? { ref: tradeRef(tradeId), snap: await tradeRef(tradeId).get() } : await findTradeByCode(optionalString(body, "code"));
  let ref = resolved && resolved.ref;
  let snap = resolved && resolved.snap;
  if ((!snap || !snap.exists) && optionalString(body, "code")) {
    const found = await findTradeByCode(optionalString(body, "code"));
    ref = found && found.ref;
    snap = found && found.snap;
  }
  if (ref && snap && snap.exists && (snap.data() || {}).status !== "completed") {
    await deleteTradeDocument(ref);
    deleted = true;
  }

  return { tradeId, cancelledBy: characterId, deleted };
}));
exports.getTrade = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tradeId = optionalString(body, "tradeId");
  const code = normalizeCode(optionalString(body, "code"));
  let ref = tradeId ? tradeRef(tradeId) : null;
  let snap = ref ? await ref.get() : null;

  if ((!snap || !snap.exists) && code) {
    const found = await findTradeByCode(code);
    if (!found) throw new Error("Codigo de troca nao encontrado.");
    ref = found.ref;
    snap = found.snap;
  }
  if (!ref) throw new Error("Informe tradeId ou code.");
  if (!snap || !snap.exists) throw new Error("Troca nao encontrada.");
  const tradeData = snap.data() || {};
  if (tradeData.status !== "completed" && timestampExpired(tradeData.expiresAt)) {
    await deleteTradeDocument(ref);
    throw new Error("Sala de troca expirada. Crie uma nova sala.");
  }
  const hostOffer = await ref.collection("offers").doc("host").collection("items").get();
  const guestOffer = await ref.collection("offers").doc("guest").collection("items").get();

  return {
    ...publicTradeData(snap),
    ...flatOfferFields("host", hostOffer.docs),
    ...flatOfferFields("guest", guestOffer.docs),
    trade: publicTradeData(snap),
    hostItems: hostOffer.docs.map((doc) => ({ id: doc.id, ...doc.data() })),
    guestItems: guestOffer.docs.map((doc) => ({ id: doc.id, ...doc.data() })),
  };
}));


const AUTOMATION_TTL_MS = 2 * 60 * 1000;

function automationKeyAliases(value) {
  const raw = String(value || "").trim();
  if (!raw) return [];
  const out = [];
  const add = (v) => {
    const s = String(v || "").trim();
    if (s && !out.includes(s)) out.push(s);
  };
  add(raw);
  add(raw.toLowerCase());
  add(raw.toLowerCase().replace(/[_\-:]+/g, " ").replace(/\s+/g, " ").trim());
  const roomMatch = raw.match(/rooms\/([\w\-_]+)/i)
    || raw.match(/room\/([\w\-_]+)/i)
    || raw.match(/room[:\s]+([\w\-_]+)/i)
    || raw.match(/sala[\/=]([\w\-_]+)/i);
  if (roomMatch && roomMatch[1]) {
    add(`room:${roomMatch[1]}`);
    add(`room ${roomMatch[1]}`);
    add(roomMatch[1]);
  }
  return out;
}

function automationKeyList(values, limit = 60) {
  const out = [];
  for (const value of values || []) {
    for (const alias of automationKeyAliases(value)) {
      if (!out.includes(alias)) out.push(alias);
      if (out.length >= limit) return out;
    }
  }
  return out;
}

function automationRequestRef(requestId) {
  return db.collection("automationRequests").doc(requestId);
}

function automationRequestPublic(doc) {
  const data = doc.data() || {};
  return {
    requestId: doc.id,
    status: String(data.status || ""),
    tableName: String(data.tableName || ""),
    tableKeys: Array.isArray(data.tableKeys) ? data.tableKeys : [],
    type: String(data.type || ""),
    characterName: String(data.characterName || ""),
    playerName: String(data.playerName || ""),
    item: String(data.item || ""),
    clientSentAtMs: Number(data.clientSentAtMs || 0),
    meters: Number(data.meters || 0),
    lightIntense: Number(data.lightIntense || data.meters || 0),
    lightWeak: Number(data.lightWeak || data.meters || 0),
    angle: Number(data.angle || 360),
    targetNames: Array.isArray(data.targetNames) ? data.targetNames : [],
    targetCharacterIds: Array.isArray(data.targetCharacterIds) ? data.targetCharacterIds : [],
    targetUserIds: Array.isArray(data.targetUserIds) ? data.targetUserIds : [],
    createdAtMs: data.createdAt && typeof data.createdAt.toMillis === "function" ? data.createdAt.toMillis() : 0,
  };
}

exports.submitAutomationRequest = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tableName = requireString(body, "tableName");
  const type = requireString(body, "type");
  const characterName = optionalString(body, "characterName");
  const playerName = optionalString(body, "playerName");
  const requestId = sanitizeDocId(`${Date.now()}-${playerName || "Jogador"}-${characterName || "Personagem"}-${Math.floor(Math.random() * 100000)}`);
  const alvos = body.targets && typeof body.targets === "object" ? body.targets : {};
  const incomingKeys = Array.isArray(body.tableKeys) ? body.tableKeys.map(String) : [];
  const tableKeys = automationKeyList([tableName, ...incomingKeys], 60);
  const data = {
    status: "pending",
    tableName,
    tableKeys,
    type,
    characterName,
    playerName,
    item: optionalString(body, "item"),
    clientSentAtMs: Number(body.clientSentAtMs || 0),
    meters: Number(body.meters || 0),
    lightIntense: Number(body.lightIntense || body.meters || 0),
    lightWeak: Number(body.lightWeak || body.meters || 0),
    angle: Number(body.angle || 360),
    targetNames: Array.isArray(alvos.names) ? alvos.names.map(String).slice(0, 20) : [],
    targetCharacterIds: Array.isArray(alvos.characterIds) ? alvos.characterIds.map(String).slice(0, 20) : [],
    targetUserIds: Array.isArray(alvos.userIds) ? alvos.userIds.map(String).slice(0, 20) : [],
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
    expiresAt: admin.firestore.Timestamp.fromMillis(Date.now() + AUTOMATION_TTL_MS),
  };
  await automationRequestRef(requestId).set(data);
  return { requestId, status: "pending" };
}));

exports.pollAutomationRequests = onRequest({ region: "southamerica-east1", timeoutSeconds: 35 }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tableName = requireString(body, "tableName");
  const incomingKeys = Array.isArray(body.tableKeys) ? body.tableKeys.map(String) : [];
  const queryKeys = automationKeyList([tableName, ...incomingKeys], 10);
  const waitMs = Math.max(0, Math.min(25000, Number(body.waitMs || 0)));
  const deadline = Date.now() + waitMs;
  let requests = [];

  do {
    const now = admin.firestore.Timestamp.now();
    const snap = await db.collection("automationRequests")
      .where("tableKeys", "array-contains-any", queryKeys.length > 0 ? queryKeys : [tableName])
      .where("status", "==", "pending")
      .limit(10)
      .get();

    const batch = db.batch();
    requests = [];
    for (const doc of snap.docs) {
      const data = doc.data() || {};
      if (data.expiresAt && typeof data.expiresAt.toMillis === "function" && data.expiresAt.toMillis() <= Date.now()) {
        batch.set(doc.ref, { status: "expired", updatedAt: FieldValue.serverTimestamp() }, { merge: true });
        continue;
      }
      requests.push(automationRequestPublic(doc));
      batch.set(doc.ref, { status: "processing", claimedAt: now, updatedAt: FieldValue.serverTimestamp() }, { merge: true });
    }
    if (!snap.empty) await batch.commit();
    if (requests.length > 0 || Date.now() >= deadline) break;
    await new Promise((resolve) => setTimeout(resolve, 500));
  } while (true);

  const flat = {};
  requests.forEach((r, idx) => {
    const n = idx + 1;
    flat[`req${n}_requestId`] = r.requestId;
    flat[`req${n}_type`] = r.type;
    flat[`req${n}_characterName`] = r.characterName;
    flat[`req${n}_playerName`] = r.playerName;
    flat[`req${n}_item`] = r.item;
    flat[`req${n}_createdAtMs`] = r.createdAtMs;
    flat[`req${n}_clientSentAtMs`] = r.clientSentAtMs;
    flat[`req${n}_meters`] = r.meters;
    flat[`req${n}_lightIntense`] = r.lightIntense;
    flat[`req${n}_lightWeak`] = r.lightWeak;
    flat[`req${n}_angle`] = r.angle;
    flat[`req${n}_targetNames`] = r.targetNames.join("|");
    flat[`req${n}_targetCharacterIds`] = r.targetCharacterIds.join("|");
    flat[`req${n}_targetUserIds`] = r.targetUserIds.join("|");
  });
  return { count: requests.length, waitedMs: waitMs, serverNowMs: Date.now(), ...flat };
}));

exports.completeAutomationRequest = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const requestId = requireString(body, "requestId");
  const ok = body.success === true || body.ok === true;
  const message = optionalString(body, "message");
  await automationRequestRef(requestId).set({
    status: ok ? "completed" : "failed",
    success: ok,
    message,
    completedAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
  }, { merge: true });
  return { requestId, status: ok ? "completed" : "failed" };
}));


const LIGHT_COMMAND_TTL_MS = 2 * 60 * 1000;

function lightCommandKey(values) {
  const aliases = automationKeyList(values, 20);
  for (const key of aliases) {
    const txt = String(key || "").trim();
    if (/^room[: ]/i.test(txt)) return sanitizeDocId(txt.toLowerCase().replace(/^room\s+/i, "room:"));
  }
  return sanitizeDocId((aliases[0] || values[0] || "mesa").toString());
}

function lightCommandRef(key) {
  return db.collection("lightCommandInbox").doc(sanitizeDocId(key));
}

function lightCommandPublic(data) {
  data = data || {};
  return {
    requestId: String(data.requestId || ""),
    type: String(data.type || "alterarLuzToken"),
    characterName: String(data.characterName || ""),
    playerName: String(data.playerName || ""),
    item: String(data.item || ""),
    createdAtMs: Number(data.createdAtMs || 0),
    clientSentAtMs: Number(data.clientSentAtMs || 0),
    meters: Number(data.meters || 0),
    lightIntense: Number(data.lightIntense || data.meters || 0),
    lightWeak: Number(data.lightWeak || data.meters || 0),
    angle: Number(data.angle || 360),
    targetNames: Array.isArray(data.targetNames) ? data.targetNames : [],
    targetCharacterIds: Array.isArray(data.targetCharacterIds) ? data.targetCharacterIds : [],
    targetUserIds: Array.isArray(data.targetUserIds) ? data.targetUserIds : [],
  };
}

function flattenLightCommands(commands) {
  const flat = {};
  commands.forEach((r, idx) => {
    const n = idx + 1;
    flat[`req${n}_requestId`] = r.requestId;
    flat[`req${n}_type`] = r.type;
    flat[`req${n}_characterName`] = r.characterName;
    flat[`req${n}_playerName`] = r.playerName;
    flat[`req${n}_item`] = r.item;
    flat[`req${n}_createdAtMs`] = r.createdAtMs;
    flat[`req${n}_clientSentAtMs`] = r.clientSentAtMs;
    flat[`req${n}_meters`] = r.meters;
    flat[`req${n}_lightIntense`] = r.lightIntense;
    flat[`req${n}_lightWeak`] = r.lightWeak;
    flat[`req${n}_raio`] = r.lightIntense;
    flat[`req${n}_angle`] = r.angle;
    flat[`req${n}_targetNames`] = r.targetNames.join("|");
    flat[`req${n}_targetCharacterIds`] = r.targetCharacterIds.join("|");
    flat[`req${n}_targetUserIds`] = r.targetUserIds.join("|");
  });
  return flat;
}

exports.submitLightCommand = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tableName = requireString(body, "tableName");
  const incomingKeys = Array.isArray(body.tableKeys) ? body.tableKeys.map(String) : [];
  const key = lightCommandKey([tableName, ...incomingKeys]);
  const alvos = body.targets && typeof body.targets === "object" ? body.targets : {};
  const createdAtMs = Date.now();
  const requestId = sanitizeDocId(optionalString(body, "commandId") || `${createdAtMs}-${Math.floor(Math.random() * 100000)}`);
  const command = {
    requestId,
    type: "alterarLuzToken",
    characterName: optionalString(body, "characterName"),
    playerName: optionalString(body, "playerName"),
    item: optionalString(body, "item"),
    createdAtMs,
    clientSentAtMs: Number(body.clientSentAtMs || 0),
    meters: Number(body.meters || body.raio || 0),
    lightIntense: Number(body.lightIntense || body.raio || body.meters || 0),
    lightWeak: Number(body.lightWeak || body.raio || body.meters || 0),
    angle: Number(body.angle || 360),
    targetNames: Array.isArray(alvos.names) ? alvos.names.map(String).slice(0, 8) : [],
    targetCharacterIds: Array.isArray(alvos.characterIds) ? alvos.characterIds.map(String).slice(0, 8) : [],
    targetUserIds: Array.isArray(alvos.userIds) ? alvos.userIds.map(String).slice(0, 8) : [],
    expiresAtMs: createdAtMs + LIGHT_COMMAND_TTL_MS,
  };

  await lightCommandRef(key).set({ command, updatedAt: FieldValue.serverTimestamp() }, { merge: true });
  return { requestId, status: "queued", tableKey: key, serverNowMs: createdAtMs };
}));

exports.pollLightCommands = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tableName = requireString(body, "tableName");
  const incomingKeys = Array.isArray(body.tableKeys) ? body.tableKeys.map(String) : [];
  const key = lightCommandKey([tableName, ...incomingKeys]);
  const ref = lightCommandRef(key);
  const nowMs = Date.now();
  const snap = await ref.get();
  const data = snap.exists ? (snap.data() || {}) : {};
  const raw = data.command || null;
  let requests = [];

  if (raw && Number(raw.expiresAtMs || 0) > nowMs) {
    requests = [lightCommandPublic(raw)];
  } else if (raw) {
    await ref.set({ command: FieldValue.delete(), updatedAt: FieldValue.serverTimestamp() }, { merge: true });
  }

  return { count: requests.length, tableKey: key, serverNowMs: nowMs, ...flattenLightCommands(requests) };
}));

exports.completeLightCommand = onRequest({ region: "southamerica-east1" }, async (req, res) => withJsonRequest(req, res, async (body) => {
  const tableName = requireString(body, "tableName");
  const requestId = requireString(body, "requestId");
  const incomingKeys = Array.isArray(body.tableKeys) ? body.tableKeys.map(String) : [];
  const key = lightCommandKey([tableName, ...incomingKeys]);
  const ref = lightCommandRef(key);
  const snap = await ref.get();
  const data = snap.exists ? (snap.data() || {}) : {};
  const raw = data.command || null;

  if (raw && String(raw.requestId || "") === requestId) {
    await ref.set({
      command: FieldValue.delete(),
      lastCompletedRequestId: requestId,
      lastCompletedAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    }, { merge: true });
    return { requestId, status: "completed", tableKey: key, serverNowMs: Date.now() };
  }

  return { requestId, status: "stale", tableKey: key, serverNowMs: Date.now() };
}));
