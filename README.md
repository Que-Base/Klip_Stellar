# Klip — Stellar Wallet App

A self-custody Flutter wallet built on the Stellar blockchain. Klip lets users manage XLM and Stellar assets, send payments, and grow savings — all from a single mobile app.

---

## Tech Stack

| Layer | Library |
|---|---|
| Framework | Flutter (FVM `3.35.3`) |
| State | Riverpod + flutter_hooks |
| Routing | go_router |
| Blockchain | stellar_flutter_sdk `^3.0.5` |
| Key storage | flutter_secure_storage |
| UI utilities | flutter_screenutil, flutter_svg, flutter_gen |

---

## Project Structure

```
lib/
  core/
    navigation/       # Bottom nav shell + provider
    routes/           # go_router config (AppRouter, AppRoutes)
    stellar/          # StellarService — blockchain interface layer
  features/
    onboarding/       # Splash, page 1 & 2, signup, login
    home/             # Dashboard: balance card, transfer/withdraw, funding rule
    transaction/      # Transaction list + transfer flow (wallet select, success)
    saving/           # Savings wallet view + staking info
    settings/         # Wallet mgmt, notifications, theme, profile
    profile/auth/     # Login + signup views
  shared/
    components/       # Dialogs, loading, animations, rich text, thumbnails
    style/            # Text styles
    widget/           # AppBar, LiquidGlassTexture, EmptyView
  gen/                # Auto-generated: assets.gen.dart, colors.gen.dart
```

---

## What Is Built (UI)

- Onboarding flow — 4-page swipeable PageView (2 intro pages → signup → login)
- Bottom navigation shell — Home, Transactions, Savings, Settings tabs
- Home screen — wallet address display, balance card, Transfer/Withdraw buttons, Import/View wallet buttons, funding rule card, empty transaction state
- Transaction list — filter tabs (All / Deposits / Withdrawals), sort dropdown, hardcoded list item
- Transfer flow — wallet selection screen (Savings Wallet / External Wallet), success screen
- Savings screen — savings wallet card, withdrawal button, staking info banner, empty state
- Settings screen — Wallet Management, Notifications, Theme, Profile sections (all static)
- Login / Signup — form UI with navigation wired to home

---

## What Needs to Be Built

### 1. Stellar / Wallet Core
- [ ] **Wallet creation** — call `StellarService.createKeyPair()` on first launch, persist and display the public key
- [ ] **Wallet import** — wire the "Import Wallet" button to `StellarService.importKeyPair(seed)` with a secret seed input screen
- [ ] **Live balance** — replace the hardcoded `$0.00` with `StellarService.getBalances()` polled via a Riverpod `FutureProvider`
- [ ] **Testnet funding** — call `StellarService.fundTestnetAccount()` for dev/testing; expose a "Fund with Friendbot" debug option
- [ ] **Send payment** — wire the Transfer flow to `StellarService.sendPayment()`, passing destination address, amount, and optional memo
- [ ] **Transaction history** — fetch real transactions from Horizon (`sdk.transactions.forAccount()`) and replace the hardcoded list item

### 2. Authentication
- [ ] **Auth strategy decision** — Klip is self-custody, so decide whether "login" is a local PIN/biometric gate or a full backend account. Currently the login button just navigates to home with no validation.
- [ ] **PIN / biometric lock** — protect app entry and transaction signing with `local_auth`
- [ ] **Onboarding completion flag** — persist a flag (e.g. `shared_preferences`) so returning users skip onboarding and go straight to home or the lock screen

### 3. Transaction Feature
- [ ] **Transaction model** — create a `Transaction` data class mapping Horizon's `TransactionResponse`
- [ ] **Transaction provider** — replace the static `TransactionFilter` notifier with a real Riverpod provider that fetches and filters Horizon transactions
- [ ] **Transaction list items** — replace the single hardcoded `ListTile` with a proper list driven by the provider
- [ ] **Transaction detail screen** — tap a transaction to see full details (hash, fee, memo, timestamp)
- [ ] **Pagination / streaming** — use Horizon's cursor-based paging or SSE streaming for real-time updates

### 4. Transfer Flow
- [ ] **Destination input screen** — a screen to enter/scan a Stellar address before wallet selection
- [ ] **Amount input screen** — enter amount, select asset (XLM or other trustlines)
- [ ] **Fee preview** — show the base fee before the user confirms
- [ ] **Wire wallet selection** — "Savings Wallet" should transfer from the savings keypair; "External Wallet" should open the destination input screen
- [ ] **Success screen data** — replace hardcoded `4000 USDT` / `Recipient` labels with real transaction data passed via route extras
- [ ] **Share receipt** — implement the "Share Receipt" button using the `share_plus` package

### 5. Savings Feature
- [ ] **Savings wallet** — generate or derive a separate Stellar keypair for savings, stored separately in secure storage
- [ ] **Savings chart** — implement the empty `SizedBox` placeholder with a real chart (e.g. `fl_chart`) showing savings over time
- [ ] **Funding rule** — implement the "Save X% after each payment" logic: intercept outgoing payments and auto-transfer the configured percentage to the savings wallet
- [ ] **Staking / yield** — the UI mentions 0.3% yield on up to $2000 staked; decide if this is on-chain (Soroban contract) or off-chain and implement accordingly
- [ ] **Withdrawal to main wallet** — wire the withdrawal button to transfer from savings keypair back to main keypair

### 6. Settings
- [ ] **Connect / Disconnect wallet** — implement wallet connection state; "Disconnect" should clear the keypair from secure storage and return to onboarding
- [ ] **Notifications toggle** — integrate `firebase_messaging` or local notifications for transaction alerts
- [ ] **Theme toggle** — implement light/dark mode switching, persisted via a Riverpod provider + `shared_preferences`
- [ ] **Update Email / Password** — only relevant if a backend auth layer is added; otherwise remove these items
- [ ] **Backup / export secret key** — critical for self-custody: let users view and copy their secret seed from settings (behind biometric auth)

### 7. QR Code
- [ ] **Receive screen** — display the wallet address as a QR code for incoming payments (`qr_flutter`)
- [ ] **Scan to send** — add a QR scanner to the transfer destination input (`mobile_scanner`)

### 8. Multi-Asset Support
- [ ] **Trustlines** — allow users to add Stellar trustlines for non-XLM assets (USDC, etc.)
- [ ] **Asset list on home** — show all asset balances, not just XLM

### 9. Error Handling & UX Polish
- [ ] **Global error handling** — wrap Stellar calls in try/catch and surface errors via the existing dialog/animation components
- [ ] **Loading states** — use the existing `LoadingScreen` / `LoadingAnimationWidget` during async Stellar operations
- [ ] **Empty states** — the `_transactionBlock` helper is inverted (passes `true` to show the empty state); fix the logic and wire it to real data
- [ ] **Network awareness** — detect offline state and show appropriate messaging

---

## Suggested Build Order

1. Wallet creation + balance display (unblocks everything else)
2. Auth gate (PIN/biometric) + onboarding completion flag
3. Send payment flow end-to-end
4. Real transaction history
5. Savings wallet + funding rule
6. QR receive/scan
7. Settings actions (disconnect, backup seed, notifications)
8. Multi-asset / trustlines
9. Polish: error handling, loading states, theme toggle

---

## Running the Project

```bash
# Install FVM if needed
dart pub global activate fvm

# Use the pinned Flutter version
fvm use

# Install dependencies
fvm flutter pub get

# Run code generation (Riverpod + assets)
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
fvm flutter run
```

---

## Environment

The app currently targets **Stellar Testnet**. To switch to mainnet, change the `StellarNetwork` passed to `StellarService` in its provider and update the Horizon URL accordingly. Do not ship with testnet as the default.
