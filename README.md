
![ThreatSpotter Logo](images/threatspotter_new_logo.png)


# ThreatSpotter AISecureMe
The AISecureMe ThreatSpotter is an implementation of community edition and scans for containers and images.

The main community features that AISecureMe ThreatSpotter is supporting:

1. Data Visibility : All virtual machines, containers, kubernetes clusters, running processes, and interrleated connections are visible at one place on provided credentials.
2. Vulnerability Management : Initiate scans on attached container and images for provided AWS credentials.
3. Runtime Compliance Scan : Perform compliance scan for containers and images for provided AWS credentials.
4. Container Scanning: Perform vulnerability scan on images stored in AWS ECR and provide accurate results.
5. Integration with DevOps pipelines.
6. Visualization: Visualize kubernetes clusters, virtual machines, containers and images, running processes, and network connections in near real time.
7. Runtime Vulnerability Management: Perform vulnerability scans on localhosts.
8. Runtime Vulnerability Management: Perform vulnerability scans on running containers & container images
9. Container Registry Scanning: Check for vulnerabilities in images stored on AWS ECR.
10. CI/CD pipeline: CircleCI.

# Contents

* [Architecture](#architecture)
* [Features](#feature-availability)
  * [Feature (1) Discover & Visualize Running Pods, Containers and Host](#feature-1)
    * [Weave Scope](#weave-scope)
      * [Understand your Docker containers in real time](#understand-your-docker-containers-in-real-time)
      * [Contextual details and deep linking](#contextual-details-and-deep-linking)
      * [Interact with and manage containers](#interact-with-and-manage-containers)
      * [Extend and customize via plugins](#extend-and-customize-via-plugins)
  * [Feature (2) Runtime Vulnerability Management for localhosts](#feature-2)
  * [Feature (3) Runtime Vulnerability Management for containers](#feature-3)
    * [Trivy](#trivy)
      * [Detect comprehensive vulnerabilities](#detect-comprehensive-vulnerabilities)
      * [Simple](#simple)
      * [Fast](#fast)
      * [High accuracy](#high-accuracy)
    * [Expected results](#expected-results)
  * [Feature (4) Container Registry Scanning: Check for vulnerabilities in images stored on AWS ECR.](#feature-4)
    * [Prowler AWS Security Tool](#prowler)
    * [Expected results](#expected-results)
  * [Feature (5) CI/CD Integration](#feature-5)
* [Getting Started](#getting-started)
  * [Debian-based Linux Distros](#Debian-based-Linux-Distros)
* [How to use?](#how-to-use)

# Architecture

A pictorial depiction of the ThreatSpotter AiSecureMe Architecture is below


![Deepfence Architecture](assets/images/architecture.png)

- Server (Golang): Weaveworks/scope solid backend Go server for monitoring, visualisation & management for Docker & Kubernetes.

- Proxy Server (Node): Weaveworks/scope simple proxy Node (Express) server for binding between the Server (Golang) and the Client (React).

- Client Server (React): Weaveworks/scope React client server.

- Server (Node): A server of APIs from several third-party tools (Trivy).

# Feature Availability

Features      | AiSecureMe | 
------------- | ----------------- 
(Feature #1) Discover & Visualize Running Pods, Containers and Hosts   | :heavy_check_mark: (unlimited) 
(Feature #2) Runtime Vulnerability Management for hosts/VMs | :heavy_check_mark: (unlimited) 
(Feature #3) Runtime Vulnerability Management for containers | :heavy_check_mark: (unlimited) 
(Feature #4) Container Registry Scanning (AWS ECR) | :heavy_check_mark: 
(Feature #5) CI/CD Integration  | :heavy_check_mark: 

## Feature 1
Discover & Visualize Running Pods, Containers and Hosts. [issue #1](https://github.com/blockboard/ThreatMapper-aisecureme/issues/1)

- [Weaveworks/scope](https://github.com/weaveworks/scope) has been selected and forked to implement the vistualization feature, and below is the description from Weaveworks/scope READMEmd


### Weave Scope
Weave Scope automatically generates a map of your application, enabling you to
intuitively understand, monitor, and control your containerized, microservices-based application.

#### Understand your Docker containers in real time

<img src="imgs/topology.png" width="200" alt="Map you architecture" align="right">

Choose an overview of your container infrastructure, or focus on a specific microservice. Easily identify and correct issues to ensure the stability and performance of your containerized applications.

#### Contextual details and deep linking

<img src="imgs/selected.png" width="200" alt="Focus on a single container" align="right">

View contextual metrics, tags, and metadata for your containers.  Effortlessly navigate between processes inside your container to hosts your containers run on, arranged in expandable, sortable tables.  Easily find the container using the most CPU or memory for a given host or service.

#### Interact with and manage containers

<img src="imgs/terminals.png" width="200" alt="Launch a command line." align="right">

Interact with your containers directly: pause, restart, and stop containers. Launch a command line. All without leaving the scope browser window.

#### Extend and customize via plugins

Add custom details or interactions for your hosts, containers, and/or processes by creating Scope plugins. Or, just choose from some that others have already written at the GitHub [Weaveworks Scope Plugins](https://github.com/weaveworks-plugins/) organization.

## Feature 2
Runtime Vulnerability Management for LocalHost. [issue #2](https://github.com/blockboard/ThreatMapper-aisecureme/issues/2)
## Feature 3
Runtime Vulnerability Management for containers. [issue #3](https://github.com/blockboard/ThreatMapper-aisecureme/issues/3)

- [Trivy](https://github.com/aquasecurity/trivy#installation) has been selected for scanning the vulnerabilities for containers.

### Trivy
A Simple and Comprehensive Vulnerability Scanner for Containers and other Artifacts, Suitable for CI.

#### Detect comprehensive vulnerabilities
  - OS packages (Alpine, **Red Hat Universal Base Image**, Red Hat Enterprise Linux, CentOS, Oracle Linux, Debian, Ubuntu, Amazon Linux, openSUSE Leap, SUSE Enterprise Linux, Photon OS and Distroless)
  - **Application dependencies** (Bundler, Composer, Pipenv, Poetry, npm, yarn and Cargo)
#### Simple
  - Specify only an image name or artifact name
#### Fast
  - The first scan will finish within 10 seconds (depending on your network). Consequent scans will finish in single seconds.
  - Unlike other scanners that take long to fetch vulnerability information (~10 minutes) on the first run, and encourage you to maintain a durable vulnerability database, Trivy is stateless and requires no maintenance or preparation.
#### High accuracy
  - **Especially Alpine Linux and RHEL/CentOS**
  - Other OSes are also high

### Expected results

- A generated report with the scanning results for the container from Trivy, with a Pie chart comparing High, Medium, and Low vulnerabilities.
<img src="assets/images/feature2.png" width="600" height="300" alt="Container scanning results">


## Feature 4
Container Registry Scanning: Check for vulnerabilities in images stored on AWS ECR. 

- [Prowler](https://github.com/toniblyx/prowler#table-of-contents) has been selected for scanning vulnerabilities in images/containers stored on AWS ECR.

### Prowler
Prowler is a command line tool for AWS Security Best Practices Assessment, Auditing, Hardening and Forensics Readiness Tool.

It follows guidelines of the CIS Amazon Web Services Foundations Benchmark (49 checks) and has more than 100 additional checks including related to GDPR, HIPAA, PCI-DSS, ISO-27001, FFIEC, SOC2 and others.

#### Prowler features
+150 checks covering security best practices across all AWS regions and most of AWS services and related to the next groups:

- Identity and Access Management [group1]
- Logging  [group2]
- Monitoring [group3]
- Networking [group4]
- CIS Level 1 [cislevel1]
- CIS Level 2 [cislevel2]
- Forensics related group of checks [forensics-ready]
- GDPR [gdpr] 
- HIPAA [hipaa] 
- Trust Boundaries [trustboundaries] 
- Secrets 
- PCI-DSS
- ISO-27001
- Internet exposed resources
- EKS-CIS
- FFIEC
- SOC2
- ENS (Esquema Nacional de Seguridad of Spain)

With Prowler you can:

- get a direct colorful or monochrome report 
- a HTML, CSV, JUNIT, JSON or JSON ASFF format report
- send findings directly to Security Hub
- run specific checks and groups or create your own
- check multiple AWS accounts in parallel or sequentially
- and more! Read examples below

### Expected results

- A generated report with the scanning results for the AWS containers from Prowler. 
<img src="assets/images/feature4.png" width="600" height="300" alt="Focus on a single container">


## Feature 5
CI/CD pipeline: CI/CD Pipelines like CircleCI. [issue #5](https://github.com/blockboard/ThreatMapper-aisecureme/issues/5)

# Getting started
- For a detailed installation guide for the prerequisites check out this [Detailed Prerequisites installation document](https://github.com/blockboard/ThreatMapper-aisecureme/blob/master/Pre-Requisites.md)

## Debian-based Linux Distros
:warning: **Make sure you are inside the ThreatSpotter-AiSecureMe project location from your terminal.**

### Pre-requirstes installations
- This shell script works for any Debian-based Linux Distro like **Ubuntu**, **MX Linux**, **Linux Mint**, **Deepin**, **Kali Linux**, and **Parrot OS**. 

```console
sudo chmod a+x scripts/installations_debian.sh

./scripts/installations_debian.sh
```

### ThreatSpotter-AiSecureMe running

- The following command is used for running ThreatSpotter-AiSecureMe.
```console
sudo ./scope launch
```

- The following command is used for stopping and closing ThreatSpotter-AiSecureMe. 
```console
sudo ./scope stop
```
# How to use
- Visualize Running Pods, Containers and Hosts.
<img src="imgs/ReadMe/Processes.png" width="600" height="300" alt="Focus on a single container">

- Visualize by Table view.
<img src="imgs/ReadMe/ProcessesTable.png" width="600" height="300" alt="Focus on a single container">

- Visualize by Resources.
<img src="imgs/ReadMe/Processes Resources.png" width="600" height="300" alt="Focus on a single container">

- The container menu at the top lists all the avaiable running containers for the user as a graph
<img src="imgs/ReadMe/Containers.png" width="600" height="300" alt="Focus on a single container">

- For showing the running container node detailes.
<img src="imgs/ReadMe/ContainerDetail.png" width="600" height="300" alt="Focus on a single container">

- Pressing an container opens a containers details menu which lists the details of a container and a list of buttons to control container operations like starting and stoping the container , pausing the container and scanning the container 
<img src="imgs/ReadMe/Container_details_1.png" width="300" height="200" alt="Focus on a single container">
<img src="imgs/ReadMe/Container_details_2.png" width="300" height="200" alt="Focus on a single container">

- For scanning running containers, and show vulnerabilities.
<img src="imgs/ReadMe/ContainerScan.png" width="600" height="300" alt="Focus on a single container">

- For running container vulnerabilities report after scanning.
<img src="imgs/ReadMe/Container Vulnerability.png" width="500" height="500" alt="Focus on a single container">

- The hosts menu at the top lists all the avaiable running Hosts from the network for the user as a graph
<img src="imgs/ReadMe/Hosts.png" width="600" height="300" alt="Focus on a single container">

- Showing scanning local host. 
<img src="imgs/ReadMe/HostScanning.png" width="600" height="300" alt="Focus on a single container">

- Showing Terminal inside the running local host. 
<img src="imgs/ReadMe/HostTerminal.png" width="600" height="300" alt="Focus on a single container">

- The Registers cloud vulnerabilities table page after registering and configuring AWS.
<img src="imgs/ReadMe/RegisterAWS.png" width="600" height="500" alt="Focus on a single container">
