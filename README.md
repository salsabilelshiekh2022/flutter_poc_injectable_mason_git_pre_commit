# 🚀 Flutter POC: Injection, Mason & Git Pre-Commit

A comprehensive guide to setting up **dependency injection**, **code generation**, and **automated quality checks** in Flutter projects.

---

## 📚 Table of Contents

- [🧩 Injectable — Dependency Injection](#-injectable--dependency-injection)
- [🧱 Mason — Code Generation](#-mason--code-generation)
- [🪝 Git Hooks — Automated Quality Checks](#-git-hooks--automated-quality-checks)

---

## 🧩 Injectable — Dependency Injection

### 🔍 Overview

`injectable` is a Flutter package that automates dependency injection using `get_it`. It removes boilerplate code, keeps your architecture clean, and makes testing easier.

---

### 🎯 Why Use It?

- 🚀 **Automatic Registration** — No manual `getIt.register...` calls needed
- 🧩 **Clean Architecture** — Keeps project structure scalable and maintainable
- 🧪 **Easy Testing** — Swap implementations with mocks or different environments
- 💡 **Best Practices** — Works perfectly with Clean Architecture and SOLID principles

---

### ⚙️ Setup Guide

#### 1. Install Packages
```bash
flutter pub add get_it injectable
flutter pub add --dev injectable_generator build_runner
```

#### 2. Create DI Configuration File

Create `lib/core/di/injection.dart`:
```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart'; // Auto-generated file

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
```

#### 3. Annotate Your Classes
```dart
@lazySingleton
class ApiClient {}

@injectable
class AuthRepository {
  final ApiClient apiClient;
  AuthRepository(this.apiClient);
}
```

#### 4. Generate Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

#### 5. Use Dependencies Anywhere
```dart
final repo = getIt<AuthRepository>();
```

---

### 💡 Key Annotations

| Annotation | Lifetime | Use Case |
|------------|----------|----------|
| `@injectable` | Transient (new instance each time) | Default registration for services |
| `@singleton` | Eager singleton (created immediately) | Services needed at app startup |
| `@lazySingleton` | Lazy singleton (created on first use) | Shared services like API clients |
| `@module` | N/A | Provides external dependencies (Dio, SharedPreferences) |
| `@preResolve` | N/A | Handles async initialization |

---

## 🧱 Mason — Code Generation

### 🔍 Overview

Mason helps you create reusable code templates (called **bricks**) to generate boilerplate faster and maintain consistent project structure across your team.

---

### ⚙️ Setup Guide

#### 1. Install Mason CLI
```bash
dart pub global activate mason_cli
```

#### 2. Initialize Mason in Your Project
```bash
mason init
```

This creates a `mason.yaml` file in your project root.

#### 3. Add a Brick
```bash
mason add <brick_name>
```

**Example:**
```bash
mason add feature_brick
```

#### 4. Organize Your Bricks (Optional)

For custom bricks:

1. Create a `bricks` folder in your project root
2. Move or create your brick inside it (e.g., `bricks/feature_brick`)
3. Update `mason.yaml`:
```yaml
bricks:
  feature_brick:
    path: bricks/feature_brick
```

---

### 🚀 Generate Code from Bricks

Run the brick anywhere in your project:
```bash
mason make feature_brick
```

Mason will prompt you for any required variables (like feature name) and generate the code.

---

### 💡 Key Benefits

| Feature | Description |
|---------|-------------|
| 🧠 **Reusable Templates** | Share bricks across teams or projects |
| ⚡ **Fast Scaffolding** | Generate entire features in seconds |
| 🧩 **Customizable Inputs** | Use variables to fit your naming conventions |
| 🔄 **Consistency** | Enforce clean architecture patterns easily |
| 🔧 **Easy Maintenance** | Update one brick — apply changes everywhere |

---

## 🪝 Git Hooks — Automated Quality Checks

### 🔍 Overview

Git Hooks are custom scripts that run automatically during Git events (like committing or pushing). They enforce code quality standards by running formatting, linting, or tests before changes are saved.

---

### ⚙️ Setup Guide

#### 1. Locate the Hooks Folder

Navigate to your project's `.git/hooks/` directory.

#### 2. Create the Pre-Commit Hook

Create a file named `pre-commit` (no extension) in `.git/hooks/`:
```bash
touch .git/hooks/pre-commit
```

#### 3. Make It Executable
```bash
chmod +x .git/hooks/pre-commit
```

#### 4. Add Quality Checks

Edit `.git/hooks/pre-commit` and add:
```bash
#!/bin/bash
echo "🔍 Running pre-commit checks..."

# 1️⃣ Format check (skip bricks and build folders)
echo "✨ Checking Dart format (excluding bricks and build)..."

FILES=$(find . -type f -name "*.dart" ! -path "./bricks/*" ! -path "./build/*")

if [ -z "$FILES" ]; then
  echo "⚠️  No Dart files found to format."
else
  dart format --set-exit-if-changed $FILES
  if [ $? -ne 0 ]; then
    echo "❌ Some files need formatting. Please run:"
    echo "   dart format ."
    exit 1
  fi
fi

# 2️⃣ Static analysis
echo "🧠 Running Flutter analyze..."
flutter analyze
if [ $? -ne 0 ]; then
  echo "❌ Commit canceled due to analysis issues!"
  exit 1
fi

# 3️⃣ Check for possible fixes
echo "🧩 Checking for possible fixes..."
dart fix --dry-run
if [ $? -ne 0 ]; then
  echo "⚠️  dart fix found issues that can be automatically fixed."
  echo "👉 Run 'dart fix --apply' to fix them."
  exit 1
fi

echo "✅ All checks passed successfully!"
```

**Note:** If any check fails (non-zero exit code), the commit will be blocked automatically.

---

### 🚀 How It Works

Every time you run:
```bash
git commit -m "Your commit message"
```

The pre-commit hook will automatically:

1. ✨ Format all Dart files (excluding `bricks/` and `build/`)
2. 🧠 Run static analysis with `flutter analyze`
3. 🧩 Check for auto-fixable issues with `dart fix --dry-run`

If all checks pass, the commit proceeds. Otherwise, you'll see error messages with instructions to fix the issues.

---

### 💡 Key Benefits

| Feature | Description |
|---------|-------------|
| 🧹 **Automatic Formatting** | Maintains consistent code style across the team |
| 🧠 **Static Analysis** | Catches potential bugs and issues early |
| 🧪 **Pre-commit Validation** | Ensures code quality before it enters version control |
| ⏱️ **Saves Time** | Reduces back-and-forth in code reviews |
| 🔒 **Enforces Standards** | Guarantees every commit follows project rules |

---
