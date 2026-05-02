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

The app currently targets **Stellar Testnet**. To switch to mainnet, change the `StellarNetwork` passed to `StellarService` and update the Horizon URL. Do not ship with testnet as the default.
