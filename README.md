START
  ↓
Device Detection
  ↓
Load Cookies
  ↓
Preprocess (extract tokens)
  ↓
Pre-login (validate sessions)
  ↓
Get User Inputs
  ↓
Get Available Actors
  ↓
Mode Select (Normal / RC Speed)
  ↓
For Each Comment:
  ├─ Token Available? 
  │   ├─ YES → Web GraphQL → Graph API (fallback)
  │   └─ NO → Cookie-Only Direct Method
  ↓
Show Statistics
  ↓
Next Round? (ENTER = same, n = new, q = quit)
  ↓
END
