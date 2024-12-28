---
title: 'requirements.txt'
date: 2024-12-27
permalink: /posts/2024/12/requirements/
tags:
  - technical
  # - thoughts
---

### How to Generate a `requirements.txt` File for Your Python Project
Creating a `requirements.txt` file is essential for managing dependencies and ensuring your project is easy to share and reproduce. Here’s how you can do it effectively:

1. Install `pipreqs`:
   ```bash
   pip install pipreqs
   ```
2. Generate `requirements.txt`:
   ```bash
   pipreqs /path/to/project
   ```
   This method ensures the file includes only the dependencies your project actually uses, based on `import` statements in your code.

#### `pipreqs` vs. `pip freeze`
- **`pipreqs`**:
  - Scans your project for `import` statements.
  - Generates a minimal `requirements.txt` with only the dependencies your project uses.
  - Works even if modules are not installed.
  - Use **`pipreqs`** for project-specific and minimal dependencies.

- **`pip freeze`**:
  - Captures all installed packages in your environment.
  - Can include unused or global packages, leading to bloated `requirements.txt`.
  - Requires a clean virtual environment for accuracy.
  - Use **`pip freeze`** for full environment replication.

For clean, focused dependency management, `pipreqs` is the better choice.