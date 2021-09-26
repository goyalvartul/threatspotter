# Detailed Prerequisites installation document

* [Pre-Requisites](#pre-requisites)
    * [Node Installation](#Node-Installation)
      * [Arch Linux](#Arch-Linux)
      * [CentOS, Fedora and Red Hat Enterprise Linux](#CentOS,-Fedora-and-Red-Hat-Enterprise-Linux)
      * [FreeBSD](#FreeBSD)
      * [Gentoo](#Gentoo)
      * [IBM i](#IBM-i)
      * [Void Linux](#Void-Linux)
    * [Trivy Installation](#trivy-installation)
      * [RHEL/CentOS](#RHEL/CentOS)
      * [Debian/Ubuntu](#Debian/Ubuntu)
      * [Arch Linux](#Arch-Linux)
      * [Homebrew](#Homebrew)
      * [Install Script](#Install-Script)
      * [Binary](#Binary)
      * [From source](#from-source)
    * [AWS CLI Installation](#aws-cli-installation)
      * [Prerequisites for Linux](#prerequisites-for-linux)
      * [Install the AWS CLI version 2 on Linux](#install-the-aws-cli-version-2-on-linux)
      * [AWS configure for Prowler](#AWS-configure-for-Prowler)
        * [Specify the region: ](#1-Specify-the-region)
        * [Try some a basic command to test the functionality of the AWS CLI](#2-Try-some-a-basic-command-to-test-the-functionality-of-the-AWS-CLI)
    * [Python Installation on Linux](#Python-Installation-on-Linux)
      * [How to Check Your Python Version on Linux](#How-to-Check-Your-Python-Version-on-Linux)
      * [What Your Options Are](#What-Your-Options-Are)
      * [Install on Ubuntu and Linux Mint](#Install-on-Ubuntu-and-Linux-Mint)
      * [Install on Debian Linux](#Install-on-Debian-Linux)
      * [Install on openSUSE](#Install-on-openSUSE)
      * [Install on CentOS and Fedora](#Install-on-CentOS-and-Fedora)
      * [Install on Arch Linux](#Install-on-Arch-Linux)
    * [Prowler Installation](#prowler-installation)
* [ThreatSpotter-AiSecureMe Installation](#threatspotter-aisecureme-installations)
    
## Pre-Requisites

## Node Installation

Installing Node.js via package manager

### Arch Linux
Node.js and npm packages are available in the Community Repository.

```shell
$ pacman -S nodejs npm
```

### CentOS, Fedora and Red Hat Enterprise Linux
Node.js is available as a module called nodejs in CentOS/RHEL 8 and Fedora.

```shell
$ dnf module install nodejs:<stream>
```

where <stream> corresponds to the major version of Node.js. To see a list of available streams:

```shell
$ dnf module list nodejs
```
For example, to install Node.js 12:

```shell
$ dnf module install nodejs:12
```

### FreeBSD

Install a binary package via pkg:

```shell
$ pkg install node
```

Or compile it on your own using ports:

```shell
$ cd /usr/ports/www/node && make install
```

### Gentoo

Node.js is available in the portage tree.

```shell
$ emerge nodejs
```

### IBM i

LTS versions of Node.js are available from IBM, and are available via the 'yum' package manager. The package name is nodejs followed by the major version number (for instance, nodejs12, nodejs14 etc)

To install Node.js 14.x from the command line, run the following as a user with *ALLOBJ special authority:

```shell
$ yum install nodejs14
```

Node.js can also be installed with the IBM i Access Client Solutions product. See this support document for more details.

### Void Linux

Void Linux ships Node.js stable in the main repository.

```shell
$ xbps-install -Sy nodejs
```

- Installing Trivy tool, follow the installation guide according to your machine's operating system.

## Trivy Installation

Replace `{TRIVY_VERSION}` with the latest released version of Trivy. You can find the latest releases on this page: https://github.com/aquasecurity/trivy/releases

### RHEL/CentOS

Add repository setting to `/etc/yum.repos.d`.

```shell
$ sudo vim /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$releasever/$basearch/
gpgcheck=0
enabled=1
$ sudo yum -y update
$ sudo yum -y install trivy
```

or

```shell
$ rpm -ivh https://github.com/aquasecurity/trivy/releases/download/{TRIVY_VERSION}/trivy_{TRIVY_VERSION}_Linux-64bit.rpm
```

### Debian/Ubuntu

Add repository to `/etc/apt/sources.list.d`.

```shell
$ sudo apt-get install wget apt-transport-https gnupg lsb-release
$ wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
$ echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
$ sudo apt-get update
$ sudo apt-get install trivy
```

or

```shell
$ sudo apt-get install rpm
$ wget https://github.com/aquasecurity/trivy/releases/download/{TRIVY_VERSION}/trivy_{TRIVY_VERSION}_Linux-64bit.deb
$ sudo dpkg -i trivy_{TRIVY_VERSION}_Linux-64bit.deb
```



### Arch Linux
Package trivy-bin can be installed from the Arch User Repository. Examples:
```shell
$ pikaur -Sy trivy-bin
```
or
```shell
$ yay -Sy trivy-bin
```

### Homebrew

You can use homebrew Linux.

```shell
$ brew install aquasecurity/trivy/trivy
```

### Install Script
This script downloads Trivy binary based on your OS and architecture.

```shell
$ curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | sh -s -- -b /usr/local/bin
```

### Binary

Get the latest version from [this page](https://github.com/aquasecurity/trivy/releases/latest), and download the archive file for your operating system/architecture. Unpack the archive, and put the binary somewhere in your `$PATH` (on UNIX-y systems, /usr/local/bin or the like). Make sure it has execution bits turned on.

You also need to install `rpm` command for scanning images based on RHEL/CentOS.

### From source

```shell
$ mkdir -p $GOPATH/src/github.com/aquasecurity
$ cd $GOPATH/src/github.com/aquasecurity
$ git clone https://github.com/aquasecurity/trivy
$ cd trivy/cmd/trivy/
$ export GO111MODULE=on
$ go install
```

You also need to install `rpm` command for scanning images based on RHEL/CentOS.

## AWS CLI Installation

This section describes how to install the AWS CLI version 2 on Linux. The AWS CLI version 2 has no dependencies on other Python packages. It has a self-contained, embedded copy of Python included in the installer.

### Prerequisites for Linux

- You must be able to extract or "unzip" the downloaded package. If your operating system doesn't have the built-in unzip command, use an equivalent.

- The AWS CLI version 2 uses `glibc`, `groff`, and `less`. These are included by default in most major distributions of Linux.

- We support the AWS CLI version 2 on 64-bit versions of recent distributions of CentOS, Fedora, Ubuntu, Amazon Linux 1, and Amazon Linux 2.

- We support the AWS CLI version 2 on Linux ARM.

- Because AWS doesn't maintain third-party repositories, we can’t guarantee that they contain the latest version of the AWS CLI.

### Install the AWS CLI version 2 on Linux

Follow these steps from the command line to install the AWS CLI on Linux.

We provide the steps in one easy to copy and paste group based on whether you use 64-bit Linux or Linux ARM. See the descriptions of each line in the steps that follow.


`Linux x86 (64-bit)`

**For the latest version of the AWS CLI**, use the following command block:

```shell
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**For a specific version of the AWS CLI**, append a hyphen and the version number to the filename. For this example the filename for version `2.0.30` would be 
`awscli-exe-linux-x86_64-2.0.30.zip` resulting in the following command:

```shell
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

For a list of versions, see [AWS CLI version 2 changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst) on GitHub.

`Linux ARM`

**For the latest version of the AWS CLI**, use the following command block:

```shell
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**For a specific version of the AWS CLI**, append a hyphen and the version number to the filename. For this example the filename for version `2.0.30` would be `awscli-exe-linux-aarch64-2.0.30.zip` resulting in the following command:

```shell
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64-2.0.30.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

For a list of versions, see the [AWS CLI version 2 changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst) on GitHub.


#### 1. Download the installation file in one of the following ways:

- **Use the curl command** – The `-o` option specifies the file name that the downloaded package is written to. The options on the following example command write the downloaded file to the current directory with the local name `awscliv2.zip`.

  `Linux x86 (64-bit)`

  **For the current version of the AWS CLI**, use the following command:

  ```shell
  $ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  ```

  **For a specific version of the AWS CLI**, append a hyphen and the version number to the filename. For this example the filename for version `2.0.30` would be `awscli-exe-linux-x86_64-2.0.30.zip` resulting in the following command:

  ```shell
  $ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
  ```

  For a list of versions, see the [AWS CLI version 2 changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst) on GitHub.

  `Linux ARM`

  **For the current version of the AWS CLI**, use the following command:

  ```shell
  $ curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
  ```

  **For a specific version of the AWS CLI**, append a hyphen and the version number to the filename. For this example the filename for version `2.0.30` would be `awscli-exe-linux-aarch64-2.0.30.zip` resulting in the following command:

  ```shell
  $ curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64-2.0.30.zip" -o "awscliv2.zip"curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
  ```

  For a list of versions, see the [AWS CLI version 2 changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst) on GitHub.

- **Downloading from the URL** – To download the installer with your browser, use one of the following URLs. You can verify the integrity and authenticity of your downloaded installation file before you extract (unzip) the package. See [Verify the integrity and authenticity of the downloaded installer files](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#v2-install-linux-validate) for more information.

  `Linux x86 (64-bit)`

  **For the latest version of the AWS CLI**: https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

  **For a specific version of the AWS CLI**, append a hyphen and the version number to the filename. For this example the filename for version 2.0.30 would be awscli-exe-linux-x86_64-2.0.30.zip resulting in the following url: https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip

  **For a list of versions**, see the [AWS CLI version 2 changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst) on GitHub.

  `Linux ARM`

  **For the latest version of the AWS CLI**: https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip

  **For a specific version of the AWS CLI**, append a hyphen and the version number to the filename. For this example the filename for version 2.0.30 would be awscli-exe-linux-aarch64-2.0.30.zip resulting in the following url https://awscli.amazonaws.com/awscli-exe-linux-aarch64-2.0.30.zip

  **For a list of versions**, see the [AWS CLI version 2 changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst) on GitHub.


#### 2. Unzip the installer. If your Linux distribution doesn't have a built-in unzip command, use an equivalent to unzip it. The following example command unzips the package and creates a directory named aws under the current directory.

```shell
$ unzip awscliv2.zip
```

#### 3. Run the install program. The installation command uses a file named `install` in the newly unzipped aws directory. By default, the files are all installed to `/usr/local/aws-cli`, and a symbolic link is created in `/usr/local/bin`. The command includes `sudo` to grant write permissions to those directories.

```shell
$ sudo ./aws/install
```

You can install without `sudo` if you specify directories that you already have write permissions to. Use the following instructions for the `install` command to specify the installation location:

- Ensure that the paths you provide to the `-i` and `-b` parameters contain no volume name or directory names that contain any space characters or other white space characters. If there is a space, the installation fails.

- `--install-dir` or `-i` – This option specifies the directory to copy all of the files to.
The default value is `/usr/local/aws-cli.`

- `--bin-dir` or `-b` – This option specifies that the main `aws` program in the install directory is symbolically linked to the file `aws` in the specified path. You must have write permissions to the specified directory. Creating a symlink to a directory that is already in your path eliminates the need to add the install directory to the user's `$PATH` variable.
The default value is `/usr/local/bin`.

  ```shell
  $ sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
  ```

#### 4. Confirm the installation.

```shell
$ aws --version

aws-cli/2.1.1 Python/3.7.4 Linux/4.14.133-113.105.amzn2.x86_64 botocore/2.0.0
```

### AWS configure for Prowler

#### 1. Specify the region: 

It will ask you for the Access Key ID, and the Secret Access Key ID, which can be obtained from the IAM console console.aws.amazon.com/iam

```shell
$ aws configure

AWS Access Key ID [****************RPFA]: {YOUR_ACCESS_KEY_ID}
AWS Secret Access Key ID [****************K1u+]: {YOUR_SECRET_ACCESS_KEY_ID}
Default region name [ap-southeast-1]: ap-southeast-1 
Default output format [None]: {None: click enter}
```

#### 2. Try some a basic command to test the functionality of the AWS CLI

- For getting some information about your instance:

  ```shell
  $ aws ec2 describe-instances  :more
  ```

## Python Installation on Linux

There are two installation methods on Linux:

1. Using your operating system’s package manager
2. Building Python from source code

### Install on Ubuntu and Linux Mint
In this section, you’ll learn how to install Python using Ubuntu’s apt package manager. If you’d like to build Python from source code, skip ahead to the [How to Build Python From Source Code](https://realpython.com/installing-python/#how-to-build-python-from-source-code) section.

```
Note: Linux Mint users can skip to the “Linux Mint and Ubuntu 17 and below” section.
```

Depending on the version of the Ubuntu distribution you run, the process for setting up Python on your system will vary. You can determine your local Ubuntu version by running the following command:

```shell
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.4 LTS
Release:        16.04
Codename:       xenial
```

Follow the instructions below that match the version number you see under Release in the console output:

- **Ubuntu 18.04, Ubuntu 20.04 and above**: Python 3.8 doesn’t come by default on Ubuntu 18.04 and above, but it is available in the Universe repository. To install version 3.8, open a terminal application and type the following commands:

  ```shell
  $ sudo apt-get update
  $ sudo apt-get install python3.8 python3-pip
  ```

  Once the installation is complete, you can run Python 3.8 with the `python3.8` command and pip with the `pip3` command.

- **Linux Mint and Ubuntu 17 and below**: Python 3.8 isn’t in the Universe repository, so you need to get it from a Personal Package Archive (PPA). For example, to install from the [“deadsnakes” PPA](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa), use the following commands:

  ```shell
  $ sudo add-apt-repository ppa:deadsnakes/ppa
  $ sudo apt-get update
  $ sudo apt-get install python3.8 python3-pip
  ```
  Once the installation is complete, you can run Python 3.8 with the python3.8 command and run pip with the pip3 command.

### Install on Debian Linux
Before you can install Python 3.8 on Debian, you’ll need to install the sudo command. To install it, execute the following commands in a terminal:

```shell
$ su
$ apt-get install sudo
$ sudo vim /etc/sudoers
```

After that, open the `/etc/sudoers` file using the `sudo vim` command or your favorite text editor. Add the following line of text to the end of the file, replacing `your_username` with your actual username:

```text
your_username ALL=(ALL) ALL
```

Now you can skip ahead to the [How to Build Python From Source Code](https://realpython.com/installing-python/#how-to-build-python-from-source-code) section to finish installing Python.

### Install on openSUSE
Building from source is the most reliable way to set up Python on openSUSE. To do that, you’ll need to install the development tools, which can be done in YaST via the menus or by using `zypper`:

```shell
$ sudu zypper install -t pattern devel_C_C
```
This might take a while to complete as it installs over 150 packages. Once it’s completed, skip ahead to the [How to Build Python From Source Code](https://realpython.com/installing-python/#how-to-build-python-from-source-code) section.

### Install on CentOS and Fedora
Python 3.8 isn’t available in the CentOS and Fedora repositories, so you’ll have to build Python from source code. Before you compile Python, though, you need to make sure your system is prepared.

First, update the [yum package manager](http://yum.baseurl.org/):

```shell 
$ sudo yum -y update
```

Once `yum` finishes updating, you can install the necessary build dependencies with the following commands:

```shell
$ sudo yum -y groupinstall "Development Tools"
$ sudo yum -y install gcc openssl-devel bzip2-devel libffi-devel
```

When everything is finished installing, skip ahead to the [How to Build Python From Source Code](https://realpython.com/installing-python/#how-to-build-python-from-source-code) section.

### Install on Arch Linux
Arch Linux is fairly diligent about keeping up with Python releases. It’s likely you already have the latest version. If not, use the following command to update Python:

```shell
$ sudo pacman -S python
```

When Python is finished updating, you should be all set!

## Prowler Installation
Prowler has been written in bash using AWS-CLI and it works in Linux and OSX.

- Make sure the latest version of AWS-CLI is installed on your workstation (it works with either v1 or v2), and other components needed, with Python pip already installed:

    ```shell
    $ pip install awscli detect-secrets
    ```

    AWS-CLI can be also installed it using "brew", "apt", "yum" or manually from <https://aws.amazon.com/cli/>, but `detect-secrets` has to be installed using `pip`. You will need to install `jq` to get the most from Prowler.

- Make sure jq is installed (example below with "apt" but use a valid package manager for your OS):

    ```shell
    $ sudo apt install jq
    ```

- Previous steps, from your workstation:

    ```shell
    $ git clone https://github.com/toniblyx/prowler
    cd prowler
    ```

- Since Prowler users AWS CLI under the hood, you can follow any authentication method as described [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-precedence). Make sure you have properly configured your AWS-CLI with a valid Access Key and Region or declare AWS variables properly (or intance profile):

    ```shell
    $ aws configure
    ```

    or

    ```shell
    $ export AWS_ACCESS_KEY_ID="ASXXXXXXX"
    $ export AWS_SECRET_ACCESS_KEY="XXXXXXXXX"
    $ export AWS_SESSION_TOKEN="XXXXXXXXX"
    ```

- Those credentials must be associated to a user or role with proper permissions to do all checks. To make sure, add the AWS managed policies, SecurityAudit and ViewOnlyAccess, to the user or role being used.  Policy ARNs are:

    ```shell
    $ arn:aws:iam::aws:policy/SecurityAudit
    $ arn:aws:iam::aws:policy/job-function/ViewOnlyAccess
    ```

    > Additional permissions needed: to make sure Prowler can scan all services included in the group *Extras*, make sure you attach also the custom policy [prowler-additions-policy.json](https://github.com/toniblyx/prowler/blob/master/iam/prowler-additions-policy.json) to the role you are using. If you want Prowler to send findings to [AWS Security Hub](https://aws.amazon.com/security-hub), make sure you also attach the custom policy [prowler-security-hub.json](https://github.com/toniblyx/prowler/blob/master/iam/prowler-security-hub.json).

# ThreatSpotter AiSecureMe Installations

**Ensure your computer is behind a firewall that blocks port 4040** then,

## How to build and run the project

:warning: **This release is prefered to run on a Linux operating system.**

> Depending on your os you may need to add the `sudo` before any command if it says permission denied or any permission related issue.

I. Execute make command for executing the Makefile, which will install dependencies and build the project. [Done once the first time]

```shell
$ make
```

II. Execute the following command to launch scope script. It will create a docker container for the scope backend and run Node server. 

```shell
$ ./scope launch
```

Open your web browser to **http://localhost:4040**.


III. In case of stopping the project, and it's running docker container execute the following command: 

```shell
$ ./scope stop
```
