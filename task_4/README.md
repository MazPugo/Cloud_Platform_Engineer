Create Virtual Machine
Go to Google Console. Choose Compute Engine from the Navigation Menu, then VM Instances. Choose CREATE INSTANCE.
Now you will be able to to create a Virtual Machine Instance. Type in the name of your virtual machine instance. Choose a region. The region indicated in what data centers the virtual machine will be created.
We get to also choose the Machine type.----Choose the e2-small instance type. Scroll down.
So far we specified the instance type, name, region. Now we need to decide who can access the VM instance. Keep the default service account.
In the Firewall section mark both HTTPs and HTTP.
Click Advanced options. And then Networking. Add a network tag dareit-public . This tag will be used to match firewall rules to the instances to which the rules should apply.
Now we can choose Network. Click on the Network, you will see more options. Choose subnetwork. As well as decide whether our instance should get a public IP address (External IPv4 address), Leave other options as default. After all that click CREATE.
It might take a few seconds for the instance to become ready. You will see the green staus and Internal IP as well as External IP assigned to it.
Now we will connect to the Virtual Machine Instance. Click on the SSH button in the Connect column.
A new window will open and a connection will be established. 
In this step will will:
get package information from all configured sources (sudo apt update) and install the Apache Web server (sudo apt -y install apache2)
we will check the status of the Apache server (we want to see if it is active and running nicely)
we will remove the preconfigured index.html file
we will add our own index.html file
So let’s run first the below command in the Terminal. You can copy and paste and hit enter.

sudo apt update && sudo apt -y install apache2

Now check the status of the Apache server. So let’s run the below command in the Terminal. 
You can copy and paste and hit enter. 

sudo systemctl status apache2
Wait a few minutes and then copy the External IP of your Virtual Machine Instance.
Paste it in your browser. You will see: Appache2 Debian default page
Go back to your Terminal and go the the location in which the index.html file is stored. It is a known location /var/www/html/ (html folder in a www folder that is in the var folder)

We will use a command cd in order to change the directory in which we currently are.
cd - change directory command :

cd /var/www/html/

We will create out own index.html file using the vim command

sudo vim index.html

Input into the new index.html file below code

<!DOCTYPE html>
<html>
  <head>
    <title>Hello World: Static Website</title>
  </head>
  <body>
    <h1>I am hosted on a VM in GCP.</h1>
    <p>DareIT rocks!</p>
  </body>
</html>


Save the file and exit. Got the the browser again and refresh the tab in which you previously opened your website (pasted the External IP of the VM).

Copy thet public IP address of your instance and paste it into this form. No Github this time!
