# What's Built

All screens listed here exist as Flutter widgets. None are wired to live Stellar data yet — that work is tracked in the [GitHub Issues](https://github.com/Que-Base/Klip_Stellar/issues).

## Onboarding
- 4-page swipeable `PageView` — 2 intro pages → signup → login
- Page indicator dots that track the current page
- Login button navigates directly to home (no validation yet)

## Bottom Navigation
- Shell route with 4 tabs: Home, Savings, Transactions, Settings
- Custom `NavigationMenu` with SVG tab icons

## Home
- Wallet address display (hardcoded — see issue #2)
- Balance card showing `$0.00` (hardcoded — see issue #3)
- Transfer and Withdrawal buttons (unwired)
- Import Wallet / View Wallet buttons (unwired)
- Funding rule card showing `"Save 100% after each payment"` (static)
- Empty transaction state

## Transactions
- Filter tabs: All / Deposits / Withdrawals
- Sort dropdown (New to Old / Old to New)
- Single hardcoded `ListTile` (see issue #9)

## Transfer Flow
- Wallet selection screen (Savings Wallet / External Wallet)
- Success screen with hardcoded `"4000 USDT"` and `"Recipient"` (see issue #14)

## Savings
- Savings wallet card with hardcoded address
- Empty chart placeholder (`SizedBox`)
- Withdrawal to Main Wallet button (unwired)
- Staking info banner

## Settings
- Wallet Management: Connect / Disconnect (unwired)
- Notifications toggle (unwired)
- Theme / Appearance tile (unwired)
- Profile: Update Email / Update Password (static)

## Login / Signup
- Form UI with text fields
- Navigation wired to home on submit (no validation)
