Acebook — CI/CD Pipeline & AWS Deployment
A cloud engineering project focused on building a fully automated deployment pipeline for a Node.js social media application, simulating real-world DevOps workflows in a team environment.

Note: The application itself (Acebook) was provided as a base template. My contribution was designing and implementing the CI/CD pipeline and AWS deployment infrastructure around it.


What I Built
The goal was to take an existing Node.js application and make it continuously deployable to AWS — automatically, reliably, and without manual steps after a code push.
CI/CD Pipeline (GitHub Actions + AWS CodeDeploy)

Configured a GitHub Actions workflow that triggers on every push to the main branch
Pipeline runs automated tests (unit + integration via Jest and Cypress) before any deployment proceeds
On a successful test run, the build artefact is packaged and uploaded to Amazon S3
AWS CodeDeploy then picks up the artefact from S3 and deploys it to the target EC2 instance
The appspec.yml file defines the deployment lifecycle hooks, controlling how CodeDeploy manages the deployment process on the instance

AWS Infrastructure
ServiceRoleEC2Application host — runs the Node.js serverS3Artefact storage — holds deployment packages between pipeline stagesCodeDeployAutomated deployment orchestration to EC2IAMRoles and permissions for CodeDeploy and EC2 access

Architecture
GitHub Push
    │
    ▼
GitHub Actions Workflow
    ├── Run unit tests (Jest)
    ├── Run integration tests (Cypress)
    └── On success → Upload artefact to S3
                          │
                          ▼
                    AWS CodeDeploy
                          │
                          ▼
                      EC2 Instance
                    (Node.js App Running)

Key Files

.github/workflows/ — GitHub Actions pipeline definition
appspec.yml — CodeDeploy deployment lifecycle configuration
scripts/ — Deployment hook scripts (start/stop application)


Tech Stack
LayerTechnologyCI/CDGitHub ActionsDeploymentAWS CodeDeployComputeAWS EC2Artefact StorageAWS S3Access ControlAWS IAMApp RuntimeNode.js / ExpressTestingJest, Cypress

What I Learned

Structuring a multi-stage CI/CD pipeline with test gates before deployment
Configuring CodeDeploy deployment groups, IAM roles and instance profiles
Managing deployment lifecycle hooks via appspec.yml
Debugging pipeline failures across GitHub Actions and AWS CodeDeploy logs
Coordinating infrastructure changes within a team environment
