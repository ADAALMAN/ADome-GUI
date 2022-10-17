# GUI Test apps
This folder contains apps to develop and test specific code for the main GUI.

## TextboxTestGUI.mlapp
The TextboxTestGUI reads data from the command window, puts it in a diary file (.log) and displays it in a text window in the GUI.
#### Capabilities
- Data printed to the command window with disp() or printf() is stored and added in a diary file. The file is being in a loop started by the startupFcn and keeps running till the application is deleted (closed). 
#### Bugs/limits
- No empty line can be put into the .log file or it will stop too soon.
- The .log file **cannot** be edited directly. Data can only be added via the command window.
- Is being read and added in a while loop. Could benifit of being triggerd by a timer.

## NodeCommandsTestGUI.mlapp
The NodeCommandsTestGUI takes the combination of the press of a button, a selection of a test command and a selection of a COM port to send and read data from the master of the CAN bus.
#### Capabilities

#### Bugs/limits
- When receiving data after sending an "i", it gives random characters/numbers (not hex).
- Need to input a value for the count variable in read(). If the data length you are receiving exeeds the value given data is lost. If the data length is smaller then value, you get a warning.

## VisualizeNodesTestGUI.mlapp
#### Capabilities
#### Bugs/limits
