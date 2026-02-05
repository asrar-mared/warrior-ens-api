# 🤝 Contributing to Warrior ENS API

First off, thank you for considering contributing to Warrior ENS API! 🛡️

It's people like you that make this project a great tool for the Web3 community.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Community](#community)

---

## 📜 Code of Conduct

This project and everyone participating in it is governed by our commitment to providing a welcoming and inclusive environment. By participating, you are expected to uphold this standard.

### Our Standards

✅ **Be Respectful** - Treat everyone with respect and kindness  
✅ **Be Collaborative** - Work together towards common goals  
✅ **Be Professional** - Maintain professional conduct in all interactions  
✅ **Be Inclusive** - Welcome and support people of all backgrounds  
✅ **Be Constructive** - Provide helpful and constructive feedback

---

## 🚀 How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**When submitting a bug report, include:**

- **Clear title** - Brief description of the issue
- **Steps to reproduce** - Detailed steps to reproduce the behavior
- **Expected behavior** - What you expected to happen
- **Actual behavior** - What actually happened
- **Environment** - OS, Node version, npm version
- **Screenshots** - If applicable
- **Logs** - Relevant error logs or output

**Example:**

```markdown
**Bug:** ENS resolution fails for subdomains

**Steps to Reproduce:**
1. Start the server with `npm run dev`
2. Make request to `/resolve/warrior.nike49424.eth`
3. Observe error response

**Expected:** Should return address `0x4EF3...175d`
**Actual:** Returns 500 error

**Environment:**
- OS: Ubuntu 22.04
- Node: v20.10.0
- npm: 10.2.3

**Logs:**
```
Error: ENS resolution timeout
at ProviderManager.executeWithFallback
```
```

### ✨ Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues.

**When suggesting an enhancement, include:**

- **Clear title** - Brief description of the suggestion
- **Use case** - Why this enhancement would be useful
- **Detailed description** - How it should work
- **Examples** - Code examples or mockups if applicable
- **Alternatives** - Alternative solutions you've considered

### 🔧 Pull Requests

We actively welcome your pull requests!

**Areas where we'd love contributions:**

- 🐛 Bug fixes
- ✨ New features
- 📝 Documentation improvements
- 🧪 Test coverage improvements
- 🎨 UI/UX enhancements
- ⚡ Performance optimizations
- 🔒 Security improvements

---

## 💻 Development Setup

### Prerequisites

- Node.js >= 18.0.0
- npm >= 9.0.0
- Git
- Redis (optional but recommended)

### Fork & Clone

```bash
# 1. Fork the repository on GitHub
# Click the "Fork" button at https://github.com/asrar-mared/warrior-ens-api

# 2. Clone your fork
git clone https://github.com/YOUR-USERNAME/warrior-ens-api.git
cd warrior-ens-api

# 3. Add upstream remote
git remote add upstream https://github.com/asrar-mared/warrior-ens-api.git

# 4. Verify remotes
git remote -v
```

### Install Dependencies

```bash
# Install all dependencies
npm install

# Copy environment template
cp .env.example .env

# Edit .env with your settings
nano .env
```

### Start Development Server

```bash
# Run in development mode with hot reload
npm run dev

# Run tests
npm test

# Run linting
npm run lint
```

### Verify Setup

```bash
# Test the API
curl http://localhost:3000/health

# Should return:
{
  "status": "healthy",
  "uptime": ...,
  "blockchain": { "connected": true, ... }
}
```

---

## 📤 Pull Request Process

### 1. Create a Branch

Always create a new branch from `main`:

```bash
# Update your main branch
git checkout main
git pull upstream main

# Create feature branch
git checkout -b feature/amazing-feature

# Or for bug fixes
git checkout -b fix/bug-description
```

**Branch Naming Convention:**

- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `test/` - Test additions or modifications
- `refactor/` - Code refactoring
- `perf/` - Performance improvements
- `chore/` - Maintenance tasks

### 2. Make Your Changes

```bash
# Make changes to the code
# Add tests for new features
# Update documentation as needed

# Test your changes
npm test
npm run lint
npm run type-check
```

### 3. Commit Your Changes

Follow our [commit guidelines](#commit-guidelines):

```bash
# Stage your changes
git add .

# Commit with descriptive message
git commit -m "feat: add batch ENS resolution endpoint"
```

### 4. Push to Your Fork

```bash
# Push your branch
git push origin feature/amazing-feature
```

### 5. Open a Pull Request

1. Go to https://github.com/asrar-mared/warrior-ens-api
2. Click "New Pull Request"
3. Select your branch
4. Fill out the PR template
5. Submit!

### PR Checklist

Before submitting, ensure:

- [ ] Code follows the style guidelines
- [ ] All tests pass (`npm test`)
- [ ] Linting passes (`npm run lint`)
- [ ] Type checking passes (`npm run type-check`)
- [ ] Documentation is updated
- [ ] Commit messages follow guidelines
- [ ] PR description is clear and complete
- [ ] Self-review completed
- [ ] No merge conflicts

### PR Review Process

1. **Automated Checks** - CI/CD pipeline runs automatically
2. **Code Review** - Maintainers review your code
3. **Feedback** - Address any requested changes
4. **Approval** - Once approved, PR will be merged
5. **Merge** - Your contribution is now part of the project! 🎉

---

## 📏 Coding Standards

### TypeScript

We use TypeScript with strict mode enabled.

**Key principles:**

```typescript
// ✅ GOOD - Explicit types
async function resolveENS(name: string): Promise<string | null> {
  const address = await provider.resolveName(name);
  return address;
}

// ❌ BAD - No types
async function resolveENS(name) {
  const address = await provider.resolveName(name);
  return address;
}

// ✅ GOOD - Error handling
try {
  const result = await riskyOperation();
  return result;
} catch (error) {
  logger.error('Operation failed:', error);
  throw createError('Operation failed', 500);
}

// ❌ BAD - No error handling
const result = await riskyOperation();
return result;
```

### Code Style

We use ESLint and Prettier for code formatting.

```bash
# Auto-fix linting issues
npm run lint:fix

# Format code
npm run format
```

**Key rules:**

- ✅ Use `const` and `let`, never `var`
- ✅ Use arrow functions for callbacks
- ✅ Use async/await instead of callbacks
- ✅ Add JSDoc comments for public APIs
- ✅ Keep functions small and focused
- ✅ Use meaningful variable names
- ✅ Add error handling everywhere
- ✅ Write unit tests for new code

### File Organization

```
src/
├── index.ts              # Main entry point
├── config/               # Configuration
├── routes/               # API routes
├── services/             # Business logic
├── middleware/           # Express middleware
├── utils/                # Utility functions
├── types/                # TypeScript types
└── __tests__/            # Test files
```

### Naming Conventions

```typescript
// Classes - PascalCase
class ProviderManager { }

// Functions - camelCase
function resolveENS() { }

// Constants - UPPER_SNAKE_CASE
const MAX_RETRIES = 3;

// Interfaces - PascalCase with 'I' prefix (optional)
interface IProvider { }

// Types - PascalCase
type ENSResult = { };

// Files - kebab-case
// provider-manager.ts
// ens-resolver.ts
```

---

## 📝 Commit Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat** - New feature
- **fix** - Bug fix
- **docs** - Documentation changes
- **style** - Code style changes (formatting, no code change)
- **refactor** - Code refactoring
- **perf** - Performance improvements
- **test** - Adding or updating tests
- **chore** - Maintenance tasks
- **ci** - CI/CD changes
- **build** - Build system changes

### Examples

```bash
# Feature
git commit -m "feat(api): add batch ENS resolution endpoint"

# Bug fix
git commit -m "fix(cache): resolve Redis connection timeout issue"

# Documentation
git commit -m "docs(readme): update installation instructions"

# Performance
git commit -m "perf(resolver): optimize provider fallback logic"

# With body and footer
git commit -m "feat(websocket): add heartbeat mechanism

Implements ping/pong heartbeat to detect dead connections.
Automatically closes stale connections after 30 seconds.

Closes #42"
```

### Commit Best Practices

- ✅ Use imperative mood ("add feature" not "added feature")
- ✅ Keep subject line under 50 characters
- ✅ Capitalize first letter
- ✅ No period at the end of subject
- ✅ Use body to explain "what" and "why"
- ✅ Reference issues in footer

---

## 🧪 Testing

We aim for high test coverage (>80%).

### Writing Tests

```typescript
// Example test
describe('ENS Resolver', () => {
  it('should resolve vitalik.eth to correct address', async () => {
    const result = await request(app)
      .get('/resolve/vitalik.eth')
      .expect(200);
    
    expect(result.body.name).toBe('vitalik.eth');
    expect(result.body.address).toMatch(/^0x[a-fA-F0-9]{40}$/);
  });
  
  it('should return 404 for non-existent ENS name', async () => {
    await request(app)
      .get('/resolve/nonexistent12345.eth')
      .expect(404);
  });
});
```

### Running Tests

```bash
# Run all tests
npm test

# Run with coverage
npm run test:coverage

# Run in watch mode
npm run test:watch

# Run specific test file
npm test -- provider-manager.test.ts
```

---

## 🌍 Community

### Communication Channels

- 📧 **Email:** nike49424@gmail.com
- 📧 **Secure Email:** nike49424@proton.me
- 💬 **Telegram:** https://t.me/boost?c=2982645300
- 🐙 **GitHub:** https://github.com/asrar-mared/warrior-ens-api
- 🐦 **Twitter/X:** @WarriorENS (coming soon)

### Getting Help

**Need help?**

1. Check the [README.md](README.md)
2. Search existing [GitHub Issues](https://github.com/asrar-mared/warrior-ens-api/issues)
3. Ask in our Telegram channel
4. Create a new issue with the `question` label

**Before asking:**

- ✅ Search documentation
- ✅ Check existing issues
- ✅ Provide context and details
- ✅ Include error messages and logs

### Maintainers

- **asrar-mared** - [@asrar-mared](https://github.com/asrar-mared)

### Contributors

This project exists thanks to all the people who contribute! 🙏

See [CONTRIBUTORS.md](CONTRIBUTORS.md) for the full list.

---

## 🎖️ Recognition

Contributors will be:

- ✅ Listed in CONTRIBUTORS.md
- ✅ Mentioned in release notes
- ✅ Acknowledged in documentation
- ✅ Given credit in commit history

### Hall of Fame

Top contributors:

1. **Most Commits:** TBD
2. **Best Bug Fixes:** TBD
3. **Best Features:** TBD
4. **Best Documentation:** TBD

---

## 📄 License

By contributing to Warrior ENS API, you agree that your contributions will be licensed under the MIT License.

See [LICENSE](LICENSE) file for details.

---

## 🙏 Thank You!

Your contributions make this project better for everyone. Whether it's:

- 🐛 Fixing a bug
- ✨ Adding a feature
- 📝 Improving documentation
- 🧪 Writing tests
- 💡 Suggesting ideas

**Every contribution matters!**

Thank you for being part of the Warrior ENS API community! 🛡️

---

**Questions?** Feel free to reach out:

- 📧 nike49424@gmail.com
- 📧 nike49424@proton.me
- 💬 https://t.me/boost?c=2982645300

**Happy Coding! 🚀**

---

*Last Updated: February 5, 2026*

