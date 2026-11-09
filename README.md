# MacroForge — personal nutrition PWA

A free, dark-mode nutrition tracking prototype. Works without a paid account; local tracking is functional offline after initial installation. No tracking data is sent to a developer-owned server.

## Features
- Date-specific food diary, calories, protein, carbohydrates, fat, and daily targets
- Favorites for reusable foods and per-portion meal-prep recipes
- Open Food Facts barcode lookup and optional camera scanning (Chrome support varies; manual UPC fallback)
- Water tracking and weight history with charts
- Photo capture/preview with manual nutrition entry; **automatic AI recognition is NOT included**
- JSON export/import backups
- Optional private cloud sync using your own Supabase project

## Put the app on your Android phone
A PWA needs to be hosted on **HTTPS** (or localhost for development). You cannot install the ZIP itself as a PWA.

1. Extract this ZIP on a computer.
2. Sign up for a free GitHub account and create a public repository (e.g. `macroforge`). Upload the files **inside** the `macroforge` folder to the repository root (not the ZIP itself).
3. In GitHub: Settings → Pages → Build and deployment → Deploy from a branch → `main` / `(root)` → Save.
4. Wait for GitHub Pages to publish at `https://YOUR-USERNAME.github.io/macroforge/`.
5. On your Samsung, open that URL in **Chrome**, tap ⋮ → **Add to Home screen** → **Install** (wording may vary). Launch it from the new icon.

GitHub Pages hosts public app code, **not** your local food diary. Do not put passwords or personal exports in the repository. Hosting availability/limits can change.

## Optional: cloud sync (Supabase free tier)
1. Create a free project at https://supabase.com.
2. Open SQL Editor and run the included `supabase.sql` **once**. If you have already created the policies, do not rerun blindly.
3. In Supabase → Project Settings / API Keys, copy the project URL and the **publishable** key (or legacy anon key). Never use a `service_role` or secret key in a browser app.
4. In Authentication → Providers, ensure Email is enabled. Email confirmation may be required.
5. In MacroForge → Settings, paste the project URL/key, sign up with email and password, confirm email if prompted, then log in and tap **Sync now**.
6. Repeat the same URL/key and login on another device and tap Sync now to retrieve the latest saved data.

**Important sync limitations:** Version 1 uses a last-write-wins snapshot of all data, not a merge. If you make separate edits on two devices while offline, one device's changes may overwrite the other's. Export backups regularly. Cloud sync is manual plus a best-effort sync when the app becomes visible; it is not guaranteed continuous background sync. Tokens are held only in session storage; login again after a new browser session. Your project is controlled by you, and the SQL enables row-level security for per-user access. Supabase free tiers may pause inactive projects or change limits.

## Food database notes
Open Food Facts is crowdsourced and may have missing or inaccurate nutrition labels. Barcode lookup requires internet. Camera scanning depends on browser `BarcodeDetector` support and camera permission; manually enter the barcode if unsupported. Always check serving sizes and packaging.

## AI photo estimation
Photo upload/preview is implemented, but **AI-based calorie estimation is not**. Automatic food recognition would require connecting a suitable vision API or running an on-device model; API usage may incur charges. Even AI food estimates are approximate and require user confirmation. The prototype does not upload your photos.

## Local development
Run a local static server in this directory, e.g. `python -m http.server 8000`, and open `http://localhost:8000`. Browser service workers support localhost for development.

## Privacy and limitations
This is an initial personal prototype, not a production medical or security-audited application. LocalStorage is not encrypted. Anyone with access to your unlocked browser profile may access local records. Cloud data is stored in your Supabase account with RLS; avoid using it for sensitive clinical information. Do not use the app as a substitute for medical advice.
