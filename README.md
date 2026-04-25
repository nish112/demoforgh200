# demoforgh200

🎓 GH-200: GitHub Actions Practical Workshop

This repository contains a series of progressive labs designed to take you from a GitHub Actions beginner to building full CI/CD pipelines. Each lab addresses a specific real-world IT bottleneck using the provided workflow files.
🛠 Module 1: The Basics of Automation

The Problem: A developer says, "It works on my machine!" We need a way to run our code in a clean, neutral environment every time we want to check our logic.
Lab 1: Manual Triggers & Artifacts

    File: firstdemo.yml

    Goal: Manually testing code across different versions of Node.js without installing them locally.

    Key Concepts:

        workflow_dispatch: Adds a "Run workflow" button in the GitHub UI for manual control.

        matrix: Runs parallel jobs for multiple versions (e.g., Node 18.x & 20.x) simultaneously.

        upload-artifact: Saves files generated inside the runner so you can download and inspect them after the job finishes.

⚡ Module 2: Optimization & Resilience

The Problem: Running npm install on every single push is slow. We also need to understand how the system reacts when code is broken.
Lab 2: Speeding up with Caching

    File: seconddemowithcache.yml

    Goal: Reducing build times by reusing files from previous runs if the code hasn't changed.

    Key Concepts:

        cache/restore: Looks for a "Key" in GitHub’s global storage to find existing data.

        ${{ github.sha }}: Uses a unique commit ID to ensure the cache is specific to that exact version of code.

        Conditional Logic: Uses if statements to only run a "Fresh Build" if a cache-hit is not detected.

Lab 3: Handling Failures (The Sabotage)

    File: fourthdemoWillFail.yml

    Goal: Visualizing how GitHub Actions signals a "Stop" when a command fails.

    Key Concepts:

        exit 1: The standard way to tell the runner that a process has crashed or failed.

        Fail-Fast: GitHub stops the job immediately upon failure, ensuring the "Never Runs" step is skipped.

📊 Module 3: Reporting & Visibility

The Problem: Raw text logs are difficult to read for quick status updates. We need a professional dashboard.
Lab 4: The Job Summary Dashboard

    File: thirddemojobsummaries.yml

    Goal: Creating a visual "Executive Summary" directly on the GitHub Actions run page.

    Key Concepts:

        $GITHUB_STEP_SUMMARY: A special environment file used to display Markdown tables and bold text on the GitHub UI.

        Dynamic Tables: Gathering results from multiple parallel matrix jobs into a single readable table.

🤖 Module 5: Collaboration & Security

The Problem: We want to automate communication and deployment, but only when specific approvals (like labels) are granted.
Lab 5: Label-Triggered Deployment

    File: SeventhDemoLabel.yml

    Goal: Preventing accidental deployments by requiring a specific GitHub Label (e.g., stage-deploy) on a Pull Request.

    Key Concepts:

        types: [labeled]: The workflow only triggers when a label event occurs on a PR.

        Permissions: Explicitly granting write access to pull-requests and issues so the action can post comments.

        Environment Context: Successfully deployed specifically for the Lucknow Lab Environment.

Lab 6: The Welcome Bot (GraphQL)

    File: fifthdemoGithubScripts.yml

    Goal: Automatically welcoming new contributors using advanced API queries.

    Key Concepts:

        github-script: Running JavaScript directly in your YAML to interact with the GitHub API.

        GraphQL Mutation: Using modern queries to post automated responses to GitHub Discussions.

🚀 Module 6: The Grand Finale (CI/CD)

The Problem: We need to ship our app! This means creating a Docker image and a formal Release entry.
Lab 7: Package & Release

    File: eightdemo_githubpackagerelease.yml

    Goal: Building a container and creating an official Release when a version tag (e.g., v1.0) is pushed.

    Key Concepts:

        Tag Filtering: Using on: push: tags: 'v*' to ensure only versioned code triggers a release.

        needs: Creating a dependency chain where the Release job waits for the Docker Build job to succeed.

        GHCR: Pushing images to the GitHub Container Registry (ghcr.io).
