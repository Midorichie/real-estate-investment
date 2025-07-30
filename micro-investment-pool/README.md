# 🏘️ Micro-Investment Pool for Real Estate

A decentralized investment platform built on Stacks blockchain that enables users to pool STX tokens for real estate projects with secure, admin-controlled fund distribution.

## 🎯 Overview

This Clarity smart contract system creates a trustless investment pool where:
- **Investors** contribute STX tokens to a shared pool
- **Administrators** manage approved real estate projects
- **Funds** are securely released only to verified, active projects
- **Transparency** is maintained through on-chain tracking of all contributions and distributions

---

## 📦 Contract Architecture

### `pool.clar`
The core investment management contract that:
- **Accepts STX contributions** from investors via `add-investment`
- **Tracks individual balances** for each contributor
- **Manages total pool funds** with automatic balance updates
- **Enables controlled fund release** to approved projects only
- **Implements security checks** for all fund transfers

### `projects.clar`
The project registry contract that:
- **Maintains approved projects** with unique IDs and metadata
- **Stores project status** (active/inactive) for validation
- **Provides admin controls** for adding and deactivating projects
- **Ensures data integrity** through structured project information

### `projects-trait.clar`
Interface definition that:
- **Defines contract interaction standards** for cross-contract calls
- **Ensures type safety** when querying project information
- **Enables secure inter-contract communication** between pool and projects

---

## 🚀 Quick Start

### Prerequisites
- [Clarinet CLI](https://github.com/hirosystems/clarinet) installed
- Basic understanding of Stacks blockchain and Clarity

### Installation & Testing
```bash
# Install Clarinet globally
npm install -g @hirosystems/clarinet

# Verify contract syntax
clarinet check

# Run test suite
clarinet test

# Start local development environment
clarinet integrate
```

---

## 🔐 Security Features

### Fund Protection
- **Actual STX transfers** - Funds are genuinely moved into the contract, not just tracked
- **Contract custody** - All pooled funds are held securely by the smart contract
- **Multi-layer validation** - Each transaction undergoes multiple security checks

### Access Control
- **Owner-only administration** - Only the contract owner can release funds
- **Project verification** - Funds can only be sent to pre-approved, active projects
- **Recipient validation** - Each fund release requires explicit recipient approval

### Cross-Contract Security
- **Trait-based validation** - Uses `projects-trait` to ensure safe contract interactions
- **Error handling** - Comprehensive error codes for all failure scenarios
- **State consistency** - Atomic operations prevent partial state updates

---

## 📚 API Reference

### Investment Functions (`pool.clar`)

#### `add-investment`
```clarity
(add-investment (amount uint)) → (response bool uint)
```
**Purpose**: Allows users to contribute STX to the investment pool  
**Parameters**: 
- `amount` - STX amount to invest (in microSTX)
**Returns**: Success boolean or error code  
**Security**: Validates amount > 0, handles transfer failures

#### `release-to-project`
```clarity
(release-to-project (id uint) (amount uint) (recipient principal)) → (response bool uint)
```
**Purpose**: Admin function to release funds to approved projects  
**Parameters**:
- `id` - Project ID from the registry
- `amount` - STX amount to release
- `recipient` - Wallet address to receive funds  
**Access**: Contract owner only  
**Security**: Verifies project exists and is active

### Query Functions

#### `get-total-pool`
```clarity
(get-total-pool) → (response uint uint)
```
**Purpose**: Returns total STX currently in the pool  
**Access**: Public read-only

#### `get-contribution`
```clarity
(get-contribution (addr principal)) → (response uint uint)
```
**Purpose**: Returns total contribution amount for a specific investor  
**Parameters**: `addr` - Investor's wallet address  
**Access**: Public read-only

### Project Management (`projects.clar`)

#### `add-project`
```clarity
(add-project (name (string-ascii 50))) → (response uint uint)
```
**Purpose**: Registers a new real estate project  
**Parameters**: `name` - Project identifier (max 50 characters)  
**Returns**: Unique project ID  
**Access**: Admin only

#### `get-project`
```clarity
(get-project (id uint)) → (response (tuple (name (string-ascii 50)) (active bool)) uint)
```
**Purpose**: Retrieves project information by ID  
**Returns**: Project name and active status

#### `deactivate-project`
```clarity
(deactivate-project (id uint)) → (response bool uint)
```
**Purpose**: Marks a project as inactive (prevents fund releases)  
**Access**: Admin only

---

## 🛡️ Error Codes

| Code | Constant | Description |
|------|----------|-------------|
| `u100` | `ERR_INVALID_AMOUNT` | Investment amount must be greater than 0 |
| `u101` | `ERR_TRANSFER_FAILED` | STX transfer operation failed |
| `u102` | `ERR_PROJECT_NOT_FOUND` | Project ID does not exist |
| `u103` | `ERR_PROJECT_INACTIVE` | Cannot release funds to inactive projects |
| `u104` | `ERR_UNAUTHORIZED` | Operation requires admin privileges |

---

## 🏗️ Development Roadmap

### Phase 1: Core Infrastructure ✅
- [x] Basic investment pool functionality
- [x] Project registry system
- [x] Admin controls and security
- [x] Cross-contract communication

### Phase 2: Enhanced Security 🔄
- [ ] Comprehensive integration tests for all contract interactions
- [ ] Investor whitelist functionality for KYC compliance
- [ ] Investment caps and limits per project/investor
- [ ] Time-locked fund releases with milestone tracking

### Phase 3: Advanced Features 📋
- [ ] Multi-signature admin controls for enhanced security
- [ ] Automated profit distribution to investors
- [ ] Integration with real estate oracles for project validation
- [ ] Web3 frontend application for user interactions

### Phase 4: Ecosystem Integration 📋
- [ ] Integration with major Stacks wallets
- [ ] DeFi protocol integrations for yield optimization
- [ ] Cross-chain bridge support for broader accessibility
- [ ] Mobile application for retail investors

---

## 🤝 Contributing

We welcome contributions to improve the platform! Please:

1. **Fork the repository** and create a feature branch
2. **Write comprehensive tests** for any new functionality
3. **Follow Clarity best practices** and security guidelines
4. **Submit pull requests** with detailed descriptions
5. **Participate in code reviews** to maintain code quality

### Development Guidelines
- All functions must include proper error handling
- Security-critical functions require admin-only access
- Cross-contract calls must use defined traits
- Test coverage should exceed 90% for all critical paths

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🚨 Disclaimer

This is experimental software for educational and development purposes. Always conduct thorough security audits before deploying to mainnet with real funds. The developers assume no responsibility for any financial losses.

