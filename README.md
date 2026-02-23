# Acebook — CI/CD Pipeline & AWS Deployment

A cloud engineering project focused on building a fully automated deployment pipeline for a Node.js social media application, simulating real-world DevOps workflows in a team environment.

> **Note:** The application itself was provided as a base template. My contribution was designing and implementing the CI/CD pipeline and AWS deployment infrastructure around it.

---

## What I Built

The goal was to take an existing Node.js application and make it continuously deployable to AWS — automatically, reliably, and without manual steps after a code push.

### CI/CD Pipeline

- Configured a **GitHub Actions workflow** that triggers on every push to the main branch
- Pipeline runs automated **unit and integration tests** (Jest + Cypress) before any deployment proceeds
- On a successful test run, the build artefact is packaged and uploaded to **Amazon S3**
- **AWS CodeDeploy** picks up the artefact from S3 and deploys it to the target EC2 instance
- Deployment lifecycle hooks are managed via `appspec.yml`, controlling how CodeDeploy handles each stage of the rollout

### AWS Infrastructure

- **EC2** — hosts and runs the Node.js application
- **S3** — stores deployment artefacts between pipeline stages
- **CodeDeploy** — orchestrates automated deployment to EC2
- **IAM** — roles and permissions scoped to least privilege for CodeDeploy and EC2

---

## Architecture

```
Code Push to GitHub
        |
        v
GitHub Actions Workflow
        |-- Run unit tests (Jest)
        |-- Run integration tests (Cypress)
        |-- On success: package and upload artefact to S3
                        |
                        v
                  AWS CodeDeploy
                        |
                        v
                   EC2 Instance
               (Node.js App Running)
```

---

## Key Files

- `.github/workflows/` — GitHub Actions pipeline definition
- `appspec.yml` — CodeDeploy deployment lifecycle configuration
- `scripts/` — Hook scripts that start and stop the application during deployment

---

## Tech Stack

- **CI/CD:** GitHub Actions
- **Deployment:** AWS CodeDeploy
- **Compute:** AWS EC2
- **Artefact Storage:** AWS S3
- **Access Control:** AWS IAM
- **App Runtime:** Node.js / Express
- **Testing:** Jest, Cypress

---

## What I Learned

- Structuring a multi-stage CI/CD pipeline with test gates before deployment
- Configuring CodeDeploy deployment groups, IAM roles and EC2 instance profiles
- Managing deployment lifecycle hooks via `appspec.yml`
- Debugging pipeline failures across GitHub Actions logs and AWS CodeDeploy events
- Coordinating infrastructure changes in a team environment
