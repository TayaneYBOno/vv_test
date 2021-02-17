# vv_test
VV test

1. [Install and Setup ](https://github.com/TayaneYBOno/vv_test/-/edit/master/README.md#install-and-setup)  

2. [Tests Run](https://github.com/TayaneYBOno/vv_test/-/edit/master/README.md#tests-run)

3. [Report](https://github.com/TayaneYBOno/vv_test/-/edit/master/README.md#report) 

4. [Project Structure](https://github.com/TayaneYBOno/vv_test/-/edit/master/README.md#project-structure) 

> # Install and Setup 

**Ruby**

This project using Ruby as a language. So we have to install ruby to runs this project.

1. Access https://rubyinstaller.org/downloads/.

2. Download "devkit" version: Ruby+Devkit 2.6.5.1 (x64).

3. Install. 
    
    a. Keep the default installation.
    
    b. Select all options on "Select Components" step.
    Note: The message displayed on the bottom inform that it will be needed to install some dependences. 
        Because that after the Ruby installation, we have to execute “ridk install” (it is the devkit install).
        
    c. Unselect the option for install ‘ridk’ and development toolchain.

4.  Access Console, and check if ruby is installed correctly.
    
    On Console, execute:

    `ruby --version`

    If you see the ruby version means that ruby was successfully installed.
    
5. On Consoler, execute:

    `ridk install`
    
6. After execute “rdik install”, it appears a question

    Choose  the option “3” :

    “3 – MSYS2 and MINGW development toolchain”

7. It will question about witch components shall should be installed.
Just press “Enter”.

*Important:*
Check if there is the 2.3.3 version installed.
It is needed to remove old version before install new version.
For remove old version: delete "Railsinstaller" folder (it usually is allocated on "C:/")
It is needed Ruby 2.4 or more.
Close all terminals opened for start Ruby install.
Prompt, Cmder, etc.

| Important |
| ------ | 
| Check if there is the 2.3.3 version installed. It is needed to remove old version before install new version.
For remove old version: delete "Railsinstaller" folder (it usually is allocated on "C:/"). It is needed Ruby 2.4 or more.
Close all terminals opened for start Ruby install. E.g. Prompt, Cmder, etc. | 

**Bundler**

The bundler provides a consistent environment for ruby projects by tracking and installing the exact gems and versions that are required.
With the bundler we can use ruby libraries in a simple way. So we can define our gems and versions, and running the bundler, we will have our libraries installed.

1. On Console, execute:
    
    `gem install bundler`

    | Important |
    | ------ |
    | Case it displays the firewall window, select all options. |

2.  Check version to verify bundler installation:
    
    `bundler --version`

    It should return the bundler version.
    
**Clone Project**

1. Clone this project:
    
    * With SSH:
        
        `git clone git@github.com:TayaneYBOno/vv_test.git`

    * Or with https:
        
        `git clone https://github.com/TayaneYBOno/vv_test.git`

2. On Console, access the root of the project and execute:

    `bundle install`
    

> # Tests Run 

**Execute all tests**
To execute all automated tests, on console, execute:

`cucumber`

**Execute tests with specific tag**

To execute only tests with specific tag, on console, execute:

`cucumber -t <@tag>`

> # Report 

After automated tests executed we can check the tests report.

Access `..\log\cucumber_web_report.html`.
    
In this report we can see the tests executed with their results.

For each scenario we can see the status and response (Access Features > Scenario for more details.).


>  # Project Structure

**Gemfile**

*Gemfile* → A format for describing gem dependencies for Ruby programs.

A Gemfile is a file we create which is used for describing gem dependencies for Ruby programs. A gem is a collection of Ruby code that we can extract into a “collection” which we can call later.

Your Gemfile should always be in the root of your project directory, this is where Bundler expects it to be and it is the standard place for any package manager style files to live.

It is useful to note that your Gemfile is evaluated as Ruby code. When it is evaluated by Bundler the context it is in allows us access to certain methods that we will use to explain our gem requirements.

**Specs**

In the "*features*" folder, we have the "*specs*" folder.

In the "*specs*" we create the files "*.feature*".

In these files we create the specifications using BDD to describe the behavior of the features.

**Hooks**

Cucumber hooks allows us to better manage the code workflow and helps us to reduce the code redundancy. We can say that it is an unseen step, which allows us to perform our scenarios or tests.

Hooks are blocks of code that can run at various points in the Cucumber execution cycle. They are typically used for setup and teardown of the environment before and after each scenario.

Where a hook is defined has no impact on what scenarios or steps it is run for.

**Page Object**

In the "*support*" folder, we have "*pages*".

On "*pages*" files, we implement the methods that should be used on step definitions.

On "*pages*" we keep the classes files included as requests (following best practices, using page objects).

In this way, we are going to follow the best practices, the partners "page object".

All files in this folder, must ending with "_page.rb".

**Config**

In the "*support*" folder, we have "*config*" folder.

In the "*config*" folder, we can configure different environments (dev, qa, sandbox, prod, etc.).

In the "*config*" we create files "*.yaml*" (e.g. "qa.yaml").

In this way we can execute the same tests in differents environments.

**Fixtures**

In the "*support*" folder, we have "*fixtures*" folder.

In this folder, we usually create the files that contain mass of tests, and this file should be "*.yaml*".

**Env**

When we added the gem HTTParty to our "Gemfile" file and run the "bundle install", we just install the HTTParty in our project. But we need to configure it.

Inside the ‘*support*’ folder, which was generated when we executed cucumber, we have the ‘*env.rb*’ file.
We access this file and import the fundamental libraries that we will use to automate API tests.

The *env.rb* file is our configuration file, which will be read first when we run cucumber.

When running cucumber in the console, ./features/support/env.rb is the first file that is loaded.
In execution, for its to understand that we are using the libraries, we need to import them into our project.

**Cucumber.yaml**

On "*cucumber.yaml*" we specify configuration options for Cucumber.

Defining a template requires a name and then the command-line options that you want to execute with this profile.

**log**

In the log folder we have the reports of test execution.

**tags**

| Tag | Description |
| ------ | ------ |
| @automation_done | Automation is done. Ready to execute tests. |
| @pesquisa_qa | Scenarios about 'Pesquisa com o QA' funcionality. | 
| @pesquisa_qa_obrigatorios| Scenarios validate 'Pesquisa com o QA' filling mandatory fields. |

**Database**

In this project I did not use integration with Database.

For this reason, I can not check the all data in the best way.
