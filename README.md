# kitchen_test-ec2_example
Kitchen configuration and tests for an AWS EC2 instance


## What is this repository about

This repository will use ```test-kitchen``` and ```terraform``` to 
show you how you could test an AWS EC2 instance. 
In this particular case, we're going to check the type of the OS on the AWS EC2 instance. 

## Prerequisites

- AWS Account
- Terraform
- Ruby installed

**NOTE:** **The following steps are for MacOS users** **:NOTE**

 * Install and fine tune rbenv by running the following commands
   
```
which rbenv || brew install rbenv

grep ".rbenv" ~/.bash_profile || {
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' | tee -a ~/.bash_profile
}

source ~/.bash_profile

rbenv init
```
 * Install ruby version 2.3.1 with rbenv by running the following commands

```
rbenv versions | grep 2.3.1 || rbenv install 2.3.1

rbenv local 2.3.1

```

 * Install bundler
 
 ```
 gem install bundler
 ```

## How to use this repository

- Clone the repository

```
git clone https://github.com/firedot/kitchen_test-ec2_example.git
```

- Go to the cloned repo directory

```
cd kitchen_test-ec2_example
```

- Use Bundler to install the ruby gems needed to perform the testing

```
bundle install
```

- Run the following command to prepare the environment

```
bundle exec kitchen converge
```

- Run the following command to test the environment

```
bundle exec kitchen verify
```

- Run the following command to destroy your environment

```
bundle exec kitchen destroy
```

* Additionally, you may use the following command to run the test in an automated manner

```
bundle exec kitchen test
```
