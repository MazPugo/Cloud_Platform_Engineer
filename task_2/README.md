The goal of the task is to host a static website in a GCS bucket.
Go to console.cloud.google.com. On the Navigation Menu choose Cloud Storage. Create a bucket.
Bucket name must be unique across ALL projects that exist in GCP. Not just your project, or protects that belong to you. Pick globally unique name.
define location : where to store your data
storage class: standard
Uncheck the Enforce Public access prevention on this bucket,
Leave default settings (protection tools: none)
Click on create
Create in your cloud_challenge repository folder called task_2. In that folder create two files:
-first file called website_url
-second file called index.html
contents <!DOCTYPE html>
<html>
  <head>
    <title>Hello World: Static Website</title>
  </head>
  <body>
    <h1>I am hosted on a bucket in GCP.</h1>
    <p>DareIT rocks!</p>
  </body>
</html>

Upload the index.html file to the bucket. You can drag and drop that file in the browser.
Amend permissions of the bucket. If we want the website to be accessible by others we need to change the permissions.
Go to the permissions tab and Click on GRANT ACCESS.
In the New principals write allUsers. For the role that those allUsers should have choose predefined role called Storage Object Viewer. This means that anybody will be able to view the files.
Click Save and confirm on the popup Allow Public Access.
Copy the public url of the object and paste it into your browser (you can use incognito tab or your phone to access it).
Check out the website you created
