# This is a detailed description on the proccess of the creation of this repository

## Before we start

* **Some of the terms and commands that will be used are described here**
* Remote repository is our VCS server (in this example GitHub).
* The terms remote repository and GitHub will be used interchangebly from now on.
* Local repository is the repository cloned from GitHub on our local machine.
* Bundler is a tool that provides a consistent environment for Ruby projects by tracking and installing the exact gems (Ruby     software packages) and versions that are needed. Bundler itself comes as a gem.
* A Gemfile is a list of Ruby software packages that will be installed with bundler.
* ``` git add <some_file> ``` is an action that will prepare the content  that will be commited and eventually pushed to the remote repository
* ``` git commit ``` is an action that records the changes to the repository
* ``` git push ``` is an action that pushes the locally recorded repository changes to the remote repository

* **Additional informational sources are provided below**

* If you want further information on how to use git, you may find it [here](https://git-scm.com/docs)

* You could find what a pull request is [here](https://help.github.com/articles/about-pull-requests/)
* You could find how to create a pull request [here](https://help.github.com/articles/creating-a-pull-request/)
* You could find how to merge your pull request [here](https://help.github.com/articles/merging-a-pull-request/)

- Create a new repository on GitHub called ```kitchen_test-ec2_example```

- Clone the repository to your local machine

```
git clone https://github.com/firedot/kitchen_test-ec2_example.git
```
- Go into the cloned repository directory

```
cd kitchen_test-ec2_example
```

- Create a new branch ```f-addGemfile```

```
git checkout -b "f-addGemfile"
```

- Create a Gemfile

```
touch Gemfile
```

- Edit the Gemfile to have the following contents by using a text editor of your choice

```
source 'https://rubygems.org/' do
  gem 'kitchen'
  gem 'kitchen-inspec'
  gem 'test-kitchen', '= 1.21.2'
  gem 'kitchen-terraform', '= 3.3.1'
ruby '2.3.1'
end
```
- Add the ```Gemfile``` for commit

```
git add Gemfile
```

- Commit the changes for upload to the remote repository

```
git commit -m "Added a Gemfile to be used by bundler"
```

- Push the changes to the remote repository

```
git push --set-upstream origin f-addGemfile
```

- Go to Github
- Create a pull request
- Merge the pull request to the master branch
- Go back to your local repository

- Checkout to the master branch

```
git checkout master
```

- Pull the changes from the remote repository

```
git pull origin master
```

- Create a new branch ```f-addKitchenConfig```

```
git checkout -b "f-addKitchenConfig"
```

- Create the configuration file for test-kitchen

```
touch kitchen.yml
```

- Edit the ```kitchen.yml``` to have the following contents by using a text editor of your choice

```
---
driver:
  name: terraform
  variable_files:
    - testing.tfvars
provisioner:
  name: terraform
platforms:
  - name: ubuntu
transport:
  name: ssh
  ssh_key: ~/.ssh/id_rsa

verifier:
  name: terraform
  format: doc
  groups:
    - name: default
      controls:
        - operating_system
      hostnames: public_dns
      username: ubuntu

suites:
  - name: default
```

- Create ```inspec``` directory within our test directories, which is going to be the default group of tests

```
mkdir -p test/integration/default/controls
```

- Create a YML file that contains the  name of the group of tests that we previously created

```
touch test/integration/default/inspec.yml
```
- Add the name of the group to that file: 

```
---
name: default
```

- Add the the Kitchen configuration files as well as the files that contin the tests

```
git add kitchen.yml test/
```

- Commit the changes for upload to the remote repository

```
git commit -m "Added a test-kitchen configuration, and a test that will check the AWS EC2 instnace linux version"
```

- Push the changes to the remote repository

```
git push --set-upstream origin f-addKitchenConfig
```

- Go to Github
- Create a pull request
- Merge the pull request to the master branch
- Go back to your local repository

- Checkout to the master branch

```
git checkout master
```

- Pull the changes from the remote repository

```
git pull origin master
```
- Create a new branch ```f-addTerraformConfig```

```
git checkout -b "f-addTerraformConfig"
```
- Create the main terraform configuration file

```
touch main.tf
```
- Add the following configuration to ```main.tf``` using your text editor of choice

```
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region_id}"
}

resource "aws_instance" "example" {
  ami                    = "${var.ami_id}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
}

```
- Create a ```testing.tfvars``` file

```
touch testing.tfvars
```

- Create a terraform configuration file, that will contain your configuration variables

```
touch variables.tf
```

- Add the following configuration to ```variables.tf``` using your text editor of choice

```
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region_id" {}
variable "ami_id" {}
variable "key_name" {}

variable "vpc_security_group_ids" {
  type = "list"
}
```

- Create a terraform configuration file in which all outputs that you need to see sorted, will be described

```
touch output.tf
```

- Add the following configuration to ```output.tf``` using your text editor of choice

```
output "public_dns" {
  value = "${aws_instance.example.public_dns}"
}
```
- Add the the Terraform configuration files for commit

```
git add main.tf output.tf variables.tf testing.tfvars
```
- Commit the changes for upload to the Remote repository

```
git commit -m "Added Terraform configuration files"
```
- Push the changes to GitHub

```
git push --set-upstream origin f-addTerraformConfig
```
- Go to Github
- Create a pull request
- Merge the pull request to the master branch
- Go back to your local repository

- Checkout to the master branch

```
git checkout master
```

- Pull the changes from the remote repository

```
git pull origin master
```
- Create a new branch ```f-addGitIgnore```
```
git checkout -b "f-addGitIgnore"
```
- Create a ```.gitignore``` file

```
touch .gitignore
```
- Add files and folders that should not be uploaded to GitHub
```
.kitchen/
.ruby-version
.terraform/
.Gemfile.lock
ruby
terraform.tfstate.d/
```
- Add the file for upload

```
git add .gitignore
```

- Commit the changes for upload

```
git commit -m "Added .gitignore"
```
- Push the changes to GitHub

```
git push --set-upstream origin f-addGitIgnore
```
- Go to Github
- Create a pull request
- Merge the pull request to the master branch
- Go back to your local repository

- Checkout to the master branch

```
git checkout master
```

- Pull the changes from the remote repository

```
git pull origin master
```

- Create a new branch ```f-addDETAILED```

```
git checkout -b "f-addDETAILED"
```

- Add this file

```
git add DETAILED.md
```

- Commit the changes for upload 

```
git commit -m "Added DETAILED.md, which contains detailed information on how this repository was created"
```

- Push the changes to GitHub
```
git push --set-upstream origin f-addDETAILED
```
- Go to Github
- Create a pull request
- Merge the pull request to the master branch
- Go back to your local repository

- Checkout to the master branch

```
git checkout master
```

- Pull the changes from the remote repository

```
git pull origin master
```
