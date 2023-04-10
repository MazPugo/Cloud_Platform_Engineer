We will create a file and input python code inside the file.
Open Cloud Shell, Open the terminal and type in the terminal: vim hello.py
(When we are issuing a command vim <some_file_name> and that some_file_name doesn’t exist yet, the file will be created automatically and then it will be opened by the Vim editor)
Hit ESC then SHIFT+I - this will allow Vim to enter the INSERT mode. In the INSERT mode, you will be able to edit the file, which is empty so far.
Type in the file: : print('Hello DareIT')
Hit ESC
Type :wq end press Enter

Vim modes:
Normal - default mode for navigation and simple editing
Insert - for explicitly inserting and modifying text
Command Line - for operations like saving, exiting, 
Vim commands:
ESC - goes to normal mode (where the file is simply displayed)
:wq - save and python hello.py
We have now created the first python script, the script is stored in our [hello.py](<http://hello.py>;) file. In order to run it we will type in the terminal:
(python hello.py)
OPTIONAL
Create a hello_function.py file and paste the following code, run it in Cloud Shell. You can copy the output from the Cloud Shell and paste it to task_3_optional_function file and commit it to your repository.
def hello_function():
    print("Hello from the other siiiiiiiiiide!")

def my_function_with_args(name, surname):
    print("Hello, it's me, %s %s"%(name, surname))

def sum_two_numbers(a, b):
    return a + b

hello_function()

my_function_with_args("Martyna", "Lewinska")

x = sum_two_numbers(1,2)
print(x)

CREATE A CLOUD FUNCTION
Go to Google Console. Choose Cloud Function from the Navigation Menu. Choose CREATE FUNCTION.
You might need to enable a few Cloud APIs.
Choose the trigger for the Function. We will want to trigger our function from our browser, so choose HTTP
Take a look at the Runtime and Build section. There you can see the settings for RAM. We will leave the default 256 MB.
Hit SAVE and then an Editor will appear. Choose Python3.7 from the Runtime dropdown. 
Edit the code a little. Change the Hello world to some other text and Save. (the main.py is the main file of our program. It will be executed the moment we trigger the execution of the Cloud Function)
Copy the url from the Trigger tab.
Paste the url in the browser. Now when you call the URL, it will trigger the run of the function (the code that is in the function will be executed).
Let’s try to edit the Functions we just deployed. Click EDIT. Then click on 2 Code.
Paste the following code to the main.py file and Save.
from datetime import datetime

def hello_world(request):
    """Responds to any HTTP request.
    Args:
        request (flask.Request): HTTP request object.
    Returns:
        The response text or any set of values that can be turned into a
        Response object using
        `make_response <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>`.
    """
    request_json = request.get_json()
    if request.args and 'message' in request.args:
        return request.args.get('message')
    elif request_json and 'message' in request_json:
        return request_json['message']
    else:
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")
        return 'Let me tell you what time it is: ' + current_time
        
        
 Paste the trigger url to your function in task_3_cloud_function file in your cloud_challenge repository and save.
 Commit and push changes to your remote repository.



