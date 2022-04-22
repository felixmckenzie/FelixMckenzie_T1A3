# Who Wants To Be a Ruby Millionaire
## A Terminal Quiz Application Based On The Ruby Programming Language
### 
## Features
screenshots of app plus description of each feature 

- log in with valid user name to play

- Quiz Feature 

- Main Menu Feature 


## Implementation and Planning

Planning of the application involved:
- Describing each feature of the app 
- Defining what classes would be used to achieve the features. 
- Defining the behaviours of each class to achieve the desired outcome
- Defining the attributes needed to implement the behaviour of each class and their interactions
- This was then translated to a Trello board for implementation
- Researching potential Ruby gems that would aid in the project

Adding requirements to the Trello board, once features were defined:
- TDD would be implemented with the use of Rspec tests
- Error handling was added and updated as potential errors arose during implementation phase
- Bash Script 
- Command line arguments would be implemented making use of the OptionParser class 
- Source control to remind myself to make regular git commits 
- Updating Dependencies (Ruby gems) to make sure they were achieving their intended purpose for the project

### You can view the planning and implementation on my trello board via the link 
https://trello.com/b/PRylJ433/quizapp

### Trello Board approximately at the half way point
![Trello1](./docs/trello1.png)

### Trello Board towards the end of the project
![Trello2](./docs/trello2.png)

### High Level Overview Of The Application
![FlowChart](./docs/flowchart.png)

## Install Instructions 
For the app to run you will need the following requirements:
 - Ruby installed on your local machine
 - Ruby Gem dependencies installed 

 Ensure gem dependencies are installed and up to date:
- Run bundle install from the directory FelixMckenzie_T1A3 
- If you do not have bundler installed, run the command gem install bundler 

To execute the program: 
- Navigate to the lib directory and run the command ruby ruby_millionaire.rb 
- Alternatively run ./run_app.sh to execute the program  with a bash script 

Executing the program with a trailing command line argument:
- -h or -help will display a help message with information regarding how to play, dependencies, and system requirements
- -q or -quick will skip the main menu and 'quick start' to log in and play

For the best experience expand the command line to the full width of your monitor
