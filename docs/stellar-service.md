# StellarService

Located at `lib/core/stellar/stellar_service.dart`.

The single interface between the app and the Stellar network. All Horizon calls go through this class.

## Instantiation

```dart
StellarService() // defaults to testnet
StellarService(network: StellarNetwork.mainnet)
```

Pass `StellarNetwork.mainnet` for production. The network is set once at construction and cannot be changed.

---

## Key Management

### `createKeyPair()`
```dart
Future<KeyPair> createKeyPair()
```
Generates a new random keypair and persists the secret seed to `flutter_secure_storage`. Returns the `KeyPair`.

Call this on first launch when `loadKeyPair()` returns `null`.

---

### `loadKeyPair()`
```dart
Future<KeyPair?> loadKeyPair()
```
Reads the stored secret seed and returns the `KeyPair`. Returns `null` if no keypair has been saved yet.

---

### `importKeyPair(String secretSeed)`
```dart
Future<void> importKeyPair(String secretSeed)
```
Validates and stores an existing secret seed. Throws if the seed is invalid (wrong format or checksum). Use this to implement the "Import Wallet" flow.

---

### `deleteKeyPair()`
```dart
Future<void> deleteKeyPair()
```
Removes the stored keypair from secure storage. Call this on wallet disconnect.

---

## Account

### `getAccount(String accountId)`
```dart
Future<AccountResponse> getAccount(String accountId)
```
Fetches the full account record from Horizon.

---

### `getBalances(String accountId)`
```dart
Future<List<Balance>> getBalances(String accountId)
```
Returns all asset balances for the account. The native XLM balance has `balance.assetType == "native"`.

---

## Transactions

### `sendPayment(...)`
```dart
Future<SubmitTransactionResponse> sendPayment({
  required String destinationId,
  required String amount,
  String? memo,
})
```
Builds, signs, and submits an XLM payment from the loaded keypair to `destinationId`. Throws `StateError` if no keypair is loaded. Optionally attaches a text memo.

---

## Testnet Helpers

### `fundTestnetAccount(String accountId)`
```dart
Future<bool> fundTestnetAccount(String accountId)
```
Funds an account via Friendbot. **Testnet only.** Guard calls with `kDebugMode`.
