# How To Build Basic Desktop Applications in Ruby
## RubyConf 2024 Workshop Code Exercises by Andy Maleh

The full material of this workshop will be released on day 2 of RubyConf 2024 (Thursday, Nov 14, 2024).

Mac | Windows | Linux
----|---------|------
![glimmer-dsl-libui-mac-control-gallery.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-mac-control-gallery.png) | ![glimmer-dsl-libui-windows-control-gallery.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-windows-control-gallery.png) | ![glimmer-dsl-libui-linux-control-gallery.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-linux-control-gallery.png)

Please star ("⭐️") this project and [Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui) to save for later reference with regards to Ruby Desktop Development. [Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui) was used in this workshop because it is the simplest and quickest to setup in standard Ruby (aka MRI / CRuby), but the lessons learned are applicable to other [Glimmer GUI DSLs](https://github.com/AndyObtiva/glimmer#glimmer-dsl-comparison-table) (with some syntax variations), including more mature ones like [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt), which might be better for more serious usage after finishing the workshop. If you discover any issues or get stuck while going through the material of this repo, please [report them in GitHub issues](https://github.com/AndyObtiva/how-to-build-desktop-applications-in-ruby/issues) or discuss in the [Glimmer Gitter Chat](https://app.gitter.im/#/room/#AndyObtiva_glimmer:gitter.im).

- [How To Build Desktop Applications in Ruby](#how-to-build-desktop-applications-in-ruby)
  * [Setup Glimmer DSL for LibUI](#setup-glimmer-dsl-for-libui)
  * [Resources](#resources)
  * [Hack Day](#hack-day)

## Setup Glimmer DSL for LibUI

Please make sure to follow these instructions on your laptop successfully before attending the workshop.

1- Open Terminal (on Mac or Linux) or Command-Prompt/Git-Bash (on Windows) [do not use WSL or PowerShell]

2- Install [glimmer-dsl-libui](https://github.com/AndyObtiva/glimmer-dsl-libui) gem

Run:

```
gem install glimmer-dsl-libui -v0.12.4
```

3- Load Glimmer Meta-Example to test gem

Run:

```
glimmer examples
```

You should see the Glimmer Meta-Example (the example of examples).

Mac | Windows | Linux
----|---------|------
![glimmer-dsl-libui-mac-meta-example.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-mac-meta-example.png) | ![glimmer-dsl-libui-windows-meta-example.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-windows-meta-example.png) | ![glimmer-dsl-libui-linux-meta-example.png](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-libui/master/images/glimmer-dsl-libui-linux-meta-example.png)

4- Clone repository

Clone the GitHub repository to avoid running into issues if WIFI service is unreliable at the event:

```
https://github.com/AndyObtiva/how-to-build-desktop-applications-in-ruby.git
```

This will download the [presentation slides](https://github.com/AndyObtiva/how-to-build-desktop-applications-in-ruby/raw/refs/heads/rubyconf2024/RubyConf%202024%20-%20How%20To%20Build%20Basic%20Desktop%20Applications%20in%20Ruby%20-%20Andy%20Maleh.pptx).

On the morning of day 2 (Thursday, Nov 14, 2024), pull the latest version of the repository before you go into the workshop to get all the code exercises.

5- (Optional) Scaffold Application

This step is helpful for the Hack Day event that follows the 2-hour workshop, but is not necessary for the workshop itself and can be skipped till you get to the Hack Day event if you run into any issues with it.

Application Scaffolding relies on the juwelier Ruby gem, which expects a local Git config of:
- `user.name` (`git config --global user.name "FirstName LastName"`)
- `github.user` (`git config --global github.user githubusername`)

Scaffold Glimmer DSL for LibUI application with this command:

```
glimmer "scaffold[hello_world]"
```

## Resources

- [Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui)
- [Glimmer DSL for LibUI Supported Keywords](https://github.com/AndyObtiva/glimmer-dsl-libui#supported-keywords)

## Hack Day

There will be 2 events associated with this workshop:
- The Workshop: it takes place from 11:15pm-1:15pm
- The Hack Day event: it takes place from 3:45pm-5:45pm

Everyone is welcome to attend the Hack Day event for "How To Build Basic Desktop Applications in Ruby", including Software Developers who are missing the Workshop.

To participate in the Hack Day event, please make sure to [Setup Glimmer DSL for LibUI](#setup-glimmer-dsl-for-libui) beforehand.

Aftewrwards, you may engage in one of the following activities:
- Go through the workshop exercises if you missed the workshop
- Finish the workshop exercises if you attended the workshop, but did not get around to finishing all exercises
- Do the additional exercises that are in the [RubyConf 2023](https://github.com/AndyObtiva/how-to-build-desktop-applications-in-ruby/tree/rubyconf2023) longer version of the workshop
- Build an application that stores its data in memory (in Ruby variables)
- Build an application that stores its data in flat files (e.g. CSV files)
- Build an application that stores its data with a relational database (e.g. SQLite)
- Build a board game or 2D game (e.g. Hangman). This requires advanced knowledge that is available in the [RubyConf 2023](https://github.com/AndyObtiva/how-to-build-desktop-applications-in-ruby/tree/rubyconf2023) longer version of the workshop

I will be availble at the Hack Day event to answer any questions or help with any problems.

Happy hacking!!!

## License

[MIT](LICENSE.txt)

Copyright (c) 2024 Andy Maleh
