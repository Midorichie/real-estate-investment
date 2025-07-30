# 🏘️ Micro-Investment Pool for Real Estate (Clarity Smart Contract)

A simple Clarity smart contract to enable small-scale investors to pool funds into real estate deals transparently using Stacks blockchain.

---

## 📁 Project Structure

micro-investment-pool/
├── contracts/
│ └── pool.clar
├── tests/
│ └── pool_test.ts
├── Clarinet.toml
└── README.md

less
Copy
Edit

---

## ⚙️ Setup

### Prerequisites
- [Node.js](https://nodejs.org/)
- [Clarinet CLI](https://docs.hiro.so/clarinet/get-started)

### Install Clarinet

```bash
npm install -g @hirosystems/clarinet
Clone & Run
bash
Copy
Edit
git clone <repo-url>
cd micro-investment-pool
clarinet check
clarinet test
📜 Contract Functions
add-investment
Allows a user to send STX and records the contribution.

Requires: stx-transfer? with non-zero value

get-total-pool
Returns the total STX in the investment pool.

get-contribution (principal)
Returns the total STX a specific investor has contributed.

🧪 Testing
Run:

bash
Copy
Edit
clarinet test
Checks that:

Contributions are accepted

Pool totals are correct

Individual records are tracked

📌 TODO
Add withdrawal mechanism

Add project milestones / use of funds

Add minimum/maximum contribution logic

Add admin-only controls

🛠 By
Your Name
Stacks Smart Contract Developer

yaml
Copy
Edit

---

Would you like me to add a **withdrawal flow**, **admin control**, or **vesting logic** in the next phase?

# 🏘️ Micro-Investment Pool for Real Estate (Clarity Smart Contract)

A simple Clarity smart contract to enable small-scale investors to pool funds into real estate deals transparently using Stacks blockchain.

---

## 📁 Project Structure

micro-investment-pool/
├── contracts/
│ └── pool.clar
├── tests/
│ └── pool_test.ts
├── Clarinet.toml
└── README.md

less
Copy
Edit

---

## ⚙️ Setup

### Prerequisites
- [Node.js](https://nodejs.org/)
- [Clarinet CLI](https://docs.hiro.so/clarinet/get-started)

### Install Clarinet

```bash
npm install -g @hirosystems/clarinet
Clone & Run
bash
Copy
Edit
git clone <repo-url>
cd micro-investment-pool
clarinet check
clarinet test
📜 Contract Functions
add-investment
Allows a user to send STX and records the contribution.

Requires: stx-transfer? with non-zero value

get-total-pool
Returns the total STX in the investment pool.

get-contribution (principal)
Returns the total STX a specific investor has contributed.

🧪 Testing
Run:

bash
Copy
Edit
clarinet test
Checks that:

Contributions are accepted

Pool totals are correct

Individual records are tracked

📌 TODO
Add withdrawal mechanism

Add project milestones / use of funds

Add minimum/maximum contribution logic

Add admin-only controls

🛠 By
Your Name
Stacks Smart Contract Developer
