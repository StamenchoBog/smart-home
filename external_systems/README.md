# External systems

This repository is part of the [Smart Home](https://github.com/StamenchoBog/smart-home) project.

## Description

The cloud infrastructure includes provisioned databases ([MariaDB](https://mariadb.com/kb/en/documentation/) and [InfluxDB](https://docs.influxdata.com/influxdb/v2.7/)) and the [Home Assistant](https://www.home-assistant.io/docs/) application, which processes and displays the received data in various formats, such as graphs and other informative visualizations.

## Technology and software stack

### Terraform

Terraform is used to define and provision the infrastructure resources needed for the Smart Home project. It allows for infrastructure-as-code, enabling the declarative definition of infrastructure components. Also `Terraform Cloud` is used, to provision,
track, and manage the infrastructure.

Check the following [page](https://developer.hashicorp.com/terraform/docs) for more information and documentation.

### AWS (Amazon Web Services)

AWS is the cloud platform used to host the Smart Home project. It offers a wide range of services and resources that will be leveraged for storing data, processing metrics, and visualizing the consumption information.

Check the following [page](https://docs.aws.amazon.com/) for more information and documentation.

### Home Assistant

Home Assistant is an open-source home automation platform that focuses on privacy and local control. It allows you to integrate and control various smart devices and systems in your home. Home Assistant will be used as the central hub for managing the Smart Home project and integrating the data from the meters.

Check the following [page](https://www.home-assistant.io/docs/) for more information and documentation.

### MariaDB

MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system, intended to remain free and open-source software under the GNU General Public License.

Check the following [page](https://mariadb.com/kb/en/documentation/) for more information and documentation.

### InfluxDB

InfluxDB is an open-source time series database developed by the company InfluxData. It is written in the Go programming language for storage and retrieval of time series data in fields such as operations monitoring, application metrics, Internet of Things sensor data, and real-time analytics.

Check the following [page](https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4) for more information and documentation.

## Guide

To use this Terraform repository and leverage the CI/CD pipeline for automated checks, follow these steps:

1. Clone the repository to your local development environment.
2. Modify the Terraform configuration files (`*.tf`) in the `./infra/terraform/` directory to define your AWS infrastructure resources.
3. Commit and push your changes to trigger the GitLab CI/CD pipeline.
4. Monitor the pipeline's progress and review the results of each stage, including linting, security analysis, and validation.

### Gitlab CI/CD integration and stages

#### Stage `fmt_and_lint_check`

Job: `lint_check`

- Description: Performs linting checks on Terraform code using TFLint to maintain code quality.
- Image: ghcr.io/terraform-linters/tflint-bundle:latest
- Script: Initializes TFLint and scans ./infra/terraform/ directory recursively for lint errors and misplacements.
- Allow Failure: True (Allows the pipeline to continue even if linting issues are found).

#### Stage `security_analysis`

Job: `dependency_scanning`

- Description: Performs dependency scanning to identify known vulnerabilities in infrastructure code.
- Allow Failure: False (Fails the pipeline if vulnerabilities are detected).
- Note: Uses GitLab CI template from Jobs/Dependency-Scanning.gitlab-ci.yml.

Job: `tfsec_scanning`

- Description: Scans Terraform code using tfsec to identify security issues.
- Image: aquasec/tfsec
- Script: Scans the code with tfsec and generates a JUnit report tfsec.test.xml.
- Artifacts: JUnit report is saved for future reference.
- Allow Failure: False (Fails the pipeline if high-severity security issues are detected).

#### Stage `validate`

Job: `terraform_validate`

- Description: Validates Terraform code to ensure correctness and adherence to best practices.
- Image: hashicorp/terraform:1.4
- Script: Initializes Terraform (without backend) and validates AWS infrastructure code (./infra/terraform/aws).
- Allow Failure: False (Fails the pipeline if validation errors are found).

## Authors

- Stamencho Bogdanovski
  - Gitlab: [@sbogdanovski](https://gitlab.com/sbogdanovski)
  - Github: [@StamenchoBog](https://github.com/StamenchoBog)

## License

MIT License

Copyright (c) 2023 Stamencho Bogdanovski

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
