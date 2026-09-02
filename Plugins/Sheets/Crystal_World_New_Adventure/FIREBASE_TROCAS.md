# Sistema de Trocas - Firebase

Este esqueleto cria a camada segura para troca entre fichas usando Cloud Functions + Firestore.

## Arquivos

- `firebase.json`: configuracao do Firebase.
- `.firebaserc`: troque `SEU_PROJECT_ID_AQUI` pelo ID real do projeto Firebase.
- `firestore.rules`: bloqueia acesso direto ao Firestore; a ficha deve usar Cloud Functions.
- `functions/index.js`: endpoints HTTPS para inventario e trocas.
- `functions/package.json`: dependencias das Functions.

## Identidade da Troca

Cada troca guarda:

- `hostCharacterId`
- `hostName`
- `guestCharacterId`
- `guestName`
- `code`, exemplo `CW-8A2KQ`

O codigo permite entrar na sala, mas o FRAME deve mostrar claramente `hostName` e `guestName` antes da confirmacao final. Assim os jogadores conferem visualmente se estao trocando com a pessoa certa.

## Endpoints

Todos usam `POST` com JSON.

### syncInventory

Salva o inventario atual da ficha em:

`characters/{characterId}/inventory/{itemUid}`

Payload minimo:

```json
{
  "characterId": "char_arthur_001",
  "playerName": "Cezar",
  "characterName": "Arthur",
  "items": []
}
```

### createTrade

Cria uma troca e retorna `tradeId` e `code`.

```json
{
  "hostCharacterId": "char_a",
  "hostName": "Arthur"
}
```

### joinTrade

Entra na troca usando o codigo.

```json
{
  "code": "CW-8A2KQ",
  "guestCharacterId": "char_b",
  "guestName": "Luna"
}
```

### addItemToTrade

Adiciona item a oferta do personagem.

```json
{
  "tradeId": "abc123",
  "characterId": "char_a",
  "item": {
    "uidInventario": "item_001",
    "nomeItem": "Espada de Ferro +1",
    "tipoItem": "Arma",
    "RankItem": "D"
  },
  "quantity": 1
}
```

### removeItemFromTrade

Remove item da oferta.

```json
{
  "tradeId": "abc123",
  "characterId": "char_a",
  "itemUid": "item_001"
}
```

### confirmTrade

Confirma o lado do personagem. Qualquer alteracao na oferta remove as confirmacoes dos dois lados.

```json
{
  "tradeId": "abc123",
  "characterId": "char_a"
}
```

### completeTrade

Executa a troca quando host e convidado confirmaram. A funcao valida se os itens ainda existem no inventario Firebase de cada jogador antes de transferir.

```json
{
  "tradeId": "abc123"
}
```

### cancelTrade

Cancela a troca.

```json
{
  "tradeId": "abc123",
  "characterId": "char_a"
}
```

### getTrade

Consulta a troca e ofertas.

```json
{
  "code": "CW-8A2KQ"
}
```

ou

```json
{
  "tradeId": "abc123"
}
```

## Proximo passo na ficha Lua

1. Criar/salvar `characterId` fixo na ficha.
2. Exportar inventario local para JSON.
3. Chamar `syncInventory` ao abrir ficha e depois de compra/venda/forja/equipamentos.
4. Criar frame de troca com nome do host, nome do convidado e campo do codigo.
5. Usar os endpoints para criar, entrar, ofertar, confirmar e concluir.