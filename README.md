# 🎓 GH-200: GitHub Actions Practical Workshop

<p>This repository contains a series of progressive labs designed to take you from a GitHub Actions beginner to building full CI/CD pipelines. Each lab addresses a specific real-world IT bottleneck using the provided workflow files.</p>

---

## 🛠️ Module 1: The Basics of Automation
<p><strong>The Problem:</strong> A developer says, "It works on my machine!" We need a way to run our code in a clean, neutral environment every time we want to check our logic.</p>

<div style="background-color: #f6f8fa; border-radius: 6px; padding: 16px; border: 1px solid #d0d7de;">
  <p><strong>Lab 1: Manual Triggers & Artifacts</strong></p>
  <p><strong>File:</strong> <code>firstdemo.yml</code></p>
  <p><strong>Goal:</strong> Manually testing code across different versions of Node.js without installing them locally.</p>
  <p><strong>Key Concepts:</strong></p>
  <ul>
    <li><strong><code>workflow_dispatch</code></strong>: Adds a "Run workflow" button in the GitHub UI for manual control.</li>
    <li><strong><code>matrix</code></strong>: Runs parallel jobs for multiple versions (e.g., Node 18.x & 20.x) simultaneously.</li>
    <li><strong><code>upload-artifact</code></strong>: Saves files generated inside the runner so you can download and inspect them after the job finishes.</li>
  </ul>
</div>

---

## ⚡ Module 2: Optimization & Resilience
<p><strong>The Problem:</strong> Running <code>npm install</code> on every single push is slow. We also need to understand how the system reacts when code is broken.</p>

<div style="background-color: #f6f8fa; border-radius: 6px; padding: 16px; border: 1px solid #d0d7de; margin-bottom: 10px;">
  <p><strong>Lab 2: Speeding up with Caching</strong></p>
  <p><strong>File:</strong> <code>seconddemowithcache.yml</code></p>
  <p><strong>Goal:</strong> Reducing build times by reusing files from previous runs if the code hasn't changed.</p>
  <p><strong>Key Concepts:</strong></p>
  <ul>
    <li><strong><code>cache/restore</code></strong>: Looks for a "Key" in GitHub’s global storage to find existing data.</li>
    <li><strong><code>${{ github.sha }}</code></strong>: Uses a unique commit ID to ensure the cache is specific to that exact version of code.</li>
    <li><strong>Conditional Logic</strong>: Uses <code>if</code> statements to only run a "Fresh Build" if a <code>cache-hit</code> is not detected.</li>
  </ul>
</div>

<div style="background-color: #f6f8fa; border-radius: 6px; padding: 16px; border: 1px solid #d0d7de;">
  <p><strong>Lab 3: Handling Failures (The Sabotage)</strong></p>
  <p><strong>File:</strong> <code>fourthdemoWillFail.yml</code></p>
  <p><strong>Goal:</strong> Visualizing how GitHub Actions signals a "Stop" when a command fails.</p>
  <p><strong>Key Concepts:</strong></p>
  <ul>
    <li><strong><code>exit 1</code></strong>: The standard way to tell the runner that a process has crashed or failed.</li>
    <li><strong>Fail-Fast</strong>: GitHub stops the job immediately upon failure, ensuring subsequent steps never run.</li>
  </ul>
</div>

---

## 📊 Module 3: Reporting & Visibility
<p><strong>The Problem:</strong> Raw text logs are difficult to read for quick status updates. We need a professional dashboard.</p>

<div style="background-color: #f6f8fa; border-radius: 6px; padding: 16px; border: 1px solid #d0d7de;">
  <p><strong>Lab 4: The Job Summary Dashboard</strong></p>
  <p><strong>File:</strong> <code>thirddemojobsummaries.yml</code></p>
  <p><strong>Goal:</strong> Creating a visual "Executive Summary" directly on the GitHub Actions run page.</p>
  <p><strong>Key Concepts:</strong></p>
  <ul>
    <li><strong><code>$GITHUB_STEP_SUMMARY</code></strong>: A special environment file used to display Markdown tables and bold text on the GitHub UI.</li>
    <li><strong>Dynamic Tables</strong>: Gathering results from multiple parallel matrix jobs into a single readable table.</li>
  </ul>
</div>

---

## 🤖 Module 4: Collaboration & Security
<p><strong>The Problem:</strong> We want to automate communication and deployment, but only when specific approvals (like labels) are granted.</p>

<div style="background-color: #f6f8fa; border-radius: 6px; padding: 16px; border: 1px solid #d0d7de; margin-bottom: 10px;">
  <p><strong>Lab 5: Label-Triggered Deployment</strong></p>
  <p><strong>File:</strong> <code>SeventhDemoLabel.yml</code></p>
  <p><strong>Goal:</strong> Preventing accidental deployments by requiring a specific GitHub Label (<code>stage-deploy</code>) on a Pull Request.</p>
  <p><strong>Key Concepts:</strong></p>
  <ul>
    <li><strong><code>types: [labeled]</code></strong>: The workflow only triggers when a label event occurs.</li>
    <li><strong>Permissions</strong>: Explicitly granting <code>write</code> access to post comments back to the PR.</li>
    <li><strong>Environment</strong>: Successfully deployed specifically for the <strong>GH-200 Lab Environment</strong>.</li>
  </ul>
</div>

<div style="background-color: #f6f8fa; border-radius: 6px; padding: 16px; border: 1px solid #d0d7de;">
  <p><strong>Lab 6: The Welcome Bot (GraphQL)</strong></p>
  <p><strong>File:</strong> <code>fifthdemoGithubScripts.yml</code></p>
  <p><strong>Goal:</strong> Automatically welcoming new contributors using advanced API queries.</p>
  <p><strong>Key Concepts:</strong></p>
  <ul>
    <li><strong><code>github-script</code></strong>: Running JavaScript directly in your YAML to interact with the GitHub API.</li>
    <li><strong>GraphQL Mutation</strong>: Using modern queries to post automated responses to Discussions.</li>
  </ul>
</div>

---

## 🚀 Module 5: The Grand Finale (CI/CD)
<p><strong>The Problem:</strong> We need to ship our app! This means creating a Docker image and a formal Release entry.</p>

<div style="background-color: #f6f8fa; border-radius: 6px; padding: 16px; border: 1px solid #d0d7de;">
  <p><strong>Lab 7: Package & Release</strong></p>
  <p><strong>File:</strong> <code>eightdemo_githubpackagerelease.yml</code></p>
  <p><strong>Goal:</strong> Building a container and creating an official Release when a version tag (e.g., <code>v1.0</code>) is pushed.</p>
  <p><strong>Key Concepts:</strong></p>
  <ul>
    <li><strong>Tag Filtering</strong>: Using <code>on: push: tags: 'v*'</code> to ensure only versioned code triggers a release.</li>
    <li><strong><code>needs</code></strong>: Ensuring the Release job waits for the Docker Build job to succeed.</li>
    <li><strong>GHCR</strong>: Pushing images to the GitHub Container Registry (<code>ghcr.io</code>).</li>
  </ul>
</div>
